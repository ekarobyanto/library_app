import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UrlInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final baseUrl = prefs.getString('baseUrl');
    options.baseUrl = baseUrl ?? options.baseUrl;
    super.onRequest(options, handler);
  }
}
