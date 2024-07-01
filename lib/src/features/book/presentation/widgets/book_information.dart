import 'package:flutter/material.dart';
import 'package:library_app/src/widgets/book_header.dart';

class BookInformation extends StatelessWidget {
  const BookInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookHeader(),
        SizedBox(
          height: 16,
        ),
        Text(
          'Description',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
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
