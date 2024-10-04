import 'package:agro_nova_app/Crop%20Info/About/about.dart';
import 'package:agro_nova_app/Crop%20Info/Insects/insects.dart';
import 'AI chat/ai_chat.dart';
import 'package:flutter/material.dart';
import 'EONET events/eonet_events.dart';
import 'crop_card.dart';

class CropInfoScreen extends StatelessWidget {
  const CropInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap content in SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30), // Optional padding at the top

              // Disaster Events Card
              CropCard(
                title: 'Disaster Events',
                description: 'Click to view recent disaster events.',
                icon: Icons.flood_outlined,
                imagePath: 'assets/image/eonet.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EonetEvents()),
                  );
                },
                gradientColors: [Colors.transparent, Colors.lightGreen],
              ),
              const SizedBox(height: 20),

              // Crop Growth Info Card with Background Image
              CropCard(
                title: 'AgroNova Ai',
                description: 'Click to ask AgroNova Ai.',
                icon: Icons.eco_rounded,
                imagePath: 'assets/image/ai_chat.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AiChat()),
                  );
                },
                gradientColors: [Colors.transparent, Colors.greenAccent],
              ),
              const SizedBox(height: 20),

              // Insects Card
              CropCard(
                title: 'Insects',
                description: 'Click to learn about pest control.',
                svgIconPath: 'assets/image/bug-svgrepo-com.svg',
                imagePath: 'assets/image/insect.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Insects()),
                  );
                },
                gradientColors: [ Colors.transparent, Colors.yellowAccent],
              ),
              const SizedBox(height: 20),

              // About Us Card
              CropCard(
                title: 'About Us',
                imagePath: 'assets/image/about.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const About()),
                  );
                },
                gradientColors: [Colors.transparent, Colors.transparent, Colors.pinkAccent],
              ),
              const SizedBox(height: 30),

              // Optional padding at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
