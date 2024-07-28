import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/book/presentation/book_screen/cubit/book_detail_cubit.dart';
import 'package:library_app/src/widgets/button.dart';

class BookDetailBottomBar extends StatefulWidget {
  final bool isFavorite;
  final Book book;

  const BookDetailBottomBar({
    super.key,
    this.isFavorite = false,
    required this.book,
  });

  @override
  State<BookDetailBottomBar> createState() => _BookDetailBottomBarState();
}

class _BookDetailBottomBarState extends State<BookDetailBottomBar> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

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
      setState(() {
        isFavorite = !isFavorite;
      });
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
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
            child: AppButton(onPressed: () {}, label: "Read Book"),
          ),
        ],
      ),
    );
  }
}
