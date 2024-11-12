import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';

import '../../../theme/app_theme.dart';

class CommunityChatScreenTile extends StatelessWidget {
  const CommunityChatScreenTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.people,
                size: 32,
                color: color.primaryColor,
              ),
              const SizedBox(width: 20),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Community'),
                  Text('Chat with all users'),
                ],
              )
            ],
          ),
          IconButton(
            color: color.primaryColor,
            onPressed: () => router.push('/community-chat'),
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          )
        ],
      ),
    );
  }
}
