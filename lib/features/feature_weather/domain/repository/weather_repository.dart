
import 'package:flutter_advanced_course/core/resources/data_state.dart';
import 'package:flutter_advanced_course/features/feature_weather/data/models/suggest_city_model.dart';
import 'package:flutter_advanced_course/features/feature_weather/domain/entities/current_city_entity.dart';

import '../../../../core/params/ForecastParams.dart';
import '../entities/forecase_days_entity.dart';

abstract class WeatherRepository{

  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);

  Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(ForecastParams params);

  Future<List<Data>> fetchSuggestData(cityName);

}