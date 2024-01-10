import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

void signupSheet(context, String ButtonName, String Route, bool admin) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: false,
    // backgroundColor: const Color(0xFF000000).withOpacity(0.6),
    builder: (context) => Container(
      //height: 216,
      width: 414,
      color: const Color(0xFF000000).withOpacity(0.6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
            //height: 112,
            width: 396,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color.fromRGBO(255, 255, 255, 0.8)),
            child: Column(
              children: [
                Container(
                  height: AppDimensions.height10(context) * 5.6,
                  width: 396,
                  color: Colors.transparent,
                  child: TextButton(
                      onPressed: () {
                        Route == "OnBoarding"
                            ? Navigator.push(
                                context,
                                FadePageRoute3(
                                  enterPage: const OnBoarding(),
                                  exitPage: const HomeScreen(login: true),
                                ),
                              )
                            : Container();
                      },
                      child: Text(
                        ButtonName,
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 120, 255, 1),
                          fontSize: AppDimensions.height10(context) * 1.6,
                        ),
                      )),
                ),
                admin
                    ? Container(
                        height: AppDimensions.height10(context) * 5.6,
                        width: 396,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.4),
                                    width:
                                        AppDimensions.width10(context) * 0.1))),
                        child: TextButton(
                            onPressed: () {
                              AdminGoal.checkUserActiveGoal().then((response) {
                                if (response == 200) {
                                  Navigator.push(
                                    context,
                                    FadePageRoute(
                                      page: const view_goals(
                                          missed: false,
                                          update: false,
                                          name: '',
                                          helpfulTips: false,
                                          record: 0),
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
                            child: Text(
                              " (Dev only) Dashboard logged in",
                              style: TextStyle(
                                color: const Color.fromRGBO(0, 120, 255, 1),
                                fontSize: AppDimensions.height10(context) * 1.6,
                              ),
                            )),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
            height: AppDimensions.height10(context) * 5.6,
            width: 396,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: Colors.white),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 120, 255, 1),
                    fontSize: AppDimensions.height10(context) * 1.6,
                  ),
                )),
          ),
          SizedBox(
            height: AppDimensions.height10(context),
          )
        ],
      ),
    ),
  );
}
