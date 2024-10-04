import 'package:agro_nova_app/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:agro_nova_app/background.dart'; // Import the Background widget

void main() {
  runApp(const AgriApp());
}

class AgriApp extends StatelessWidget {
  const AgriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroNova',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Background(
          child: OnboardingScreen(), // Pass your onboarding screen here
        ),
      ),
    );
  }
}
