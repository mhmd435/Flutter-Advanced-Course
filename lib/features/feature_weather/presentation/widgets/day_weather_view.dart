
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/utils/date_converter.dart';
import 'package:flutter_advanced_course/core/widgets/app_background.dart';
import 'package:flutter_advanced_course/features/feature_weather/data/models/ForcastDaysModel.dart';

class DaysWeatherView extends StatefulWidget {
  final Daily daily;
  const DaysWeatherView({super.key, required this.daily});

  @override
  State<DaysWeatherView> createState() => _DaysWeatherViewState();
}

class _DaysWeatherViewState extends State<DaysWeatherView> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: animationController, curve: const Interval(0.5, 1,curve: Curves.decelerate)));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child){
        return Transform(
          transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Column(
                    children: [
                      Text(DateConverter.changeDtToDateTime(widget.daily.dt),
                          style: const TextStyle(fontSize: 12, color: Colors.grey),),
                      Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: AppBackground.setIconForMain(widget.daily.weather![0].description),),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                                "${widget.daily.temp!.day!.round()}\u00B0",
                                style: const TextStyle(fontSize: 15, color: Colors.white),),
                          ),),
                    ],
                  ),),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    // _fwBloc.dispose();
    // _cwBloc.dispose();
    super.dispose();
  }
}
