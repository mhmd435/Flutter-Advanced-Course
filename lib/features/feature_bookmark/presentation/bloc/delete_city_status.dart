
import 'package:equatable/equatable.dart';

abstract class DeleteCityStatus extends Equatable{}

class DeleteCityInitial extends DeleteCityStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// loading state
class DeleteCityLoading extends DeleteCityStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// loaded state
class DeleteCityCompleted extends DeleteCityStatus{
  final String name;
  DeleteCityCompleted(this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

// error state
class DeleteCityError extends DeleteCityStatus{
  final String? message;
  DeleteCityError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
