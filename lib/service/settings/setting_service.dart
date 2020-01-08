import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingService {
  static const String themeModeKey = 'themeMode';

  Future<SharedPreferences> _getPrefInstance() async {
    return SharedPreferences.getInstance();
  }

  void saveThemeMode(ThemeMode mode) async {
    final prefs = await _getPrefInstance();

    prefs.setInt(themeModeKey, mode.index);

    _dispatch<ThemeMode>(themeModeKey, mode);
  }

  Future<ThemeMode> getThemeMode() async {
    final prefs = await _getPrefInstance();

    final themModeIndex = prefs.getInt(themeModeKey);
    return ThemeMode.values[themModeIndex];
  }

  static Map<String, List> _subcriptions = {};

  static void subscribe<T>(String settingKey, ValueChanged<T> callback) {
    _subcriptions.putIfAbsent(settingKey, () => <ValueChanged<T>>[]);
    _subcriptions[settingKey].add(callback);
  }

  void _dispatch<T>(String settingKey, T value) {
    final hasSubs = _subcriptions.containsKey(settingKey);

    if (!hasSubs) {
      return;
    }

    final subs = _subcriptions[settingKey];
    subs.forEach((sub) => sub(value));
  }
}
