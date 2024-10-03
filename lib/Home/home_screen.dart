import 'package:flutter/material.dart';

import 'farminova_card.dart';
import 'home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Makes the content scrollable
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              const SizedBox(height: 50), // Optional space at the top
              HomeCard(
                title: 'NASA missions',
                description: 'Click to view NASA missions.',
                imagePath: 'assets/image/nasa_mission.png',
                logoPath: 'assets/image/nasa_logo.png', // Your NASA logo path
                onTap: () {
                  // Handle tap action here
                },
                gradientColors: [Colors.transparent, Colors.cyan],
              ),
              const SizedBox(height: 20),
              FarminovaCard(
                imagePath: 'assets/image/farminova.png', // Your background image path
                buttonText: 'Open Figma',
                figmaLink: 'https://www.figma.com/proto/fvWPrQpBqvr5v2Hp5TTp0Y/Agronova-Main?node-id=2063-3145&t=f4Mjg1sBYCPEPUg7-1&starting-point-node-id=3%3A72',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
