import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/book/presentation/widgets/empty_book.dart';
import 'package:library_app/src/features/community/cubit/user_chat_cubit.dart';
import 'package:library_app/src/features/community/data/community_repository.dart';
import 'package:library_app/src/features/community/widgets/chat_room_screen.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({
    super.key,
    required this.chatRoomId,
    required this.receiverName,
  });

  final String chatRoomId;
  final String receiverName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserChatCubit(context.read<CommunityRepository>())
        ..getChats(chatRoomId),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 232, 223, 252),
          appBar: ApplicationAppbar(
            title: "Chat",
            onBackButtonPressed: () => router.pop(),
          ),
          body: BlocBuilder<UserChatCubit, UserChatState>(
            builder: (context, state) {
              return state.maybeWhen(
                connected: (messages) => ChatRoomScreen(
                  user: context.read<AuthCubit>().state.whenOrNull(
                        signedIn: (user) => user,
                      ),
                  messages: messages,
                  onSendMessage: (message) =>
                      context.read<UserChatCubit>().sendChat(
                            chatRoomId,
                            message.copyWith(receiverName: receiverName),
                          ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                failed: (message) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: EmptyBook(label: "Failed to connect to chat"),
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        );
      }),
    );
  }
}
