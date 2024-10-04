import 'package:flutter/material.dart';
import '../../Home/NASA missions/mission_card.dart';
import 'team_member_card.dart'; // Import the TeamMemberCard widget

class About extends StatelessWidget {
  const About({super.key});

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
                videoPath: 'assets/video/about.mp4',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Use TeamMemberCard widget
              const TeamMemberCard(
                imagePath: 'assets/image/Akib.png',
                name: 'Akibur Ur Rahat',
                position: 'Team Lead',
              ),
              const TeamMemberCard(
                imagePath: 'assets/image/Nahar.jpg',
                name: 'Mehzabin Nahar',
                position: 'Research Lead',
              ),
              const TeamMemberCard(
                imagePath: 'assets/image/gazi.jpg',
                name: 'Gazi Faysal Jubayer',
                position: 'App Developer',
              ),
              const TeamMemberCard(
                imagePath: 'assets/image/rahim.jpg',
                name: 'Md. Abdur Raheem',
                position: 'UI/UX Designer',
              ),
              const TeamMemberCard(
                imagePath: 'assets/image/nafi.png',
                name: 'Naich Naznafi',
                position: 'Graphics Lead',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
