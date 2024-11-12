import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/community/cubit/chat_cubit.dart';
import 'package:library_app/src/features/community/domain/message.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/utils/datetime_parser.dart';
import 'package:library_app/src/widgets/text_field.dart';

class ChatRoomScreen extends StatelessWidget {
  ChatRoomScreen({
    super.key,
    required this.user,
    required this.messages,
  });

  final User? user;
  final List<Message> messages;

  final ScrollController scrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: messages.length,
            controller: scrollController,
            padding: const EdgeInsets.all(8),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final message = messages[index];
              return Align(
                alignment: message.id == user?.uid
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: message.id == user?.uid
                          ? color.primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: message.id != user?.uid
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        if (message.id != user?.uid)
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    message.senderName,
                                    style: TextStyle(
                                      color: message.id == user?.uid
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    parseDateTime(
                                      message.timestamp,
                                      withTime: true,
                                      isUtc: true,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: message.id == user?.uid
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        Text(
                          message.message,
                          style: TextStyle(
                            color: message.id == user?.uid
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: AppTextField(
                  placeholder: 'Type a message...',
                  controller: messageController,
                  onTap: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    if (scrollController.position.pixels <
                        scrollController.position.maxScrollExtent) {
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                ),
              ),
              IconButton(
                onPressed: () async {
                  context.read<ChatCubit>().sendToChat(
                        Message(
                          id: user?.uid ?? 'Invalid',
                          timestamp: DateTime.now().toIso8601String(),
                          message: messageController.text,
                          senderName: user?.displayName ?? 'Invalid',
                        ),
                      );
                  await Future.delayed(const Duration(milliseconds: 500));
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                  messageController.clear();
                },
                icon: const Icon(Icons.send),
                color: color.primaryColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
