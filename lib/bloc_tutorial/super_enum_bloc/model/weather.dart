import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;
  final double? temperatureCelsius;

  const Weather({required this.cityName, required this.temperature, this.temperatureCelsius});

  @override
  List<Object?> get props => [cityName, temperature];
}
