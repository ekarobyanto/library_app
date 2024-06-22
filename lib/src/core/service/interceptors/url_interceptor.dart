import 'package:dio/dio.dart';
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
    final baseUrl = await _remoteConfigService.getString('base_url');
    if (baseUrl == null) {
      throw Exception('Base Url is not set, check remote config');
    }
    logger.i('Set Base Url $baseUrl');
    options.baseUrl = baseUrl ?? options.baseUrl;
    super.onRequest(options, handler);
  }
}
