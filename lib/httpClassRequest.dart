import 'package:http/http.dart' as http;

import 'jsonFiles/weatherJson.dart';
import 'keys/api.dart';

class WeatherRequest{
  Future<Weather?> getData(double? latitude, double? longitude) async{
    var client = http.Client();
    var uri = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return weatherFromJson(json);
    }
    return null;
  }
}