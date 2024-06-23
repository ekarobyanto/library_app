import 'package:flutter/material.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/core/overlay/overlay.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/utils/show_alert.dart';

void authStateListener(
  BuildContext context,
  AuthState state,
  AppOverlay loadingOverlay,
) {
  state.whenOrNull(
    signedIn: (cred) {
      try {
        loadingOverlay.hide();
      } catch (e) {
        logger.e(e.toString());
      }
      router.go('/dashboard');
    },
    loading: (message) {
      try {
        loadingOverlay.hide();
      } catch (e) {
        logger.e(e.toString());
      }
      loadingOverlay.show(context, message);
    },
    error: (message) {
      try {
        loadingOverlay.hide();
      } catch (e) {
        logger.e(e.toString());
      }
      showAlert(context: context, message: message);
    },
  );
}
