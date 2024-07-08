import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/horizontal_book_list.dart';

enum CategoryPresentation { nameOnly, withBooks }

class BookCategoryList extends StatefulWidget {
  const BookCategoryList({super.key});

  @override
  State<BookCategoryList> createState() => _BookCategoryListState();
}

class _BookCategoryListState extends State<BookCategoryList> {
  final pageController = PageController();
  var categoryPresentation = CategoryPresentation.withBooks;

  void toggleCategoryPresentation() {
    setState(() {
      if (categoryPresentation == CategoryPresentation.withBooks) {
        categoryPresentation = CategoryPresentation.nameOnly;
        pageController.animateToPage(1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      } else {
        categoryPresentation = CategoryPresentation.withBooks;
        pageController.animateToPage(0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationAppbar(
        title: "Categories",
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: toggleCategoryPresentation,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(color.primaryShade),
              ),
              icon: categoryPresentation == CategoryPresentation.withBooks
                  ? Icon(
                      Icons.grid_view_outlined,
                      color: color.primaryColor,
                    )
                  : Icon(
                      Icons.list_outlined,
                      color: color.primaryColor,
                    ),
              color: Colors.black,
            ),
          ),
        ],
        onBackButtonPressed: router.pop,
      ),
      body: PageView(
        controller: pageController,
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListView.separated(
            itemCount: 12,
            padding: const EdgeInsets.all(8),
            separatorBuilder: (ctx, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) => HorizontalBookList(
              label: "Horrors",
              books: const ['', '', ''],
              showAll: true,
              showAllCallback: () => router.push('/book-list', extra: {
                'title': 'Horrors',
                'url': '/recently-read',
              }),
            ),
          ),
          ListView.separated(
            itemCount: 12,
            padding: const EdgeInsets.all(8),
            separatorBuilder: (ctx, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) => ListTile(
              title: const Text("Horrors (12 books)"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => router.push('/book-list', extra: {
                'title': 'Horrors',
                'url': '/recently-read',
              }),
            ),
          )
        ],
      ),
    );
  }
}
