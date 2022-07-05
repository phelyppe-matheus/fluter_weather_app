import 'package:fluter_weather_app/features/weather/data/models/weatherdbi_weather_model.dart';
import 'package:fluter_weather_app/features/weather/domain/entities/weather.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherdbiWeatherModel> getLastWeather();

  Future<void> cacheWeather(Weather weather);
}
