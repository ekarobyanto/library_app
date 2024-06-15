import 'package:flutter/material.dart';

showAlert({
  required BuildContext context,
  String? title,
  String? message,
  List<TextButton>? actionButtons,
}) =>
    showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: message != null ? Text(message) : null,
        actions: actionButtons ?? [],
      ),
    );
