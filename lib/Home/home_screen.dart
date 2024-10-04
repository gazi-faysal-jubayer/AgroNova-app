import 'package:agro_nova_app/Home/NASA%20missions/nasa_missions.dart';
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NasaMissions()),
                  );
                },
                gradientColors: [Colors.transparent, Colors.cyan],
              ),
              const SizedBox(height: 20),
              FarminovaCard(
                imagePath: 'assets/image/farminova.png', // Your background image path
                buttonText: 'Open Figma',
                figmaLink: 'https://www.figma.com/proto/mcdizEPdS3OUVUAvIDqXtU/FarmiNova?page-id=0%3A1&node-id=1-2062&node-type=canvas&viewport=-8553%2C-6973%2C0.94&t=12LXlEdpozjgift9-1&scaling=scale-down&content-scaling=fixed',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
