
import 'package:floor/floor.dart';
import 'package:flutter_advanced_course/features/feature_bookmark/domain/entities/city_entity.dart';

@dao
abstract class CityDao {
  @Query('SELECT * FROM City')
  Future<List<City>> getAllCity();

  @Query('SELECT * FROM City WHERE name = :name')
  Future<City?> findCityByName(String name);

  @insert
  Future<void> insertCity(City city);

  @Query('DELETE FROM City WHERE name = :name')
  Future<void> deleteCityByName(String name);
}