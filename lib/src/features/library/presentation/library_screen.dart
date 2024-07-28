import 'package:flutter/material.dart';
import 'package:library_app/src/features/book/presentation/book_list/book_list.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/horizontal_book_list.dart';
import 'package:library_app/src/widgets/searchbar.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 1,
        scrolledUnderElevation: 0,
        shadowColor: Colors.black12,
        title: const Text('Library'),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              label: "Upload Book",
              onPressed: () => router.push('/create-book'),
            ),
          )
        ],
        bottom: AppSearchbar(
          isEnable: false,
          placeholder: "Find books",
          padding: const EdgeInsets.all(8.0),
          onPress: () => router.pushNamed('search-books'),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: RefreshIndicator(
          onRefresh: () async {},
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButton(
                  label: "Find books by category",
                  icon: Icons.chevron_right,
                  iconPosition: IconPosition.right,
                  mode: ButtonMode.contained,
                  onPressed: () => router.push('/library/book-category'),
                ),
                const SizedBox(height: 12),
                // const HorizontalBookList(
                //   canUploadBook: true,
                //   label: "Uploaded Books",
                //   books: [],
                // ),
                // const SizedBox(height: 12),
                // HorizontalBookList(
                //   label: "New Books",
                //   showAll: true,
                //   showAllCallback: () => router.push('/book-list', extra: {
                //     'title': 'Recent Books',
                //     'url': '/book',
                //   }),
                //   books: const [],
                // ),
                // const SizedBox(height: 12),
                // HorizontalBookList(
                //   label: "Recently Read",
                //   showAll: true,
                //   showAllCallback: () => router.push('/book-list', extra: {
                //     'title': 'Recently Read',
                //     'url': '/recently-read',
                //   }),
                //   books: const [],
                // ),
                // const SizedBox(height: 12),
                // HorizontalBookList(
                //   label: "Favorite Books",
                //   showAll: true,
                //   showAllCallback: () => router.push('/book-list', extra: {
                //     'title': 'Favorite Books',
                //     'url': '/favorite-books',
                //   }),
                //   books: const [],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
