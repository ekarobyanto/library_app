import 'package:flutter/material.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/overlay/loading_overlay.dart';
import 'package:library_app/src/utils/show_alert.dart';

void authStateListener(BuildContext context, AuthState state) {
  state.whenOrNull(
    signedIn: (cred) {
      loadingOverlay.remove();
      showAlert(
        context: context,
        message: 'Welcome, ${cred?.user?.displayName}!',
      );
    },
    loading: (message) => Overlay.of(context).insert(loadingOverlay),
    error: (message) {
      loadingOverlay.remove();
      showAlert(context: context, message: message);
    },
  );
}
