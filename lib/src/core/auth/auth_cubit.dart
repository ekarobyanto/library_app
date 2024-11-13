import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/src/core/auth/repository/auth_repository.dart';
import 'package:library_app/src/core/auth/service/firebase_auth_service.dart';
import 'package:library_app/src/core/auth/utils/firebase_auth.exception.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/features/auth/models/auth_params.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthService firebaseAuthService;
  final AuthRepository authRepository;
  AuthCubit({
    required this.firebaseAuthService,
    required this.authRepository,
  }) : super(const AuthState.loading());

  static const String defaultAuthError = 'Failed to retrieve user data.';

  emailSignUp(AuthParams params) async {
    try {
      emit(const _Loading('Signing up...'));
      await authRepository
          .createUserWithEmailAndPassword(params)
          .then((_) => emailSignIn(params));
    } on FirebaseAuthException catch (err) {
      emit(_Error(message: parseFirebaseAuthError(err.code)));
    } catch (err) {
      emit(_Error(message: err.toString()));
    }
  }

  emailSignIn(AuthParams params) async {
    try {
      emit(const _Loading('Signing in...'));
      await firebaseAuthService.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      if ((params.name ?? '').isNotEmpty) {
        await firebaseAuthService.currentUser?.updateDisplayName(params.name);
      }
      checkAuthState();
    } on FirebaseAuthException catch (err) {
      emit(_Error(message: parseFirebaseAuthError(err.code)));
    } catch (err) {
      emit(_Error(message: err.toString()));
    }
  }

  signOut() async {
    try {
      emit(const _Loading('Signing out...'));
      await firebaseAuthService.signOut();
      emit(const _SignedOut());
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
      logger.i(user);
      logger.i(idToken);
      if (idToken == null) {
        emit(const _SignedOut());
      } else {
        emit(_SignedIn(userCred: user));
      }
    } on FirebaseAuthException catch (err) {
      emit(_Error(message: err.message ?? defaultAuthError));
    } catch (err) {
      emit(_Error(message: err.toString()));
    }
  }
}
