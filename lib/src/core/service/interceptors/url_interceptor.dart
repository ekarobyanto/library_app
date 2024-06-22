import 'package:dio/dio.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UrlInterceptor extends Interceptor {
  String? _baseUrl;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _baseUrl ??= await _getBaseUrl();
    if (_baseUrl == null) {
      throw Exception('Base Url is not set, check remote config');
    }
    logger.i('Set Base Url $_baseUrl');
    options.baseUrl = _baseUrl ?? options.baseUrl;
    super.onRequest(options, handler);
  }

  Future<String?> _getBaseUrl() async {
    logger.i('Get Base Url');
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('base_url');
  }
}
