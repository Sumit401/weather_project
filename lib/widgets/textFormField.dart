import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:provider/provider.dart';

import '../providers/weatherProvider.dart';
import 'flutterToast.dart';
import 'submitButton.dart';

Widget textFormField() {
  return Container(
    margin: const EdgeInsets.only(right: 20,left: 20, bottom: 30,top: 10),
    child: Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        return TextFormField(
          minLines: 1,
          maxLines: 1,
          scrollPadding: EdgeInsets.all(20),
          style: const TextStyle(color: Colors.white,fontSize: 18),
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
    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      labelText: "Location Name",
      labelStyle: const TextStyle(color: Colors.white,fontSize: 15),
      suffixIcon: submitButton(weatherProvider),
      icon: IconButton(
        icon: const Icon(FontAwesomeIcons.locationCrosshairs,
            color: Colors.white70),
        onPressed: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          try {
            Geolocator.requestPermission();
            Position position = await Geolocator.getCurrentPosition();
            weatherProvider.getLatLong(position.latitude, position.longitude);
            await weatherProvider.getWeatherInfo();
          } on Exception catch (e) {
            print(e.toString());
            flutterToast("Location Not Found");
          }
        },
      ));
}
