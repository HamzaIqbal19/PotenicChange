import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_goal_impact.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';

class hurdles_splash extends StatefulWidget {
  const hurdles_splash({super.key});

  @override
  State<StatefulWidget> createState() {
    return hurdles_splashState();
  }
}

class hurdles_splashState extends State<hurdles_splash> {
  bool data = false;
  int myAmount = 0;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 1), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => hurdles_goal_impact()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/practicebackground.png'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10 * 34.3,
                height: AppDimensions.height10 * 7.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 12.0,
                    bottom: AppDimensions.height10 * 1.9),
                child: GradientText(
                  'My faced\nhurdles & obstacles',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 3.0,
                    fontWeight: FontWeight.w700,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 35.1,
                height: AppDimensions.height10 * 8.3,
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 8.7),
                child: Text(
                    'Use this space to capture obstacles that may hold you back from achieving your personal growth goals.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.8,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'laila')),
              ),
            ],
          )),
    );
  }
}
