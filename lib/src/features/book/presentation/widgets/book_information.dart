import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookInformation extends StatelessWidget {
  const BookInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    maxLines: 3,
                    "BOOK TITLE WLEOWLEOWLEO WLEOWLEOWLEO",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "Author Name",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Upload Date",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Category:\nHorror, Harem, Brutal, Action, Comedy, Wtf",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Text(
                'Lorem ipsum dolor sit amet, cLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, nunc in dictum volutpat, velit eros laLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, nunc in dictum volutpat, velit eros laLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, nunc in dictum volutpat, velit eros laLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, nunc in dictum volutpat, velit eros laLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, nunc in dictum volutpat, velit eros laonsectetur adipiscing elit. Donec vehicula, nunc in dictum volutpat, velit eros laoreet ex, eu consectetur tortor ligula ut ex. Aliquam nulla dui, vestibulum et nisi ut, gravida vehicula tortor. Nulla vestibulum dui non dolor vehicula commodo. Suspendisse eleifend nec mauris eu commodo. Nulla lacinia id sem id consectetur. Nullam id ipsum fringilla, pellentesque nisl nec, scelerisque magna. Vivamus commodo viverra arcu et lobortis. Donec malesuada est nulla. Vivamus vehicula tincidunt lacus. Vestibulum vitae iaculis massa, nec imperdiet orci. In quis tincidunt ipsum. Fusce nec turpis tortor. Praesent eget nulla eget elit lacinia tempus. Duis tristique ante sit amet ante placerat accumsan. Curabitur nec rutrum nisl.',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
