import 'package:latlong2/latlong.dart';
import 'dart:math';

// Function to calculate the area of the polygon
double calculatePolygonArea(List<LatLng> points) {
  const R = 6378137; // Earth's radius in meters
  double sum = 0.0;

  for (int i = 0; i < points.length; i++) {
    LatLng p1 = points[i];
    LatLng p2 = points[(i + 1) % points.length];

    double deltaLng = (p2.longitude - p1.longitude) * (pi / 180.0);
    double lat1 = p1.latitude * (pi / 180.0);
    double lat2 = p2.latitude * (pi / 180.0);

    sum += deltaLng * (2 + sin(lat1) + sin(lat2));
  }

  return (sum.abs() * R * R) / 2.0; // Area in square meters
}

// Function to calculate the perimeter of the polygon
double calculatePolygonPerimeter(List<LatLng> points) {
  const Distance distance = Distance(); // LatLng distance calculator
  double perimeter = 0.0;

  for (int i = 0; i < points.length; i++) {
    LatLng p1 = points[i];
    LatLng p2 = points[(i + 1) % points.length]; // Loop back to the first point

    perimeter += distance(p1, p2);
  }

  return perimeter; // Perimeter in meters
}
