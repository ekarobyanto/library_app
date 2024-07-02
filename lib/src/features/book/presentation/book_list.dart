import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/book_card.dart';

class BookList extends StatelessWidget {
  final String title;
  final String url;
  const BookList({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationAppbar(
        title: title,
        onBackButtonPressed: router.pop,
      ),
      body: GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 4.5 / 10,
        ),
        itemBuilder: (context, index) => const BookCard(),
      ),
    );
  }
}
