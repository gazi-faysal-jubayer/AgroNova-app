import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_icons/weather_icons.dart';
import '../../Model/eonet_data_model.dart' as eventModel;

class EventDetails extends StatelessWidget {
  final eventModel.Event event;

  EventDetails({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.description.isNotEmpty
                  ? event.description
                  : "No description available",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Categories:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            for (var category in event.categories)
              Text("  - ${category.title.toString().split('.').last}"),
            SizedBox(height: 10),
            Text(
              "Sources: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: event.sources.map((source) {
                return ListTile(
                  // title: Text(source.id),
                  subtitle: Text(source.url),
                  trailing: Icon(Icons.open_in_browser),
                  onTap: () {
                    // Implement link opening functionality if needed
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              "Event Location on Map",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: _getEventLocation(),
                  initialZoom: 5.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: _buildMarkers(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  LatLng _getEventLocation() {
    // Default to the first geometry coordinates
    if (event.geometries.isNotEmpty) {
      var geometry = event.geometries.first;
      return LatLng(geometry.coordinates[1], geometry.coordinates[0]);
    }
    // Default location if no geometries are available
    return LatLng(0, 0);
  }

  List<Marker> _buildMarkers() {
    return event.geometries.map((geometry) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(geometry.coordinates[1], geometry.coordinates[0]),
        child: _getMarkerIcon(event.categories.first.title),
      );
    }).toList();
  }

  // A function that returns different icons for different categories
  Widget _getMarkerIcon(eventModel.Title category) {
    // Use the alias here
    switch (category) {
      case eventModel.Title.SEA_AND_LAKE_ICE:
        return Icon(Icons.ac_unit, color: Colors.blue, size: 40);
      case eventModel.Title.SEVERE_STORMS:
        return Icon(WeatherIcons.flood,color: Colors.lightBlue, size: 40);
      case eventModel.Title.VOLCANOES:
        return Icon(Icons.volcano, color: Colors.red, size: 40);
      case eventModel.Title.WILDFIRES:
        return Icon(Icons.local_fire_department,
            color: Colors.deepOrange, size: 40);
      default:
        return Icon(Icons.location_on,
            color: Colors.green, size: 40); // Default marker
    }
  }
}
