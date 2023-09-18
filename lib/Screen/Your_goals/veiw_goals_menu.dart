import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Alerts/message_center.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';

import 'package:potenic_app/Screen/Goal%20Evaluation/practice_score.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/progress_report.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations.dart';
import 'package:potenic_app/Screen/Menu&settings/settings.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
import 'package:potenic_app/Screen/ReviewPractice/Activateyourstar.dart';
import 'package:potenic_app/Screen/Subscription/Subscription.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding.dart';
import 'package:potenic_app/Screen/timeline/timeline.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
// import 'package:flutter_offline/flutter_offline.dart';

import '../Recording Practice Session/recordPracticeMenu.dart';
import '../captureHurdles/splash_hurdles.dart';
import '../capture_inspiration/inpiration_motivation.dart';
import '../community/community.dart';
import 'goal_menu_inactive.dart';

class your_goals_menu extends StatefulWidget {
  final bool trial;
  final bool membership;
  final bool cancel;

  const your_goals_menu(
      {super.key,
      required this.trial,
      required this.membership,
      required this.cancel});

  @override
  State<your_goals_menu> createState() => _your_goals_menuState();
}

class _your_goals_menuState extends State<your_goals_menu> {
  @override
  Widget build(BuildContext context) {
    final colorC = Color.alphaBlend(
        const Color(0xFF000000).withOpacity(0.2), const Color(0XFF5B74A6));
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
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
        return Future.value(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
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
                  },
                  icon: Image.asset(
                    'assets/images/Back.webp',
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
                  )),
            ),
            centerTitle: true,
            title: SizedBox(
              width: AppDimensions.height10(context) * 17.0,
              height: AppDimensions.height10(context) * 4.8,
              child: Center(
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 1.8,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: Stack(alignment: Alignment.center, children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: AppDimensions.height10(context) * 37.4,
                    //height: AppDimensions.height10(context) * 28.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 16.0),
                    padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.height10(context) * 1.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: Colors.white),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const view_all_goals_menu()));
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 33.4,
                            height: AppDimensions.height10(context) * 5.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: colorC))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 20.6,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    'Your goals',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500,
                                        color: colorC),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.webp',
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        color: colorC,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 33.4,
                          height: AppDimensions.height10(context) * 5.0,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width:
                                          AppDimensions.height10(context) * 0.1,
                                      color: colorC))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppDimensions.height10(context) * 20.6,
                                height: AppDimensions.height10(context) * 1.9,
                                child: Text(
                                  'Messages (00 new)',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: colorC),
                                ),
                              ),
                              SizedBox(
                                  width: AppDimensions.height10(context) * 2.4,
                                  height:
                                      AppDimensions.height10(context) * 1.39,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/BTN Back.webp',
                                      //width: AppDimensions.height10(context) * 2.6,
                                      //height: AppDimensions.height10(context) * 2.6,
                                      color: colorC,
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 33.4,
                          // height: AppDimensions.height10(context) * 5.0,
                          padding: EdgeInsets.symmetric(
                              vertical: AppDimensions.height10(context) * 1.5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width:
                                          AppDimensions.height10(context) * 0.1,
                                      color: colorC))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // if (widget.membership == true) {
                                      //   Navigator.push(
                                      //       context,
                                      //       FadePageRoute(
                                      //           page: const Subscription()));
                                      // } else if (widget.trial == true) {
                                      //   print(widget.cancel);
                                      //   Navigator.push(
                                      //       context,
                                      //       FadePageRoute(
                                      //           page: widget.cancel
                                      //               ? const dashBoard(
                                      //                   saved: false,
                                      //                   helpful_tips: false,
                                      //                   dashboard_ctrl: true,
                                      //                   membership: true,
                                      //                   trial: false,
                                      //                   cancel: false)
                                      //               : const dashBoard(
                                      //                   saved: false,
                                      //                   helpful_tips: false,
                                      //                   dashboard_ctrl: true,
                                      //                   membership: false,
                                      //                   trial: true,
                                      //                   cancel: true)));

                                      //   _canceled_plan(context);
                                      // } else {
                                      //   Navigator.push(
                                      //       context,
                                      //       FadePageRoute(
                                      //           page: const Subscription()));
                                      // }
                                    },
                                    child: SizedBox(
                                        width: AppDimensions.height10(context) *
                                            27.6,
                                        // height: AppDimensions.height10(context) * 1.9,
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'Laila',
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.15,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.6,
                                                    fontWeight: FontWeight.w500,
                                                    color: colorC),
                                                children: [
                                              TextSpan(
                                                  text: widget.membership
                                                      ? 'Membership subscription\n'
                                                      : 'Manage my subscription\n'),
                                              widget.membership
                                                  ? const TextSpan(
                                                      text:
                                                          'Current plan: Empowered Starter',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color(
                                                              0xFF8C648A)))
                                                  : TextSpan(
                                                      text:
                                                          'Your subscription is managed through\nthe App Store.',
                                                      style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.4,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                            ]))),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.webp',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: colorC,
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                ],
                              ),
                              widget.trial
                                  ? Container(
                                      width: AppDimensions.height10(context) *
                                          33.9,
                                      // height: AppDimensions.height10(context) * 1.9,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Text(
                                          widget.cancel
                                              ? 'Renews March 9th 2023'
                                              : '5 day trial, 4 days left (tap here to cancel)',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xFF8C648A))),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 33.4,
                          height: AppDimensions.height10(context) * 5.0,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width:
                                          AppDimensions.height10(context) * 0.1,
                                      color: colorC))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  // community_sheet(context);
                                },
                                child: SizedBox(
                                  width: AppDimensions.height10(context) * 20.6,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    'Community (coming soon)',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500,
                                        color: colorC),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: AppDimensions.height10(context) * 2.4,
                                  height:
                                      AppDimensions.height10(context) * 1.39,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/BTN Back.webp',
                                      //width: AppDimensions.height10(context) * 2.6,
                                      //height: AppDimensions.height10(context) * 2.6,
                                      color: colorC,
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, FadePageRoute(page: const Settings()));
                          },
                          child: SizedBox(
                            width: AppDimensions.height10(context) * 33.4,
                            height: AppDimensions.height10(context) * 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 20.6,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    'Settings',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500,
                                        color: colorC),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.webp',
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        color: colorC,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 37.4,
                    // height: AppDimensions.height10(context) * 86.4,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.0,
                        bottom: AppDimensions.height10(context) * 3.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: AppDimensions.height10(context) * 26.6,
                            height: AppDimensions.height10(context) * 2.4,
                            child: Text(
                              'Journeys (DEV USE ONLY)',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0XFFFBFBFB)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 37.4,
                          // height: AppDimensions.height10(context) * 83.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: AppDimensions.height10(context),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      FadePageRoute(page: const OnBoarding()));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J1 Onboarding',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     FadePageRoute(
                                  //         page: const practiceMenu(
                                  //       goal_eval: false,
                                  //     )));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J2 Record practice session',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const view_all_goals_menu()));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J3 Your goals',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const hurdles_splash()));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J4 Record hurdle ',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const inspiration_motivation(
                                        goal_delete: false,
                                        inspirationName: '',
                                      )));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J5 Record inspiration  ',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const goal_menu_inactive(
                                        isActive: true,
                                        goal_evaluation: true,
                                      )));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J6 Goal evaluation',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context,
                                  //     FadePageRoute(page: const prac_score()));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J7 Practice evaluation',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  community_sheet(context);
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J8 Community',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      FadePageRoute(page: const timeline()));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J9 Timeline',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const congratulations()));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J10 Goal achieved',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: Image.asset(
                                            'assets/images/BTN Back.webp',
                                            //width: AppDimensions.height10(context) * 2.6,
                                            //height: AppDimensions.height10(context) * 2.6,
                                            color: colorC,
                                            fit: BoxFit.cover,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     FadePageRoute(
                                  //         page: const message_center()));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J11 Alerts',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: colorC,
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      FadePageRoute(page: const Settings()));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J12 Menu & Settings',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: Image.asset(
                                            'assets/images/BTN Back.webp',
                                            //width: AppDimensions.height10(context) * 2.6,
                                            //height: AppDimensions.height10(context) * 2.6,
                                            color: colorC,
                                            fit: BoxFit.cover,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const view_goals(
                                        missed: false,
                                        name: '',
                                        update: false,
                                        helpfulTips: false,
                                        record: 0,
                                      )));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J13 Dashboard behaviour',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: Image.asset(
                                            'assets/images/BTN Back.webp',
                                            //width: AppDimensions.height10(context) * 2.6,
                                            //height: AppDimensions.height10(context) * 2.6,
                                            color: colorC,
                                            fit: BoxFit.cover,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      FadePageRoute(
                                        page: const view_goals(
                                          missed: false,
                                          name: '',
                                          update: false,
                                          helpfulTips: true,
                                          record: 0,
                                        ),
                                      ));
                                  dashboard_sheet(context);
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              color: colorC))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J14 Helpful tips',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          child: Image.asset(
                                            'assets/images/BTN Back.webp',
                                            //width: AppDimensions.height10(context) * 2.6,
                                            //height: AppDimensions.height10(context) * 2.6,
                                            color: colorC,
                                            fit: BoxFit.cover,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 33.4,
                                height: AppDimensions.height10(context) * 5.0,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: AppDimensions.height10(
                                                    context) *
                                                0.1,
                                            color: colorC))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     FadePageRoute(
                                        //         page: const Subscription()));
                                      },
                                      child: SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J15 Subscription ',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: AppDimensions.height10(context) *
                                            2.4,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.39,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/images/BTN Back.webp',
                                            //width: AppDimensions.height10(context) * 2.6,
                                            //height: AppDimensions.height10(context) * 2.6,
                                            color: colorC,
                                            fit: BoxFit.cover,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 33.4,
                                height: AppDimensions.height10(context) * 5.0,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: AppDimensions.height10(
                                                    context) *
                                                0.1,
                                            color: colorC))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'J16 Offline mode',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: AppDimensions.height10(context) *
                                            2.4,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.39,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/images/BTN Back.webp',
                                            //width: AppDimensions.height10(context) * 2.6,
                                            //height: AppDimensions.height10(context) * 2.6,
                                            color: colorC,
                                            fit: BoxFit.cover,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 33.4,
                                height: AppDimensions.height10(context) * 5.0,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: AppDimensions.height10(
                                                    context) *
                                                0.1,
                                            color: colorC))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: AppDimensions.height10(context) *
                                            20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'Reset account to it’s default state',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w500,
                                              color: colorC),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: AppDimensions.height10(context) *
                                            2.4,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.39,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/images/BTN Back.webp',
                                            //width: AppDimensions.height10(context) * 2.6,
                                            //height: AppDimensions.height10(context) * 2.6,
                                            color: colorC,
                                            fit: BoxFit.cover,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 3,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // OfflineBuilder(
            //     debounceDuration: const Duration(seconds: 1),
            //     connectivityBuilder: (
            //       BuildContext context,
            //       ConnectivityResult connectivity,
            //       Widget child,
            //     ) {
            //       final bool connected = connectivity != ConnectivityResult.none;
            //       return Stack(
            //         fit: StackFit.expand,
            //         children: [
            //           Positioned(
            //               child: Align(
            //             alignment: Alignment.bottomCenter,
            //             child: Container(
            //               width: double.infinity,
            //               height: AppDimensions.height10(context) * 3.0,
            //               color: connected
            //                   ? const Color(0xFF27AE60)
            //                   : const Color(0xFFFE6624),
            //               child: Center(
            //                 child: Text(
            //                   connected ? 'Back Online' : 'You’re Offline',
            //                   style: TextStyle(
            //                       fontSize: AppDimensions.height10(context) * 1.4,
            //                       fontWeight: FontWeight.w400,
            //                       color: const Color(0xFFFBFBFB)),
            //                 ),
            //               ),
            //             ),
            //           ))
            //         ],
            //       );
            //     },
            //     child: Container())
          ]),
        ),
      ),
    );
  }
}

void _canceled_plan(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10(context) * 39.4,
          height: AppDimensions.height10(context) * 75.5,
          margin: EdgeInsets.only(
              left: AppDimensions.height10(context) * 1.0,
              right: AppDimensions.height10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.9,
                        right: AppDimensions.height10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.5,
                    bottom: AppDimensions.height10(context) * 2.0),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.height10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 30.7,
                height: AppDimensions.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'Ownership Plan is\nnow cancelled',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.12,
                      fontSize: AppDimensions.height10(context) * 2.8,
                      // letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensions.height10(context) * 33.2,
                  height: AppDimensions.height10(context) * 36.4,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.8,
                              fontFamily: 'laila',
                              height: AppDimensions.height10(context) * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: const [
                            TextSpan(
                                text:
                                    'We are sad you’ve decided to cancel\nyour subscription. \n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(text: 'You’ve been downgraded to\n'),
                            TextSpan(
                                text: 'Empowered Starter ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'Plan.\n\nWe know life circumstances change and\nevolve, so if you change your mind in\nthe future, you can always upgrade\nback to '),
                            TextSpan(
                                text: 'Ownership Plan.\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                              text:
                                  'We always look to improve and provide\nbetter service - if you could let us know\nyour feedback by completing a short\nsurvey below we would be very grateful.\nYour experience is important to us. ',
                            )
                          ]))),
              Container(
                width: AppDimensions.height10(context) * 33.5,
                height: AppDimensions.height10(context) * 5.0,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
                decoration: BoxDecoration(
                    color: const Color(0xFF5A4D73),
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 5.0)),
                child: Center(
                  child: Text(
                    'Feedback about their experience',
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.8,
                        height: AppDimensions.height10(context) * 0.15,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              )
            ],
          )),
    ),
  );
}

void activeReport(
    context, String goalName, String pracName, int color1, int color2) {
  //bool cancel = canceled;
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 2.0)),
      builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: AppDimensions.height10(context) * 39.4,
            height: AppDimensions.height10(context) * 53.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0XffD9B4B4).withOpacity(0.7),
                  ]),
            ),
            padding: EdgeInsets.all(AppDimensions.height10(context)),
            child: Container(
              width: AppDimensions.height10(context) * 39.4,
              height: AppDimensions.height10(context) * 51.3,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 1.5),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFE1B3B7), Color(0XffC9B9CB)]),
                image: const DecorationImage(
                    opacity: 0.7,
                    image: AssetImage('assets/images/timeline_2.webp')),
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 2.0),
              ),
              child: Column(
                children: [
                  Container(
                    //color: Colors.amber,
                    // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                    alignment: const Alignment(1, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 2.6,
                        height: AppDimensions.height10(context) * 2.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.5,
                            right: AppDimensions.height10(context) * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Close_blue.webp'))),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 23.8,
                    height: AppDimensions.height10(context) * 3.4,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 0),
                    child: Text(
                      'Congratulations!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppDimensions.height10(context) * 2.8,
                          color: const Color(0xff437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 32.7,
                    //height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 0.3),
                    child: Text(
                      'Your 20 active day report is ready',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: AppDimensions.height10(context) * 0.12,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimensions.height10(context) * 2.0,
                          color: const Color(0xff437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 33.8,
                    //height: AppDimensions.height10(context) * 6.8,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.5),
                    child: Text(
                      'You have been consistently working on your\npractice for 20 active days now. We’ve put together\na progress report for you to review and evaluate\nyour journey.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppDimensions.height10(context) * 1.4,
                          color: const Color(0xff437296)),
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () {
                      Navigator.push(context,
                          FadePageRoute(page: const progress_report()));
                    },
                    child: Container(
                      width: AppDimensions.height10(context) * 23.7,
                      height: AppDimensions.height10(context) * 25.5,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.2),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0XffD9B4B4), Color(0xFFF5EDED)]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  AppDimensions.height10(context)),
                              topRight: Radius.circular(
                                  AppDimensions.height10(context)),
                              bottomLeft: Radius.circular(
                                  AppDimensions.height10(context)),
                              bottomRight: Radius.circular(
                                  AppDimensions.height10(context) * 5))),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-2.5, -2.0),
                            child: Container(
                              width: AppDimensions.height10(context) * 18.7,
                              height: AppDimensions.height10(context) * 18.7,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        color1 == 1
                                            ? "assets/images/red_gradient.webp"
                                            : color1 == 2
                                                ? 'assets/images/orange_moon.webp'
                                                : color1 == 3
                                                    ? "assets/images/lightGrey_gradient.webp"
                                                    : color1 == 4
                                                        ? "assets/images/lightBlue_gradient.webp"
                                                        : color1 == 5
                                                            ? "assets/images/medBlue_gradient.webp"
                                                            : color1 == 6
                                                                ? "assets/images/Blue_gradient.webp"
                                                                : 'assets/images/orange_moon.webp',
                                      ),
                                      fit: BoxFit.cover)),
                              child: Container(
                                width: AppDimensions.height10(context) * 11.5,
                                height: AppDimensions.height10(context) * 4.8,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensions.height10(context) * 2),
                                alignment: const Alignment(-0.2, -0.1),
                                child: Text(
                                  goalName,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
                                      height: AppDimensions.height10(context) *
                                          0.15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff5B74A6)),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.3, -0.4),
                            child: Container(
                              width: AppDimensions.height10(context) * 11.6,
                              height: AppDimensions.height10(context) * 11.6,
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.height10(context)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(color2 == 1
                                          ? "assets/images/Ellipse orange.webp"
                                          : color2 == 2
                                              ? 'assets/images/Ellipse 158.webp'
                                              : color2 == 3
                                                  ? "assets/images/Ellipse 157.webp"
                                                  : color2 == 4
                                                      ? "assets/images/Ellipse light-blue.webp"
                                                      : color2 == 5
                                                          ? "assets/images/Ellipse blue.webp"
                                                          : 'assets/images/Ellipse 158.webp'),
                                      fit: BoxFit.contain)),
                              child: SizedBox(
                                width: AppDimensions.height10(context) * 9.5,
                                height: AppDimensions.height10(context) * 5.0,
                                child: Center(
                                  child: Text(
                                    pracName,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(-1, 0.9),
                            child: Container(
                              width: AppDimensions.height10(context) * 17.1,
                              height: AppDimensions.height10(context) * 6.4,
                              padding: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.84,
                                  top: AppDimensions.height10(context) * 1.04),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      // begin: Alignment.topCenter,
                                      // end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0XFF91698C),
                                        Color(0xFFC19CA7)
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          AppDimensions.height10(context)),
                                      bottomRight: Radius.circular(
                                          AppDimensions.height10(context)))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '20 day report',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 5.03,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context)),
                                    child: Divider(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      color: const Color(0xFFFFFFFF)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context)),
                                    child: Text(
                                      'Ready',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.1,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFFBFBFB)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )));
}
