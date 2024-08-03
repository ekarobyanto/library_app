import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/core/overlay/loading_overlay.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/book/presentation/book_screen/cubit/book_detail_cubit.dart';
import 'package:library_app/src/features/book/presentation/book_screen/cubit/delete_book_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/utils/show_alert.dart';
import 'package:library_app/src/widgets/button.dart';

class BookDetailBottomBar extends StatefulWidget {
  final Book book;
  final Function()? refreshBookList;

  const BookDetailBottomBar({
    super.key,
    this.refreshBookList,
    required this.book,
  });

  @override
  State<BookDetailBottomBar> createState() => _BookDetailBottomBarState();
}

class _BookDetailBottomBarState extends State<BookDetailBottomBar> {
  late bool isFavorite = widget.book.isFavorite!;
  LoadingOverlay loadingOverlay = LoadingOverlay();

  onFavoritePressed() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      if (isFavorite) {
        await context
            .read<BookDetailCubit>()
            .deleteFromFavorite(widget.book.id!);
      } else {
        await context.read<BookDetailCubit>().addToFavorite(widget.book.id!);
      }
      setState(() => isFavorite = !isFavorite);
      if (widget.refreshBookList != null) {
        widget.refreshBookList!();
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  onReadBook() async {
    context.read<BookDetailCubit>().readBook(widget.book.id!).catchError(
          (e) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.toString(),
              ),
            ),
          ),
        );

    router.push('/pdf/${widget.book.name}', extra: widget.book.docUrl);
  }

  @override
  Widget build(BuildContext context) {
    final user =
        context.read<AuthCubit>().state.whenOrNull(signedIn: (user) => user);
    final isUserBook = user?.uid == widget.book.author?.id;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isUserBook)
            SizedBox(
              width: double.maxFinite,
              child: AppButton(
                onPressed: () => showAlert(
                  context: context,
                  title: 'Delete Book?',
                  message: 'This action is irreversible, proceed?',
                  actionButtons: [
                    TextButton(
                      onPressed: router.pop,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color?>(
                          Colors.transparent,
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<DeleteBookCubit>()
                            .deleteBook(widget.book.id!);
                        context.pop();
                      },
                      child: const Text('Ok'),
                    )
                  ],
                ),
                label: "Delete Book",
                buttonColor: Colors.red,
                icon: Icons.delete,
              ),
            ),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  onPressed: onFavoritePressed,
                  label: "Add to favorite",
                  icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppButton(
                  onPressed: onReadBook,
                  label: "Read Book",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
