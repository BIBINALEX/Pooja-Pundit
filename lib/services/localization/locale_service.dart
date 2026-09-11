import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pooja_pundit/core/di/providers.dart' as di;

class LocaleService {
  static const _key = 'app_locale';

  LocaleService({required this.prefs});

  final SharedPreferences prefs;
  Locale? _current;

  Future<void> loadLocale() async {
    final code = prefs.getString(_key);
    if (code != null && code.isNotEmpty) {
      _current = Locale(code);
    }
  }

  Locale? get locale => _current;

  Future<void> setLocale(Locale? locale) async {
    _current = locale;
    if (locale == null) {
      await prefs.remove(_key);
    } else {
      await prefs.setString(_key, locale.languageCode);
    }
  }
}

final localeProvider = NotifierProvider<LocaleController, Locale?>(
  LocaleController.new,
);

class LocaleController extends Notifier<Locale?> {
  late final LocaleService _service;

  @override
  Locale? build() {
    _service = ref.watch(di.localeServiceProvider);
    return _service.locale;
  }

  Future<void> set(Locale? locale) async {
    await _service.setLocale(locale);
    state = _service.locale;
  }
}
