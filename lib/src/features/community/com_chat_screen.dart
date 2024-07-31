import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/book/presentation/widgets/empty_book.dart';
import 'package:library_app/src/features/community/cubit/chat_cubit.dart';
import 'package:library_app/src/features/community/data/community_repository.dart';
import 'package:library_app/src/features/community/domain/message.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/utils/datetime_parser.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/text_field.dart';

class CommunityChatScreen extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();
  CommunityChatScreen({super.key});

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
              return WidgetsBinding.instance.addPostFrameCallback((_) {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });
            }),
        child: Builder(builder: (context) {
          return GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.grey[200],
              appBar: ApplicationAppbar(
                title: 'Chat Room',
                onBackButtonPressed: context.pop,
              ),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) => state.maybeWhen(
                      connected: (messages) => Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemCount: messages.length,
                              controller: scrollController,
                              padding: const EdgeInsets.all(8),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (context, index) {
                                final message = messages[index];
                                return Align(
                                  alignment: message.id == user?.uid
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.7,
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
                                        crossAxisAlignment:
                                            message.id != user?.uid
                                                ? CrossAxisAlignment.start
                                                : CrossAxisAlignment.end,
                                        children: [
                                          if (message.id != user?.uid)
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      message.senderName,
                                                      style: TextStyle(
                                                        color: message.id ==
                                                                user?.uid
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      parseDateTime(
                                                        message.timestamp,
                                                        withTime: true,
                                                      ),
                                                      style: TextStyle(
                                                        color: message.id ==
                                                                user?.uid
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
                                      await Future.delayed(
                                          const Duration(milliseconds: 500));
                                      if (scrollController.position.pixels <
                                          scrollController
                                              .position.maxScrollExtent) {
                                        scrollController.animateTo(
                                          scrollController
                                              .position.maxScrollExtent,
                                          duration:
                                              const Duration(milliseconds: 300),
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
                                            timestamp: DateTime.now()
                                                .toIso8601String(),
                                            message: messageController.text,
                                            senderName:
                                                user?.displayName ?? 'Invalid',
                                          ),
                                        );
                                    await Future.delayed(
                                        const Duration(milliseconds: 500));
                                    scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 300),
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
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
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
