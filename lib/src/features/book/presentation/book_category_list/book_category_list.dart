import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/book/presentation/widgets/empty_book.dart';
import 'package:library_app/src/features/common/cubit/category_list_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/error.dart';
import 'package:library_app/src/widgets/horizontal_book_list.dart';
import 'package:library_app/src/widgets/loading.dart';

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
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: ApplicationAppbar(
          title: "Categories",
          actions: [
            context.watch<CategoryListCubit>().state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  success: (categories) => categories.isEmpty
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: toggleCategoryPresentation,
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(color.primaryShade),
                            ),
                            icon: categoryPresentation ==
                                    CategoryPresentation.withBooks
                                ? Icon(
                                    Icons.list_outlined,
                                    color: color.primaryColor,
                                  )
                                : Icon(
                                    Icons.grid_view_outlined,
                                    color: color.primaryColor,
                                  ),
                            color: Colors.black,
                          ),
                        ),
                )
          ],
          onBackButtonPressed: router.pop,
        ),
        body: context.watch<CategoryListCubit>().state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              error: (message) => ErrorFetch(
                message: message,
                onRetry: () =>
                    context.read<CategoryListCubit>().getCategories(),
              ),
              loading: () => const Center(child: LoadingWidget()),
              success: (categories) => categories.isEmpty
                  ? EmptyBook(
                      label: 'No Category Available',
                      onRefresh:
                          context.read<CategoryListCubit>().getCategories,
                    )
                  : PageView(
                      controller: pageController,
                      allowImplicitScrolling: false,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        RefreshIndicator(
                          onRefresh: () async =>
                              context.read<CategoryListCubit>().getCategories(),
                          child: ListView.separated(
                            itemCount: categories.length,
                            padding: const EdgeInsets.all(8),
                            separatorBuilder: (ctx, index) =>
                                const SizedBox(height: 8),
                            itemBuilder: (context, index) => HorizontalBookList(
                              showAll: true,
                              canUploadBook: false,
                              books: categories[index].books,
                              label: categories[index].name,
                              showAllCallback: () =>
                                  router.push('/book-list', extra: {
                                'title': categories[index].name,
                                'url':
                                    '/book?category_id=${categories[index].id}',
                              }),
                            ),
                          ),
                        ),
                        RefreshIndicator(
                          onRefresh: () async =>
                              context.read<CategoryListCubit>().getCategories(),
                          child: ListView.separated(
                            itemCount: categories.length,
                            padding: const EdgeInsets.all(8),
                            separatorBuilder: (ctx, index) =>
                                const SizedBox(height: 8),
                            itemBuilder: (context, index) => ListTile(
                              title: Text(
                                "${categories[index].name} (${categories[index].books.length} books)",
                              ),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () => router.push('/book-list', extra: {
                                'title': categories[index].name,
                                'url':
                                    '/book?category_id=${categories[index].id}',
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
      );
    });
  }
}
