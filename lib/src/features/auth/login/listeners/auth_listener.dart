import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/cubit/auth_cubit.dart';
import 'package:library_app/src/utils/show_alert.dart';

void authStateListener(BuildContext context, AuthState state) {
  state.whenOrNull(
    signedIn: (cred) {
      context.pop();
      showAlert(
        context: context,
        message: 'Welcome, ${cred?.user?.displayName}!',
      );
    },
    loading: () => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) => const Center(child: CircularProgressIndicator()),
    ),
    error: (message) {
      context.pop();
      showAlert(context: context, message: message);
    },
  );
}
