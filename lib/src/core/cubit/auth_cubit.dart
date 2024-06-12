import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/features/auth/models/auth_params.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthCubit() : super(const AuthState.initial());

  static const String defaultAuthError = 'Authentication failed.';

  emailSignUp(AuthParams params) async {
    try {
      emit(const _Loading());
      await auth
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
      UserCredential? userCred = await auth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
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
    final String? user = await auth.currentUser?.getIdToken();
    log(user ?? 'No user found');
    if (user != null) {
      emit(const _SignedIn());
    }
  }
}
