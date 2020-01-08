import 'package:flutter/material.dart';
import 'package:hello_flutter/routes.dart';
import 'package:hello_flutter/theme/theme_dart.dart';
import 'package:hello_flutter/theme/theme_light.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeLightData,
      darkTheme: themeDarkData,
      themeMode: ThemeMode.system,
      routes: routes,
    );
  }
}
