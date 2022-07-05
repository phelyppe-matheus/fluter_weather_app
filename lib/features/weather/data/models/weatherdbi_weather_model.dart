import 'dart:convert';

import 'package:fluter_weather_app/features/weather/domain/entities/weather.dart';

class WeatherdbiWeatherModel extends Weather {
  const WeatherdbiWeatherModel({
    required cityName,
    required temperature,
  }) : super(
          cityName: cityName,
          temperature: temperature,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cityName': cityName,
      'temperature': temperature,
    };
  }

  factory WeatherdbiWeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherdbiWeatherModel(
      cityName: (map['region'] as String).split(',')[0],
      temperature: (map['currentConditions']['temp']['c'] as int).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherdbiWeatherModel.fromJson(String source) =>
      WeatherdbiWeatherModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
