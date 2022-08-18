
import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/core/utils/constants.dart';

import '../../../../../core/params/ForecastParams.dart';

class ApiProvider{
  final Dio _dio = Dio();
  var apiKey = Constants.apiKeys1;

  /// current weather api call
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get(
        '${Constants.baseUrl}/data/2.5/weather',
        queryParameters: {
          'q' : cityName,
          'appid' : apiKey,
          'units' : 'metric'
        }
    );
    return response;
  }

  /// 7 days forecast api
  Future<dynamic> sendRequest7DaysForcast(ForecastParams params) async {

    var response = await _dio.get(
        "${Constants.baseUrl}/data/2.5/onecall",
        queryParameters: {
          'lat': params.lat,
          'lon': params.lon,
          'exclude': 'minutely,hourly',
          'appid': apiKey,
          'units': 'metric'
        });

    return response;
  }

  /// city name suggest api
  Future<dynamic> sendRequestCitySuggestion(String prefix) async {
    var response = await _dio.get(
        "http://geodb-free-service.wirefreethought.com/v1/geo/cities",
        queryParameters: {'limit': 7, 'offset': 0, 'namePrefix': prefix});

    return response;
  }
}