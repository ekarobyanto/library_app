import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/community/domain/chat_list.dart';

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
    final displayName = chatList.usernames
        .where((username) => username != user?.displayName)
        .first;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              displayName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              chatList.lastMessage,
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
