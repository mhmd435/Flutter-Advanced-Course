
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/city_entity.dart';
import '../repository/city_repository.dart';


class GetAllCityUseCase implements UseCase<DataState<List<City>>, NoParams>{
  final CityRepository _cityRepository;
  GetAllCityUseCase(this._cityRepository);

  @override
  Future<DataState<List<City>>> call(NoParams params) {
    return _cityRepository.getAllCityFromDB();
  }
}