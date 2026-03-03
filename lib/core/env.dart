import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Env {
  static final _assetPath = 'assets/env/env_dev.json';
  Env._();

  static Map<String, String> _runtime = {};

  static const Map<String, String> _keys = {
    "R2_BASE_URL": String.fromEnvironment("R2_BASE_URL"),
    "R2_ACCOUNT_ID": String.fromEnvironment("R2_ACCOUNT_ID"),
    "R2_ACCESS_KEY_ID": String.fromEnvironment("R2_ACCESS_KEY_ID"),
    "R2_SECRET_ACCESS_KEY_ID":
        String.fromEnvironment("R2_SECRET_ACCESS_KEY_ID"),
  };

  static Future<void> init() async {
    final hasAnyDartDefine = _keys.values.any((v) => v.isNotEmpty);

    if (kReleaseMode || hasAnyDartDefine) {
      _runtime = const {};
      return;
    }

    // Debug sem dart-define => carregar assets
    // const assetPath = 'assets/env/dev.json';
    final raw = await rootBundle.loadString(_assetPath);
    final jsonMap = (jsonDecode(raw) as Map).map(
      (k, v) => MapEntry(k.toString(), v.toString()),
    );

    _runtime = jsonMap;
  }

  static String _getKey(String key) {
    // 1) Prioriza dart-define se existir
    final fromDefine = _keys[key] ?? '';
    if (fromDefine.isNotEmpty) return fromDefine;

    // 2) Se não, usa runtime (assets)
    final fromAsset = _runtime[key] ?? '';
    if (fromAsset.isNotEmpty) return fromAsset;

    throw Exception('$key is not set (dart-define or assets)');
  }

  static String get r2BaseUrl => _getKey("R2_BASE_URL");
  static String get r2AccountId => _getKey("R2_ACCOUNT_ID");
  static String get r2AccessKeyId => _getKey("R2_ACCESS_KEY_ID");
  static String get r2SecretAccessKeyId => _getKey("R2_SECRET_ACCESS_KEY_ID");
}
