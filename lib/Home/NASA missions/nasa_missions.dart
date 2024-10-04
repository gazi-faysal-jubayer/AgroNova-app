import 'package:agro_nova_app/Home/NASA%20missions/aqua.dart';
import 'package:agro_nova_app/Home/NASA%20missions/gpm.dart';
import 'package:agro_nova_app/Home/NASA%20missions/grace.dart';
import 'package:agro_nova_app/Home/NASA%20missions/landsat.dart';
import 'package:agro_nova_app/Home/NASA%20missions/modis.dart';
import 'package:agro_nova_app/Home/NASA%20missions/smap.dart';
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
          _missionButton(
            'SMAP',
            Colors.red,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Smap()),
              );
            },
          ),
          _missionButton(
            'AQUA',
            Colors.cyan,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Aqua()),
              );
            },
          ),
          _missionButton(
            'GPM',
            Colors.deepOrange,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Gpm()),
              );
            },
          ),
          _missionButton(
            'GEACE',
            Colors.deepPurple,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Grace()),
              );
            },
          ),
          _missionButton(
            'MODIS',
            Colors.pinkAccent,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Modis()),
              );
            },
          ),
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
