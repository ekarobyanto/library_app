import 'package:flutter/material.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/widgets/book_header.dart';

class BookInformation extends StatelessWidget {
  final Book book;
  const BookInformation({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookHeader(
          book: book,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Text(
                book.description ?? 'No description available',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
