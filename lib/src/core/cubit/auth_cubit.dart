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

  static const String defaultAuthError = 'Failed to retrieve user data.';

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
      if ((params.name ?? '').isNotEmpty) {
        await auth.currentUser?.updateDisplayName(params.name);
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
      final String? idToken = await auth.currentUser?.getIdToken();
      final User? user = auth.currentUser;
      log(user?.displayName ?? '--');
      log(idToken ?? 'No user found');
      log(auth.currentUser?.displayName ?? '--');
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
