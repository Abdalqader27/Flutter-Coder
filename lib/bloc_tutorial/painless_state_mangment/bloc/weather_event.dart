import 'bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent([List props = const []]);

  @override
  List<Object?> get props => [];
}

class GetWeather extends WeatherEvent {
  final String cityName;

  const GetWeather(this.cityName);
}
