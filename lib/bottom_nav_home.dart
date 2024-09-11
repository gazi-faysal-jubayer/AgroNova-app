import 'package:flutter/material.dart';

import 'Crop Info/crop_info_screen.dart';
import 'Home/home_screen.dart';
import 'Map/map_screen.dart';
import 'Settings/settings_screen.dart';
import 'Weather/weather_screen.dart';

class BottomNavHome extends StatefulWidget {
  const BottomNavHome({super.key});

  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const CropInfoScreen(),
    const WeatherScreen(),
    const MapScreen(),
    const SettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Agri App"),
      // ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,  // Set the bottom navigation bar color to black
        selectedItemColor: Colors.green, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture),
            label: 'Crops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',  // Map label added here
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}