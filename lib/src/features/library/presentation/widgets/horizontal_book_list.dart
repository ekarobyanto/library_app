import 'package:flutter/material.dart';
import 'package:library_app/src/widgets/book_card.dart';

class HorizontalBookList extends StatelessWidget {
  final String? label;
  const HorizontalBookList({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? const Text(
                  'Recently Read',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 8),
          LimitedBox(
            maxHeight: 260,
            child: ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) => const BookCard(),
            ),
          )
        ],
      ),
    );
  }
}
