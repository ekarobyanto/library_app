import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/auth/widgets/background_decoration.dart';
import 'package:library_app/src/features/dashboard/presentation/widget/content_row.dart';
import 'package:library_app/src/features/dashboard/presentation/widget/dashboard_stats.dart';
import 'package:library_app/src/features/library/presentation/cubit/library_cubit.dart';
import 'package:library_app/src/features/user/cubit/user_stat_cubit.dart';
import 'package:library_app/src/features/user/data/user_repository.dart';
import 'package:library_app/src/features/user/presentation/widget/user_header.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/horizontal_book_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return BlocProvider(
      create: (context) =>
          UserStatCubit(context.read<UserRepository>())..getUserStat(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                AuthBackgroundDecoration(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 8,
                    ),
                    child: SafeArea(
                      child: Column(
                        children: [
                          const UserHeader(),
                          const SizedBox(height: 12),
                          BlocBuilder<UserStatCubit, UserStatState>(
                            builder: (context, state) {
                              logger.i('DashboardScreen: $state');
                              return StatsCard(
                                icon: Icon(
                                  Icons.book,
                                  color: color.primaryColor,
                                ),
                                contents: state.maybeWhen(
                                  orElse: () => [],
                                  success: (values) => [
                                    ContentRowContent(
                                      label: 'Book Uploaded',
                                      message: values.bookUploaded.toString(),
                                    ),
                                    ContentRowContent(
                                      label: 'Book Readed',
                                      message: values.bookReaded.toString(),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      BlocBuilder<LibraryCubit, LibraryState>(
                        builder: (context, state) => state.maybeWhen(
                            orElse: () => const SizedBox.shrink(),
                            success: (results) {
                              final sortedList = List.from(results)
                                ..sort((a, b) => a.title.compareTo(b.title));
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: sortedList.length,
                                itemBuilder: (context, index) =>
                                    HorizontalBookList(
                                  showAll: true,
                                  label: sortedList[index].title,
                                  books: sortedList[index].books,
                                  showAllCallback: () async {
                                    await context.push(
                                      '/book-list',
                                      extra: {
                                        'title': sortedList[index].title,
                                        'url': sortedList[index].url,
                                      },
                                    );
                                  },
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 12),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
