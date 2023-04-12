import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeFellingAftr.dart';

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
      MaterialPageRoute(
        builder: (context) => feelingsAfter(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(top: AppDimensions.height10 * 1.3),
          child: Center(
              child: Text(
            'Meditation Session',
            style: TextStyle(
                fontSize: AppDimensions.height10 * 2.0,
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
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Container(
            width: AppDimensions.height10 * 35.9,
            height: AppDimensions.height10 * 14.8,
            margin: EdgeInsets.only(
                left: AppDimensions.height10 * 2.7,
                right: AppDimensions.height10 * 2.7),
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Well Done!',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 3.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'laila'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                  child: Text('Now, let’s record your\npractice.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.8,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'laila')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
