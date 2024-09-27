import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/weather_data_model.dart';

const apiKey = '6012c063d9f2ec1c806219bfcf1a8dc9';

Future<Weather> fetchWeather(double lat, double lon) async {
  final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}
