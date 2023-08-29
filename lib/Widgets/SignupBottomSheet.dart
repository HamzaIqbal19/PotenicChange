import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

void signupSheet(context, String ButtonName, String Route) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: false,
    // backgroundColor: const Color(0xFF000000).withOpacity(0.6),
    builder: (context) => Container(
      height: 216,
      width: 414,
      color: const Color(0xFF000000).withOpacity(0.6),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
            height: 112,
            width: 396,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color.fromRGBO(255, 255, 255, 0.8)),
            child: Column(
              children: [
                Container(
                  height: 56,
                  width: 396,
                  color: Colors.transparent,
                  child: TextButton(
                      onPressed: () {
                        Route == "OnBoarding"
                            ? Navigator.push(
                                context,
                                FadePageRoute3(
                                  enterPage: OnBoarding(),
                                  exitPage: const HomeScreen(login: true),
                                ),
                              )
                            : Container();
                      },
                      child: Text(
                        ButtonName,
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 120, 255, 1),
                          fontSize: 16,
                        ),
                      )),
                ),
                Container(
                  height: 56,
                  width: 396,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: const Color(0xFF000000).withOpacity(0.4),
                              width: AppDimensions.height10(context) * 0.1))),
                  child: TextButton(
                      onPressed: () {
                        AdminGoal.checkUserActiveGoal().then((response) {
                          if (response == 200) {
                            Navigator.push(
                              context,
                              FadePageRoute(
                                page: const dashBoard(
                                  saved: false,
                                  helpful_tips: false,
                                  dashboard_ctrl: false,
                                  membership: true,
                                  cancel: false,
                                  trial: false,
                                ),
                              ),
                            );
                          } else if (response == 404) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              "There are no active goals ",
                              style: TextStyle(color: Colors.red),
                            )));
                          }
                        });
                      },
                      child: const Text(
                        " (Dev only) Dashboard logged in",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 120, 255, 1),
                          fontSize: 16,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
            height: 56,
            width: 396,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: Colors.white),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 120, 255, 1),
                    fontSize: 16,
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}
