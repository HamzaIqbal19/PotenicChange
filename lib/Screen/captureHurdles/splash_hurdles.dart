import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_goal_impact.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            ),
          ]),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Capture_hurdle_landing.png'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => landing_hurdles()),
                  );
                },
                child: Container(
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
              ),
              Container(
                width: AppDimensions.height10 * 35.1,
                height: AppDimensions.height10 * 8.3,
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 3.7),
                child: Text(
                    'Use this space to capture obstacles that\nmay hold you back from achieving your\npersonal growth goals.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.8,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'laila')),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => hurdles_goal_impact()),
                  );
                },
                child: Container(
                  width: AppDimensions.height10 * 16.8,
                  height: AppDimensions.height10 * 17.0,
                  // color: Colors.amber,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 5.5,
                      right: AppDimensions.height10 * 1.9),
                  child: Center(
                    child: Text(
                      'Record your\nhurdles',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
