import 'AI chat/ai_chat.dart';
import 'package:flutter/material.dart';
import 'EONET events/eonet_events.dart';
import 'crop_card.dart';

class CropInfoScreen extends StatelessWidget {
  const CropInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
    );
  }
}

