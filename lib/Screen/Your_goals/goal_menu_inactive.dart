import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/new_progress_score.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReview.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive_5goals.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../utils/app_dimensions.dart';
import '../Recording Practice Session/recordPracticeMenu.dart';

class goal_menu_inactive extends StatefulWidget {
  final bool isActive;
  final bool goal_evaluation;
  final bool premium;
  const goal_menu_inactive({
    super.key,
    required this.isActive,
    required this.goal_evaluation,
    required this.premium,
  });

  @override
  State<goal_menu_inactive> createState() => _goal_menu_inactiveState();
}

class _goal_menu_inactiveState extends State<goal_menu_inactive> {
  bool Loader = true;
  var goalDetails;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void _fetchGoalDetails() {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          goalDetails = response;
        });
        loadData();
        print(response);
      } else {
        loadData();
      }
    }).catchError((error) {
      // loadData();
      print("error");
    }).whenComplete(() {
      loadData();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchGoalDetails();
  }

  @override
  int goal_level = 2;
  Widget build(BuildContext context) {
    //bool premium = false;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
                  )),
            ),
          ]),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/prac_assesment.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Loader == false
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      // color: Colors.amber,
                      //width: AppDimensions.height10(context) * 17.1,
                      height: AppDimensions.height10(context) * 2.2,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 5.2,
                        // left: AppDimensions.height10(context) * 12.2,
                        // right: AppDimensions.height10(context) * 12.1
                      ),
                      child: Center(
                        child: Text(
                          'Goal Menu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.8,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffffffff)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 30.1,
                      height: AppDimensions.height10(context) * 2.4,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 0.5,
                          left: AppDimensions.height10(context) * 12.2,
                          right: AppDimensions.height10(context) * 12.1),
                      child: Text(
                        goalDetails['name'],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffffffff)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.premium
                            ? Navigator.push(
                                context,
                                FadePageRoute(
                                    page: (const goal_menu_inactive(
                                  premium: false,
                                  isActive: true,
                                  goal_evaluation: true,
                                ))))
                            : Navigator.push(
                                context,
                                FadePageRoute(
                                    page: (const goal_menu_inactive(
                                  premium: true,
                                  isActive: true,
                                  goal_evaluation: true,
                                ))));
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 6.56,
                        height: AppDimensions.height10(context) * 6.56,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.03),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                goalDetails['color'] == '1'
                                    ? "assets/images/red_gradient.webp"
                                    : goalDetails['color'] == '2'
                                        ? 'assets/images/orange_moon.webp'
                                        : goalDetails['color'] == '3'
                                            ? "assets/images/lightGrey_gradient.webp"
                                            : goalDetails['color'] == '4'
                                                ? "assets/images/lightBlue_gradient.webp"
                                                : goalDetails['color'] == '5'
                                                    ? "assets/images/medBlue_gradient.webp"
                                                    : goalDetails['color'] ==
                                                            '6'
                                                        ? "assets/images/Blue_gradient.webp"
                                                        : 'assets/images/orange_moon.webp',
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 37.4,
                      height: AppDimensions.height10(context) * 14.7,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 4.81),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: const Color(0xFFF5F5F5)),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (goal_level == 0) {
                                setState(() {
                                  goal_level = 2;
                                });
                              } else if (goal_level == 2) {
                                setState(() {
                                  goal_level = 0;
                                });
                              }
                              print(goal_level);
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 37.4,
                              height: AppDimensions.height10(context) * 12.0,
                              decoration: widget.premium
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Rectangle 192.webp'),
                                        fit: BoxFit.cover,
                                      ))
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0),
                                      gradient: LinearGradient(colors: [
                                        const Color(0xFFFF7975)
                                            .withOpacity(0.8),
                                        const Color(0xFFF9DCC0).withOpacity(0)
                                      ])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page:
                                                  const new_progress_score()));
                                    },
                                    child: Container(
                                      width: goal_level == 2
                                          ? AppDimensions.height10(context) *
                                              10.135
                                          : AppDimensions.height10(context) *
                                              10.1,
                                      height: goal_level == 2
                                          ? AppDimensions.height10(context) *
                                              10.135
                                          : AppDimensions.height10(context) *
                                              10.1,
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  0.6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(goal_level == 2
                                              ? 'assets/images/Nebula pie 2.webp'
                                              : goal_level == 3
                                                  ? 'assets/images/Nebula pie 3.webp'
                                                  : "assets/images/Nebula Pie.webp"),
                                        ),
                                        // color: Colors.amber,
                                      ),
                                      child: Align(
                                        alignment: goal_level != 0
                                            ? const Alignment(0, -0.1)
                                            : const Alignment(0, -0.07),
                                        child: Text(
                                          goalDetails['goalLevel'] == 0
                                              ? '-'
                                              : goalDetails['goalLevel']
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: widget.premium
                                                  ? goal_level == 0
                                                      ? AppDimensions.height10(
                                                              context) *
                                                          2.8
                                                      : AppDimensions.height10(
                                                              context) *
                                                          2.0
                                                  : AppDimensions.height10(
                                                          context) *
                                                      2.8,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF464646)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 20.9,
                                    height:
                                        AppDimensions.height10(context) * 9.1,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            // width: AppDimensions.height10(context) * 16.5,
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.9,

                                            child: Text(
                                              'Goal level evaluation',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w700,
                                                  color: widget.premium
                                                      ? const Color(0xFFFFFFFF)
                                                      : const Color(
                                                          0xFF464646)),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            // width: AppDimensions.height10(context) * 9.5,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.2,

                                            child: Text(
                                              'for 01 FEB 23!',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: widget.premium
                                                      ? const Color(0xFFFFFFFF)
                                                      : const Color(
                                                          0xFF464646)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  20.9,
                                          height:
                                              AppDimensions.height10(context) *
                                                  5,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            widget.premium
                                                ? "I'm making small steps\nforward"
                                                : 'Only available to Premium\nCustomers',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.5,
                                                fontWeight: FontWeight.w400,
                                                color: widget.premium
                                                    ? const Color(0xFFFFFFFF)
                                                    : const Color(0xFF464646)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.31,
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  0.8),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.webp',
                                          color: const Color(0xFFFFFFFF),
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(-0.8, 0.875),
                            child: Container(
                              width: AppDimensions.height10(context) * 18.5,
                              height: AppDimensions.height10(context) * 1.6,
                              child: Row(
                                children: [
                                  Text(
                                    'Next score needed in ',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.3,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff464646)),
                                  ),
                                  Text(
                                    '-00',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.3,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff464646)),
                                  ),
                                  Text(
                                    ' days',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.3,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff464646)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          widget.goal_evaluation
                              ? Container()
                              : Align(
                                  alignment: const Alignment(-0.975, -1.275),
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 11.9,
                                    height:
                                        AppDimensions.height10(context) * 2.9,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0),
                                        color: const Color(0xFFFFFFFF)),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  0.8,
                                          top: AppDimensions.height10(context) *
                                              0.5,
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  0.5),
                                      child: Text(
                                        'Score needed!',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF646464)),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.isActive
                            ? widget.goal_evaluation
                                ? Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const multiple_goal_inactive(
                                            isActive: true)))
                                : Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const goal_inactive(
                                            isActive: true)))
                            : Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const goal_inactive(
                                  isActive: false,
                                )));
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 37.4,
                        height: AppDimensions.height10(context) * 6.0,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.0),
                        padding: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 2.0,
                            right: AppDimensions.height10(context) * 1.9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: const Color(0xFFF5F5F5),
                          border: Border.all(
                              color: const Color(0xFFFFFFFF),
                              width: AppDimensions.height10(context) * 0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'This goal is ',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w500,
                                        color: goalDetails['goalStatus'] ==
                                                "active"
                                            ? const Color(0xFF156F6D)
                                            : const Color(0xFFDE7A11)),
                                  ),
                                  widget.isActive
                                      ? Text(
                                          capitalizeFirstLetter(
                                              goalDetails['goalStatus']),
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.8,
                                              fontWeight: FontWeight.w700,
                                              color: goalDetails[
                                                          'goalStatus'] ==
                                                      "active"
                                                  ? const Color(0xFF156F6D)
                                                  : const Color(0xFFDE7A11)),
                                        )
                                      : Text(
                                          capitalizeFirstLetter(
                                              goalDetails['goalStatus']),
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.8,
                                              fontWeight: FontWeight.w700,
                                              color: goalDetails[
                                                          'goalStatus'] ==
                                                      "active"
                                                  ? const Color(0xFF156F6D)
                                                  : const Color(0xFFDE7A11)),
                                        )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 3.6,
                              height: AppDimensions.height10(context) * 2.2,
                              child: Center(
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF437296),
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: AppDimensions.height10(context) * 0.1,
                      color: const Color(0xFFFFFFFF).withOpacity(0.5),
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.0),
                    ),
                    widget.goal_evaluation
                        ? Container(
                            height: AppDimensions.height10(context) * 18,
                            // width: AppDimensions.height10(context) * 45.4,
                            // margin: EdgeInsets.only(
                            //   top: AppDimensions.height10(context) * 3.0,
                            //   //  left: AppDimensions.height10(context) * 2.6
                            // ),
                            // color: Colors.amber,
                            child: ListView.builder(
                                // shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                itemCount: goalDetails['userPractices'].length,
                                itemBuilder: ((context, index) {
                                  return Container(
                                    width:
                                        AppDimensions.height10(context) * 13.8,
                                    height:
                                        AppDimensions.height10(context) * 13.8,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context)),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(goalDetails['userPractices']
                                                  [index]['color'] ==
                                              '1'
                                          ? "assets/images/Ellipse orange_wb.webp"
                                          : goalDetails['userPractices'][index]
                                                      ['color'] ==
                                                  '2'
                                              ? 'assets/images/Ellipse 158_wb.webp'
                                              : goalDetails['userPractices']
                                                          [index]['color'] ==
                                                      '3'
                                                  ? "assets/images/Ellipse 157_wb.webp"
                                                  : goalDetails['userPractices']
                                                                  [index]
                                                              ['color'] ==
                                                          '4'
                                                      ? "assets/images/Ellipse light-blue_wb.webp"
                                                      : goalDetails['userPractices']
                                                                      [index]
                                                                  ['color'] ==
                                                              '5'
                                                          ? "assets/images/Ellipse blue_wb.webp"
                                                          : 'assets/images/Ellipse 158_wb.webp'),
                                      fit: BoxFit.contain,
                                    )),
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10(context)),
                                      child: Center(
                                        child: Text(
                                          goalDetails['userPractices'][index]
                                              ['name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.8,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          )
                        : GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     FadePageRoute(
                              //         page: const practiceMenu(
                              //       goal_eval: true,
                              //     )));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 13.8,
                              height: AppDimensions.height10(context) * 13.8,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 3.0),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Ellipse 158.webp'),
                                fit: BoxFit.contain,
                              )),
                              child: Center(
                                child: Text(
                                  'Meditation',
                                  style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    Container(
                      width: double.infinity,
                      height: AppDimensions.height10(context) * 0.1,
                      color: const Color(0xFFFFFFFF).withOpacity(0.5),
                      // margin: EdgeInsets.only(
                      //     top: AppDimensions.height10(context) * 2.2),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 36.0,
                      height: AppDimensions.height10(context) * 20.0,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.0,
                        //bottom: AppDimensions.height10(context) * 8.4
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 36.0,
                            height: AppDimensions.height10(context) * 6.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: const Color(0xFFFFFFFF),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: AppDimensions.height10(context) * 18.5,
                                  height: AppDimensions.height10(context) * 2.2,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.99),
                                  child: Text(
                                    'Progress report  (00)',
                                    style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10(context) *
                                            2.391),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.webp',
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              width: AppDimensions.height10(context) * 36.0,
                              height: AppDimensions.height10(context) * 6.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: widget.premium
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFFFFFFFF).withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 19.2,
                                    height:
                                        AppDimensions.height10(context) * 2.2,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            1.99),
                                    child: Text(
                                      widget.premium
                                          ? 'Timeline'
                                          : 'Timeline (Premium only)',
                                      style: TextStyle(
                                        color: const Color(0xff646464),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  2.391),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.webp',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
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
                                  FadePageRoute(page: const StarReview()));
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 36.0,
                              height: AppDimensions.height10(context) * 6.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: const Color(0xFFFFFFFF),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 18.5,
                                    height:
                                        AppDimensions.height10(context) * 2.2,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            1.99),
                                    child: Text(
                                      'Goal details',
                                      style: TextStyle(
                                        color: const Color(0xff646464),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  2.391),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.webp',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
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
                    widget.goal_evaluation
                        ? Container(
                            width: AppDimensions.height10(context) * 17.0,
                            height: AppDimensions.height10(context) * 0.5,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 14.1,
                                bottom: AppDimensions.height10(context) * 1.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color:
                                    const Color(0xFFFFFFFF).withOpacity(0.3)),
                          )
                        : SizedBox(
                            height: AppDimensions.height10(context) * 8.4,
                          ),
                  ],
                ),
              )
            : const Center(
                child: SpinKitFadingCircle(
                  color: Color(0xFFB1B8FF),
                  size: 80,
                ),
              ),
      ),
    );
  }
}
