import 'dart:async';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding.dart';
import 'package:potenic_app/Widgets/fading.dart';
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
  bool data = false;
  int myAmount = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), loadData);

    super.initState();
  }

  Future loadData() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var SessionToken = prefs.getString("refreshtoken");
    var Routes = prefs.getString("route");
//
    if (Accestoken != null && Routes == null) {
      Authentication().refreshTokenApi(SessionToken!).then((response) {
        if (response == true) {
          AdminGoal.checkUserGoalByUserId().then((response) {
            if (response == true) {
              Navigator.push(
                  context,
                  FadePageRoute(
                    page: const view_goals(
                      missed: false,
                      name: '',
                      update: false,
                      helpfulTips: false,
                      record: 0,
                    ),
                  ));
            } else if (response == false) {
              Navigator.push(
                  context,
                  FadePageRoute(
                    page: const HomeScreen(login: true),
                  ));
            }
          });
        } else if (response == false) {
          Navigator.push(
              context,
              FadePageRoute(
                page: const HomeScreen(login: false),
              ));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response["message"])));
        }
      }).catchError((error) {
        print("error");
      });
    } else if (Accestoken != null && Routes != null) {
      Authentication().refreshTokenApi(SessionToken!).then((response) {
        if (response == true) {
          Navigator.push(
              context,
              FadePageRoute(
                page: const HomeScreen(login: true),
              ));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response["message"])));
        }
      }).catchError((error) {
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
        page: const OnBoarding(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(right: 0, top: 0, bottom: 0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splashpage.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
