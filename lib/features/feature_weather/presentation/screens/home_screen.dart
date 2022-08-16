
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/widgets/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/params/ForecastParams.dart';
import '../../../../core/widgets/dot_loading_widget.dart';
import '../../data/models/ForcastDaysModel.dart';
import '../../domain/entities/current_city_entity.dart';
import '../../domain/entities/forecase_days_entity.dart';
import '../bloc/cw_status.dart';
import '../bloc/fw_status.dart';
import '../bloc/home_bloc.dart';
import '../widgets/day_weather_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String cityName = "Tehran";
  final PageController _pageController = PageController();


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
                buildWhen: (previous, current){
                  /// rebuild just when CwStatus Changed
                  if(previous.cwStatus == current.cwStatus){
                    return false;
                  }
                  return true;
                },
              builder: (context, state){

                if(state.cwStatus is CwLoading){
                  return const Expanded(child: DotLoadingWidget());
                }

                if(state.cwStatus is CwCompleted){

                  /// cast
                  final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
                  final CurrentCityEntity currentCityEntity = cwCompleted.currentCityEntity;

                  /// create params for api call
                  final ForecastParams forecastParams = ForecastParams(currentCityEntity.coord!.lat!, currentCityEntity.coord!.lon!);

                  /// start load Fw event
                  BlocProvider.of<HomeBloc>(context).add(LoadFwEvent(forecastParams));

                  return Expanded(
                      child: ListView(
                        children: [

                          Padding(
                              padding: EdgeInsets.only(top: height * 0.02),
                              child: SizedBox(
                                width: width,
                                height: 400,
                                child: PageView.builder(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  allowImplicitScrolling: true,
                                  controller: _pageController,
                                  itemCount: 2,
                                  itemBuilder: (context, position) {
                                    if (position == 0) {
                                      return Column(
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
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Text(
                                              "${currentCityEntity.main!.temp!.round()}\u00B0",
                                              style: const TextStyle(fontSize: 50,color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              /// max temp
                                              Column(
                                                children: [
                                                  const Text(
                                                    "max",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  Text("${currentCityEntity.main!.tempMax!.round()}\u00B0",
                                                    style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,),)
                                                ],
                                              ),

                                              /// divider
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10.0, right: 10,),
                                                child: Container(
                                                  color: Colors.grey,
                                                  width: 2,
                                                  height: 40,
                                                ),
                                              ),

                                              /// min temp
                                              Column(
                                                children: [
                                                  const Text(
                                                    "min",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  Text("${currentCityEntity.main!.tempMin!.round()}\u00B0",
                                                    style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,),)
                                                ],
                                              ),
                                            ],
                                          )

                                        ],
                                      );
                                    } else {
                                      return Container(
                                        color: Colors.amber,
                                      );
                                    }
                                  },),
                              ),
                          ),

                          const SizedBox(height: 10,),
                          /// pageView Indicator
                          Center(
                            child: SmoothPageIndicator(
                              controller: _pageController,
                              // PageController
                              count: 2,
                              effect: const ExpandingDotsEffect(
                                dotWidth: 10,
                                dotHeight: 10,
                                spacing: 5,
                                activeDotColor: Colors.white,),
                              // your preferred effect
                              onDotClicked: (index) =>
                                  _pageController.animateToPage(index,
                                    duration: const Duration(microseconds: 500),
                                    curve: Curves.bounceOut,),),
                          ),

                          /// divider
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              color: Colors.white24,
                              height: 2,
                              width: double.infinity,
                            ),
                          ),

                          /// forecast weather 7 days
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Center(
                                  child: BlocBuilder<HomeBloc, HomeState>(
                                    builder: (BuildContext context, state) {

                                      /// show Loading State for Fw
                                      if (state.fwStatus is FwLoading) {
                                        return const DotLoadingWidget();
                                      }

                                      /// show Completed State for Fw
                                      if (state.fwStatus is FwCompleted) {
                                        /// casting
                                        final FwCompleted fwCompleted = state.fwStatus as FwCompleted;
                                        final ForecastDaysEntity forecastDaysEntity = fwCompleted.forecastDaysEntity;
                                        final List<Daily> mainDaily = forecastDaysEntity.daily!;

                                        return ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 8,
                                          itemBuilder: (BuildContext context,
                                              int index,) {
                                            return DaysWeatherView(
                                              daily: mainDaily[index],);
                                          },);
                                      }

                                      /// show Error State for Fw
                                      if (state.fwStatus is FwError) {
                                        final FwError fwError = state.fwStatus as FwError;
                                        return Center(
                                          child: Text(fwError.message!),
                                        );
                                      }

                                      /// show Default State for Fw
                                      return Container();

                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// divider
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              color: Colors.white24,
                              height: 2,
                              width: double.infinity,
                            ),
                          ),
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
