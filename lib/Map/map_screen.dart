import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];
  MapController mapController = MapController();
  String currentLayer = 'Street';

// Function to add markers dynamically based on user's tap
  void _handleTap(LatLng latlng) {
    setState(() {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: latlng,
          child: Container(
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40.0,
            ),
          ),
        ),
      );
    });
  }


  // Function to get user's current location
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng userLocation = LatLng(position.latitude, position.longitude);

      setState(() {
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: userLocation,
            child: Container(
              child: const Icon(
                Icons.my_location,
                color: Colors.blue,
                size: 40.0,
              ),
            ),
          ),
        );
      });

      mapController.move(userLocation, 15.0);
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: const LatLng(51.509865, -0.118092), // Default location (London)
              initialZoom: 13.0,
              onTap: (tapPosition, latlng) => _handleTap(latlng),
            ),
            children: [
              TileLayer(
                urlTemplate: currentLayer == 'Street'
                    ? 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
                    : currentLayer == 'Satellite'
                    ? 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}'
                    : 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: markers,
              ),
            ],
          ),
          Positioned(
            top: 50,
            right: 10,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentLayer = 'Street';
                    });
                  },
                  child: const Text('Street'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentLayer = 'Satellite';
                    });
                  },
                  child: const Text('Satellite'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentLayer = 'Hybrid';
                    });
                  },
                  child: const Text('Hybrid'),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _getCurrentLocation,
            heroTag: 'location',
            child: const Icon(Icons.my_location),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                markers.clear();
              });
            },
            backgroundColor: Colors.red,
            heroTag: 'clear',
            child: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}