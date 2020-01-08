import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/home_page.dart';
import 'package:hello_flutter/screens/settings.dart';

const String homeRoute = '/';
const String settingsRoute = '/settings';

final Map<String, WidgetBuilder> routes = {
  homeRoute: (context) => HomePage(title: 'Hello Flutter'),
  settingsRoute: (context) => Settings(),
};
