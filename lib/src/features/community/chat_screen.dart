import 'package:flutter/material.dart';
import 'package:library_app/src/features/community/widgets/community_chat_tile.dart';
import 'package:library_app/src/widgets/application_appbar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationAppbar(title: "Social"),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommunityChatScreenTile(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Chats"),
          ),
        ],
      ),
    );
  }
}
