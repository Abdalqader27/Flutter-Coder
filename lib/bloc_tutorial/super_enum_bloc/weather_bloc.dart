// import '../super_enum_bloc/bloc.dart';
// import 'data/weather_repository.dart';
//
// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   final WeatherRepository weatherRepository;
//
//   WeatherBloc(WeatherState initialState, this.weatherRepository) : super(initialState);
//
//   @override
//   Stream<WeatherState> mapEventToState(
//     WeatherEvent event,
//   ) async* {
//     // Instantiating state classes directly
//     yield WeatherLoading();
//     // Using type checks for determining events
//     if (event is GetWeather) {
//       try {
//         final weather = await weatherRepository.fetchWeather(event.cityName);
//         yield WeatherLoaded(weather);
//       } on NetworkError {
//         yield WeatherError("Couldn't fetch weather. Is the device online?");
//       }
//     }
//   }
// }
