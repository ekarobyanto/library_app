import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/library/presentation/cubit/library_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/horizontal_book_list.dart';
import 'package:library_app/src/widgets/searchbar.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
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
      body: Builder(
        builder: (context) => Container(
          color: Colors.white,
          child: RefreshIndicator(
            onRefresh: () async =>
                await context.read<LibraryCubit>().getBooks(),
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
                  BlocBuilder<LibraryCubit, LibraryState>(
                    builder: (context, state) => state.maybeWhen(
                        orElse: () => const SizedBox.shrink(),
                        success: (results) {
                          final sortedList = List.from(results)
                            ..sort((a, b) => a.title.compareTo(b.title));
                          return Expanded(
                            child: ListView.separated(
                              itemCount: sortedList.length,
                              itemBuilder: (context, index) =>
                                  HorizontalBookList(
                                showAll: true,
                                label: sortedList[index].title,
                                books: sortedList[index].books,
                                showAllCallback: () async {
                                  await context.push(
                                    '/book-list',
                                    extra: {
                                      'title': sortedList[index].title,
                                      'url': sortedList[index].url,
                                    },
                                  );
                                },
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 12),
                            ),
                          );
                        }),
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
