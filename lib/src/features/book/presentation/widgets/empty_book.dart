import 'package:flutter/material.dart';

class EmptyBook extends StatelessWidget {
  const EmptyBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.book,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 8),
          Text(
            'No books found',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
