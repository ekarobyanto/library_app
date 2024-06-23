import 'package:flutter/material.dart';
import 'package:library_app/src/widgets/application_appbar.dart';

class BookScreen extends StatelessWidget {
  final String bookId;
  const BookScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: applicationAppbar(title: 'Book'),
      body: Text(bookId),
    );
  }
}
