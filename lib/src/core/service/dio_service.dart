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

  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(path, queryParameters: params);
      logger.i(response.data);
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.post(path, data: data);
      logger.i(response.data);
      return response.data;
    } on DioException catch (e) {
      logger.e(e.error);
      logger.e(e.message);
      rethrow;
    }
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.put(path, data: data);
      logger.i(response.data);
      return response.data;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Response> delete(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.delete(path, data: data);
      logger.i(response.data);
      return response.data;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Response> patch(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.patch(path, data: data);
      logger.i(response.data);
      return response.data;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
