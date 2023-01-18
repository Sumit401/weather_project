import 'package:flutter/material.dart';
import 'package:indian_cities/httpClassRequest.dart';

import '../jsonFiles/countriesJson.dart';

class CountryProvider extends ChangeNotifier {
  Weather? countryList;
  String? locationName;

  double? latitude;
  double? longitude;

  Future<void> getCountryList() async {
    countryList = await WeatherRequest().getData(latitude, longitude);
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
