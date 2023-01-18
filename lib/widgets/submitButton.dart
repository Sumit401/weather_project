
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';

Widget submitButton(weatherProvider){
  return   IconButton(
      onPressed: () async {
        // Get location data..........
        try {
          List<Location>? locations = await locationFromAddress(
              weatherProvider.locationName.toString());
          weatherProvider.getLatLong(locations.last.latitude, locations.last.longitude);
          print(locations.last.latitude);
          print(locations.last.longitude);
        } on Exception catch (e) {
          print(e.toString());
        }
        // Get weather info..............................
        await weatherProvider.getWeatherInfo();
      },
      icon: Icon(FontAwesomeIcons.circleArrowRight),
  );
}