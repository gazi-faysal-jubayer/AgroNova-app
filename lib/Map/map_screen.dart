import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];

  // Function to add markers dynamically based on user's tap
  void _handleTap(LatLng latlng) {
    setState(() {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: latlng,
          builder: (ctx) => Container(
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40.0,
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dynamic Map'),
      // ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(51.509865, -0.118092), // Default location (London)
          zoom: 13.0,
          onTap: (tapPosition, latlng) => _handleTap(latlng), // Add a tap event listener
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            // attribution: '© OpenStreetMap contributors',  // Correct attribution
          ),
          MarkerLayer(
            markers: markers, // Display dynamic markers here
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Optionally, you can clear all markers
          setState(() {
            markers.clear();
          });
        },
        child: Icon(Icons.clear),
        backgroundColor: Colors.red,
      ),
    );
  }
}
