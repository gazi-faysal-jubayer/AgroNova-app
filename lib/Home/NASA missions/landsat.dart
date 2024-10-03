import 'package:flutter/material.dart';
import 'mission_card.dart';

class Landsat extends StatelessWidget {
  const Landsat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              const SizedBox(height: 50), // Optional space at the top
              MissionCard(
                videoPath: 'assets/video/lansat.mp4', // Path to video asset
                logoPath: 'assets/image/nasa_logo.png',
              ),
              const SizedBox(height: 20),

              // Headline Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'NASA Missions at a Glance',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}