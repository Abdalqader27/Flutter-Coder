part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class _PolylineEvent {
  final Map<PolylineId, Polyline> polylineData;

  _PolylineEvent(this.polylineData);
}

/// set markers data event by get your arena
/// if you set event markers
class _MarkersEvent {
  final Set<Marker> markerData;

  _MarkersEvent(this.markerData);
}

class _RouteDataEvent {
  final RouteModel routeModel;

  _RouteDataEvent(this.routeModel);
}

class _LoadingEvent {}

class _ThemeEvent {
  /// [dark ]or [light] brightness  you get it from {assets} as json file
  final String mapTheme;

  /// Do not display map tiles.[none]
  /// Normal tiles (traffic and labels, subtle terrain information).[ normal]
  /// Satellite imaging tiles (aerial photos)[ satellite]
  /// Terrain tiles (indicates type and height of terrain)[terrain]
  /// Hybrid tiles (satellite images with some labels/overlays)[hybrid]
  final MapType mapType;

  _ThemeEvent(this.mapTheme, this.mapType);
}
