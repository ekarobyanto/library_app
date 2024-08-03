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

  logErrors(DioException e) {
    logger.e(e.error);
    logger.e(e.message);
    logger.e(e.response);
    logger.e(e.response?.data);
  }

  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(path, queryParameters: params);
      logger.i(response.data);
      return response;
    } on DioException catch (e) {
      logErrors(e);
      throw e.response?.data;
    }
  }

  post(String path, {Object? data, Options? option}) async {
    try {
      logger.i(data);
      final response = await dio.post(path, data: data);
      logger.i(response.data);
      return response.data;
    } on DioException catch (e) {
      logErrors(e);
      throw e.response?.data;
    }
  }

  put(String path, {Object? data}) async {
    try {
      logger.i(data);
      final response = await dio.put(path, data: data);
      logger.i(response.data);
      return response.data;
    } on DioException catch (e) {
      logErrors(e);
      throw e.response?.data;
    }
  }

  delete(String path, {Object? data}) async {
    try {
      logger.i(data);
      final response = await dio.delete(path, data: data);
      logger.i(response.data);
      return response.data;
    } on DioException catch (e) {
      logErrors(e);
      throw e.response?.data;
    }
  }

  patch(String path, {Object? data}) async {
    try {
      logger.i(data);
      final response = await dio.patch(path, data: data);
      logger.i(response.data);
      return response.data;
    } on DioException catch (e) {
      logErrors(e);
      throw e.response?.data;
    }
  }
}
