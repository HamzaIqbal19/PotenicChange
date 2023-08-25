import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeFellingAftr.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class welldone_splash extends StatefulWidget {
  const welldone_splash({super.key});

  @override
  State<StatefulWidget> createState() {
    return welldone_splashState();
  }
}

class welldone_splashState extends State<welldone_splash> {
  bool data = false;
  int myAmount = 0;
  String pracName = "";

  @override
  void initState() {
    super.initState();
    _fetchPracticeNames();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _fetchPracticeNames() async {
    final SharedPreferences prefs = await _prefs;
    var Name = prefs.getString('pracName');

    setState(() {
      pracName = '$Name';
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.push(
      context,
      FadePageRoute(
        page: const feelingsAfter(
          summary: false,
          selected: 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.push(
        //   context,
        //   FadePageRoute(
        //     page: const feelingsAfter(
        //       summary: false,
        //     ),
        //   ),
        // );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.3),
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.height10(context) * 3,
            ),
            child: Center(
                child: Text(
              pracName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: AppDimensions.height10(context) * 2.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'laila',
                  color: Colors.white),
            )),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Container(
                  width: AppDimensions.height10(context) * 35.9,
                  height: AppDimensions.height10(context) * 14.8,
                  margin: EdgeInsets.only(
                      left: AppDimensions.height10(context) * 2.7,
                      right: AppDimensions.height10(context) * 2.7),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.0),
                    child: Text('Let\'s continue recording\n your practice.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.8,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'laila')),
                  ),
                ),
              ),
              Positioned(
                bottom: AppDimensions.height10(context) * 6,
                child: AnimatedScaleButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      FadePageRoute(
                        page: const feelingsAfter(
                          summary: false,
                          selected: 0,
                        ),
                      ),
                    );
                  },
                  child: Container(
                      height: AppDimensions.height10(context) * 5.0,
                      width: AppDimensions.height10(context) * 20.7,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffFCC10D),
                              Color(0xffFDA210),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0),
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.2,
                              color: Colors.transparent)),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
