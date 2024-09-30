
class OpenWeatherAPI {

  String apiKey = '6012c063d9f2ec1c806219bfcf1a8dc9';

  String apiUrl(lat, lon) {
    return 'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey';
  
  }
}
