import 'package:weather_apps/exceptions/weather_exception.dart';
import 'package:weather_apps/models/custom_error.dart';

import '../models/weather.dart';
import '../services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;
  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String cityName) async {
    try {
      final Weather weather = await weatherApiServices.getWeather(cityName);
      final weatherMap = Weather.fromMap(weather.toMap());
      return weatherMap;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
