import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/polyline_model.dart';

abstract class MapInterface {
  /// Set sections [markers ],[ polyline] , [theme],[ filter ]
  ///
  Future<void> setMarkers(Set<Marker> markers);

  ///Polyline Model =[polylineId],[originPoint],[destinationPoint],[travelMode]
  ///just for set and for get we have to use [Polyline]
  Future<bool> setPolyline({required PolylineModel polylineModel});

  Future<void> setMapTheme();

  Future<void> setMapType();

  Future<void> setMarkersByText({required String text});

  Future<void> setLocation(LatLng point);

  /// Get Sections  [markers ],[ polyline] , [theme],[ filter ]
  Future<Set<Marker>> getMarkers();

  Map<PolylineId, Polyline>? getPolyline();

  getMapTheme();

  Future<Set<Marker>> getMarkersByText();
}
