import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/library/presentation/search/cubit/book_search_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/book_list_tile.dart';
import 'package:library_app/src/widgets/error.dart';
import 'package:library_app/src/widgets/loading.dart';
import 'package:library_app/src/widgets/searchbar.dart';

class LibrarySearchScreen extends StatefulWidget {
  const LibrarySearchScreen({super.key});

  @override
  State<LibrarySearchScreen> createState() => _LibrarySearchScreenState();
}

class _LibrarySearchScreenState extends State<LibrarySearchScreen> {
  FocusNode focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (searchController.text.isEmpty) return;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<BookSearchCubit>().findBooks(searchController.text);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationAppbar(
        title: "Find Book",
        onBackButtonPressed: () => router.pop(),
        bottom: AppSearchbar(
          focusNode: focusNode,
          controller: searchController,
          padding: const EdgeInsets.all(8.0),
          placeholder: "Search books by name...",
        ),
      ),
      body: BlocBuilder<BookSearchCubit, BookSearchState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            error: (message) => ErrorFetch(message: message),
            loading: () => const Center(child: LoadingWidget()),
            success: (books) => books.isNotEmpty
                ? ListView.separated(
                    itemCount: books.length,
                    padding: const EdgeInsets.all(8),
                    separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) => BookListTile(
                      book: books[index],
                      onPress: () => router.push('/book/${books[index].id}'),
                    ),
                  )
                : const ErrorFetch(message: "No books found"),
          );
        },
      ),
    );
  }
}
