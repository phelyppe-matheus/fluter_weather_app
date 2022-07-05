// Mocks generated by Mockito 5.2.0 from annotations
// in fluter_weather_app/test/features/weather/data/repositories/weather_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:fluter_weather_app/core/plataform/network_info.dart' as _i7;
import 'package:fluter_weather_app/features/weather/data/datasources/weather_local_data_source.dart'
    as _i5;
import 'package:fluter_weather_app/features/weather/data/datasources/weather_remote_data_source.dart'
    as _i3;
import 'package:fluter_weather_app/features/weather/data/models/weatherdbi_weather_model.dart'
    as _i2;
import 'package:fluter_weather_app/features/weather/domain/entities/weather.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeWeatherdbiWeatherModel_0 extends _i1.Fake
    implements _i2.WeatherdbiWeatherModel {}

/// A class which mocks [WeatherRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRemoteDataSource extends _i1.Mock
    implements _i3.WeatherRemoteDataSource {
  MockWeatherRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.WeatherdbiWeatherModel> getLastWeather() =>
      (super.noSuchMethod(Invocation.method(#getLastWeather, []),
              returnValue: Future<_i2.WeatherdbiWeatherModel>.value(
                  _FakeWeatherdbiWeatherModel_0()))
          as _i4.Future<_i2.WeatherdbiWeatherModel>);
  @override
  _i4.Future<_i2.WeatherdbiWeatherModel> getWeatherFromApi(String? cityName) =>
      (super.noSuchMethod(Invocation.method(#getWeatherFromApi, [cityName]),
              returnValue: Future<_i2.WeatherdbiWeatherModel>.value(
                  _FakeWeatherdbiWeatherModel_0()))
          as _i4.Future<_i2.WeatherdbiWeatherModel>);
}

/// A class which mocks [WeatherLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherLocalDataSource extends _i1.Mock
    implements _i5.WeatherLocalDataSource {
  MockWeatherLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.WeatherdbiWeatherModel> getLastWeather() =>
      (super.noSuchMethod(Invocation.method(#getLastWeather, []),
              returnValue: Future<_i2.WeatherdbiWeatherModel>.value(
                  _FakeWeatherdbiWeatherModel_0()))
          as _i4.Future<_i2.WeatherdbiWeatherModel>);
  @override
  _i4.Future<_i2.WeatherdbiWeatherModel> cacheWeather(_i6.Weather? weather) =>
      (super.noSuchMethod(Invocation.method(#cacheWeather, [weather]),
              returnValue: Future<_i2.WeatherdbiWeatherModel>.value(
                  _FakeWeatherdbiWeatherModel_0()))
          as _i4.Future<_i2.WeatherdbiWeatherModel>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i7.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}