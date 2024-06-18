import 'package:dio/dio.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/core/service/interceptors/log_interceptor.dart';
import 'package:library_app/src/core/service/interceptors/url_interceptor.dart';

class DioService {
  final Dio dio = Dio();

  DioService() {
    logger.i("Initialize Dio Service");
    dio.interceptors.addAll([LoggingInterceptor(), UrlInterceptor()]);
  }
}
