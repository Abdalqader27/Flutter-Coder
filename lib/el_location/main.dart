import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_coder/el_location/el_location_builder.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MaterialApp(home: ExampleApp()));
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ELLocationBuilder(builder: (BuildContext context, dynamic location, Widget? child) {
        LocationData data = location;
        String lat = data.latitude.toString();
        String lag = data.longitude.toString();
        return Center(child: Text("lat is $lat" "\n" "lag is $lag"));
      }),
    );
  }
}
