import 'package:flutter/material.dart';
import 'package:library_app/src/features/library/presentation/widgets/horizontal_book_list.dart';
import 'package:library_app/src/features/user/presentation/widget/user_header.dart';
import 'package:library_app/src/router/router.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UserHeader(),
                  const SizedBox(
                    height: 16,
                  ),
                  HorizontalBookList(
                    label: "My Books",
                    showAll: true,
                    showAllCallback: () => router.push('/book-list', extra: {
                      'title': 'My Books',
                      'url': '/my-books',
                    }),
                    books: const ['', '', '', ''],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HorizontalBookList(
                    label: "Favorite Books",
                    showAll: true,
                    showAllCallback: () => router.push('/book-list', extra: {
                      'title': 'Favorite Books',
                      'url': '/favorite-books',
                    }),
                    books: const ['', '', '', ''],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HorizontalBookList(
                    label: "Recently Read Books",
                    showAll: true,
                    showAllCallback: () => router.push('/book-list', extra: {
                      'title': 'Recently Read',
                      'url': '/recently-read',
                    }),
                    books: const ['', '', '', ''],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
