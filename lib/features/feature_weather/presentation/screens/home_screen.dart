
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/widgets/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/dot_loading_widget.dart';
import '../../domain/entities/current_city_entity.dart';
import '../bloc/cw_status.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String cityName = "Tehran";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName));
  }


  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

              BlocBuilder<HomeBloc,HomeState>(
              builder: (context, state){

                if(state.cwStatus is CwLoading){
                  return const Expanded(child: DotLoadingWidget());
                }

                if(state.cwStatus is CwCompleted){

                  /// cast
                  final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
                  final CurrentCityEntity currentCityEntity = cwCompleted.currentCityEntity;

                  return Expanded(
                      child: ListView(
                        children: [
                          Column(
                            children: [
                               Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Text(
                                    currentCityEntity.name!,
                                    style: const TextStyle(fontSize: 30,color: Colors.white),
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  currentCityEntity.weather![0].description!,
                                  style: const TextStyle(fontSize: 20,color: Colors.grey),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: AppBackground.setIconForMain(currentCityEntity.weather![0].description!),
                              ),
                            ],
                          )
                        ],
                      )
                  );
                }

                if(state.cwStatus is CwError){
                  return const Center(child: Text('error'),);
                }

                return Container();
              },
            ),

          ],
        )
    );
  }
}
