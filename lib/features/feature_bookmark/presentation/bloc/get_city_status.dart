
import 'package:equatable/equatable.dart';

import '../../domain/entities/city_entity.dart';

abstract class GetCityStatus extends Equatable{}

// loading state
class GetCityLoading extends GetCityStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// loaded state
class GetCityCompleted extends GetCityStatus{
  final City? city;
  GetCityCompleted(this.city);

  @override
  // TODO: implement props
  List<Object?> get props => [city];
}

// error state
class GetCityError extends GetCityStatus{
  final String? message;
  GetCityError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}