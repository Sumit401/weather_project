import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';

import 'flutterToast.dart';


Widget submitButton(weatherProvider) {
  return IconButton(
    color: Colors.white,
    onPressed: () async {
      FocusManager.instance.primaryFocus?.unfocus();
      // Get location data..........
      try {
        List<Location>? locations = await locationFromAddress(weatherProvider.locationName.toString());
        weatherProvider.getLatLong(locations.last.latitude, locations.last.longitude);
        await weatherProvider.getWeatherInfo();
      } on Exception catch (e) {
        print(e.toString());
        flutterToast("No Such Location Found");
      }
      // Get weather info..............................

    },
    icon: const Icon(FontAwesomeIcons.circleArrowRight),
  );
}
