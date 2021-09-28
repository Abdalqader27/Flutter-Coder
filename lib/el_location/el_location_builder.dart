import 'el_location.dart';

Location location = Location();

class ELLocationBuilder extends StatefulWidget {
  const ELLocationBuilder({Key? key, required this.builder}) : super(key: key);
  final ValueWidgetBuilder builder;

  @override
  _ELLocationBuilderState createState() => _ELLocationBuilderState();
}

class _ELLocationBuilderState extends State<ELLocationBuilder> {
  final hasPermissionStream = location.hasPermission().asStream();
  final requestPermissionStream = location.requestPermission().asStream();
  final getLocation = location.getLocation().asStream();

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: hasPermissionStream,
      builder: (_, hasPermission) {
        if (hasPermission.data == null) {
          return loading();
        } else {
          if (hasPermission.data != PermissionStatus.granted) {
            return noLocationWidget(context: context);
          }
          return StreamBuilder(
              stream: location.requestPermission().asStream(),
              builder: (_, requestPermission) {
                if (requestPermission.data == null) {
                  return loading();
                } else {
                  if (requestPermission.data != PermissionStatus.granted) {
                    return noLocationWidget(context: context);
                  }
                  return StreamBuilder<LocationData?>(
                      stream: location.getLocation().asStream(),
                      builder: (context, loc) {
                        if (loc.hasData && loc.data == null) {
                          return noLocationWidget(context: context);
                        }

                        if (loc.data != null && loc.data!.latitude != null && loc.data!.longitude != null) {
                          return ValueListenableBuilder<LocationData>(
                            valueListenable: ValueNotifier<LocationData>(loc.data ?? LocationData.fromMap({})),
                            builder: widget.builder,
                          );
                        }
                        return loading();
                      });
                }
              });
        }
      });

  Widget checkPermission({dynamic data, required Widget child}) {
    if (data == null) {
      return const CircularProgressIndicator();
    } else if (data != PermissionStatus.granted) {
      return noLocationWidget(context: context);
    }
    return child;
  }

  void onTapGranted() async {
    try {
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      setState(() {});
    } on PlatformException catch (_) {}
  }

  Widget loading() => const Center(child: CircularProgressIndicator());

  Widget openLocationButton({required BuildContext context}) {
    return Center(
        child: SizedBox(
      width: 100,
      child: CustomButton(
        title: "Open Location ",
        height: 44,
        icon: const Icon(Icons.location_on_outlined),
        color: Theme.of(context).colorScheme.primary,
        textStyle: Theme.of(context).textTheme.button,
        onPressed: onTapGranted,
      ),
    ));
  }

  Widget noLocationWidget({required BuildContext context}) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.location_on_outlined, size: 38),
        Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Please open location  ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
        openLocationButton(context: context)
      ],
    ));
  }
}
