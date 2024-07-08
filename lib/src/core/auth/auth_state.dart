part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading([String? message]) = _Loading;
  const factory AuthState.signedIn({User? userCred}) = _SignedIn;
  const factory AuthState.signedUp() = _SignedUp;
  const factory AuthState.signedOut() = _SignedOut;
  const factory AuthState.error({required String message}) = _Error;
}
