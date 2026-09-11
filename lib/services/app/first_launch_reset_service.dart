import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstLaunchResetService {
  static const _resetCompletedKey = 'initial_state_reset_completed';

  const FirstLaunchResetService({
    FlutterSecureStorage? secureStorage,
    FirebaseAuth? firebaseAuth,
    FirebaseMessaging? firebaseMessaging,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage(),
       _firebaseAuth = firebaseAuth,
       _firebaseMessaging = firebaseMessaging;

  final FlutterSecureStorage _secureStorage;
  final FirebaseAuth? _firebaseAuth;
  final FirebaseMessaging? _firebaseMessaging;

  Future<void> resetIfNeeded() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(_resetCompletedKey) ?? false) return;

    await _secureStorage.deleteAll();
    await (_firebaseAuth ?? FirebaseAuth.instance).signOut();
    final messaging = _firebaseMessaging ?? FirebaseMessaging.instance;
    if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS) {
      final apnsToken = await messaging.getAPNSToken();
      if (apnsToken != null && apnsToken.isNotEmpty) {
        await messaging.deleteToken();
      }
    } else {
      await messaging.deleteToken();
    }
    await preferences.setBool(_resetCompletedKey, true);
  }
}
