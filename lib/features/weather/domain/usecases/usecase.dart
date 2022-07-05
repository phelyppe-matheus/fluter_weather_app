import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fluter_weather_app/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<WeatherFailure, Type>> call(Params params);
}

class Params extends Equatable {
  final String cityName;

  const Params(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
