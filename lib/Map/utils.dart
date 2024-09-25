import 'package:latlong2/latlong.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

// Function to fetch soil data from SoilGrids API
Future<Map<String, dynamic>> fetchSoilData(LatLng point) async {
  Map<String, dynamic> soilData;
  final url = 'https://rest.isric.org/soilgrids/v2.0/properties/query?lon=${point.longitude}&lat=${point.latitude}&property=phh2o&depth=0-5cm&depth=0-30cm&depth=5-15cm&depth=15-30cm&depth=30-60cm&depth=60-100cm&depth=100-200cm&value=Q0.05&value=Q0.5&value=Q0.95&value=mean&value=uncertainty';
  print(url);
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      soilData = jsonDecode(response.body);
      return soilData; // Parse the JSON response
    } else {
      throw 'Failed to load soil data';
    }
  } catch (e) {
    print("Error fetching soil data: $e");
    return {};
  }
}
