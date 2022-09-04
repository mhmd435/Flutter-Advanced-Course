
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/widgets/app_background.dart';
import 'package:flutter_advanced_course/features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import 'package:flutter_advanced_course/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_advanced_course/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:flutter_advanced_course/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter_advanced_course/features/feature_weather/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_nav.dart';


class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);

  final PageController pageController = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {

    List<Widget> pageViewWidget = [
      const HomeScreen(),
      BookMarkScreen(pageController: pageController,),
    ];

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(Controller: pageController),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AppBackground.getBackGroundImage(),
              fit: BoxFit.cover
          ),
        ),
        height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ),
    );
  }
}
