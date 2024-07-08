import 'package:flutter/material.dart';

class ErrorFetch extends StatelessWidget {
  final Function()? onRetry;
  final String? message;
  const ErrorFetch({
    super.key,
    this.onRetry,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message ?? 'An error occurred, please try again.'),
          if (onRetry != null)
            TextButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
        ],
      ),
    );
  }
}
