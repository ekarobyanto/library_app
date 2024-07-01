import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/book_card.dart';
import 'package:library_app/src/widgets/upload_book_card.dart';

class HorizontalBookList extends StatelessWidget {
  final String? label;
  final List<String> books;
  final bool canUploadBook;
  final bool showAll;
  final Function()? showAllCallback;
  const HorizontalBookList({
    super.key,
    this.label,
    this.books = const [],
    this.canUploadBook = false,
    this.showAll = false,
    this.showAllCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (showAll)
                  InkWell(
                    onTap: showAllCallback,
                    child: Text(
                      'Show all',
                      style: TextStyle(
                        color: color.primaryColor,
                      ),
                    ),
                  ),
              ],
            )
          else
            const SizedBox.shrink(),
          const SizedBox(height: 8),
          LimitedBox(
            maxHeight: 240,
            child: ListView.separated(
              shrinkWrap: true,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: canUploadBook && books.isEmpty ? 1 : books.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                if (canUploadBook && books.isEmpty) {
                  return UploadBookCard(
                    onPressed: () => router.push('/create-book'),
                  );
                }
                return BookCard(
                  onPress: () => router.push('/book/${1}'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
