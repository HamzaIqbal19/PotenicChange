// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/CreateGoal/StartProcess.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpWithEmail.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Dashboard Behaviour/dashboard_view_goals.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // var token = FirebaseMessaging.instance.getToken().then((newToken) {});
  bool data = false;
  int myAmount = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // late SharedPreferences _prefss;
  // setToken(token) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString('token', token);
  //   print("SetToken: $token");
  // }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), loadData);

    super.initState();
  }

  Future loadData() async {
    // Navigator.push(
    //   context,
    //   FadePageRoute(
    //     page: dashBoard(
    //       saved: false,
    //       helpful_tips: false,
    //       membership: true,
    //       dashboard_ctrl: false,
    //       cancel: false,
    //       trial: false,
    //     ),
    //   ),
    //);
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var SessionToken = prefs.getString("refreshtoken");
    var Routes = prefs.getString("route");
//
    print("======================>${prefs.getString("refreshtoken")}");
    if (Accestoken != null && Routes == null) {
      print("====================>");

      Authentication().refreshTokenApi(SessionToken!).then((response) {
        print("???????????:$response");
        if (response == true) {
          AdminGoal.checkUserGoalByUserId().then((response) {
            print(response);
            if (response == true) {
              Navigator.push(
                  context,
                  FadePageRoute(
                    page: view_goals(
                      missed: false,
                      name: '',
                      update: false,
                      helpfulTips: false,
                    ),
                    // exitPage:SplashPage(),
                  ));
            } else if (response == false) {
              Navigator.push(
                  context,
                  FadePageRoute(
                    page: HomeScreen(login: true),
                    // exitPage:SplashPage(),
                  ));
            }
          });
        } else if (response == false) {
          Navigator.push(
              context,
              FadePageRoute(
                page: HomeScreen(login: false),
                // enterPage: const HomeScreen(login: true),
              ));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response["message"])));
        }
      }).catchError((error) {
        print("error");
      });
    } else if (Accestoken != null && Routes != null) {
      print("====================>");
      Authentication().refreshTokenApi(SessionToken!).then((response) {
        print("???????????:$response");
        if (response == true) {
          Navigator.push(
              context,
              FadePageRoute(
                page: HomeScreen(login: true),
                // exitPage:SplashPage(),
              ));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response["message"])));
        }
      }).catchError((error) {
        //onDoneLoading();
        print("error");
      }).whenComplete(() {
        onDoneLoading();
      });
    } else {
      onDoneLoading();
    }
  }

  onDoneLoading() async {
    Navigator.push(
      context,
      FadePageRoute(
        page: OnBoarding(),
      ),
    );
    // print('==================================');
  }

  @override
  Widget build(BuildContext context) {
    print("app dimension:${AppDimensions.height10}");
    print("app dimension:${AppDimensions.screenHeight}");
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(right: 0, top: 0, bottom: 0),
          decoration: BoxDecoration(
            // color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage('assets/images/splashpage.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
