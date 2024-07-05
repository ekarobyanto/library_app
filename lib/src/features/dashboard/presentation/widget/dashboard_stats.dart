import 'package:flutter/material.dart';
import 'package:library_app/src/features/dashboard/presentation/widget/content_row.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final Icon icon;
  final List<ContentRowContent> contents;
  const StatsCard({
    super.key,
    required this.icon,
    required this.contents,
    this.label = 'Book Stats',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ContentRow(
            contents: contents,
          ),
        ],
      ),
    );
  }
}
