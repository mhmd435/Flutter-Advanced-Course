
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/feature_bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature_weather/presentation/bloc/home_bloc.dart';
import '../../domain/entities/city_entity.dart';
import '../bloc/get_all_city_status.dart';

class BookMarkScreen extends StatelessWidget {
  final PageController pageController;
  const BookMarkScreen({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    BlocProvider.of<BookmarkBloc>(context).add(GetAllCityEvent());

    return BlocBuilder<BookmarkBloc,BookmarkState>(
        buildWhen: (previous, current) {
          /// rebuild UI just when allCityStatus Changed
          if (current.getAllCityStatus == previous.getAllCityStatus) {
            return false;
          } else {
            return true;
          }
        },
        builder: (context, state){

          /// show Loading for AllCityStatus
          if (state.getAllCityStatus is GetAllCityLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          /// show Completed for AllCityStatus
          if (state.getAllCityStatus is GetAllCityCompleted) {
            /// casting for getting cities
            GetAllCityCompleted getAllCityCompleted = state.getAllCityStatus as GetAllCityCompleted;
            List<City> cities = getAllCityCompleted.cities;

            return SafeArea(
              child: Column(
                children: [
                  const Text(
                    'WatchList',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    /// show text in center if there is no city bookmarked
                    child: (cities.isEmpty)
                        ? const Center(
                      child: Text(
                        'there is no bookmark city',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                        : ListView.builder(
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          City city = cities[index];
                          return GestureDetector(
                            onTap: () {
                              /// call for getting bookmarked city Data
                              BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(city.name));

                              /// animate to HomeScreen for showing Data
                              pageController.animateToPage(0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 5.0, sigmaY: 5.0),
                                  child: Container(
                                    width: width,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        color:
                                        Colors.grey.withOpacity(0.1)),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            city.name,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                BlocProvider.of<BookmarkBloc>(context).add(DeleteCityEvent(city.name));
                                                BlocProvider.of<BookmarkBloc>(context).add(GetAllCityEvent());
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.redAccent,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          }

          /// show Error for AllCityStatus
          if (state.getAllCityStatus is GetAllCityError) {
            /// casting for getting Error
            GetAllCityError getAllCityError =
            state.getAllCityStatus as GetAllCityError;

            return Center(
              child: Text(getAllCityError.message!),
            );
          }

          /// show Default value
          return Container();
        },
      );
  }
}
