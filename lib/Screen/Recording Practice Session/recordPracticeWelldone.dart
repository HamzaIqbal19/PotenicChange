import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeFellingAftr.dart';
import 'package:potenic_app/Widgets/fading2.dart';

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
    loadData();
    super.initState();
    _fetchGoalNames();
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          // Loading = false;

          pracName = response["userPractices"][0]["name"];
        });
      } else {
        setState(() {
          //Loading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        // Loading = false;
      });
      print("error");
    });

    // setState(() {
    //   goalName = AdminGoal().getUserGoal();
    // });
    // print('GoalName: $goalName');
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 10), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.push(
      context,
      FadePageRoute(
        page: const feelingsAfter(
          summary: false,
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
          title: Container(
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.3),
            child: Center(
                child: Text(
              pracName,
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
          child: Center(
            child: Container(
              width: AppDimensions.height10(context) * 35.9,
              height: AppDimensions.height10(context) * 14.8,
              margin: EdgeInsets.only(
                  left: AppDimensions.height10(context) * 2.7,
                  right: AppDimensions.height10(context) * 2.7),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Well Done!',
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 3.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'laila'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.0),
                    child: Text('Now, let’s record your\npractice.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.8,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'laila')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
