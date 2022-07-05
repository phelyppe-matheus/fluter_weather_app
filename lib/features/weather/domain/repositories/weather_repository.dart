import 'package:dartz/dartz.dart';
import 'package:fluter_weather_app/core/error/failure.dart';
import 'package:fluter_weather_app/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<WeatherFailure, Weather>> getWeatherFromApi(String cityName);
}
