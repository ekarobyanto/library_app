import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/core/overlay/loading_overlay.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/presentation/book_screen/cubit/book_detail_cubit.dart';
import 'package:library_app/src/features/book/presentation/book_screen/cubit/delete_book_cubit.dart';
import 'package:library_app/src/features/book/presentation/widgets/book_bottom_bar.dart';
import 'package:library_app/src/features/book/presentation/widgets/book_information.dart';
import 'package:library_app/src/features/common/cubit/category_list_cubit.dart';
import 'package:library_app/src/features/library/presentation/cubit/library_cubit.dart';
import 'package:library_app/src/features/report/cubit/report_cubit.dart';
import 'package:library_app/src/features/user/cubit/user_last_read_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/utils/show_alert.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/error.dart';
import 'package:library_app/src/widgets/loading.dart';

class BookScreen extends StatefulWidget {
  final String bookId;
  const BookScreen({super.key, required this.bookId});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final int favoriteCount = 0;
  final LoadingOverlay loadingOverlay = LoadingOverlay();

  refreshCubits(BuildContext context) {
    context.read<LibraryCubit>().getBooks();
    context.read<CategoryListCubit>().getCategories();
    context.read<ReportCubit>().getUserReport();
    context.read<UserLastReadCubit>().getUserLastRead();
    context.read<ReportCubit>().getReport(false);
  }

  @override
  Widget build(BuildContext context) {
    context.read<BookDetailCubit>().getBookDetail(widget.bookId);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => DeleteBookCubit(
            bookRepository: context.read<BookRepository>(),
          ),
        ),
      ],
      child: BlocListener<DeleteBookCubit, DeleteBookState>(
        listener: (context, state) => state.whenOrNull(
          loading: () {
            loadingOverlay.show(context, 'Deleting book...');
            return null;
          },
          success: () {
            loadingOverlay.hide();
            refreshCubits(context);
            context.pop();
            return null;
          },
          fail: (message) {
            loadingOverlay.hide();
            showAlert(
              context: context,
              message: message ?? 'Something went wrong',
            );
            return null;
          },
        ),
        child: Builder(builder: (context) {
          final user = context
              .read<AuthCubit>()
              .state
              .whenOrNull(signedIn: (user) => user);
          final book = context
              .watch<BookDetailCubit>()
              .state
              .whenOrNull(success: (book) => book);
          final isUserBook = user?.uid == book?.author?.id;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: ApplicationAppbar(
              title: 'Book',
              onBackButtonPressed: () => router.pop(),
              actions: isUserBook
                  ? [
                      IconButton(
                        icon: Icon(Icons.edit, color: color.primaryColor),
                        onPressed: () async {
                          final reload = await context.push(
                            '/create-book',
                            extra: book,
                          );
                          if (reload == true) {
                            context
                                .read<BookDetailCubit>()
                                .getBookDetail(widget.bookId);
                          }
                        },
                      ),
                    ]
                  : null,
            ),
            bottomNavigationBar: context
                .watch<BookDetailCubit>()
                .state
                .whenOrNull(
                  success: (book) => BookDetailBottomBar(
                    book: book,
                    refreshBookList: () {
                      context.read<BookDetailCubit>().getBookDetail(book.id!);
                      context.read<LibraryCubit>().getBooks;
                    },
                  ),
                ),
            body: BlocBuilder<BookDetailCubit, BookDetailState>(
              builder: (context, state) => state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const LoadingWidget(),
                error: (message) => ErrorFetch(
                  message: message ?? 'Something went wrong',
                  onRetry: () => context
                      .read<BookDetailCubit>()
                      .getBookDetail(widget.bookId),
                ),
                success: (value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RefreshIndicator(
                    color: color.primaryColor,
                    onRefresh: () async => await context
                        .read<BookDetailCubit>()
                        .getBookDetail(widget.bookId),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        child: BookInformation(
                          book: value,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
