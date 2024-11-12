import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/community/cubit/chat_list_cubit.dart';
import 'package:library_app/src/features/community/cubit/search_user_cubit.dart';
import 'package:library_app/src/features/community/data/community_repository.dart';
import 'package:library_app/src/features/community/widgets/chat_item_tile.dart';
import 'package:library_app/src/features/community/widgets/community_chat_tile.dart';
import 'package:library_app/src/features/community/widgets/search_users_chat.dart';
import 'package:library_app/src/features/user/data/user_repository.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';

import '../../theme/app_theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatListCubit(
        communityRepository: CommunityRepository(
          context.read<FirebaseFirestore>(),
        ),
      )..retrieveChats(
          context
              .read<AuthCubit>()
              .state
              .whenOrNull(signedIn: (user) => user!.uid)!,
        ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ApplicationAppbar(title: "Social"),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            useSafeArea: true,
            useRootNavigator: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            builder: (context) => const SearchUsersChat(),
          ),
          backgroundColor: color.primaryColor,
          child: const Icon(Icons.add_comment, color: Colors.white),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommunityChatScreenTile(),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Chats"),
            ),
            BlocBuilder<ChatListCubit, ChatListState>(
              builder: (context, state) => state.maybeWhen(
                orElse: () => const SizedBox(),
                failed: (err) => const Expanded(
                  child: Center(
                    child: Text("Unable to retrieve chats :("),
                  ),
                ),
                loading: () => const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                connected: (chats) => Expanded(
                  child: chats.isEmpty
                      ? const Center(
                          child: Text(
                            "Chat empty",
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: chats.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) => ChatItemTile(
                            chatList: chats[index],
                            onTap: () =>
                                router.push('/chat-room/${chats[index].id}'),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
