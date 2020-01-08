import 'package:flutter/material.dart';
import 'package:hello_flutter/widgets/nav/app_nav.dart';

class Settings extends StatelessWidget {
  static const String title = "設定";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Center(),
      bottomNavigationBar: AppNav(1),
    );
  }
}
