import 'package:flutter/material.dart';
import 'package:hello_flutter/theme/theme_dart.dart';
import 'package:hello_flutter/theme/theme_light.dart';

import 'screens/my_home_page.dart';

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
      home: MyHomePage(title: 'Hello Flutter'),
    );
  }
}
