import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/weatherProvider.dart';
import 'widgets/textForData.dart';
import 'widgets/textFormField.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Data")),
      body:
          Consumer<WeatherProvider>(builder: (context, weatherProvider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text field with Buttons................
            textFormField(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textForTimeZone(weatherProvider),
                textForPlaceName(weatherProvider),
                textForWeatherDesc(weatherProvider),
                textForTemp(weatherProvider),
                textForFeelsLike(weatherProvider),
                textForVisibility(weatherProvider),
                textForHumidity(weatherProvider),
                textForPressure(weatherProvider),
                textForSunrise(weatherProvider),
                textForSunset(weatherProvider),
                textForWindSpeed(weatherProvider),
                textForCloudData(weatherProvider),
              ],
            ),
          ],
        );
      }),
    );
  }
}
