import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/horizontal_book_list.dart';

class BookCategoryList extends StatelessWidget {
  const BookCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationAppbar(
        title: "Categories",
        onBackButtonPressed: router.pop,
      ),
      body: ListView.separated(
        itemCount: 12,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (ctx, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) => HorizontalBookList(
          label: "Horrors",
          books: const ['', '', ''],
          showAll: true,
          showAllCallback: () => router.push('/book-list', extra: {
            'title': 'Horrors',
            'url': '/recently-read',
          }),
        ),
      ),
    );
  }
}
