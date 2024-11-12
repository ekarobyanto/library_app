import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/book/presentation/widgets/empty_book.dart';
import 'package:library_app/src/features/community/cubit/chat_cubit.dart';
import 'package:library_app/src/features/community/data/community_repository.dart';
import 'package:library_app/src/features/community/widgets/chat_room_screen.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/application_appbar.dart';

class CommunityChatScreen extends StatelessWidget {
  const CommunityChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final user =
        context.read<AuthCubit>().state.whenOrNull(signedIn: (user) => user);
    return BlocProvider(
      create: (context) => ChatCubit(
        CommunityRepository(
          context.read<FirebaseFirestore>(),
        ),
      )..connectToChat(),
      child: BlocListener<ChatCubit, ChatState>(
        listener: (context, state) => state.whenOrNull(
          failed: (message) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message ?? "An Error Occured"),
              backgroundColor: color.primaryColor,
            ),
          ),
          connected: (_) {
            return WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                scrollController.animateTo(
                  curve: Curves.easeOut,
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                );
              },
            );
          },
        ),
        child: Builder(builder: (context) {
          return GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.grey[200],
              appBar: ApplicationAppbar(
                title: 'Community',
                onBackButtonPressed: context.pop,
                bottom: AppBar(toolbarHeight: 0),
              ),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) => state.maybeWhen(
                      connected: (messages) => ChatRoomScreen(
                        user: user,
                        messages: messages,
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      failed: (message) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EmptyBook(label: message),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
