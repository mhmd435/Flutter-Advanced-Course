part of 'home_bloc.dart';

class HomeState {
  CwStatus cwStatus;

  HomeState({required this.cwStatus});

  HomeState copyWith({
    CwStatus? newCwStatus,
  }){
    return HomeState(
        cwStatus: newCwStatus ?? this.cwStatus,
    );
  }
}
