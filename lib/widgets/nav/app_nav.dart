import 'package:flutter/material.dart';
import 'package:hello_flutter/routes.dart';
import 'package:hello_flutter/screens/settings.dart';

class AppNav extends StatelessWidget {
  AppNav(this._currentIndex);

  final int _currentIndex;
  final List<String> routes = [homeRoute, settingsRoute];

  void _onItemTapped(int index, BuildContext context) {
    Navigator.pushNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: const Text('首頁'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: const Text(Settings.title),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) => _onItemTapped(index, context),
    );
  }
}
