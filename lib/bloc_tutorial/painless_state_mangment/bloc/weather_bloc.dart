import 'dart:math';

import '../model/weather.dart';
import 'bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // Distinguish between different events, even though this app has only one
    if (event is GetWeather) {
      // Outputting a state from the asynchronous generator
      yield WeatherLoading();
      final Weather weather = await _fetchWeatherFromFakeApi(event.cityName);
      yield WeatherLoaded(weather);
    }
  }

  Future<Weather> _fetchWeatherFromFakeApi(String cityName) {
    // Simulate network delay
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return Weather(
          cityName: cityName,
          // Temperature between 20 and 35.99
          temperature: (20 + Random().nextInt(15) + Random().nextDouble()).toDouble(),
        );
      },
    );
  }
}
