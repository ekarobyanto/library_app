import 'package:flutter/material.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/overlay/loading_overlay.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/utils/show_alert.dart';

void authStateListener(
  BuildContext context,
  AuthState state,
  LoadingOverlay loadingOverlay,
) {
  state.whenOrNull(
    signedIn: (cred) {
      loadingOverlay.hide();
      router.go('/dashboard');
    },
    loading: (message) {
      loadingOverlay.show(context, message);
    },
    error: (message) {
      loadingOverlay.hide();
      showAlert(context: context, message: message);
    },
  );
}
