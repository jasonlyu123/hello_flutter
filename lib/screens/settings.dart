import 'package:flutter/material.dart';
import 'package:hello_flutter/service/settings/setting_service.dart';
import 'package:hello_flutter/widgets/nav/app_nav.dart';

class Settings extends StatefulWidget {
  static const String title = '設定';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final SettingService _settingService = SettingService();
  ThemeMode _themeMode = ThemeMode.system;
  bool _isLoading = true;

  _onThemeModeChange(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });

    _settingService.saveThemeMode(mode);
  }

  @override
  void initState() {
    super.initState();
    final themeFuture = _initThemeSetting();

    Future.wait([themeFuture]).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future _initThemeSetting() {
    return _settingService.getThemeMode().then((v) {
      setState(() {
        _themeMode = v;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var column = Column(
      children: <Widget>[
        ListTile(
          title: const Text('深色模式'),
        ),
        RadioListTile<ThemeMode>(
          title: const Text('遵循系統設定'),
          value: ThemeMode.system,
          groupValue: _themeMode,
          onChanged: _onThemeModeChange,
        ),
        RadioListTile<ThemeMode>(
          title: const Text('深色'),
          value: ThemeMode.dark,
          groupValue: _themeMode,
          onChanged: _onThemeModeChange,
        ),
        RadioListTile<ThemeMode>(
          title: const Text('淺色'),
          value: ThemeMode.light,
          groupValue: _themeMode,
          onChanged: _onThemeModeChange,
        )
      ],
    );

    var processIndicator = Center(
      child: CircularProgressIndicator(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(Settings.title),
      ),
      body: _isLoading ? processIndicator : column,
      bottomNavigationBar: AppNav(1),
    );
  }
}
