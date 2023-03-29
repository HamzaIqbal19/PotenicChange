// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpWithEmail.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  bool data = false;
  int myAmount = 0;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OnBoarding(),
      ),
    );
    // print('==================================');
  }

  @override
  Widget build(BuildContext context) {
    print("app dimension:${AppDimensions.height10 }");
    print("app dimension:${AppDimensions.screenHeight }");
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              width: AppDimensions.width10 * 40.65,
              height: AppDimensions.height20 * 45,
              // width: 423.5,

              margin: EdgeInsets.only(right: 0, top: 0, bottom: 0),
              decoration: BoxDecoration(
                // color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage('assets/images/splashpage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
