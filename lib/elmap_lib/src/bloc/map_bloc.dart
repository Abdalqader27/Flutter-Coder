import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:futter_coder/elmap_lib/src/models/map_models.dart';
import 'package:futter_coder/elmap_lib/src/models/route_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../interface/map_interface.dart';
import '../models/polyline_model.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> with MapInterface {
  late GoogleMapController controller;
  final MapModels mapModels = MapModels();

  MapBloc() : super(MapInitial()) {
    on<MapEvent>((event, emit) {
      if (event is MapEvent) {
        emit(MapInitial());
      }
    });
  }

  @override
  getMapTheme() {
    // TODO: implement getMapTheme
    throw UnimplementedError();
  }

  @override
  Future<Set<Marker>> getMarkers() {
    // TODO: implement getMarkers
    throw UnimplementedError();
  }

  @override
  Future<Set<Marker>> getMarkersByText() {
    // TODO: implement getMarkersByText
    throw UnimplementedError();
  }

  @override
  Map<PolylineId, Polyline>? getPolyline() {
    // TODO: implement getPolyline
    throw UnimplementedError();
  }

  @override
  Future<void> setLocation(LatLng point) {
    // TODO: implement setLocation
    throw UnimplementedError();
  }

  @override
  Future<void> setMapTheme() {
    // TODO: implement setMapTheme
    throw UnimplementedError();
  }

  @override
  Future<void> setMapType() {
    // TODO: implement setMapType
    throw UnimplementedError();
  }

  @override
  Future<void> setMarkers(Set<Marker> markers) {
    // TODO: implement setMarkers
    throw UnimplementedError();
  }

  @override
  Future<void> setMarkersByText({required String text}) {
    // TODO: implement setMarkersByText
    throw UnimplementedError();
  }

  @override
  Future<bool> setPolyline({required PolylineModel polylineModel}) {
    // TODO: implement setPolyline
    throw UnimplementedError();
  }
}
