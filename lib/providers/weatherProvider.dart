import 'package:flutter/material.dart';

import '../httpClassRequest.dart';
import '../jsonFiles/weatherJson.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weatherInfo;
  String? locationName;

  double? latitude;
  double? longitude;

  String? placeName;
  String? weatherDesc;
  double? temperature;
  double? feelsLike;


  num? windSpeed;

  int? humidity;
  int? pressure;
  int? visibility;
  int? clouds;
  int? sunrise;
  int? sunset;
  int? timeZone;

  Future<void> getWeatherInfo() async {
    weatherInfo = await WeatherRequest().getData(latitude, longitude);
    timeZone = weatherInfo?.timezone;
    weatherDesc = weatherInfo?.weather?[0]?.main;
    temperature = weatherInfo?.main?.temp;
    feelsLike = weatherInfo?.main?.feelsLike;
    pressure = weatherInfo?.main?.pressure;
    humidity = weatherInfo?.main?.humidity;
    windSpeed = weatherInfo?.wind?.speed;
    visibility = weatherInfo?.visibility;
    clouds = weatherInfo?.clouds?.all;
    sunrise = weatherInfo?.sys?.sunrise;
    sunset = weatherInfo?.sys?.sunset;
    placeName = weatherInfo?.name;

    notifyListeners();
  }

  void getLocationName(value) {
    locationName = value;
    notifyListeners();
  }

  void getLatLong(lat, long) {
    latitude = lat;
    longitude = long;
    notifyListeners();
  }
}
