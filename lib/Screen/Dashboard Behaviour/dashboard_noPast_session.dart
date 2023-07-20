import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_no_planned_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_record_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/goal_menu_missed_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/loaders/dashboard_behaviour_shimmer.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/menu_dashboard_behaviour.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/mult_circles.dart';
import '../../Widgets/bottom_navigation.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import 'calender_bottom_sheet.dart';

class no_past_session extends StatefulWidget {
  final bool missed;
  const no_past_session({super.key, required this.missed});

  @override
  State<no_past_session> createState() => _no_past_sessionState();
}

class _no_past_sessionState extends State<no_past_session> {
  var allGoals;
  var allPractice;
  bool goals_empty = false;

  bool Loader = true;

  String previousDayName =
      DateFormat('EEEE').format(DateTime.now().subtract(Duration(days: 1)));
  @override
  void initState() {
    super.initState();
    fetchGoalsByDay();
  }

  void fetchGoalsByDay() {
    AdminGoal.getUserGoalByDay(previousDayName).then((response) {
      if (response != "") {
        print(response);
        setState(() {
          goals_empty = true;
          allGoals = response;
        });
        loadData();
      }
      print('______________________________-----------------------');
      print(allGoals.length);
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          FadePageRoute(page: view_goals(missed: false)));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.32),
                      child: Image.asset(
                        'assets/images/Asset 10 2.webp',
                        height: AppDimensions.height10(context) * 4.0,
                        width: AppDimensions.height10(context) * 3.977,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          FadePageRoute(
                              page: record_session(
                            past_session: true,
                          )));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.7),
                      child: Image.asset(
                        'assets/images/Add goal.webp',
                        height: AppDimensions.height10(context) * 2.0,
                        width: AppDimensions.height10(context) * 2.1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return CalendarBottomSheet();
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.32),
                      child: Image.asset(
                        'assets/images/calendar_month_black_24dp 1.webp',
                        height: AppDimensions.height10(context) * 2.4,
                        width: AppDimensions.height10(context) * 2.4,
                      ),
                    ),
                  ),
                ],
              )
            ]),
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: const Navigation_Bar(
          bg_colored: true,
          membership: true,
          cancel: false,
          trial: false,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Mask Group.webp'),
                colorFilter: ColorFilter.mode(
                    goals_empty == false
                        ? Color.fromRGBO(0, 0, 0, 0.2)
                        : Colors.transparent,
                    BlendMode.darken),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            child: Loader == false
                ? goals_empty == false
                    ? SizedBox(
                        width: double.infinity,
                        height: AppDimensions.height10(context) * 19.2,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(children: [
                              SizedBox(
                                height: AppDimensions.height10(context) * 19.2,
                                width: AppDimensions.height10(context) * 45.7,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                7.9,
                                        width: AppDimensions.height10(context) *
                                            7.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                8.4),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3, color: Colors.white),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xffF5F1E0),
                                                Color(0xffEDDC97)
                                              ]),
                                        ),
                                        child: Container(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'MON',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.2,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff5B74A6)),
                                            ),
                                            Text(
                                              '02.06',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff5B74A6)),
                                            ),
                                            Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  2.5,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  2.5,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xff156F6D)),
                                              child: Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      1.7,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.5,

                                                  // margin: const EdgeInsets.only(left: 1),
                                                  child: Center(
                                                    child: Text(
                                                      '3/3',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.white),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        )),
                                      ),
                                      Container(
                                        width: AppDimensions.height10(context) *
                                            8.3,
                                        height:
                                            AppDimensions.height10(context) *
                                                8.3,
                                        margin: const EdgeInsets.only(
                                            right: 121, left: 121),
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 1, color: Colors.white),
                                            color: Colors.transparent),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: const view_goals(
                                                        missed: false)));
                                          },
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                7.9,
                                            width: AppDimensions.height10(
                                                    context) *
                                                7.9,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 3,
                                                    color: Colors.white),
                                                gradient: const LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xffCCCCCA),
                                                      Color(0xff5E5D5C)
                                                    ])),
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const Alignment(0, 0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'TUE',
                                                          style: TextStyle(
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  0.12,
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: const Color(
                                                                  0xFFFBFBFB)),
                                                        ),
                                                        Text(
                                                          '02.07',
                                                          style: TextStyle(
                                                              height:
                                                                  AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      0.12,
                                                              color: const Color(
                                                                  0xFFFBFBFB),
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.4,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Container(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.5,
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.5,
                                                            margin: EdgeInsets.only(
                                                                top: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.3),
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: DottedBorder(
                                                              borderType:
                                                                  BorderType
                                                                      .Circle,
                                                              color:
                                                                  Colors.white,
                                                              child: Center(
                                                                child: Text(
                                                                  '0/0',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AppDimensions.height10(context) *
                                                                              1.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page: no_planned_session(
                                                      missed: widget.missed)));
                                        },
                                        child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                7.9,
                                            width: AppDimensions.height10(
                                                    context) *
                                                7.9,
                                            margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  8.4,
                                            ),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      0.3,
                                                  color: Colors.white),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xffF5F1E0),
                                                    Color(0xffEDDC97)
                                                  ]),
                                            ),
                                            child: Container(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'MON',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.2,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff5B74A6)),
                                                ),
                                                Text(
                                                  '03.07',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.4,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff5B74A6)),
                                                ),
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.5,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      2.5,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              0xff156F6D)),
                                                  child: Container(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.7,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.5,

                                                      // margin: const EdgeInsets.only(left: 1),
                                                      child: Center(
                                                        child: Text(
                                                          '0/2',
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )),
                                                )
                                              ],
                                            ))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 34.3,
                                height: AppDimensions.height10(context) * 4.9,
                                margin: EdgeInsets.only(
                                    top:
                                        AppDimensions.height10(context) * 18.9),
                                child: Center(
                                  child: Text(
                                    'No sessions',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                3.0,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Laila'),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 26.9,
                                height: AppDimensions.height10(context) * 5.8,
                                child: Center(
                                  child: Text(
                                    'There are no recorded\npractices for this date.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Laila',
                                        height:
                                            AppDimensions.height10(context) *
                                                0.15,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 1.4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const record_session(
                                        past_session: true,
                                      )));
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 10.1,
                                  height:
                                      AppDimensions.height10(context) * 10.1,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.3,
                                          color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.5,
                                          width:
                                              AppDimensions.height10(context) *
                                                  3.5,
                                          padding: EdgeInsets.all(
                                              AppDimensions.height10(context) *
                                                  0.6),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white),
                                              color: Colors.transparent),
                                          child: Image.asset(
                                            'assets/images/Add goal.webp',
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.9,
                                            width: AppDimensions.height10(
                                                    context) *
                                                2.9,
                                          )),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Add\npractice',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'laila',
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.4,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ])))
                    : SizedBox(
                        width: double.infinity,
                        height: AppDimensions.height10(context) * 19.2,
                        child: Stack(children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: AppDimensions.height10(context) * 19.2,
                              width: AppDimensions.height10(context) * 45.7,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const Alignment(-1, 1),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: no_past_session(
                                              missed: widget.missed,
                                            )));
                                      },
                                      child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                7.9,
                                        width: AppDimensions.height10(context) *
                                            7.9,
                                        //margin: const EdgeInsets.only(top: 84),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3, color: Colors.white),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xffF5F1E0),
                                                Color(0xffEDDC97)
                                              ]),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,

                                                  // color: Colors.blue,
                                                  child: Text(
                                                    'MON',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.2,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xff5B74A6)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  //width: AppDimensions.height10(context) * 4.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  // color: Colors.amber,
                                                  child: Text(
                                                    '02.06',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xff5B74A6),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.4),
                                                  ),
                                                ),
                                                Container(
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.7,
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.7,
                                                    //  margin: const EdgeInsets.only(top: 3.32),
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Color(
                                                                0xff156F6D)),
                                                    child: const Center(
                                                      child: Text(
                                                        '0/0',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0, 0),
                                    child: SizedBox(
                                      height: AppDimensions.height10(context) *
                                          19.2,
                                      width: AppDimensions.height10(context) *
                                          18.8,
                                      // margin: EdgeInsets.only(left: 55.5, right: 55.5),
                                      child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                13.81,
                                        width: AppDimensions.height10(context) *
                                            13.265,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Asset 10 2.webp'),
                                                fit: BoxFit.cover)),
                                        child: Stack(children: [
                                          Align(
                                            alignment:
                                                const Alignment(0.185, 0.215),
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xfff1e39a),
                                                        Color(0xffEEDD96)
                                                      ])),
                                            ),
                                          ),
                                          Align(
                                            alignment: const Alignment(0, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'TUE',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.2,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xff5B74A6)),
                                                ),
                                                Text(
                                                  '02.07',
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff5B74A6),
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.4,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Container(
                                                    height: AppDimensions
                                                            .height10(context) *
                                                        2.5,
                                                    width: AppDimensions
                                                            .height10(context) *
                                                        2.5,
                                                    // margin: const EdgeInsets.only(top: 2),
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.white),
                                                    child: const Center(
                                                      child: Text(
                                                        '0/2',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff5B74A6)),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ),
                                      //color: Colors.blue,
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(1, 1),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: no_planned_session(
                                              missed: widget.missed,
                                            )));
                                      },
                                      child: Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  7.9,
                                          width:
                                              AppDimensions.height10(context) *
                                                  7.9,
                                          // margin: const EdgeInsets.only(
                                          //   top: 84,
                                          // ),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 3,
                                                  color: Colors.white),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xffFBF9EF),
                                                    Color(0xffF8F3DA)
                                                  ])),
                                          // ignore: avoid_unnecessary_containers
                                          child: Container(
                                              //margin: const EdgeInsets.only(top: 11.52),
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'MON',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.2,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xff5B74A6)),
                                              ),
                                              Text(
                                                '03.07',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff5B74A6)),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.7,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.7,
                                                //margin: const EdgeInsets.only(top: 3.32),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Color(0xFFFBFBFB)),
                                                ),
                                                child: SizedBox(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.7,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.5,
                                                    // margin:
                                                    //     const EdgeInsets.only(top: 3.32),
                                                    // margin: const EdgeInsets.only(left: 1),
                                                    child: const Center(
                                                      child: Text(
                                                        '0/2',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff5B74A6)),
                                                      ),
                                                    )),
                                              )
                                            ],
                                          ))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 66.2,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 23.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  // Container(
                                  //   width: AppDimensions.height10(context) * 35.6,
                                  //   height: AppDimensions.height10(context) * 4.2,
                                  //   margin: EdgeInsets.only(
                                  //       left: AppDimensions.height10(context) * 2.4,
                                  //       right: AppDimensions.height10(context) * 3.4,
                                  //       top: AppDimensions.height10(context) * 1.1),
                                  //   child: Column(children: [
                                  //     Container(
                                  //       alignment: Alignment.centerLeft,
                                  //       child: Text(
                                  //         '8:00',
                                  //         style: TextStyle(
                                  //           fontSize:
                                  //               AppDimensions.height10(context) * 1.8,
                                  //           fontWeight: FontWeight.w600,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Divider(
                                  //       height: AppDimensions.height10(context) * 0.2,
                                  //       color: Colors.white,
                                  //     ),
                                  //     Container(
                                  //       alignment: Alignment.centerLeft,
                                  //       child: Text(
                                  //         'AM',
                                  //         style: TextStyle(
                                  //           fontSize:
                                  //               AppDimensions.height10(context) * 1.0,
                                  //           fontWeight: FontWeight.w500,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     )
                                  //   ]),
                                  // ),

                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: allGoals.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: ((context, index) {
                                        // setState(() {
                                        //   allPractice =
                                        //       allGoals[index]['userPractices'];
                                        // });
                                        // print('---------------------------');
                                        // print(allPractice);
                                        return Column(
                                          children: [
                                            Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  35.6,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.2,
                                              margin: EdgeInsets.only(
                                                  left: AppDimensions.height10(
                                                          context) *
                                                      2.4,
                                                  right: AppDimensions.height10(
                                                          context) *
                                                      3.4,
                                                  top: AppDimensions.height10(
                                                          context) *
                                                      1.1),
                                              child: Column(children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    '8:00',
                                                    style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.8,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.2,
                                                  color: Colors.white,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'AM',
                                                    style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                              ]),
                                            ),
                                            ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: allGoals[index]
                                                        ['userPractices']
                                                    .length,
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                itemBuilder:
                                                    ((context, index1) {
                                                  return Column(
                                                    children: [
                                                      AnimatedScaleButton(
                                                        onTap: () {
                                                          if (widget.missed ==
                                                              true) {
                                                            Navigator.push(
                                                                context,
                                                                FadePageRoute(
                                                                    page:
                                                                        missed_Menu(
                                                                  goalColor: allGoals[
                                                                          index]
                                                                      ['color'],
                                                                  goalName: allGoals[
                                                                          index]
                                                                      ['name'],
                                                                  pracColor: allGoals[index]
                                                                              [
                                                                              'userPractices']
                                                                          [
                                                                          index1]
                                                                      ['color'],
                                                                  pracName: allGoals[
                                                                              index]
                                                                          [
                                                                          'userPractices']
                                                                      [
                                                                      index1]['name'],
                                                                )));
                                                          } else {
                                                            Navigator.push(
                                                                context,
                                                                FadePageRoute(
                                                                    page:
                                                                        menu_behaviour(
                                                                  goalColor: allGoals[
                                                                          index]
                                                                      ['color'],
                                                                  goalName: allGoals[
                                                                          index]
                                                                      ['name'],
                                                                  pracColor: allGoals[index]
                                                                              [
                                                                              'userPractices']
                                                                          [
                                                                          index1]
                                                                      ['color'],
                                                                  pracName: allGoals[
                                                                              index]
                                                                          [
                                                                          'userPractices']
                                                                      [
                                                                      index1]['name'],
                                                                )));
                                                          }
                                                        },
                                                        child: Center(
                                                            child:
                                                                align_circles(
                                                          asset_1: allGoals[
                                                                          index]
                                                                      [
                                                                      'color'] ==
                                                                  '1'
                                                              ? "assets/images/red_gradient.webp"
                                                              : allGoals[index][
                                                                          'color'] ==
                                                                      '2'
                                                                  ? 'assets/images/orange_moon.webp'
                                                                  : allGoals[index]
                                                                              [
                                                                              'color'] ==
                                                                          '3'
                                                                      ? "assets/images/lightGrey_gradient.webp"
                                                                      : allGoals[index]['color'] ==
                                                                              '4'
                                                                          ? "assets/images/lightBlue_gradient.webp"
                                                                          : allGoals[index]['color'] == '5'
                                                                              ? "assets/images/medBlue_gradient.webp"
                                                                              : allGoals[index]['color'] == '6'
                                                                                  ? "assets/images/Blue_gradient.webp"
                                                                                  : 'assets/images/orange_moon.webp',
                                                          s_circle_text: allGoals[
                                                                      index][
                                                                  'userPractices']
                                                              [index1]['name'],
                                                          asset_2: widget.missed
                                                              ? allGoals[index]['userPractices']
                                                                              [index1]
                                                                          [
                                                                          'color'] ==
                                                                      '1'
                                                                  ? 'assets/images/Missed_3.webp'
                                                                  : allGoals[index]['userPractices'][index1]['color'] ==
                                                                          '2'
                                                                      ? 'assets/images/Missed_1.webp'
                                                                      : allGoals[index]['userPractices'][index1]['color'] ==
                                                                              '3'
                                                                          ? "assets/images/Missed_2.webp"
                                                                          : allGoals[index]['userPractices'][index1]['color'] ==
                                                                                  '4'
                                                                              ? "assets/images/Missed_4.webp"
                                                                              : allGoals[index]['userPractices'][index1]['color'] ==
                                                                                      '5'
                                                                                  ? "assets/images/Missed_4.webp"
                                                                                  : 'assets/images/Missed_1.webp'
                                                              : allGoals[index]['userPractices']
                                                                              [index1]
                                                                          ['color'] ==
                                                                      '1'
                                                                  ? "assets/images/Practice_Completed_1.webp"
                                                                  : allGoals[index]['userPractices'][index1]['color'] == '2'
                                                                      ? 'assets/images/Practice_Completed_2.webp'
                                                                      : allGoals[index]['userPractices'][index1]['color'] == '3'
                                                                          ? "assets/images/Practice_Completed_3.webp"
                                                                          : allGoals[index]['userPractices'][index1]['color'] == '4'
                                                                              ? "assets/images/Practice_Completed_4.webp"
                                                                              : allGoals[index]['userPractices'][index1]['color'] == '5'
                                                                                  ? "assets/images/Practice_Completed_4.webp"
                                                                                  : 'assets/images/Practice_Completed_1.webp',
                                                          head_text:
                                                              allGoals[index]
                                                                  ['name'],
                                                          body_text: allGoals[
                                                                      index][
                                                                  'identityStatement']
                                                              [0]['text'],
                                                          body_text_color:
                                                              0xff5B74A6,
                                                          head_text_color:
                                                              0xff5B74A6,
                                                          body_text_size:
                                                              AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.6,
                                                          head_text_size:
                                                              AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  2.0,
                                                          enable_icon:
                                                              widget.missed
                                                                  ? false
                                                                  : true,
                                                          is_right: false,
                                                          s_circle_text_col:
                                                              0xffFD6727,
                                                        )),
                                                      ),
                                                      SizedBox(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            3.0,
                                                      )
                                                    ],
                                                  );
                                                }))
                                          ],
                                        );
                                      })),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     if (widget.missed == true) {
                                  //       Navigator.push(context,
                                  //           FadePageRoute(page: const missed_Menu()));
                                  //     } else {
                                  //       Navigator.push(
                                  //           context,
                                  //           FadePageRoute(
                                  //               page: const menu_behaviour()));
                                  //     }
                                  //   },
                                  //   child: Center(
                                  //       child: align_circles(
                                  //     asset_1: 'assets/images/orange_moon.webp',
                                  //     s_circle_text: 'Count\ntemper\nepisodes',
                                  //     asset_2: widget.missed
                                  //         ? 'assets/images/Med Habit Practice (1).webp'
                                  //         : 'assets/images/Ellipse pearl_1.webp',
                                  //     head_text: 'Control my anger',
                                  //     body_text:
                                  //         '“I am someone who is in\n control of my anger”',
                                  //     body_text_color: 0xff5B74A6,
                                  //     head_text_color: 0xff5B74A6,
                                  //     body_text_size:
                                  //         AppDimensions.height10(context) * 1.6,
                                  //     head_text_size:
                                  //         AppDimensions.height10(context) * 2.0,
                                  //     enable_icon: widget.missed ? false : true,
                                  //     is_right: false,
                                  //     s_circle_text_col: 0xffFD6727,
                                  //   )),
                                  // ),
                                  // Container(
                                  //   width: AppDimensions.height10(context) * 35.6,
                                  //   height: AppDimensions.height10(context) * 4.2,
                                  //   margin: EdgeInsets.only(
                                  //       left: AppDimensions.height10(context) * 2.4,
                                  //       right: AppDimensions.height10(context) * 3.4,
                                  //       top: AppDimensions.height10(context) * 1.1),
                                  //   child: Column(children: [
                                  //     Container(
                                  //       alignment: Alignment.centerLeft,
                                  //       child: Text(
                                  //         '11:00',
                                  //         style: TextStyle(
                                  //           fontSize:
                                  //               AppDimensions.height10(context) * 1.8,
                                  //           fontWeight: FontWeight.w600,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Divider(
                                  //       height: AppDimensions.height10(context) * 0.2,
                                  //       color: Colors.white,
                                  //     ),
                                  //     Container(
                                  //       alignment: Alignment.centerLeft,
                                  //       child: Text(
                                  //         'AM',
                                  //         style: TextStyle(
                                  //           fontSize:
                                  //               AppDimensions.height10(context) * 1.0,
                                  //           fontWeight: FontWeight.w500,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     )
                                  //   ]),
                                  // ),
                                  // Center(
                                  //     child: align_circles(
                                  //   asset_1: 'assets/images/orange_moon.webp',
                                  //   s_circle_text: 'Count\ndown',
                                  //   asset_2: 'assets/images/Ellipse purple.webp',
                                  //   head_text: 'Control my anger',
                                  //   body_text:
                                  //       '“I am someone who is in\n control of my anger”',
                                  //   body_text_color: 0xff5B74A6,
                                  //   head_text_color: 0xff5B74A6,
                                  //   body_text_size:
                                  //       AppDimensions.height10(context) * 1.6,
                                  //   head_text_size:
                                  //       AppDimensions.height10(context) * 2.0,
                                  //   enable_icon: false,
                                  //   is_right: true,
                                  //   s_circle_text_col: 0xffffffff,
                                  // )),
                                  // Center(
                                  //     child: align_circles(
                                  //   asset_1: 'assets/images/blue_sun.webp',
                                  //   s_circle_text: 'Meditation',
                                  //   asset_2: 'assets/images/Ellipse 158.webp',
                                  //   head_text: 'Control my anger',
                                  //   body_text:
                                  //       '“I am someone who is in\n control of my anger”',
                                  //   body_text_color: 0xff5B74A6,
                                  //   head_text_color: 0xff5B74A6,
                                  //   body_text_size:
                                  //       AppDimensions.height10(context) * 1.6,
                                  //   head_text_size:
                                  //       AppDimensions.height10(context) * 2.0,
                                  //   enable_icon: false,
                                  //   is_right: false,
                                  //   s_circle_text_col: 0xffFFFFFF,
                                  // )),
                                  // Container(
                                  //   width: AppDimensions.height10(context) * 35.6,
                                  //   height: AppDimensions.height10(context) * 4.2,
                                  //   margin: EdgeInsets.only(
                                  //       left: AppDimensions.height10(context) * 2.4,
                                  //       right: AppDimensions.height10(context) * 3.4,
                                  //       top: AppDimensions.height10(context) * 1.1),
                                  //   child: Column(children: [
                                  //     Container(
                                  //       alignment: Alignment.centerLeft,
                                  //       child: Text(
                                  //         '1:00',
                                  //         style: TextStyle(
                                  //           fontSize:
                                  //               AppDimensions.height10(context) * 1.8,
                                  //           fontWeight: FontWeight.w600,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Divider(
                                  //       height: AppDimensions.height10(context) * 0.2,
                                  //       color: Colors.white,
                                  //     ),
                                  //     Container(
                                  //       alignment: Alignment.centerLeft,
                                  //       child: Text(
                                  //         'PM',
                                  //         style: TextStyle(
                                  //           fontSize:
                                  //               AppDimensions.height10(context) * 1.0,
                                  //           fontWeight: FontWeight.w500,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     )
                                  //   ]),
                                  // ),
                                  // Center(
                                  //     child: align_circles(
                                  //   asset_1: 'assets/images/orange_moon.webp',
                                  //   s_circle_text: 'Meditation',
                                  //   asset_2: 'assets/images/Ellipse 158.webp',
                                  //   head_text: 'Control my anger',
                                  //   body_text:
                                  //       '“I am someone who is in\n control of my anger”',
                                  //   body_text_color: 0xff5B74A6,
                                  //   head_text_color: 0xff5B74A6,
                                  //   body_text_size:
                                  //       AppDimensions.height10(context) * 1.6,
                                  //   head_text_size:
                                  //       AppDimensions.height10(context) * 2.0,
                                  //   enable_icon: false,
                                  //   is_right: false,
                                  //   s_circle_text_col: 0xffFFFFFF,
                                  // )),
                                  // Container(
                                  //   width: AppDimensions.height10(context) * 35.6,
                                  //   height: AppDimensions.height10(context) * 4.2,
                                  //   margin: const EdgeInsets.only(
                                  //       left: 24, right: 34, top: 11),
                                  //   child: Column(children: [
                                  //     Container(
                                  //       alignment: Alignment.centerLeft,
                                  //       child: Text(
                                  //         '6:00',
                                  //         style: TextStyle(
                                  //           fontSize:
                                  //               AppDimensions.height10(context) * 1.8,
                                  //           fontWeight: FontWeight.w600,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Divider(
                                  //       height: AppDimensions.height10(context) * 0.2,
                                  //       color: Colors.white,
                                  //     ),
                                  //     Container(
                                  //       alignment: Alignment.centerLeft,
                                  //       child: Text(
                                  //         'PM',
                                  //         style: TextStyle(
                                  //           fontSize:
                                  //               AppDimensions.height10(context) * 1.0,
                                  //           fontWeight: FontWeight.w500,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     )
                                  //   ]),
                                  // ),
                                  // Center(
                                  //     child: align_circles(
                                  //   asset_1: 'assets/images/blue_sun.webp',
                                  //   s_circle_text:
                                  //       'Long Practice\nname needs to\ntruncate...',
                                  //   asset_2: 'assets/images/Ellipse blue.webp',
                                  //   head_text:
                                  //       'Long Goal name needs to\ntruncate after 2 lines...',
                                  //   body_text:
                                  //       'Long statement needs to\ntruncate after 2 lines...',
                                  //   body_text_color: 0xff5B74A6,
                                  //   head_text_color: 0xff5B74A6,
                                  //   body_text_size:
                                  //       AppDimensions.height10(context) * 1.6,
                                  //   head_text_size:
                                  //       AppDimensions.height10(context) * 1.6,
                                  //   enable_icon: false,
                                  //   is_right: true,
                                  //   s_circle_text_col: 0xffFFFFFF,
                                  // )),
                                  // Center(
                                  //     child: align_circles(
                                  //   asset_1: 'assets/images/blue_sun.webp',
                                  //   s_circle_text: 'Talk to\nstrangers',
                                  //   asset_2: 'assets/images/Ellipse light-blue.webp',
                                  //   head_text: 'Be more confident:',
                                  //   body_text:
                                  //       'I am someone who is\nconfident in my abilities.',
                                  //   body_text_color: 0xff5B74A6,
                                  //   head_text_color: 0xff5B74A6,
                                  //   body_text_size:
                                  //       AppDimensions.height10(context) * 1.6,
                                  //   head_text_size:
                                  //       AppDimensions.height10(context) * 2.0,
                                  //   enable_icon: false,
                                  //   is_right: true,
                                  //   s_circle_text_col: 0xffFFFFFF,
                                  // )),
                                  // Container(
                                  //   margin: EdgeInsets.only(
                                  //       top: AppDimensions.height10(context) * 10.8,
                                  //       bottom: AppDimensions.height10(context) * 14.7),
                                  //   height: AppDimensions.height10(context) * 14.1,
                                  //   width: AppDimensions.height10(context) * 25.1,
                                  //   child: Column(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     crossAxisAlignment: CrossAxisAlignment.center,
                                  //     children: [
                                  //       Text(
                                  //         'No more scheduled sessions\nScroll to the next day',
                                  //         style: TextStyle(
                                  //             fontSize:
                                  //                 AppDimensions.height10(context) * 1.8,
                                  //             fontWeight: FontWeight.w700,
                                  //             color: Colors.white),
                                  //         textAlign: TextAlign.center,
                                  //       ),
                                  //       Container(
                                  //         margin: EdgeInsets.only(
                                  //             top: AppDimensions.height10(context) *
                                  //                 1.7),
                                  //         width: AppDimensions.height10(context) * 4.3,
                                  //         height: AppDimensions.height10(context) * 2.1,
                                  //         child: const ImageIcon(
                                  //           AssetImage('assets/images/Arrow.webp'),
                                  //           color: Colors.white,
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: AppDimensions.height10(context) * 64.0,
                              left: AppDimensions.height10(context) * 1.3,
                              child: Container(
                                width: AppDimensions.height10(context) * 4.5,
                                height: AppDimensions.height10(context) * 4.5,
                                padding: EdgeInsets.all(
                                    AppDimensions.height10(context) * 0.4),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Container(
                                  width: AppDimensions.height10(context) * 4.16,
                                  height:
                                      AppDimensions.height10(context) * 4.16,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Smart Object_1.webp'))),
                                  child: Align(
                                    alignment: const Alignment(0, 2.8),
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 2.1,
                                      height:
                                          AppDimensions.height10(context) * 2.1,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          allGoals.length.toString(),
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.2,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFFFA9934)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          widget.missed
                              ? Positioned(
                                  top: AppDimensions.height10(context) * 56.8,
                                  left: AppDimensions.height10(context) * 2.5,
                                  child: Container(
                                    width: AppDimensions.height10(context) *
                                        38.259,
                                    height:
                                        AppDimensions.height10(context) * 9.707,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            12.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFFD4B7B9),
                                              Color(0xFF91698C)
                                            ])),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.261),
                                          width:
                                              AppDimensions.height10(context) *
                                                  4.437,
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.437,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/circle_tick.webp'))),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  16.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.6,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.232),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                //  / width: AppDimensions.height10(context) * 4.6,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    1.4,
                                                //   color: Colors.amber,
                                                child: Text(
                                                  'Session missed',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.3,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFFFFFFFF)),
                                                ),
                                              ),
                                              SizedBox(
                                                //width: AppDimensions.height10(context) * 6.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.2,
                                                child: Text(
                                                  'Count temper ep...',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFFFFFFFF)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.1,
                                          height:
                                              AppDimensions.height10(context) *
                                                  6.0,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  5.1),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xFFFFFFFF),
                                                width: 1),
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10(
                                                        context) *
                                                    2.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Veiw',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                        ]))
                : DashBoardBehaviour_shimmer()));
  }
}
