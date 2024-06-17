import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:library_app/src/core/internal/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseRemoteConfigService {
  late FirebaseRemoteConfig _remoteConfig;

  FirebaseRemoteConfigService() {
    _remoteConfig = FirebaseRemoteConfig.instance;
  }

  Future<void> initialize() async {
    log("Initializing remote config");
    try {
      await setConfigSettings();
      await _remoteConfig.fetchAndActivate();
      await SharedPreferences.getInstance().then((value) async {
        final baseUrl = _remoteConfig.getString('base_url');
        await value.setString('base_url', baseUrl);
      });
    } on PlatformException catch (e) {
      logger.e('Failed to initialize remote config: ${e.message}');
    }
  }

  getString(String key) => _remoteConfig.getString(key);

  Future<void> setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(hours: 12),
        ),
      );
}
