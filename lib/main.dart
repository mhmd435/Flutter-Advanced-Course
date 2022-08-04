import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_advanced_course/features/feature_weather/data/repository/weather_repositoryImpl.dart';
import 'package:flutter_advanced_course/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';

import 'core/widgets/main_wrapper.dart';
import 'locator.dart';

void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetCurrentWeatherUseCase getCurrentWeatherUseCase = GetCurrentWeatherUseCase(WeatherRepositoryImpl(ApiProvider()));

    getCurrentWeatherUseCase('tehran');

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}
