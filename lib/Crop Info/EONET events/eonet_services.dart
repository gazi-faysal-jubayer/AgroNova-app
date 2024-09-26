import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Model/eonet_data_model.dart';

class EonetService {
  final String apiUrl = "https://eonet.gsfc.nasa.gov/api/v2.1/events";

  Future<Welcome> fetchEvents() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return welcomeFromJson(response.body);
    } else {
      throw Exception("Failed to load events");
    }
  }
}
