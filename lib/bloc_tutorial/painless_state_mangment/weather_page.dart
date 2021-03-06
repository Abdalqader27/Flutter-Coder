import 'package:flutter/material.dart';

import 'bloc/bloc.dart';
import 'model/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

final weatherBloc = WeatherBloc();

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fake Weather App"),
      ),
      body: BlocListener(
        bloc: weatherBloc,
        // Listener is the place for logging, showing Snackbars, navigating, etc.
        // It is guaranteed to run only once per state change.
        listener: (BuildContext context, WeatherState state) {
          if (state is WeatherLoaded) {
            debugPrint("Loaded: ${state.weather.cityName}");
          }
        },
        // BlocBuilder invokes the builder when new state is emitted.
        child: BlocBuilder(
          bloc: weatherBloc,
          // The builder function has to be a "pure function".
          // That is, it only returns a Widget and doesn't do anything else.
          builder: (BuildContext context, WeatherState state) {
            // Changing the UI based on the current state
            if (state is WeatherInitial) {
              return buildInitialInput();
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              return buildColumnWithData(state.weather);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return const Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // Builds widgets from the starter UI with custom weather data
  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperature.toStringAsFixed(1)} ??C",
          style: const TextStyle(fontSize: 80),
        ),
        const CityInputField(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Don't forget to call dispose on the Bloc to close the Streams!
    weatherBloc.close();
  }
}

class CityInputField extends StatefulWidget {
  const CityInputField({
    Key? key,
  }) : super(key: key);

  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: submitCityName,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(String cityName) {
    // Get the Bloc using the BlocProvider
    // final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    // Initiate getting the weather
    weatherBloc.add(GetWeather(cityName));
  }
}
