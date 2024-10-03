import 'package:agro_nova_app/Home/NASA%20missions/landsat.dart';
import 'package:flutter/material.dart';
import 'mission_card.dart';

class NasaMissions extends StatelessWidget {
  const NasaMissions({super.key});

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
                videoPath: 'assets/video/nasa.mp4', // Path to video asset
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

              // Grid of mission buttons
              _buildMissionGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the grid of mission buttons
  Widget _buildMissionGrid(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.count(
        crossAxisCount: 2,
        // 2 items per row
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // Disable scrolling inside GridView
        crossAxisSpacing: 10,
        // Space between columns
        mainAxisSpacing: 10,
        // Space between rows
        childAspectRatio: 2.5,
        // Adjust to ensure buttons are evenly sized
        children: [
          _missionButton(
            'LANDSAT',
            Colors.blue,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Landsat()),
              );
            },
          ),
          _missionButton('Voyager', Colors.red, () {
            print('Voyager tapped');
            // Add your onTap action here
          }),
          _missionButton('Hubble', Colors.cyan, () {
            print('Hubble tapped');
            // Add your onTap action here
          }),
          _missionButton('Curiosity', Colors.deepOrange, () {
            print('Curiosity tapped');
            // Add your onTap action here
          }),
          _missionButton('Artemis', Colors.deepPurple, () {
            print('Artemis tapped');
            // Add your onTap action here
          }),
          _missionButton('Perseverance', Colors.pinkAccent, () {
            print('Perseverance tapped');
            // Add your onTap action here
          }),
        ],
      ),
    );
  }

  // Helper function to create TextButton for each mission
  Widget _missionButton(String missionName, Color color, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Text(
          missionName,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
