import 'package:flutter/material.dart';
import 'package:library_app/src/features/library/presentation/widgets/horizontal_book_list.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/searchbar.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Library',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppButton(
                    onPressed: () => router.push('/create-book'),
                    label: "Upload Book",
                  )
                ],
              ),
              const SizedBox(height: 12),
              AppSearchbar(
                isEnable: false,
                placeholder: "Find books",
                onPress: () => router.pushNamed('search-books'),
              ),
              const SizedBox(height: 12),
              const HorizontalBookList(
                label: "Recently Read",
              ),
              const SizedBox(height: 12),
              const HorizontalBookList(
                label: "Favorite Books",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
