import 'package:dartz/dartz.dart';
import 'package:fluter_weather_app/core/error/exception.dart';
import 'package:fluter_weather_app/core/error/failure.dart';
import 'package:fluter_weather_app/core/plataform/network_info.dart';
import 'package:fluter_weather_app/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:fluter_weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:fluter_weather_app/features/weather/data/models/weatherdbi_weather_model.dart';
import 'package:fluter_weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_repository_impl_test.mocks.dart';

@GenerateMocks([WeatherRemoteDataSource, WeatherLocalDataSource, NetworkInfo])
void main() {
  late WeatherRepositoryImpl repository;
  late MockWeatherRemoteDataSource mockRemoteDataSource;
  late MockWeatherLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockWeatherRemoteDataSource();
    mockLocalDataSource = MockWeatherLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = WeatherRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const tCityName = 'teresina';
  const tWeatherModel = WeatherdbiWeatherModel(
    cityName: tCityName,
    temperature: 32.0,
  );

  group("getConcreteNumberTrivia", () {
    test('should check if the device is online', () {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getWeatherFromApi(tCityName)).thenAnswer(
        ((realInvocation) async => tWeatherModel),
      );
      when(mockLocalDataSource.cacheWeather(tWeatherModel))
          .thenAnswer((_) async => tWeatherModel);

      repository.getWeatherFromApi(tCityName);

      verify(mockNetworkInfo.isConnected);
    });
  });

  group('device is online', () {
    // This setUp applies only to the 'device is online' group
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getWeatherFromApi(tCityName))
            .thenAnswer((_) async => tWeatherModel);
        when(mockLocalDataSource.cacheWeather(tWeatherModel))
            .thenAnswer((_) async => tWeatherModel);
        // act
        final result = await repository.getWeatherFromApi(tCityName);
        // assert
        verify(mockRemoteDataSource.getWeatherFromApi(tCityName));
        expect(result, equals(const Right(tWeatherModel)));
      },
    );

    test(
      'should cache the data locally when the call to remote data source is successful',
      () async {
        when(mockRemoteDataSource.getWeatherFromApi(tCityName))
            .thenAnswer((_) async => tWeatherModel);
        when(mockLocalDataSource.cacheWeather(tWeatherModel)).thenAnswer(
          (_) async => tWeatherModel,
        );

        await repository.getWeatherFromApi(tCityName);

        verify(mockRemoteDataSource.getWeatherFromApi(tCityName));
        verify(mockLocalDataSource.cacheWeather(tWeatherModel));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getWeatherFromApi(tCityName))
            .thenThrow(ServerException());

        final result = await repository.getWeatherFromApi(tCityName);
        // assert
        verify(mockRemoteDataSource.getWeatherFromApi(tCityName));
        verifyZeroInteractions(mockLocalDataSource);
        expect(
          result,
          equals(const Left(ServerFailure(message: 'Server Indisponible'))),
        );
      },
    );
  });

  group('device is offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
      'should return last locally cached data when the cached data is present',
      () async {
        // arrange
        when(mockLocalDataSource.getLastWeather())
            .thenAnswer((_) async => tWeatherModel);
        // act
        final result = await repository.getWeatherFromApi(tCityName);
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastWeather());
        expect(result, equals(const Right(tWeatherModel)));
      },
    );

    test(
      'should return CacheFailure when there is no cached data present',
      () async {
        // arrange
        when(mockLocalDataSource.getLastWeather()).thenThrow(CacheException());
        // act
        final result = await repository.getWeatherFromApi(tCityName);
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastWeather());
        expect(
          result,
          equals(const Left(
              CacheFailure(message: "Couldn't get data from local source"))),
        );
      },
    );
  });
}
