import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'map_layer_selection.dart';
import 'map_area_info.dart';
import 'utils.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng> polygonPoints = [];
  List<Marker> markers = [];
  MapController mapController = MapController();
  String currentLayer = 'Street';
  double area = 0.0;
  double perimeter = 0.0;
  Map<String, dynamic> soilData = {}; // Store soil data

  // Function to add markers dynamically based on user's tap
  void _handleTap(LatLng latlng) async {
    setState(() {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: latlng,
          child: const Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40.0,
          ),
        ),
      );
      polygonPoints.add(latlng);

      if (polygonPoints.length > 2) {
        area = calculatePolygonArea(polygonPoints);
        perimeter = calculatePolygonPerimeter(polygonPoints);
      }
    });

    // Fetch and update soil data
    final fetchedSoilData = await fetchSoilData(latlng);
    setState(() {
      soilData = fetchedSoilData;
      print(soilData['properties']['layers'][0]['depths'][0]['values']['mean']);
    });
  }

  // Function to get user's current location with permission handling
  Future<void> _getCurrentLocation() async {
    try {
      PermissionStatus permission = await Permission.location.status;
      if (permission.isDenied || permission.isRestricted) {
        PermissionStatus newPermission = await Permission.location.request();
        if (!newPermission.isGranted) {
          throw 'Location permission denied by user.';
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng userLocation = LatLng(position.latitude, position.longitude);

      setState(() {
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: userLocation,
            child: const Icon(
              Icons.my_location,
              color: Colors.blue,
              size: 40.0,
            ),
          ),
        );
        polygonPoints.add(userLocation);

        if (polygonPoints.length > 2) {
          area = calculatePolygonArea(polygonPoints);
          perimeter = calculatePolygonPerimeter(polygonPoints);
        }
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
              initialCenter: const LatLng(51.509865, -0.118092),
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
              if (polygonPoints.isNotEmpty)
                PolygonLayer(
                  polygons: [
                    Polygon(
                      points: polygonPoints,
                      borderColor: Colors.blue,
                      borderStrokeWidth: 3.0,
                      color: Colors.blue.withOpacity(0.2),
                    ),
                  ],
                ),
              MarkerLayer(
                markers: markers,
              ),
            ],
          ),
          MapLayerSelection(
            currentLayer: currentLayer,
            onLayerChanged: (layer) {
              setState(() {
                currentLayer = layer;
              });
            },
          ),
          MapAreaInfo(
            area: area,
            perimeter: perimeter,
            soilData: soilData, // Pass soil data to MapAreaInfo
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
                polygonPoints.clear();
                area = 0.0;
                perimeter = 0.0;
                soilData = {}; // Clear soil data
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
