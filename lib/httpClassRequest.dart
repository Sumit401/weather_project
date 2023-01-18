import 'package:http/http.dart' as http;

import 'jsonFiles/countriesJson.dart';

class WeatherRequest{
  Future<Weather?> getData(double? latitude, double? longitude) async{
    var client = http.Client();
    var uri = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=35407fd21f711b5dd2e81a7406daab1f");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return weatherFromJson(json);
    }
    return null;
  }
}