import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyConfig {
  final TravelMode travelMode;
  final Color polylineColor;
  final double width;
  final Cap endCap;
  final Cap startCap;

  PolyConfig(
      {this.travelMode = TravelMode.driving,
      this.polylineColor = Colors.black,
      this.width = 5,
      this.endCap = Cap.roundCap,
      this.startCap = Cap.roundCap});
}
