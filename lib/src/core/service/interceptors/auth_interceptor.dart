import 'package:dio/dio.dart';
import 'package:library_app/src/core/auth/service/firebase_auth_service.dart';

class AuthInterceptor extends Interceptor {
  final FirebaseAuthService firebaseAuth;
  AuthInterceptor(this.firebaseAuth);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await firebaseAuth.currentUser
        ?.getIdToken()
        .then((idToken) => idToken)
        .catchError((_) => '');

    if (token?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
