import 'package:flutter/material.dart';
import 'package:hello_flutter/routes.dart';
import 'package:hello_flutter/service/settings/setting_service.dart';
import 'package:hello_flutter/theme/theme_dart.dart';
import 'package:hello_flutter/theme/theme_light.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SettingService _settingService = SettingService();
  ThemeMode _themeMode = ThemeMode.system;

  Future<void> initThemeMode() async {
    final mode = await _settingService.getThemeMode();
    setThemeMode(mode);
  }

  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  void initState() {
    super.initState();
    initThemeMode();
    SettingService.subscribe(SettingService.themeModeKey, setThemeMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeLightData,
      darkTheme: themeDarkData,
      themeMode: _themeMode,
      routes: routes,
    );
  }
}
