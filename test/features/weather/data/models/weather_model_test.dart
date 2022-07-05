import 'dart:io';

import 'package:fluter_weather_app/features/weather/data/models/weatherdbi_weather_model.dart';
import 'package:fluter_weather_app/features/weather/domain/entities/weather.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

  const tWeatherModel =
      WeatherdbiWeatherModel(cityName: 'Teresina', temperature: 32.0);

  test(
    "Weatherdbi's weather model is a Weather class",
    () async {
      expect(tWeatherModel, isA<Weather>());
    },
  );

  group("from json", () {
    test('should return a valid model when the JSON number is an integer', () {
      final String jsonSource =
          fixture("weatherdbi.herokuapp.com_data_weather_teresina.json");

      final result = WeatherdbiWeatherModel.fromJson(jsonSource);

      expect(result, tWeatherModel);
    });
  });

  group('to Json', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = tWeatherModel.toJson();

        const expectedJsonMap = '{"cityName":"Teresina","temperature":32.0}';

        expect(result, expectedJsonMap);
      },
    );
  });
}
