import 'package:flutter/material.dart';

import 'bottom_nav_home.dart';

void main() {
  runApp(AgriApp());
}

class AgriApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agri App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BottomNavHome(),
    );
  }
}
