import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Alerts/message_center.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_assesment_history.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_progress.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations.dart';
import 'package:potenic_app/Screen/Menu&settings/settings.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding.dart';
import 'package:potenic_app/Screen/timeline/timeline.dart';

import '../../utils/app_dimensions.dart';
import '../Goal Evaluation/goal_criteria.dart';
import '../Recording Practice Session/recordPracticeMenu.dart';
import '../captureHurdles/splash_hurdles.dart';
import '../capture_inspiration/inpiration_motivation.dart';
import '../community/community.dart';
import 'goal_menu_inactive.dart';

class your_goals_menu extends StatelessWidget {
  const your_goals_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/Back.png',
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
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10(context) * 37.4,
                height: AppDimensions.height10(context) * 28.0,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2.0),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const veiw_all_goals_menu()));
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 33.4,
                        height: AppDimensions.height10(context) * 5.0,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
                                    color: const Color(0xff5B74A6)))),
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
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0XFF5B74A6)),
                              ),
                            ),
                            SizedBox(
                                width: AppDimensions.height10(context) * 2.4,
                                height: AppDimensions.height10(context) * 1.39,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/BTN Back.png',
                                    //width: AppDimensions.height10(context) * 2.6,
                                    //height: AppDimensions.height10(context) * 2.6,
                                    color: const Color(0xff5B74A6),
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
                                  width: AppDimensions.height10(context) * 0.1,
                                  color: const Color(0xff5B74A6)))),
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
                                  color: const Color(0XFF5B74A6)),
                            ),
                          ),
                          SizedBox(
                              width: AppDimensions.height10(context) * 2.4,
                              height: AppDimensions.height10(context) * 1.39,
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/BTN Back.png',
                                  //width: AppDimensions.height10(context) * 2.6,
                                  //height: AppDimensions.height10(context) * 2.6,
                                  color: const Color(0xff5B74A6),
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
                                  width: AppDimensions.height10(context) * 0.1,
                                  color: const Color(0xff5B74A6)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: AppDimensions.height10(context) * 20.6,
                            height: AppDimensions.height10(context) * 1.9,
                            child: Text(
                              'Membership subscription',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0XFF5B74A6)),
                            ),
                          ),
                          SizedBox(
                              width: AppDimensions.height10(context) * 2.4,
                              height: AppDimensions.height10(context) * 1.39,
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/BTN Back.png',
                                  //width: AppDimensions.height10(context) * 2.6,
                                  //height: AppDimensions.height10(context) * 2.6,
                                  color: const Color(0xff5B74A6),
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
                                  width: AppDimensions.height10(context) * 0.1,
                                  color: const Color(0xff5B74A6)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              community_sheet(context);
                            },
                            child: SizedBox(
                              width: AppDimensions.height10(context) * 20.6,
                              height: AppDimensions.height10(context) * 1.9,
                              child: Text(
                                'Community (coming soon)',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0XFF5B74A6)),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: AppDimensions.height10(context) * 2.4,
                              height: AppDimensions.height10(context) * 1.39,
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/BTN Back.png',
                                  //width: AppDimensions.height10(context) * 2.6,
                                  //height: AppDimensions.height10(context) * 2.6,
                                  color: const Color(0xff5B74A6),
                                  fit: BoxFit.cover,
                                ),
                              ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
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
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0XFF5B74A6)),
                              ),
                            ),
                            SizedBox(
                                width: AppDimensions.height10(context) * 2.4,
                                height: AppDimensions.height10(context) * 1.39,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/BTN Back.png',
                                    //width: AppDimensions.height10(context) * 2.6,
                                    //height: AppDimensions.height10(context) * 2.6,
                                    color: const Color(0xff5B74A6),
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
                height: AppDimensions.height10(context) * 86.4,
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
                              fontSize: AppDimensions.height10(context) * 2.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFFFBFBFB)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 37.4,
                      height: AppDimensions.height10(context) * 83.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OnBoarding()));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J1 Onboarding',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) => const practiceMenu(
                                            goal_eval: true,
                                          )));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J2 Record practice session',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const veiw_all_goals_menu()));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J3 Your goals',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const hurdles_splash()));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J4 Record hurdle ',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const inspiration_motivation(
                                            goal_delete: false,
                                          )));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J5 Record inspiration  ',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const goal_menu_inactive(
                                            premium: true,
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
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J6 Goal evaluation',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const your_why(evaluation: true)));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J7 Practice evaluation',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J8 Community',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) => const timeline()));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J9 Timeline',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const congratulations()));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J10 Goal achieved',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) => message_center()));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J11 Alerts',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) => Settings()));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J12 Menu & Settings',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const view_goals(missed: false)));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 33.4,
                              height: AppDimensions.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J13 Dashboard behaviour',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xff5B74A6),
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
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xff5B74A6)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 20.6,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    'J14 Helpful tips',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B74A6)),
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
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        color: const Color(0xff5B74A6),
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
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xff5B74A6)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    community_sheet(context);
                                  },
                                  child: SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 20.6,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'J15 Subscription ',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
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
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 33.4,
                            height: AppDimensions.height10(context) * 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 20.6,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    'J16 Offline mode',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B74A6)),
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
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
