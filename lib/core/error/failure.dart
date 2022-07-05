// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class WeatherFailure extends Equatable {
  final String message;

  const WeatherFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class CouldntGetWeatherFailure extends WeatherFailure {
  const CouldntGetWeatherFailure({required String message})
      : super(message: message);
}

class ServerFailure extends WeatherFailure {
  const ServerFailure({required String message}) : super(message: message);
}

class CacheFailure extends WeatherFailure {
  const CacheFailure({required String message}) : super(message: message);
}
