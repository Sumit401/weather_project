import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../providers/weatherProvider.dart';

Widget textForTemp(WeatherProvider weatherProvider) {
  return Text(
      "Temperature : ${weatherProvider.temperature != null ? ((weatherProvider.temperature?.floorToDouble())! - 273).toStringAsFixed(0) : ""} \u2103");
}

Widget textForFeelsLike(WeatherProvider weatherProvider) {
  return Text(
      "Feels Like Temp : ${weatherProvider.feelsLike != null ? ((weatherProvider.feelsLike?.floorToDouble())! - 273).toStringAsFixed(0) : ""} \u2103 ");
}

Widget textForVisibility(WeatherProvider weatherProvider) {
  return Text("Visibility : ${weatherProvider.visibility ?? ""} meters");
}

Widget textForHumidity(WeatherProvider weatherProvider) {
  return Text("Humidity : ${weatherProvider.humidity ?? ""} %");
}


Widget textForWindSpeed(WeatherProvider weatherProvider) {
  if (weatherProvider.windSpeed != null) {
    return Text("WindSpeed : ${(weatherProvider.windSpeed! * 3.6).toStringAsFixed(2)}. Km/h");
  } else {
    return const Text("WindSpeed :");
  }
}

Widget textForPressure(WeatherProvider weatherProvider) {
  return Text("Pressure : ${weatherProvider.pressure ?? ""} mbar");
}

Widget textForSunrise(WeatherProvider weatherProvider) {
  if (weatherProvider.sunrise != null) {
    var sunrise = DateTime.fromMillisecondsSinceEpoch(
        (weatherProvider.sunrise)! * 1000);
    var format = DateFormat("dd-MMM  hh:mm a");
    var dateString = format.format(sunrise);
    return Text("Sunrise : $dateString");
  } else {
    return const Text("Sunrise : ");
  }
}

Widget textForSunset(WeatherProvider weatherProvider) {
  if (weatherProvider.sunset != null) {
    var sunset = DateTime.fromMillisecondsSinceEpoch(
            (weatherProvider.sunset)! * 1000)
        .toLocal();
    var format = DateFormat("dd-MMM  hh:mm a");
    var dateString = format.format(sunset);
    return Text("Sunset : $dateString");
  } else {
    return const Text("Sunset : ");
  }
}

Widget textForWeatherDesc(WeatherProvider weatherProvider) {
  return Text("Weather Type : ${weatherProvider.weatherDesc ?? ""}");
}

Widget textForTimeZone(WeatherProvider weatherProvider){
  if(weatherProvider.timeZone != null) {
    DateTime utc = DateTime.now().toUtc();
    DateTime time = utc.add(Duration(seconds: weatherProvider.timeZone!));

    var format = DateFormat("E, dd MMMM  hh:mm a");
    var dateString = format.format(time);

    return Text("Country Time : $dateString");
  }else{
    return const Text("Country Time :");
  }
}
Widget textForCloudData(WeatherProvider weatherProvider) {
  return Text("Cloudiness : ${weatherProvider.clouds ?? ""} %");
}

Widget textForPlaceName(WeatherProvider weatherProvider){
  return Text("Place Name : ${weatherProvider.placeName ?? ""} ");
}
