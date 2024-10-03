import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_icons/weather_icons.dart';
import '../../Model/eonet_data_model.dart' as eventModel;
import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

class EventDetails extends StatelessWidget {
  final eventModel.Event event;

  EventDetails({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Removed _buildDescription
              SizedBox(height: 20),
              _buildCategories(),
              SizedBox(height: 20),
              _buildSources(),
              SizedBox(height: 20),
              _buildMap(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: event.categories.map((category) {
            return Chip(
              label: Text(category.title.toString().split('.').last),
              backgroundColor: Colors.teal[100],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSources() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sources:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Card(
          elevation: 4,
          child: Column(
            children: event.sources.map((source) {
              return ListTile(
                title: Text(
                  source.id.toString(),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: GestureDetector(
                  onTap: () => _launchURL(source.url), // Make URL clickable
                  child: Text(
                    source.url,
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ),
                trailing: Icon(Icons.open_in_browser, color: Colors.teal),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Event Location on Map",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Container(
          height: 350,
          child: FlutterMap(
            options: MapOptions(
              initialCenter: _getEventLocation(),
              initialZoom: 5.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: _buildMarkers(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  LatLng _getEventLocation() {
    if (event.geometries.isNotEmpty) {
      var geometry = event.geometries.first;
      return LatLng(geometry.coordinates[1], geometry.coordinates[0]);
    }
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

  Widget _getMarkerIcon(eventModel.Title category) {
    switch (category) {
      case eventModel.Title.SEA_AND_LAKE_ICE:
        return Icon(Icons.ac_unit, color: Colors.blue, size: 40);
      case eventModel.Title.SEVERE_STORMS:
        return Icon(WeatherIcons.flood, color: Colors.lightBlue, size: 40);
      case eventModel.Title.VOLCANOES:
        return Icon(Icons.volcano, color: Colors.red, size: 40);
      case eventModel.Title.WILDFIRES:
        return Icon(Icons.local_fire_department, color: Colors.deepOrange, size: 40);
      default:
        return Icon(Icons.location_on, color: Colors.green, size: 40);
    }
  }

  // Function to launch URL
  void _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
