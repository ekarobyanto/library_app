import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/book_list_tile.dart';
import 'package:library_app/src/widgets/searchbar.dart';

class BookList extends StatelessWidget {
  final String title;
  final String url;
  const BookList({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ApplicationAppbar(
          title: title,
          onBackButtonPressed: router.pop,
          bottom: const AppSearchbar(
            padding: EdgeInsets.all(8),
          ),
        ),
        body: ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) => BookListTile(
            onPress: () => router.push('/book/1'),
          ),
        ),
      ),
    );
  }
}
