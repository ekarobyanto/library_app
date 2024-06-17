import 'package:dio/dio.dart';

class DioService {
  final Dio dio = Dio();

  DioService() {
    dio.interceptors.add(LogInterceptor());
    dio.options.baseUrl = 'https://perpus-app-zlrfuncrya-uc.a.run.app/';
  }
}
