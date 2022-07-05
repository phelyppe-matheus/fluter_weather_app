import 'package:fluter_weather_app/features/weather/data/models/weatherdbi_weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherdbiWeatherModel> getLastWeather();

  Future<WeatherdbiWeatherModel> getWeatherFromApi(String cityName);
}
