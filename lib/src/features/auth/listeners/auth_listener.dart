import 'package:flutter/material.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/overlay/loading_overlay.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/utils/show_alert.dart';

void authStateListener(BuildContext context, AuthState state) {
  state.whenOrNull(
    signedIn: (cred) {
      try {
        loadingOverlay.remove();
      } catch (e) {
        debugPrint(e.toString());
      }
      router.go('/dashboard');
    },
    loading: (message) => Overlay.of(context).insert(loadingOverlay),
    error: (message) {
      loadingOverlay.remove();
      showAlert(context: context, message: message);
    },
  );
}
