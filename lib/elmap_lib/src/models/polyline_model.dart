import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineModel {
  final PolylineId polylineId;
  final LatLng originPoint;
  final LatLng destinationPoint;
  final TravelMode travelMode;

  PolylineModel({
    this.polylineId = const PolylineId("default"),
    this.travelMode = TravelMode.driving,
    required this.originPoint,
    required this.destinationPoint,
  });
}
