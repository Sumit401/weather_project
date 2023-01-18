import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../providers/weatherProvider.dart';
import 'submitButton.dart';

Widget textFormField() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        return TextFormField(
          minLines: 1,
          maxLines: 1,
          keyboardType: TextInputType.streetAddress,
          textCapitalization: TextCapitalization.words,
          onChanged: (value) {
            weatherProvider.getLocationName(value);
          },
          decoration: inputDecoration(weatherProvider),
        );
      },
    ),
  );
}

inputDecoration(weatherProvider) {
  return InputDecoration(
      labelText: "Input Location Name",
      suffixIcon: submitButton(weatherProvider),
      icon: IconButton(
        icon: const Icon(FontAwesomeIcons.locationCrosshairs,
            color: Colors.black),
        onPressed: () async {
          try {
            Geolocator.requestPermission();
            Position position = await Geolocator.getCurrentPosition();
            weatherProvider.getLatLong(position.latitude, position.longitude);
            await weatherProvider.getWeatherInfo();
          } on Exception catch (e) {
            print(e.toString());
          }
        },
      ));
}
