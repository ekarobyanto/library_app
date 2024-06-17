import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showAlert({
  required BuildContext context,
  String? title,
  String? message,
  List<TextButton>? actionButtons,
}) =>
    showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        title: title != null ? Text(title, softWrap: true) : null,
        content: message != null ? Text(message) : null,
        actions: actionButtons ??
            [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('OK'),
              )
            ],
      ),
    );
