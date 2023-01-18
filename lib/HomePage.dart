import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:indian_cities/providers/countryProvider.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return  Scaffold(
      appBar: AppBar(title: Text("Countries Data")),
      body: Consumer<CountryProvider>(
          builder: (context, countryProvider, child) {
            return Column(
              children: [
                TextFormField(
              decoration: const InputDecoration(labelText: "Input Location Name"),
              onChanged: (value) {
                countryProvider.getLocationName(value);
              },
            ),
                Text("${countryProvider.countryList?.main?.temp}"),
                Text("${countryProvider.countryList?.main?.feelsLike}"),
                Text("${countryProvider.countryList?.visibility}"),
                Text("${countryProvider.countryList?.main?.humidity}"),
                ElevatedButton(onPressed: () async {
                  List<Location>? locations;
                  try {
                    locations = await locationFromAddress(countryProvider.locationName.toString());
                    countryProvider.getLatLong(locations.last.latitude, locations.last.longitude);
                  } on Exception catch (e) {
                    print(e.toString());
                    // TODO
                  }
                  print(locations?.last.latitude);
                  print(locations?.last.longitude);
                  countryProvider.getCountryList();
                }, child: Text("Submit"))
              ],
            );
          }),
    );
  }
}
