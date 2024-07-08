import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/overlay/loading_overlay.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/presentation/book_list/cubit/book_list_cubit.dart';
import 'package:library_app/src/model/query_params.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/utils/show_alert.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/book_list_tile.dart';
import 'package:library_app/src/widgets/searchbar.dart';

class BookList extends StatefulWidget {
  final String title;
  final String url;
  const BookList({super.key, required this.title, required this.url});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final LoadingOverlay loadingOverlay = LoadingOverlay();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => searchController.addListener(_onSearch),
    );
    super.initState();
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearch);
    searchController.dispose();
    super.dispose();
  }

  _onSearch() {
    context
        .read<BookListCubit>()
        .getBooks(widget.url, QueryParams(search: searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookListCubit(bookRepository: context.read<BookRepository>())
            ..getBooks(widget.url, QueryParams(search: searchController.text)),
      child: BlocListener<BookListCubit, BookListState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => loadingOverlay.show(context),
            error: (message) {
              loadingOverlay.hide();
              showAlert(
                context: context,
                title: 'Error',
                message: message,
              );
            },
            success: (books) => loadingOverlay.hide(),
          );
        },
        child: BlocBuilder<BookListCubit, BookListState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: ApplicationAppbar(
                  title: widget.title,
                  onBackButtonPressed: router.pop,
                  bottom: AppSearchbar(
                    controller: searchController,
                    padding: const EdgeInsets.all(8),
                  ),
                ),
                body: ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) => BookListTile(
                    onPress: () => router.push('/book/1'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
