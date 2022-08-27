import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_advanced_course/features/feature_bookmark/presentation/bloc/save_city_status.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/use_cases/get_city_usecase.dart';
import '../../domain/use_cases/save_city_usecase.dart';
import 'get_city_status.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  GetCityUseCase getCityUseCase;
  SaveCityUseCase saveCityUseCase;

  BookmarkBloc(
      this.getCityUseCase,
      this.saveCityUseCase) : super(BookmarkState(
      getCityStatus: GetCityLoading(),
      saveCityStatus: SaveCityInitial())) {


    /// get city By name event
    on<GetCityByNameEvent>((event, emit) async {

      /// emit Loading state
      emit(state.copyWith(newCityStatus: GetCityLoading()));

      DataState dataState = await getCityUseCase(event.cityName);

      /// emit Complete state
      if(dataState is DataSuccess){
        emit(state.copyWith(newCityStatus: GetCityCompleted(dataState.data)));
      }

      /// emit Error state
      if(dataState is DataFailed){
        emit(state.copyWith(newCityStatus: GetCityError(dataState.error)));
      }
    });


    /// Save City Event
    on<SaveCwEvent>((event, emit) async {

      /// emit Loading state
      emit(state.copyWith(newSaveStatus: SaveCityLoading()));

      DataState dataState = await saveCityUseCase(event.name);

      /// emit Complete state
      if(dataState is DataSuccess){
        emit(state.copyWith(newSaveStatus: SaveCityCompleted(dataState.data)));
      }

      /// emit Error state
      if(dataState is DataFailed){
        emit(state.copyWith(newSaveStatus: SaveCityError(dataState.error)));
      }
    });

    /// set to init again SaveCity (برای بار دوم و سوم و غیره باید وضعیت دوباره به حالت اول برگرده وگرنه بوکمارک پر خواهد ماند)
    on<SaveCityInitialEvent>((event, emit) async {
      emit(state.copyWith(newSaveStatus: SaveCityInitial()));
    });

  }
}
