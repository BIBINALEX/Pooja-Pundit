import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    await (_firebaseMessaging ?? FirebaseMessaging.instance).deleteToken();
    await preferences.setBool(_resetCompletedKey, true);
  }
}
