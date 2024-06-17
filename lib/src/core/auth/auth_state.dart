part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.signedIn({UserCredential? userCred}) = _SignedIn;
  const factory AuthState.signedUp() = _SignedUp;
  const factory AuthState.error({required String message}) = _Error;
}
