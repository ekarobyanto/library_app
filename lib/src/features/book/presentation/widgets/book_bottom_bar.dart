import 'package:flutter/material.dart';
import 'package:library_app/src/widgets/button.dart';

class BookDetailBottomBar extends StatefulWidget {
  final bool isFavorite;

  const BookDetailBottomBar({
    super.key,
    this.isFavorite = false,
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

  onFavoritePressed() {
    setState(() {
      isFavorite = !isFavorite;
    });
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