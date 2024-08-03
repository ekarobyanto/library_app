import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/library/presentation/cubit/library_cubit.dart';
import 'package:library_app/src/features/user/presentation/widget/user_header.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/horizontal_book_list.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          signedOut: () => router.go('/'),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SafeArea(
              child: Scrollbar(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserHeader(
                          showLogout: true,
                          backgroundColor: color.primaryShade,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        BlocBuilder<LibraryCubit, LibraryState>(
                          builder: (context, state) => state.maybeWhen(
                            orElse: () => const SizedBox.shrink(),
                            success: (results) {
                              final sortedList = List.from(results)
                                ..sort((a, b) => a.title.compareTo(b.title));
                              return RefreshIndicator(
                                onRefresh: () async =>
                                    context.read<LibraryCubit>().getBooks(),
                                color: Theme.of(context).primaryColor,
                                child: ListView.separated(
                                  itemCount: sortedList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    if (sortedList[index].title ==
                                        'Available Books') {
                                      return const SizedBox.shrink();
                                    } else {
                                      return HorizontalBookList(
                                        showAll: true,
                                        canUploadBook:
                                            sortedList[index].title ==
                                                'My Books',
                                        label: sortedList[index].title,
                                        books: sortedList[index].books,
                                        showAllCallback: () {
                                          context.push(
                                            '/book-list',
                                            extra: {
                                              'title': sortedList[index].title,
                                              'url': sortedList[index].url,
                                            },
                                          );
                                        },
                                      );
                                    }
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 12),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
