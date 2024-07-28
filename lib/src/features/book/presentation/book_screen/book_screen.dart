import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/presentation/book_screen/cubit/book_detail_cubit.dart';
import 'package:library_app/src/features/book/presentation/widgets/book_bottom_bar.dart';
import 'package:library_app/src/features/book/presentation/widgets/book_information.dart';
import 'package:library_app/src/router/router.dart';
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
          bottomNavigationBar: context
              .watch<BookDetailCubit>()
              .state
              .whenOrNull(success: (book) => BookDetailBottomBar(book: book)),
          body: context.watch<BookDetailCubit>().state.mapOrNull(
                loading: (_) => const LoadingWidget(),
                error: (message) => ErrorFetch(
                  message: message.message,
                  onRetry: () =>
                      context.read<BookDetailCubit>().getBookDetail(bookId),
                ),
                success: (value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RefreshIndicator(
                    onRefresh: () =>
                        context.read<BookDetailCubit>().getBookDetail(bookId),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        child: BookInformation(
                          book: value.book,
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
