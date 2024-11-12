import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_app/src/features/community/domain/message.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/utils/datetime_parser.dart';
import 'package:library_app/src/widgets/text_field.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({
    super.key,
    required this.user,
    required this.messages,
    required this.onSendMessage,
  });

  final User? user;
  final List<Message> messages;
  final Function(Message message) onSendMessage;

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (_) {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(microseconds: 200),
            curve: Curves.bounceInOut);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: widget.messages.length,
            controller: scrollController,
            padding: const EdgeInsets.all(8),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final message = widget.messages[index];
              return Align(
                alignment: message.id == widget.user?.uid
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: message.id == widget.user?.uid
                          ? color.primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: message.id != widget.user?.uid
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        if (message.id != widget.user?.uid)
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    message.senderName,
                                    style: TextStyle(
                                      color: message.id == widget.user?.uid
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
                                      color: message.id == widget.user?.uid
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
                            color: message.id == widget.user?.uid
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
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                ),
              ),
              IconButton(
                onPressed: () async {
                  widget.onSendMessage(
                    Message(
                      id: widget.user?.uid ?? '',
                      message: messageController.text,
                      senderName: widget.user?.displayName ?? 'Anonymous',
                      timestamp: DateTime.now().toIso8601String(),
                    ),
                  );
                  await Future.delayed(const Duration(milliseconds: 500));
                  scrollController.animateTo(
                      scrollController.position.maxScrollExtent + 200,
                      duration: const Duration(microseconds: 200),
                      curve: Curves.bounceInOut);
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