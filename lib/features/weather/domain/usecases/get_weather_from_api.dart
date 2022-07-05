import 'package:dartz/dartz.dart';
import 'package:fluter_weather_app/core/error/failure.dart';
import 'package:fluter_weather_app/features/weather/domain/entities/weather.dart';
import 'package:fluter_weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:fluter_weather_app/features/weather/domain/usecases/usecase.dart';

class GetWeatherFromAPI extends UseCase<Weather, Params> {
  final WeatherRepository repository;

  GetWeatherFromAPI(this.repository);

  @override
  Future<Either<WeatherFailure, Weather>> call(Params params) async {
    return await repository.getWeatherFromApi(params.cityName);
  }
}
