import 'package:flutter/material.dart';
import 'package:library_app/src/features/library/presentation/widgets/horizontal_book_list.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/button.dart';
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
          child: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalBookList(
                    canUploadBook: true,
                    label: "Uploaded Books",
                    books: [],
                  ),
                  SizedBox(height: 12),
                  HorizontalBookList(
                    label: "Recently Read",
                    books: ["", "", "", ""],
                  ),
                  SizedBox(height: 12),
                  HorizontalBookList(
                    label: "Favorite Books",
                    books: ["", "", "", ""],
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
