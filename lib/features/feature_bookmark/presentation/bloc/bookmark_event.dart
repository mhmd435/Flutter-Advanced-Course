part of 'bookmark_bloc.dart';

@immutable
abstract class BookmarkEvent {}

class GetAllCityEvent extends BookmarkEvent {}

class GetCityByNameEvent extends BookmarkEvent {
  final String cityName;
  GetCityByNameEvent(this.cityName);
}

class SaveCwEvent extends BookmarkEvent {
  final String name;
  SaveCwEvent(this.name);
}

class SaveCityInitialEvent extends BookmarkEvent {}


class DeleteCityEvent extends BookmarkEvent {
  final String name;
  DeleteCityEvent(this.name);
}