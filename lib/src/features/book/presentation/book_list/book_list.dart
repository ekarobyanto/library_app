import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_app/src/core/overlay/loading_overlay.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/presentation/book_list/cubit/book_list_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/utils/show_alert.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/book_list_tile.dart';
import 'package:library_app/src/widgets/error.dart';
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
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          BookListCubit(bookRepository: context.read<BookRepository>())
            ..getBooks(
              widget.url,
              searchController.text.isNotEmpty
                  ? {"book_name": searchController.text}
                  : {},
            ),
      child: BlocListener<BookListCubit, BookListState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              showAlert(
                context: context,
                title: 'Error',
                message: message,
              );
            },
          );
        },
        child: Builder(builder: (context) {
          return BlocBuilder<BookListCubit, BookListState>(
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
                      onSearch: (_) => context.read<BookListCubit>().getBooks(
                            widget.url,
                            searchController.text.isNotEmpty
                                ? {"book_name": searchController.text}
                                : {},
                          ),
                    ),
                  ),
                  body: state.maybeWhen(
                    error: (message) => ErrorFetch(
                      message: message,
                      onRetry: () => context.read<BookListCubit>().getBooks(
                            widget.url,
                            searchController.text.isNotEmpty
                                ? {"book_name": searchController.text}
                                : {},
                          ),
                    ),
                    loading: () => Center(
                      child: SpinKitFoldingCube(
                        itemBuilder: (context, index) => DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? color.primaryShade
                                : color.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    success: (books) => ListView.separated(
                      shrinkWrap: true,
                      itemCount: books.length,
                      padding: const EdgeInsets.all(8),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (context, index) => BookListTile(
                        book: books[index],
                        onPress: () => router.push('/book/${books[index].id}'),
                      ),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
