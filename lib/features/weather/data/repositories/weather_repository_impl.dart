import 'package:fluter_weather_app/core/error/exception.dart';
import 'package:fluter_weather_app/core/plataform/network_info.dart';
import 'package:fluter_weather_app/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:fluter_weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:fluter_weather_app/features/weather/data/models/weatherdbi_weather_model.dart';
import 'package:fluter_weather_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fluter_weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<WeatherFailure, WeatherdbiWeatherModel>> getWeatherFromApi(
      String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        WeatherdbiWeatherModel model =
            await remoteDataSource.getWeatherFromApi(cityName);

        localDataSource.cacheWeather(model);

        return Right(model);
      } on ServerException {
        return const Left(ServerFailure(message: 'Server Indisponible'));
      }
    } else {
      try {
        WeatherdbiWeatherModel model = await localDataSource.getLastWeather();

        return Right(model);
      } on CacheException {
        return const Left(
          CacheFailure(message: "Couldn't get data from local source"),
        );
      }
    }
  }
}
