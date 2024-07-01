import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';

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
      body: Center(
        child: Text(
          'Book List: $url $title',
        ),
      ),
    );
  }
}
