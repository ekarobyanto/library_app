import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/book/domain/author.dart';
import 'package:library_app/src/features/dashboard/presentation/widget/content_row.dart';
import 'package:library_app/src/features/user/cubit/user_last_read_cubit.dart';
import 'package:library_app/src/features/user/data/user_repository.dart';
import 'package:library_app/src/widgets/book_list_tile.dart';

import '../../../book/domain/book.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final Icon icon;
  final List<ContentRowContent> contents;
  const StatsCard({
    super.key,
    required this.icon,
    required this.contents,
    this.label = 'Book Stats',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserLastReadCubit(context.read<UserRepository>())..getUserLastRead(),
      child: Builder(builder: (context) {
        return Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
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
              ContentRow(
                contents: contents,
              ),
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
                  return state.whenOrNull(
                        success: (v) => SizedBox(
                          width: double.maxFinite,
                          child: BookListTile(
                            book: Book(
                                id: v.id,
                                name: v.name,
                                thumbnailUrl: v.thumbnailUrl,
                                categories: v.categories,
                                author: Author(id: '-', name: v.author)),
                          ),
                        ),
                      ) ??
                      const SizedBox(height: 70);
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
