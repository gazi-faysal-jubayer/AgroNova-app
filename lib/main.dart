import 'package:flutter/material.dart';

import 'bottom_nav_home.dart';

void main() {
  runApp(const AgriApp());
}

class AgriApp extends StatelessWidget {
  const AgriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroNova',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const BottomNavHome(),
    );
  }
}
