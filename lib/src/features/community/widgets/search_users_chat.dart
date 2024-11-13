import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/community/cubit/search_user_cubit.dart';
import 'package:library_app/src/features/user/data/user_repository.dart';

import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/searchbar.dart';

class SearchUsersChat extends StatefulWidget {
  const SearchUsersChat({
    super.key,
  });

  @override
  State<SearchUsersChat> createState() => _SearchUsersChatState();
}

class _SearchUsersChatState extends State<SearchUsersChat> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchUserCubit(context.read<UserRepository>())..searchUser(),
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Search Users to Chat",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: router.pop,
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                AppSearchbar(
                  controller: searchController,
                  onSearch: (v) =>
                      context.read<SearchUserCubit>().searchUser(v),
                ),
                const SizedBox(height: 10),
                BlocBuilder<SearchUserCubit, SearchUserState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox(),
                      loading: () => const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      failed: (message) => Expanded(
                        child: Center(
                          child: Text(message ?? "Unable to fetch users"),
                        ),
                      ),
                      success: (users) => users.isEmpty
                          ? const Center(
                              child: Text("No Users Found"),
                            )
                          : Expanded(
                              child: ListView.separated(
                                itemCount: users.length,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    router.pop();
                                    router.push(
                                      '/chat-room/${context.read<AuthCubit>().state.whenOrNull(signedIn: (user) => user?.uid)}-${users[index].id}',
                                      extra: users[index].name,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          users[index].name.trim(),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Icon(
                                        Icons.chat,
                                        color: color.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                separatorBuilder: (ctx, index) =>
                                    const Divider(),
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
