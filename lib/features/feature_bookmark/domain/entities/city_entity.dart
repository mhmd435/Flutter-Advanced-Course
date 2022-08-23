
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class City extends Equatable {

  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;

  City({required this.name});

  @override
  List<Object?> get props => [name];
}