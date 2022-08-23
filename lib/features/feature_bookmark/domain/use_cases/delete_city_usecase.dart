
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart';
import '../repository/city_repository.dart';

class DeleteCityUseCase implements UseCase<DataState<String>, String>{
  final CityRepository _cityRepository;
  DeleteCityUseCase(this._cityRepository);

  @override
  Future<DataState<String>> call(String params) {
    return _cityRepository.deleteCityByName(params);
  }
}