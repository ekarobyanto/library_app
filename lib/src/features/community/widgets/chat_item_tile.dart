import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/community/domain/chat_list.dart';
import 'package:library_app/src/utils/check_is_share_book_text.dart';

class ChatItemTile extends StatelessWidget {
  const ChatItemTile({
    super.key,
    required this.chatList,
    required this.onTap,
  });

  final ChatList chatList;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final user =
        context.read<AuthCubit>().state.whenOrNull(signedIn: (user) => user);
    final displayName = [chatList.recipientName, chatList.senderName]
        .where((name) => name != user?.displayName)
        .first;
    final bookSharerName =
        chatList.senderName == user?.displayName ? "You" : chatList.senderName;

    final isSharedBook = checkIsShareBookText(chatList.lastMessage);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              displayName.trim(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              isSharedBook
                  ? "$bookSharerName just shared a book!"
                  : chatList.lastMessage,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
