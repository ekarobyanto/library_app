import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/presentation/book_screen/cubit/book_detail_cubit.dart';
import 'package:library_app/src/features/book/presentation/widgets/book_bottom_bar.dart';
import 'package:library_app/src/features/book/presentation/widgets/book_information.dart';
import 'package:library_app/src/features/library/presentation/cubit/library_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/error.dart';
import 'package:library_app/src/widgets/loading.dart';

class BookScreen extends StatelessWidget {
  final String bookId;
  const BookScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookDetailCubit(
        bookRepository: context.read<BookRepository>(),
      )..getBookDetail(bookId),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: ApplicationAppbar(
            title: 'Book',
            onBackButtonPressed: () => router.pop(),
          ),
          bottomNavigationBar:
              context.watch<BookDetailCubit>().state.whenOrNull(
                    success: (book) => BookDetailBottomBar(
                      book: book,
                      refreshBookList: context.read<LibraryCubit>().getBooks,
                    ),
                  ),
          body: BlocBuilder<BookDetailCubit, BookDetailState>(
            buildWhen: (previous, current) =>
                previous == const BookDetailState.loading() ||
                previous == const BookDetailState.initial(),
            builder: (context, state) => state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => const LoadingWidget(),
              error: (message) => ErrorFetch(
                message: message ?? 'Something went wrong',
                onRetry: () =>
                    context.read<BookDetailCubit>().getBookDetail(bookId),
              ),
              success: (value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  color: color.primaryColor,
                  onRefresh: () async => await context
                      .read<BookDetailCubit>()
                      .getBookDetail(bookId),
                  child: SingleChildScrollView(
                    child: BookInformation(
                      book: value,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
