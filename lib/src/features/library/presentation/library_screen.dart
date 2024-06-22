import 'package:flutter/material.dart';
import 'package:library_app/src/features/library/presentation/widgets/horizontal_book_list.dart';
import 'package:library_app/src/features/library/presentation/widgets/library_appbar.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: libraryAppbar(),
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
