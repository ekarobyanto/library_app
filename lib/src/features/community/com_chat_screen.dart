import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/book/presentation/widgets/empty_book.dart';
import 'package:library_app/src/features/community/cubit/chat_cubit.dart';
import 'package:library_app/src/features/community/data/community_repository.dart';
import 'package:library_app/src/features/community/widgets/chat_room_screen.dart';
import 'package:library_app/src/widgets/application_appbar.dart';

class CommunityChatScreen extends StatelessWidget {
  const CommunityChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user =
        context.read<AuthCubit>().state.whenOrNull(signedIn: (user) => user);
    return BlocProvider(
      create: (context) => ChatCubit(
        context.read<CommunityRepository>(),
      )..connectToChat(),
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
                      onSendMessage: (message) {
                        context.read<ChatCubit>().sendToChat(message);
                      },
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
    );
  }
}
