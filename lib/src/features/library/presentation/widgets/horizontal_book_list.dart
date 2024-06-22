import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/book_card.dart';
import 'package:library_app/src/widgets/upload_book_card.dart';

class HorizontalBookList extends StatelessWidget {
  final String? label;
  final List<String> books;
  final bool canUploadBook;
  const HorizontalBookList({
    super.key,
    this.label,
    this.books = const [],
    this.canUploadBook = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text(
                  label!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 8),
          LimitedBox(
            maxHeight: 240,
            child: ListView.separated(
              itemCount: canUploadBook && books.isEmpty ? 1 : books.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => books.isEmpty
                  ? canUploadBook && books.isEmpty
                      ? UploadBookCard(
                          onPressed: () => router.push('/create-book'),
                        )
                      : const SizedBox.shrink()
                  : const BookCard(),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          )
        ],
      ),
    );
  }
}
