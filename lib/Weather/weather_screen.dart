import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../Model/weather_data_model.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather? _weather;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Position position = await getCurrentLocation();
      Weather weather = await fetchWeather(position.latitude, position.longitude);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : _weather != null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Location: ${_weather!.name}, ${_weather!.sys.country}'),
              Text('Temperature: ${_weather!.main.temp}°C'),
              Text('Feels Like: ${_weather!.main.feelsLike}°C'),
              Text('Weather: ${_weather!.weather[0].description}'),
              Text('Wind Speed: ${_weather!.wind.speed} m/s'),
              Text('Humidity: ${_weather!.main.humidity}%'),
              Text('Pressure: ${_weather!.main.pressure} hPa'),
            ],
          )
              : Text('Failed to load weather data'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _loadWeather,
          child: Icon(Icons.refresh),
        ),
      );
  }
}