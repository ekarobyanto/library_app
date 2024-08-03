import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/utils/datetime_parser.dart';
import 'package:library_app/src/widgets/button.dart';

class BookHeader extends StatelessWidget {
  final bool showDetailButton;
  final Book book;
  const BookHeader({
    super.key,
    this.showDetailButton = false,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: book.id ?? '',
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[200],
              ),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                width: 180,
                height: 240,
                imageUrl:
                    book.thumbnailUrl ?? 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      book.name ?? 'Title',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      book.author?.name ?? 'Author',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      parseDateTime(
                        book.createdAt ?? DateTime.now().toIso8601String(),
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Favorite : ${book.favoriteCount ?? ''}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Total Read : ${book.readCount ?? 0}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Category:\n${book.categories?.join(', ')}",
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                showDetailButton
                    ? AppButton(
                        onPressed: () => router.push('/book/${book.id}'),
                        label: "View Book",
                        icon: Icons.arrow_forward_ios,
                        iconPosition: IconPosition.right,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
