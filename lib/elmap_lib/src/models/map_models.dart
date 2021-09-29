import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'route_model.dart';

class MapModels {
  Map<PolylineId, Polyline>? polyline;

  Set<Marker> allMarkers;
  Set<Marker> currentMarkers;

  LatLng? originLocation;
  LatLng? destinationLocation;

  ThemeMode themeMode;
  RouteModel? routeData;

  MapModels({
    this.allMarkers = const {},
    this.currentMarkers = const {},
    this.polyline = const {},
    this.originLocation,
    this.destinationLocation,
    this.themeMode = ThemeMode.light,
    this.routeData,
  });
}
