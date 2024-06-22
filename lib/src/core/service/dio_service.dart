import 'package:dio/dio.dart';
import 'package:library_app/src/core/auth/service/firebase_auth_service.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/core/service/interceptors/auth_interceptor.dart';
import 'package:library_app/src/core/service/interceptors/log_interceptor.dart';
import 'package:library_app/src/core/service/interceptors/url_interceptor.dart';
import 'package:library_app/src/core/service/remote_config_service.dart';

final class DioService {
  final Dio dio;
  final FirebaseAuthService firebaseAuth;
  final FirebaseRemoteConfigService remoteConfigService;

  DioService.initialize(
    this.dio,
    this.firebaseAuth,
    this.remoteConfigService,
  ) {
    try {
      logger.i("Initialize Dio Service");
      dio
        ..interceptors.add(AuthInterceptor(firebaseAuth))
        ..interceptors.add(UrlInterceptor(remoteConfigService))
        ..interceptors.add(LoggingInterceptor());
      logger.i("Dio Service Initialized");
    } catch (err) {
      logger.e("Failed to initialize Dio Service: $err");
    }
  }
}
