import 'package:dartz/dartz.dart';
import 'package:fluter_weather_app/features/weather/domain/entities/weather.dart';
import 'package:fluter_weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:fluter_weather_app/features/weather/domain/usecases/get_weather_from_api.dart';
import 'package:fluter_weather_app/features/weather/domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import './weather_repository_test.mocks.dart';

@GenerateMocks([WeatherRepository])
void main() {
  late GetWeatherFromAPI usecase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetWeatherFromAPI(mockWeatherRepository);
  });

  const tCityName = "teresina";
  const tWeather = Weather(cityName: tCityName, temperature: 20.2);

  testWidgets('weather repository ...', (tester) async {
    when(mockWeatherRepository.getWeatherFromApi(tCityName))
        .thenAnswer((_) async => right(tWeather));

    final result = await usecase(const Params(tCityName));

    expect(result, right(tWeather));
    verify(mockWeatherRepository.getWeatherFromApi(tCityName));
    verifyNoMoreInteractions(mockWeatherRepository);
  });
}
