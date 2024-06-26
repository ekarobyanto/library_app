import 'package:flutter/material.dart';
import 'package:library_app/src/features/book/presentation/widgets/book_information.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/button.dart';

class BookScreen extends StatelessWidget {
  final String bookId;
  const BookScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationAppbar(
        title: 'Book',
        onBackButtonPressed: () => router.pop(),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: AppButton(onPressed: () {}, label: "Read Book"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: BookInformation(),
      ),
    );
  }
}
