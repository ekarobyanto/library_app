import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:library_app/src/core/internal/logger.dart';

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
