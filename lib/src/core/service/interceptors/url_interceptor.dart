import 'package:dio/dio.dart';
import 'package:library_app/src/core/constants/index.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:library_app/src/core/service/remote_config_service.dart';

class UrlInterceptor extends Interceptor {
  final FirebaseRemoteConfigService _remoteConfigService;

  UrlInterceptor(this._remoteConfigService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final baseUrl = _remoteConfigService.getString(BASE_URL);
    if (baseUrl.isEmpty) {
      throw Exception('Base Url is not set, check remote config');
    }
    logger.i('Set Base Url $baseUrl');
    options.baseUrl = baseUrl;
    super.onRequest(options, handler);
  }
}
