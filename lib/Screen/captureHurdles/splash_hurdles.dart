import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_goal_impact.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_name.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_select_hurdle.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_statement.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_fellings.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class hurdles_splash extends StatefulWidget {
  const hurdles_splash({super.key});

  @override
  State<StatefulWidget> createState() {
    return hurdles_splashState();
  }
}

class hurdles_splashState extends State<hurdles_splash> {
  var Route;

  void getHurdleRoute() async {
    final SharedPreferences prefs = await _prefs;
    Route = prefs.getString('HurdleRoute');
    print(prefs.getString('HurdleRoute'));
  }

  @override
  void initState() {
    super.initState();
    getHurdleRoute();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context,
            FadePageRoute(
                page: const view_goals(
              missed: false,
              name: '',
              update: false,
            )));
        return Future.value(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          FadePageRoute(
                              page: const view_goals(
                            missed: false,
                            name: '',
                            update: false,
                          )));
                    },
                    icon: Image.asset(
                      'assets/images/Close.webp',
                      width: AppDimensions.height10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.6,
                      fit: BoxFit.cover,
                    )),
              ),
            ]),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/Capture_hurdle_landing.webp'),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   FadePageRoute(page: const landing_hurdles()),
                    // );
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 34.3,
                    height: AppDimensions.height10(context) * 7.3,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 12.0,
                        bottom: AppDimensions.height10(context) * 1.9),
                    child: GradientText(
                      'My faced\nhurdles & obstacles',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 3.0,
                        fontWeight: FontWeight.w700,
                      ),
                      colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10(context) * 35.1,
                  height: AppDimensions.height10(context) * 8.3,
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 3.7),
                  child: Text(
                      'Use this space to capture obstacles that\nmay hold you back from achieving your\npersonal growth goals.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          height: AppDimensions.height10(context) * 0.15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'laila')),
                ),
                GestureDetector(
                  onTap: () async {
                    if (Route == 'Impact') {
                      Navigator.push(
                        context,
                        FadePageRoute(
                            page: const hurdles_goal_impact(
                          summary: false,
                        )),
                      );
                    } else if (Route == 'Select') {
                      Navigator.push(
                        context,
                        FadePageRoute(page: const select_hurdle(update: false)),
                      );
                    } else if (Route == 'Name') {
                      Navigator.push(
                        context,
                        FadePageRoute(page: const hurdle_name(update: false)),
                      );
                    } else if (Route == 'Statements') {
                      Navigator.push(
                        context,
                        FadePageRoute(
                            page: const hurdle_statement(update: false)),
                      );
                    } else if (Route == 'Feelings') {
                      Navigator.push(
                        context,
                        FadePageRoute(
                            page: const felling_hurdles(
                          update: false,
                        )),
                      );
                    } else {
                      final SharedPreferences prefs = await _prefs;
                      var hurdleRoute = prefs.remove('HurdleRoute');
                      Navigator.push(
                        context,
                        FadePageRoute(
                            page: const hurdles_goal_impact(
                          summary: false,
                        )),
                      );
                    }
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 16.8,
                    height: AppDimensions.height10(context) * 17.0,
                    // color: Colors.amber,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 5.5,
                        right: AppDimensions.height10(context) * 1.9),
                    child: Center(
                      child: Text(
                        'Record your\nhurdles',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
