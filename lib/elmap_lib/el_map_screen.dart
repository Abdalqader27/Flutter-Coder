import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_coder/el_location/el_location_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../elmap_lib/src/bloc/map_bloc.dart';

final MapBloc _bloc = MapBloc();

class ElMapScreen extends StatelessWidget {
  final CameraPosition? initialCameraPosition;
  final Function(LatLng)? onMapTap;

  const ElMapScreen({Key? key, this.initialCameraPosition, this.onMapTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ELLocationBuilder(
      builder: (context, dynamic data, child) {
        ///just we organize code and declare variables here
        final LocationData currentLocation = data;
        final LatLng currentLatLag = LatLng(currentLocation.latitude!, currentLocation.longitude!);

        ///Providing Bloc instance
        return BlocProvider(
          create: (context) => _bloc,
          child: BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              ///View model providing reading from Bloc
              final viewModel = context.read<MapBloc>();

              return Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (controller) => viewModel.controller = controller,
                    initialCameraPosition: initialCameraPosition ?? CameraPosition(target: currentLatLag, zoom: 20),
                    onTap: onMapTap,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
    return Container();
  }
}
