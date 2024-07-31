import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/book/presentation/book_screen/cubit/book_detail_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final userId = context
        .read<AuthCubit>()
        .state
        .whenOrNull(signedIn: (user) => user!.uid);

    final localStorage = await SharedPreferences.getInstance();
    final readBooks = localStorage.getStringList('readBooks') ?? [];
    if (!readBooks.contains('${widget.book.id}-$userId')) {
      await Future.wait([
        localStorage.setStringList(
          'readBooks',
          [
            ...readBooks,
            '${widget.book.id}-$userId',
          ],
        ),
        // ignore: use_build_context_synchronously
        context.read<BookDetailCubit>().readBook(widget.book.id!).catchError(
              (e) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    e.toString(),
                  ),
                ),
              ),
            ),
      ]);
    }
    router.push('/pdf', extra: widget.book.docUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(
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
    );
  }
}
