import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/service/dio_service.dart';
import 'package:library_app/src/features/book/domain/author.dart';
import 'package:library_app/src/features/dashboard/cubit/app_users_stat_cubit.dart';
import 'package:library_app/src/features/dashboard/data/app_users_stat.dart';
import 'package:library_app/src/features/user/cubit/user_last_read_cubit.dart';
import 'package:library_app/src/features/user/cubit/user_stat_cubit.dart';
import 'package:library_app/src/features/user/data/user_repository.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/book_list_tile.dart';

import '../../../book/domain/book.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final Icon icon;

  const StatsCard({
    super.key,
    required this.icon,
    this.label = 'Book Stats',
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserLastReadCubit(context.read<UserRepository>())
            ..getUserLastRead(),
        ),
        BlocProvider(
          create: (context) =>
              UserStatCubit(context.read<UserRepository>())..getUserStat(),
        ),
        BlocProvider(
          create: (context) => AppUsersStatCubit(
              AppUsersStat(service: context.read<DioService>()))
            ..getAppUsersStat(),
        ),
      ],
      child: Builder(builder: (context) {
        return Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  icon,
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Divider(
                color: color.primaryColor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Statistics",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<UserStatCubit, UserStatState>(
                    builder: (context, state) {
                      final stats = state.maybeWhen(
                        orElse: () => null,
                        success: (stat) => stat,
                      );
                      return Row(
                        children: [
                          Section(
                            label: "Total Read",
                            value: (stats?.bookReaded ?? 0).toString(),
                          ),
                          const SizedBox(width: 20),
                          Section(
                            label: "Uploaded Books",
                            value: stats?.bookUploaded.toString() ?? '0',
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<AppUsersStatCubit, AppUsersStatState>(
                    builder: (context, state) {
                      final stat = state.whenOrNull(success: (stat) => stat);
                      return Row(
                        children: [
                          Section(
                            label: "Total Users Read",
                            value: (stat?['totalUsersRead'])?.toString() ?? '0',
                          ),
                          const SizedBox(width: 20),
                          Section(
                            label: "Total Users Book Uploads",
                            value: (stat?['totalBooksUploaded'])?.toString() ??
                                '0',
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Last Read",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  BlocBuilder<UserLastReadCubit, UserLastReadState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => Container(
                          padding: const EdgeInsets.all(10),
                          child: const Row(
                            children: [
                              Icon(Icons.book),
                              SizedBox(width: 12),
                              Text(
                                'No Book Readed...',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        loading: () => CircularProgressIndicator(
                            color: color.primaryColor),
                        success: (v) => SizedBox(
                          width: double.maxFinite,
                          child: BookListTile(
                            onPress: () => context.push('/book/${v.id}'),
                            book: Book(
                              id: v.id,
                              name: v.name,
                              thumbnailUrl: v.thumbnailUrl,
                              categories: v.categories,
                              author: Author(
                                id: '-',
                                name: v.author,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
