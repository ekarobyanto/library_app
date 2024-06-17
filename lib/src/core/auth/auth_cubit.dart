import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/auth/service/firebase_auth_service.dart';
import 'package:library_app/src/features/auth/models/auth_params.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthService firebaseAuthService;
  AuthCubit({required this.firebaseAuthService})
      : super(const AuthState.loading());

  static const String defaultAuthError = 'Failed to retrieve user data.';

  emailSignUp(AuthParams params) async {
    try {
      emit(const _Loading());
      await firebaseAuthService
          .createUserWithEmailAndPassword(
            email: params.email,
            password: params.password,
          )
          .then(
            (UserCredential userCred) => (userCred.user != null)
                ? emailSignIn(params)
                : emit(const _Error(message: defaultAuthError)),
          )
          .catchError(onError);
    } on FirebaseAuthException catch (err) {
      emit(_Error(message: err.message ?? defaultAuthError));
    } catch (err) {
      emit(_Error(message: err.toString()));
    }
  }

  emailSignIn(AuthParams params) async {
    try {
      emit(const _Loading());
      UserCredential? userCred =
          await firebaseAuthService.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      if ((params.name ?? '').isNotEmpty) {
        await firebaseAuthService.currentUser?.updateDisplayName(params.name);
      }
      if (userCred.user != null) {
        emit(_SignedIn(userCred: userCred));
      } else {
        emit(const _Error(message: defaultAuthError));
      }
    } on FirebaseAuthException catch (err) {
      emit(_Error(message: err.message ?? defaultAuthError));
    } catch (err) {
      emit(_Error(message: err.toString()));
    }
  }

  checkAuthState() async {
    emit(const _Loading());
    try {
      final String? idToken =
          await firebaseAuthService.currentUser?.getIdToken();
      final User? user = firebaseAuthService.currentUser;
      log(user?.displayName ?? '--');
      log(idToken ?? 'No user found');
      log(firebaseAuthService.currentUser?.displayName ?? '--');
      if (idToken != null) {
        emit(const _SignedIn());
      }
    } on FirebaseAuthException catch (err) {
      emit(_Error(message: err.message ?? defaultAuthError));
    } catch (err) {
      emit(_Error(message: err.toString()));
    }
  }
}
