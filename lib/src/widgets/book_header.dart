import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/button.dart';

class BookHeader extends StatelessWidget {
  final bool showDetailButton;
  const BookHeader({super.key, this.showDetailButton = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: 'book-image',
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200],
            ),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              width: 180,
              height: 240,
              imageUrl: 'https://via.placeholder.com/150',
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                maxLines: 2,
                "BOOK TITLE",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Text(
                "Author Name",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Upload Date",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Favorite :",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Total Read :",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Category:\nHorror, Action, Comedy",
                maxLines: 3,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showDetailButton
                  ? AppButton(
                      onPressed: () => router.push('/book/1'),
                      label: "View Details",
                      icon: Icons.arrow_forward_ios,
                      iconPosition: IconPosition.right,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        )
      ],
    );
  }
}
