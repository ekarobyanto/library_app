import 'package:dio/dio.dart';

class DioService {
  final Dio dio = Dio();

  DioService() {
    dio.interceptors.add(LogInterceptor());
  }
}
