import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';

class EmptyBook extends StatelessWidget {
  final String? label;
  final Function()? onRefresh;
  const EmptyBook({super.key, this.label, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.book,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 8),
          Text(
            label ?? 'No books found',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          if (onRefresh != null) ...[
            const SizedBox(height: 8),
            IconButton(
              onPressed: onRefresh,
              icon: Icon(
                Icons.refresh,
                size: 30,
                color: color.primaryColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
