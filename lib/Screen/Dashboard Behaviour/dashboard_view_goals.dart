// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_noPast_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_no_planned_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_record_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/goal_menu_missed_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/loaders/dashboard_behaviour_shimmer.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/Widgets/redaMessage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/bottom_navigation.dart';
import '../../Widgets/fading.dart';
import '../../Widgets/mult_circles.dart';
import '../../utils/app_dimensions.dart';
import '../capture_inspiration/inpiration_landing.dart';
import 'calender_bottom_sheet.dart';
import 'menu_dashboard_behaviour.dart';

class view_goals extends StatefulWidget {
  final bool missed;
  final bool update;
  final String name;
  final bool helpfulTips;
  final int record;

  const view_goals(
      {super.key,
      required this.missed,
      required this.update,
      required this.name,
      required this.helpfulTips,
      required this.record});

  @override
  State<view_goals> createState() => _view_goalsState();
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class _view_goalsState extends State<view_goals> {
  var allGoals;
  var responseData;
  var allPractice;
  bool noActive = false;
  bool noPlanned = false;
  bool noData = false;
  bool Loader = true;
  bool redaVisble = false;

  bool maxViewDate = false;
  List<Map<String, dynamic>> timesList = [];
  int pastPracCompleted = -1;
  int presentPracCompleted = -1;
  int nextPracCompleted = -1;
  bool contain = false;
  bool single = false;
  int removeDay = 0;
  String RecordDate = '';
  int goal_level = 0;
   ScrollController _scrollController = ScrollController();


  void _incrementValue() {
    setState(() {
      goal_level++;
    });
  }

  bool _showOverlay = false;
  int current = 0;
  int next = -1;
  int past = 1;

  previous() {
    setState(() {
      next++;
      past++;
      current++;
    });
  }

  future() {
    setState(() {
      next--;
      past--;
      current--;
    });
  }

  DateTime currentDate =
      DateTime.parse(DateTime.now().toString().substring(0, 10));

  @override
  void initState() {
    if (widget.record != 0) {
      setState(() {
        current = widget.record;
        past = widget.record + 1;
        next = widget.record - 1;
      });
    }
   


    super.initState();

    // _fetchUserGoal();
    fetchPracticeByDay();
    if (widget.update == true) {
      setState(() {
        contain = true;
      });
      startTimer();
    }
    if (widget.helpfulTips == true) {
      //dashboard_sheet(context);
      setState(() {
        _showOverlay = true;
      });
    }

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.delayed(Duration(milliseconds: 2500), () => _scrollToCurrentIndex());
    // });



   //fetchGoalsByDay();
  }

  



  // void _fetchUserGoal() {
  //   AdminGoal.getUserGoalByUserId().then((response) {
  //     setState(() {
  //       allGoals = response;
  //     });
  //     loadData();
  //     // _newFunction();
  //   });
  // }
  void _scrollToCurrentIndex() {


    _scrollController.animateTo(
   noPlanned?20: noActive?35:  15,
      duration: Duration(microseconds: 10),
      curve: Curves.easeInOut,
    );

  }

  final GlobalKey centerKey = GlobalKey();



  void fetchPracticeByDay() {
    AdminGoal.checkUserActiveGoal().then((response) {
      if (response == 200) {
        PracticeGoalApi.getUserPracticeByDay(getFormattedDate(current))
            .then((response) {
          getSixthday();

          var jsonData = jsonDecode(response.body);

          if (response.statusCode == 200) {
            setState(() {
              allGoals = jsonData['filteredUserPractices'];
              responseData = jsonData;
              pastPracCompleted = jsonData['previousCompletePractice'] -
                  jsonData['previousTotalPractice'];
              presentPracCompleted =
                  jsonData['completePractice'] - jsonData['totalPractice'];
              nextPracCompleted = jsonData['nextCompletePractice'] -
                  jsonData['nextTotalPratice'];
              noActive = false;
              noData = false;
            });

            timesList.clear();

            for (int i = 0; i < allGoals.length; i++) {
              for (int y = 0; y < allGoals[i]['schedule'].length - 1; y++) {
                timesList.add({
                  'time': '${allGoals[i]['schedule']['time${y + 1}']}',
                  'data': allGoals[i],
                  'status': '${allGoals[i]['recordingStatusTime${y + 1}']}'
                });
              }
            }

            int convertToMinutes(String time) {
              int hours = int.parse(time.split(':')[0]);
              int minutes = int.parse(time.split(':')[1].split(' ')[0]);
              if (time.toLowerCase().contains('pm') && hours != 12) {
                hours += 12;
              }
              int totalMinutes = (hours * 60 + minutes) % (24 * 60);
              return totalMinutes < 360
                  ? totalMinutes + (24 * 60 - 360)
                  : totalMinutes - 360;
            }

            // Sort the list based on converted times
            timesList.sort((a, b) {
              int timeA = convertToMinutes(a['time']);
              int timeB = convertToMinutes(b['time']);
              return timeA - timeB;
            });

            loadData();


            if (allGoals.length == 1 && allGoals[0]["schedule"].length == 2) {
              setState(() {
                single = true;
              });
            } else {
              setState(() {
                single = false;
              });
            }
          } else if (response.statusCode == 404) {
            loadData();
            setState(() {
              responseData = jsonData;
              pastPracCompleted = jsonData['previousCompletePractice'] -
                  jsonData['previousTotalPractice'];
              presentPracCompleted =
                  jsonData['completePractice'] - jsonData['totalPractice'];
              nextPracCompleted = jsonData['nextCompletePractice'] -
                  jsonData['nextTotalPratice'];
              noActive = true;
            });
            String date = DateFormat('yyyy-MM-dd')
                .parse(getFormattedDate(current))
                .toString()
                .substring(0, 10);
            DateTime parsedDate = DateTime.parse(date);

            int difference = parsedDate
                .difference(
                    DateTime.parse(currentDate.toString().substring(0, 10)))
                .inDays;
            setState(() {
              RecordDate = parsedDate.toString();
            });

            if (difference.isNegative && difference != 0) {
              setState(() {
                noPlanned = false;
              });
              print('The formatted date is in the past.');
            } else if (difference == 0) {
              setState(() {
                noPlanned = false;
              });
              print('The formatted date is the same as the current date.');
            } else {
              setState(() {
                noPlanned = true;
              });
              print('The formatted date is in the future.');
            }
          }
        });
      } else if (response == 404) {
        setState(() {
          noData = true;
          Loader = false;
        });
      }
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  String getFormattedDate(int removeDay) {
    return DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(Duration(days: removeDay)));
  }

  String getFormattedDay(int removeDay) {
    return DateFormat('EEEE')
        .format(DateTime.now().subtract(Duration(days: removeDay)));
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
    Future.delayed(Duration(milliseconds: 50), () => _scrollToCurrentIndex());
  }

  getSixthday() {
    var currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var providedDate = getFormattedDate(current);

    // Check if the provided date is in the future
    if (DateTime.parse(providedDate).isBefore(DateTime.parse(currentDate))) {
      print('Provided date is in the past.');
    } else {
      var difference = DateTime.parse(providedDate)
          .difference(DateTime.parse(currentDate))
          .inDays;
      if (difference >= 6) {
        maxViewDate = true;
      } else {
        maxViewDate = false;
      }
      print('Provided date is in the future. $difference && $maxViewDate');
    }

    // Calculate the difference in days

    // Check if the difference is exactly six days
  }

  Future<Timer> startTimer() async {
    return Timer(const Duration(seconds: 4), stop);
  }

  void stop() {
    setState(() {
      contain = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        bottom: false,
        top: false,
        maintainBottomViewPadding: true,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                actions: [
                  Row(
                    children: [
                      noActive == true
                          ? AnimatedScaleButton(
                              onTap: () {
                                setState(() {
                                  Loader = true;
                                  current = 0;
                                  // past = past - 1;
                                  // next = next - 1;
                                });

                                fetchPracticeByDay();

                                // Navigator.push(context,
                                //     FadePageRoute(page: view_goals(missed: false)));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right:
                                        AppDimensions.height10(context) * 1.32),
                                child: Image.asset(
                                  'assets/images/Asset 10 2.webp',
                                  height: AppDimensions.width10(context) * 4.0,
                                  width: AppDimensions.width10(context) * 3.977,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      AnimatedScaleButton(
                        onTap: () {
                          if (noData != true) {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const record_session(
                                  past_session: true,
                                )));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 1.7),
                          child: Image.asset(
                            'assets/images/Add goal.webp',
                            height: AppDimensions.width10(context) * 2.4,
                            width: AppDimensions.width10(context) * 2.4,
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return CalendarBottomSheet(
                                onChangedStart: (int value) {
                                  setState(() {
                                    current = -value;
                                    next = -value - 1;
                                    past = -value + 1;
                                    Loader = true;
                                  });
                                  fetchPracticeByDay();
                                },
                              );
                            },
                          );

                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 1.32),
                          child: Image.asset(
                            'assets/images/calendar_month_black_24dp 1.webp',
                            height: AppDimensions.width10(context) * 2.4,
                            width: AppDimensions.width10(context) * 2.4,
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
            extendBodyBehindAppBar: true,
            extendBody: true,
            backgroundColor: const Color(0xffD9B4B4),
            bottomNavigationBar: contain
                ? Container(
                    margin: EdgeInsets.all(AppDimensions.height10(context) * 1.8),
                    child: updateBox(
                        headText: widget.missed ? 'Missed' : 'SAVED',
                        bodyText: widget.name,
                        edit: widget.missed ? false : true,
                        onTap1: () {},
                        FadeFunction: () {},
                        functionText: widget.missed ? 'Undo' : 'Edit'),
                  )
                : const BottomAppBar(
              elevation: 0,
                  padding: EdgeInsets.zero,

                  notchMargin: 0,
                  color: Colors.transparent,
                  child:  Navigation_Bar(
                      bg_colored: true,
                      membership: true,
                      cancel: false,
                      trial: false,
                    ),
                ),
            body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Mask Group.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.infinity,
                height: AppDimensions.height10(context) * 79.8,
                child: Loader == false
                    ? noData == false
                        ? noActive == false
                            ? GestureDetector(
                                onTap: () {
                                  if (widget.helpfulTips) {
                                    if (goal_level == 0) {
                                      _incrementValue();
                                    }
                                  }
                                },
                                child: SizedBox(
                                    width: double.infinity,
                                    height:
                                        AppDimensions.height10(context) * 19.2,
                                    child: Stack(children: [
                                      Stack(
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                             controller: _scrollController,

                                            child: SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  19.2,
                                              width:
                                                  AppDimensions.width10(context) *
                                                      45.0,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const Alignment(-1, 1),
                                                    child: AnimatedScaleButton(
                                                      onTap: () {
                                                        if (_showOverlay ==
                                                            false) {
                                                          setState(() {
                                                            Loader = true;

                                                            // past = past - 1;
                                                            // next = next - 1;
                                                          });
                                                          previous();
                                                          fetchPracticeByDay();
                                                          setState(() {
                                                            contain = false;

                                                            // past = past - 1;
                                                            // next = next - 1;
                                                          });
                                                        } else {
                                                          if (goal_level == 0) {
                                                            _incrementValue();
                                                          }
                                                        }

                                                        // Navigator.push(
                                                        //     context,
                                                        //     FadePageRoute(
                                                        //         page: no_past_session(
                                                        //       missed: widget.missed,
                                                        //     )));
                                                      },
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            7.9,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            7.9,
                                                        //margin: const EdgeInsets.only(top: 84),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              width: 3,
                                                              color:
                                                                  Colors.white),
                                                          gradient: const LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(0xffF5F1E0),
                                                                Color(0xffEDDC97)
                                                              ]),
                                                        ),
                                                        child: Container(
                                                            alignment:
                                                                Alignment.center,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  height: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.7,

                                                                  // color: Colors.blue,
                                                                  child: Text(
                                                                    getFormattedDay(
                                                                            past)
                                                                        .substring(
                                                                            0, 3),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            AppDimensions.font10(context) *
                                                                                1.2,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: const Color(
                                                                            0xff5B74A6)),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  //width: AppDimensions.width10(context) * 4.0,
                                                                  height: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.7,
                                                                  // color: Colors.amber,
                                                                  child: Text(
                                                                    '${getFormattedDate(past).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(past).split('-').reversed.join().substring(2, 4)}',
                                                                    style: TextStyle(
                                                                        color: const Color(
                                                                            0xff5B74A6),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            AppDimensions.font10(context) *
                                                                                1.4),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    height: AppDimensions
                                                                            .width10(
                                                                                context) *
                                                                        2.0,
                                                                    width: AppDimensions
                                                                            .width10(
                                                                                context) *
                                                                        2.0,
                                                                    //  margin: const EdgeInsets.only(top: 3.32),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: pastPracCompleted ==
                                                                                0
                                                                            ? const Color(
                                                                                0xff156F6D)
                                                                            : Colors
                                                                                .white),
                                                                    child: Center(
                                                                      child: Text(
                                                                        '${responseData['previousCompletePractice']}/${responseData['previousTotalPractice']}',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            color: pastPracCompleted == 0
                                                                                ? Colors.white
                                                                                : const Color(0xff5B74A6)),
                                                                      ),
                                                                    ))
                                                              ],
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const Alignment(0, 0),
                                                    child: SizedBox(
                                                      key: centerKey,
                                                      height:
                                                          AppDimensions.height10(
                                                                  context) *
                                                              19.2,
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              18.8,
                                                      // margin: EdgeInsets.only(left: 55.5, right: 55.5),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            13.81,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            13.265,
                                                        decoration: const BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/images/Asset 10 2.webp'),
                                                                fit: BoxFit
                                                                    .cover)),
                                                        child: Stack(children: [
                                                          Align(
                                                            alignment:
                                                                const Alignment(
                                                                    0.185, 0.215),
                                                            child: Container(
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.4,
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  1.4,
                                                              decoration: const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  gradient:
                                                                      LinearGradient(
                                                                          colors: [
                                                                        Color(
                                                                            0xfff1e39a),
                                                                        Color(
                                                                            0xffEEDD96)
                                                                      ])),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const Alignment(
                                                                    0, 0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  getFormattedDay(
                                                                          current)
                                                                      .substring(
                                                                          0, 3),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AppDimensions.font10(context) *
                                                                              1.2,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: const Color(
                                                                          0xff5B74A6)),
                                                                ),
                                                                Text(
                                                                  '${getFormattedDate(current).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(current).split('-').reversed.join().substring(2, 4)}',
                                                                  style: TextStyle(
                                                                      color: const Color(
                                                                          0xff5B74A6),
                                                                      fontSize:
                                                                          AppDimensions.height10(context) *
                                                                              1.4,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                Container(
                                                                    height: AppDimensions
                                                                            .height10(
                                                                                context) *
                                                                        2.8,
                                                                    width: AppDimensions
                                                                            .width10(
                                                                                context) *
                                                                        2.8,
                                                                    // margin: const EdgeInsets.only(top: 2),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: presentPracCompleted ==
                                                                                0
                                                                            ? const Color(
                                                                                0xff156F6D)
                                                                            : Colors
                                                                                .white),
                                                                    child: Center(
                                                                      child: Text(
                                                                        '${responseData['completePractice']}/${responseData['totalPractice']}',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            color: presentPracCompleted == 0
                                                                                ? Colors.white
                                                                                : const Color(0xff5B74A6)),
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
                                                    alignment:
                                                        const Alignment(1, 1),
                                                    child: AnimatedScaleButton(
                                                      onTap: () {
                                                        if (_showOverlay ==
                                                            false) {
                                                          if (!maxViewDate) {
                                                            setState(() {
                                                              Loader = true;
                                                            });
                                                            future();
                                                            fetchPracticeByDay();
                                                            setState(() {
                                                              contain = false;
                                                            });
                                                          } else {}
                                                        } else {
                                                          if (goal_level == 0) {
                                                            _incrementValue();
                                                          }
                                                        }
                                                        // Navigator.push(
                                                        //     context,
                                                        //     FadePageRoute(
                                                        //         page: no_planned_session(
                                                        //       missed: widget.missed,
                                                        //     )));
                                                      },
                                                      child: Container(
                                                          height: AppDimensions.height10(context) *
                                                              7.9,
                                                          width: AppDimensions.height10(
                                                                  context) *
                                                              7.9,
                                                          // margin: const EdgeInsets.only(
                                                          //   top: 84,
                                                          // ),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  width: 3,
                                                                  color:
                                                                      Colors
                                                                          .white),
                                                              gradient: const LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment
                                                                      .bottomCenter,
                                                                  colors: [
                                                                    Color(
                                                                        0xffFBF9EF),
                                                                    Color(
                                                                        0xffF8F3DA)
                                                                  ])),
                                                          // ignore: avoid_unnecessary_containers
                                                          child: Container(
                                                              //margin: const EdgeInsets.only(top: 11.52),
                                                              child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                getFormattedDay(
                                                                        next)
                                                                    .substring(
                                                                        0, 3),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        AppDimensions.font10(
                                                                                context) *
                                                                            1.2,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: const Color(
                                                                        0xff5B74A6)),
                                                              ),
                                                              Text(
                                                                '${getFormattedDate(next).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(next).split('-').reversed.join().substring(2, 4)}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        AppDimensions.font10(
                                                                                context) *
                                                                            1.4,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xff5B74A6)),
                                                              ),
                                                              Container(
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    3,
                                                                width: AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: nextPracCompleted ==
                                                                          0
                                                                      ? const Color(
                                                                          0xff156F6D)
                                                                      : Colors
                                                                          .transparent,
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                child: SizedBox(
                                                                    width: AppDimensions
                                                                            .width10(
                                                                                context) *
                                                                        1.7,
                                                                    height: AppDimensions
                                                                            .height10(
                                                                                context) *
                                                                        1.5,
                                                                    // margin:
                                                                    //     const EdgeInsets.only(top: 3.32),
                                                                    // margin: const EdgeInsets.only(left: 1),
                                                                    child: Center(
                                                                      child: Text(
                                                                        '${responseData['nextCompletePractice']}/${responseData['nextTotalPratice']}',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            color: nextPracCompleted == 0
                                                                                ? Colors.white
                                                                                : const Color(0xff5B74A6)),
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

                                            margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  20.0,
                                            ),
                                            child: SingleChildScrollView(

                                              child: Column(
                                                children: [
                                                  ListView.builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemCount: timesList.length,
                                                      shrinkWrap: true,
                                                      padding: EdgeInsets.zero,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        return Column(
                                                          children: [
                                                            Container(
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  35.6,
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  4.7,
                                                              margin: EdgeInsets.only(
                                                                  left: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      2.4,
                                                                  right: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      3.4,
                                                                  top: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.1),
                                                              child: Column(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                       _scrollToCurrentIndex();
                                                                      },
                                                                      child: Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerLeft,
                                                                        child: Text(
                                                                          timesList[index]
                                                                                  [
                                                                                  'time']
                                                                              .toString()
                                                                              .substring(
                                                                                  0,
                                                                                  5),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                AppDimensions.font10(context) *
                                                                                    1.8,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color: Colors
                                                                                .white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              0.2,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: Text(
                                                                        timesList[index]
                                                                                [
                                                                                'time']
                                                                            .toString()
                                                                            .trim()
                                                                            .substring(
                                                                                5)
                                                                            .toUpperCase(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              AppDimensions.font10(context) *
                                                                                  1.2,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color: Colors
                                                                              .white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Center(
                                                                  child: align_circles(
                                                                      asset_1: timesList[index]['data']['userGoal']['color'] == "1"
                                                                          ? "assets/images/red_gradient.webp"
                                                                          : timesList[index]['data']['userGoal']['color'] == "2"
                                                                              ? 'assets/images/orange_moon.webp'
                                                                              : timesList[index]['data']['userGoal']['color'] == "3"
                                                                                  ? "assets/images/lightGrey_gradient.webp"
                                                                                  : timesList[index]['data']['userGoal']['color'] == "4"
                                                                                      ? "assets/images/lightBlue_gradient.webp"
                                                                                      : timesList[index]['data']['userGoal']['color'] == "5"
                                                                                          ? "assets/images/medBlue_gradient.webp"
                                                                                          : timesList[index]['data']['userGoal']['color'] == "6"
                                                                                              ? "assets/images/Blue_gradient.webp"
                                                                                              : 'assets/images/orange_moon.webp',
                                                                      s_circle_text: timesList[index]['data']['name'],
                                                                      asset_2: timesList[index]['status'] == 'missed'
                                                                          ? timesList[index]['data']['color'] == "1"
                                                                              ? 'assets/images/Missed_3.webp'
                                                                              : timesList[index]['data']['color'] == "2"
                                                                                  ? 'assets/images/Missed_1.webp'
                                                                                  : timesList[index]['data']['color'] == "3"
                                                                                      ? "assets/images/Missed_2.webp"
                                                                                      : timesList[index]['data']['color'] == "4"
                                                                                          ? "assets/images/Missed_4.webp"
                                                                                          : timesList[index]['data']['color'] == "5"
                                                                                              ? "assets/images/Missed_4.webp"
                                                                                              : "assets/images/Missed_1.webp"
                                                                          : timesList[index]['status'] == 'completed'
                                                                              ? timesList[index]['data']['color'] == "1"
                                                                                  ? "assets/images/Practice_Completed_1.webp"
                                                                                  : timesList[index]['data']['color'] == "2"
                                                                                      ? 'assets/images/Practice_Completed_2.webp'
                                                                                      : timesList[index]['data']['color'] == "3"
                                                                                          ? "assets/images/Practice_Completed_3.webp"
                                                                                          : timesList[index]['data']['color'] == "4"
                                                                                              ? "assets/images/Practice_Completed_4.webp"
                                                                                              : timesList[index]['data']['color'] == "5"
                                                                                                  ? "assets/images/Practice_Completed_4.webp"
                                                                                                  : 'assets/images/Practice_Completed_2.webp'
                                                                              : timesList[index]['data']['color'] == "1"
                                                                                  ? "assets/images/Ellipse orange_wb.webp"
                                                                                  : timesList[index]['data']['color'] == "2"
                                                                                      ? 'assets/images/Ellipse 158_wb.webp'
                                                                                      : timesList[index]['data']['color'] == "3"
                                                                                          ? "assets/images/Ellipse 157_wb.webp"
                                                                                          : timesList[index]['data']['color'] == "4"
                                                                                              ? "assets/images/Ellipse light-blue_wb.webp"
                                                                                              : timesList[index]['data']['color'] == "5"
                                                                                                  ? "assets/images/Ellipse blue_wb.webp"
                                                                                                  : 'assets/images/Ellipse 158_wb.webp',
                                                                      head_text: timesList[index]['data']['userGoal']['name'],
                                                                      body_text: timesList[index]['data']['userGoal']['identityStatement'][0]['text'],
                                                                      body_text_color: 0xff5B74A6,
                                                                      head_text_color: 0xff5B74A6,
                                                                      body_text_size: AppDimensions.font10(context) * 1.6,
                                                                      head_text_size: AppDimensions.font10(context) * 2.0,
                                                                      enable_icon: widget.missed ? false : true,
                                                                      is_right: true,
                                                                      s_circle_text_col: timesList[index]['status'] == "Not Started"
                                                                          ? 0xFFFBFBFB
                                                                          : timesList[index]['data']['color'] == "1"
                                                                              ? 0XFFFC7133
                                                                              : timesList[index]['data']['color'] == "2"
                                                                                  ? 0xFF1A481C
                                                                                  : timesList[index]['data']['color'] == "3"
                                                                                      ? 0xFF6D4B77
                                                                                      : timesList[index]['data']['color'] == "4"
                                                                                          ? 0xFF5C75A6
                                                                                          : timesList[index]['data']['color'] == "5"
                                                                                              ? 0xFF315291
                                                                                              : 0xFFFBFBFB,
                                                                      onTap1: () async {
                                                                        if (_showOverlay ==
                                                                            false) {
                                                                          Navigator.push(
                                                                              context,
                                                                              FadePageRoute(
                                                                                  page: (const goal_menu_inactive(
                                                                                isActive: false,
                                                                                goal_evaluation: false,
                                                                              ))));
                                                                          final SharedPreferences
                                                                              prefs =
                                                                              await _prefs;
                                                                          var setId = prefs.setInt(
                                                                              'goal_num',
                                                                              timesList[index]['data']['userGoal']['id']);

                                                                          await prefs.setString(
                                                                              'goal_menu_route',
                                                                              'dashboard');
                                                                        } else {
                                                                          if (goal_level ==
                                                                              0) {
                                                                            _incrementValue();
                                                                          }
                                                                        }
                                                                      },
                                                                      onTap2: () async {
                                                                        if (_showOverlay ==
                                                                            false) {
                                                                          final SharedPreferences
                                                                              prefs =
                                                                              await _prefs;
                                                                          await prefs.setString(
                                                                              'prac_menu_route',
                                                                              'dashboard');
                                                                          var pracId = prefs.setInt(
                                                                              'prac_num',
                                                                              timesList[index]['data']['id']);
                                                                          var setId = prefs.setInt(
                                                                              'goal_num',
                                                                              timesList[index]['data']['userGoal']['id']);

                                                                          var pracName = prefs.setString(
                                                                              'dash_pracName',
                                                                              timesList[index]['data']['name']);
                                                                          var goalName = prefs.setString(
                                                                              'dash_goalName',
                                                                              timesList[index]['data']['userGoal']['name']);
                                                                          prefs.setString(
                                                                              'record_date',
                                                                              getFormattedDate(current).toString());

                                                                          var pracColor = timesList[index]['data']['color'] !=
                                                                                  null
                                                                              ? prefs.setString('dash_pracColor',
                                                                                  timesList[index]['data']['color'])
                                                                              : prefs.setString('dash_pracColor', '0');
                                                                          var time = prefs.setString(
                                                                              'recording_Time1',
                                                                              timesList[index]['time']);
                                                                          var dash_boardRoute = prefs.setBool(
                                                                              'behaviour_route',
                                                                              true);
                                                                          var goalColor = timesList[index]['data']['userGoal']['color'] !=
                                                                                  null
                                                                              ? prefs.setString('dash_goalColor',
                                                                                  timesList[index]['data']['userGoal']['color'])
                                                                              : '0';
                                                                          if (timesList[index]['status'] ==
                                                                              "Not Started") {
                                                                            Navigator.push(
                                                                                context,
                                                                                FadePageRoute(page: const practiceMenu(goal_eval: false)));
                                                                          } else if (timesList[index]['status'] ==
                                                                              "missed") {
                                                                            Navigator.push(
                                                                                context,
                                                                                FadePageRoute(
                                                                                    page: missed_Menu(
                                                                                  pracName: timesList[index]['data']['name'],
                                                                                )));
                                                                          } else {
                                                                            Navigator.push(
                                                                                context,
                                                                                FadePageRoute(page: const menu_behaviour()));
                                                                          }
                                                                        } else {
                                                                          if (goal_level ==
                                                                              0) {
                                                                            _incrementValue();
                                                                          }
                                                                        }
                                                                      }),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  3.0,
                                                            ),
                                                          ],
                                                        );
                                                      })),
                                                  single == true
                                                      ?  reda(context, true)

                                                      : Container(),
                                                  Container(
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            13,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      single == true
                                          ? Container()
                                          : Positioned(
                                          top: AppDimensions.height10(
                                              context) *
                                              62.0,
                                          left: AppDimensions.height10(
                                              context) *
                                              1.3,
                                          child: Stack(
                                            children: [
                                              redaVisble?  Container(
                                                margin: EdgeInsets.only(
                                                    left: AppDimensions.height10(context)*1.2,
                                                    top: AppDimensions.height10(context)
                                                ),
                                                child: reda(context,false ),
                                              ):Container(),


                                              AnimatedScaleButton(
                                                onTap: (){
                                                  // setState(() {
                                                  //   redaVisble =!redaVisble;
                                                  // });
                                                },
                                                child: Container(
                                                  width: AppDimensions.height10(
                                                      context) *
                                                      4.5,
                                                  height:
                                                  AppDimensions.height10(
                                                      context) *
                                                      4.5,
                                                  padding: EdgeInsets.all(
                                                      AppDimensions.height10(
                                                          context) *
                                                          0.4),
                                                  decoration:
                                                  const BoxDecoration(
                                                      shape:
                                                      BoxShape.circle,
                                                      color: Colors.white),
                                                  child: Container(
                                                    width:
                                                    AppDimensions.width10(
                                                        context) *
                                                        4.16,
                                                    height:
                                                    AppDimensions.height10(
                                                        context) *
                                                        4.16,
                                                    decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/Smart Object_1.webp'))),
                                                    child: Align(
                                                      alignment:
                                                      const Alignment(
                                                          0, 2.8),
                                                      child: Container(
                                                        width: AppDimensions
                                                            .width10(
                                                            context) *
                                                            2.1,
                                                        height: AppDimensions
                                                            .height10(
                                                            context) *
                                                            2.1,
                                                        decoration:
                                                        const BoxDecoration(
                                                          shape:
                                                          BoxShape.circle,
                                                          color: Colors.white,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            allGoals.length
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: AppDimensions
                                                                    .font10(
                                                                    context) *
                                                                    1.2,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                color: const Color(
                                                                    0xFFFA9934)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          )),

                                      if (_showOverlay)
                                        FutureBuilder(
                                            future: Future.delayed(const Duration(
                                                milliseconds: 200)),
                                            builder:
                                                (c, s) =>
                                                    s.connectionState ==
                                                            ConnectionState.done
                                                        ? Align(
                                                            alignment: goal_level ==
                                                                    2
                                                                ? const Alignment(
                                                                    -0.9, -0.08)
                                                                : goal_level == 3
                                                                    ? const Alignment(
                                                                        -0.67,
                                                                        -0.07)
                                                                    : goal_level ==
                                                                            4
                                                                        ? const Alignment(
                                                                            0.25,
                                                                            -0.45)
                                                                        : goal_level ==
                                                                                5
                                                                            ? const Alignment(
                                                                                0.36,
                                                                                -0.67)
                                                                            : goal_level == 6
                                                                                ? const Alignment(0.99, -0.67)
                                                                                : goal_level == 1
                                                                                    ? const Alignment(0.3, -0.69)
                                                                                    : goal_level == 7 && single
                                                                                        ? const Alignment(0.4, 0.345)
                                                                                        : goal_level == 7 && single == false
                                                                                            ? const Alignment(-0.87, 0.55)
                                                                                            : const Alignment(0, 0),
                                                            child: SizedBox(
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  30.6,
                                                              height: goal_level ==
                                                                      1
                                                                  ? AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      22.3
                                                                  : goal_level ==
                                                                          2
                                                                      ? AppDimensions.height10(
                                                                              context) *
                                                                          22.1
                                                                      : goal_level ==
                                                                              3
                                                                          ? AppDimensions.height10(context) *
                                                                              18.3
                                                                          : goal_level ==
                                                                                  4
                                                                              ? AppDimensions.height10(context) *
                                                                                  20.6
                                                                              : goal_level == 5
                                                                                  ? AppDimensions.height10(context) * 22.6
                                                                                  : goal_level == 6
                                                                                      ? AppDimensions.height10(context) * 18.4
                                                                                      : AppDimensions.height10(context) * 20.6,
                                                              child: Stack(
                                                                children: [
                                                                  goal_level == 0
                                                                      ? Container()
                                                                      : Align(
                                                                          alignment: goal_level ==
                                                                                  2
                                                                              ? const Alignment(0.87,
                                                                                  1.1)
                                                                              : goal_level == 3
                                                                                  ? const Alignment(-0.9, -1.1)
                                                                                  : goal_level == 4
                                                                                      ? const Alignment(0, -1.1)
                                                                                      : goal_level == 5
                                                                                          ? const Alignment(0.9, -1.1)
                                                                                          : goal_level == 6
                                                                                              ? const Alignment(0.9, -1.1)
                                                                                              : goal_level == 1
                                                                                                  ? const Alignment(0, 1.1)
                                                                                                  : goal_level == 7 && single
                                                                                                      ? const Alignment(0, 1.1)
                                                                                                      : goal_level == 7 && single == false
                                                                                                          ? const Alignment(-0.88, 1.1)
                                                                                                          : const Alignment(0, 1.1),
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Image.asset(
                                                                              (goal_level == 3 || goal_level == 4 || goal_level == 5 || goal_level == 6)
                                                                                  ? 'assets/images/arrow-192-up.webp'
                                                                                  : 'assets/images/arrow-192.webp',
                                                                              height:
                                                                                  AppDimensions.height10(context) * 2.0,
                                                                              width:
                                                                                  AppDimensions.width10(context) * 2.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                  goal_level == 0
                                                                      ? Container()
                                                                      : Container(
                                                                          width: AppDimensions.width10(context) *
                                                                              30.6,
                                                                          height: goal_level ==
                                                                                  1
                                                                              ? AppDimensions.height10(context) *
                                                                                  22.3
                                                                              : goal_level == 2
                                                                                  ? AppDimensions.height10(context) * 22.1
                                                                                  : goal_level == 3
                                                                                      ? AppDimensions.height10(context) * 18.3
                                                                                      : goal_level == 4
                                                                                          ? AppDimensions.height10(context) * 20.6
                                                                                          : goal_level == 5
                                                                                              ? AppDimensions.height10(context) * 22.6
                                                                                              : goal_level == 6
                                                                                                  ? AppDimensions.height10(context) * 18.4
                                                                                                  : AppDimensions.height10(context) * 20.6,
                                                                          decoration: BoxDecoration(
                                                                              color:
                                                                                  Colors.white,
                                                                              borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 1.0)),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                width: AppDimensions.width10(context) * 21.6,
                                                                                //height: AppDimensions.height10(context) * 2.2,

                                                                                margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.7, left: AppDimensions.width10(context) * 1.6, right: AppDimensions.width10(context) * 7.4),
                                                                                child: Text(
                                                                                  goal_level == 2
                                                                                      ? 'Your Practice'
                                                                                      : goal_level == 3
                                                                                          ? 'Time'
                                                                                          : goal_level == 4
                                                                                              ? 'Your Schedule'
                                                                                              : goal_level == 5
                                                                                                  ? 'Record Practice'
                                                                                                  : goal_level == 6
                                                                                                      ? 'Your Calendar'
                                                                                                      : goal_level == 1
                                                                                                          ? 'Your Goal'
                                                                                                          : 'Reda',
                                                                                  style: TextStyle(
                                                                                    decoration: TextDecoration.none,
                                                                                    fontFamily: 'Laila',
                                                                                    color: const Color(0xFF000000),
                                                                                    fontSize: AppDimensions.font10(context) * 1.6,
                                                                                    fontWeight: FontWeight.w700,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: AppDimensions.width10(context) * 27.4,
                                                                                height: goal_level == 1
                                                                                    ? AppDimensions.height10(context) * 11.8
                                                                                    : goal_level == 2
                                                                                        ? AppDimensions.height10(context) * 11.6
                                                                                        : goal_level == 3
                                                                                            ? AppDimensions.height10(context) * 7.8
                                                                                            : goal_level == 4
                                                                                                ? AppDimensions.height10(context) * 10.1
                                                                                                : goal_level == 5
                                                                                                    ? AppDimensions.height10(context) * 12.1
                                                                                                    : goal_level == 6
                                                                                                        ? AppDimensions.height10(context) * 7.9
                                                                                                        : AppDimensions.height10(context) * 10.1,
                                                                                margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.3),
                                                                                child: RichText(
                                                                                    text: TextSpan(style: TextStyle(fontWeight: FontWeight.w400, color: const Color(0xFF464646), decoration: TextDecoration.none, fontFamily: 'Laila', fontSize: AppDimensions.font10(context) * 1.4, height: AppDimensions.height10(context) * 0.15), children: [
                                                                                  TextSpan(
                                                                                    text: goal_level == 1
                                                                                        ? 'This is your own star that you’ve created.\nRemember, '
                                                                                        : goal_level == 2
                                                                                            ? 'Smaller circles that spin around your\nstars are the planets. The '
                                                                                            : goal_level == 3
                                                                                                ? 'This shows the '
                                                                                                : goal_level == 4 || goal_level == 6
                                                                                                    ? 'This is your '
                                                                                                    : goal_level == 5
                                                                                                        ? 'If you want to '
                                                                                                        : 'This is your friend who sends out',
                                                                                  ),
                                                                                  TextSpan(
                                                                                      text: goal_level == 1
                                                                                          ? '‘stars’ '
                                                                                          : goal_level == 2
                                                                                              ? '‘planets’ '
                                                                                              : goal_level == 3
                                                                                                  ? 'actual time '
                                                                                                  : goal_level == 4
                                                                                                      ? 'daily view '
                                                                                                      : goal_level == 5
                                                                                                          ? 'record a practice session\n'
                                                                                                          : goal_level == 6
                                                                                                              ? 'calender '
                                                                                                              : ' helpful\nreminders ',
                                                                                      style: const TextStyle(fontWeight: FontWeight.w700)),
                                                                                  TextSpan(
                                                                                      text: goal_level == 1
                                                                                          ? 'are your '
                                                                                          : goal_level == 2
                                                                                              ? 'are\nyour own '
                                                                                              : goal_level == 3
                                                                                                  ? 'the practice\nis '
                                                                                                  : goal_level == 4
                                                                                                      ? 'schedule.\nNavigate here if you want quick access to\nsee all your '
                                                                                                      : goal_level == 5
                                                                                                          ? 'that it’s not currently scheduled, navigate\nhere. You will see all your '
                                                                                                          : goal_level == 6
                                                                                                              ? 'It’s very similar to your schedule. Navigate here if you want to see your '
                                                                                                              : 'and '),
                                                                                  TextSpan(
                                                                                      text: goal_level == 1
                                                                                          ? 'personal\ngrowth goals. '
                                                                                          : goal_level == 2
                                                                                              ? 'practices '
                                                                                              : goal_level == 3
                                                                                                  ? 'scheduled '
                                                                                                  : goal_level == 4
                                                                                                      ? 'scheduled practices '
                                                                                                      : goal_level == 5
                                                                                                          ? 'active goals '
                                                                                                          : goal_level == 6
                                                                                                              ? 'past '
                                                                                                              : 'messages. ',
                                                                                      style: const TextStyle(fontWeight: FontWeight.w700)),
                                                                                  TextSpan(
                                                                                      text: goal_level == 1
                                                                                          ? 'They wil always look bigger and will have '
                                                                                          : goal_level == 2
                                                                                              ? 'that you’ve created to help you progress with your goal. The\n'
                                                                                              : goal_level == 3
                                                                                                  ? 'for on that day (centred daily calendar view at the top shows you the actual date).'
                                                                                                  : goal_level == 4
                                                                                                      ? 'for that day. Scroll left or right to see your\n'
                                                                                                      : goal_level == 5
                                                                                                          ? 'with its'
                                                                                                          : goal_level == 6
                                                                                                              ? 'or'
                                                                                                              : ' You will see\nReda appearing every time you have a new\nnotification with gentle prompts to help\nyou '),
                                                                                  TextSpan(
                                                                                      text: goal_level == 1
                                                                                          ? 'goal name '
                                                                                          : goal_level == 2
                                                                                              ? 'practice '
                                                                                              : goal_level == 3
                                                                                                  ? ''
                                                                                                  : goal_level == 4
                                                                                                      ? 'schedule '
                                                                                                      : goal_level == 5
                                                                                                          ? ' assigned practices.'
                                                                                                          : goal_level == 6
                                                                                                              ? ' future schedule '
                                                                                                              : 'stay focused.',
                                                                                      style: const TextStyle(fontWeight: FontWeight.w700)),
                                                                                  TextSpan(
                                                                                      text: goal_level == 1
                                                                                          ? 'with\n'
                                                                                          : goal_level == 2
                                                                                              ? 'will have a '
                                                                                              : goal_level == 3
                                                                                                  ? ''
                                                                                                  : goal_level == 4
                                                                                                      ? 'for previous or next day.'
                                                                                                      : goal_level == 5
                                                                                                          ? ' Click on the\npractice you want to record the session\nfor and you’ll be taken to capture it.'
                                                                                                          : goal_level == 6
                                                                                                              ? 'for a\ncertain date.'
                                                                                                              : ''),
                                                                                  TextSpan(
                                                                                      text: goal_level == 1
                                                                                          ? 'identity statement  '
                                                                                          : goal_level == 2
                                                                                              ? 'name '
                                                                                              : goal_level == 3
                                                                                                  ? ''
                                                                                                  : goal_level == 4
                                                                                                      ? ''
                                                                                                      : goal_level == 5
                                                                                                          ? ''
                                                                                                          : goal_level == 6
                                                                                                              ? ''
                                                                                                              : '',
                                                                                      style: const TextStyle(fontWeight: FontWeight.w700)),
                                                                                  TextSpan(
                                                                                      text: goal_level == 1
                                                                                          ? 'written on it, so you\ncan easily identify it.'
                                                                                          : goal_level == 2
                                                                                              ? 'written on it to help you identify it.'
                                                                                              : goal_level == 3
                                                                                                  ? ''
                                                                                                  : goal_level == 4
                                                                                                      ? ''
                                                                                                      : goal_level == 5
                                                                                                          ? ''
                                                                                                          : goal_level == 6
                                                                                                              ? ''
                                                                                                              : '')
                                                                                ])),
                                                                              ),
                                                                              Container(
                                                                                width: AppDimensions.width10(context) * 24.3,
                                                                                height: AppDimensions.height10(context) * 4.0,
                                                                                margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.8),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    GestureDetector(
                                                                                      onTap: (() {
                                                                                        setState(() {
                                                                                          _showOverlay = false;
                                                                                        });
                                                                                      }),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 5.0), border: Border.all(width: AppDimensions.width10(context) * 0.1, color: const Color(0xFFFBFBFB))),
                                                                                        width: AppDimensions.width10(context) * 9.60,
                                                                                        height: AppDimensions.height10(context) * 3.2,
                                                                                        child: Center(
                                                                                          child: Text(
                                                                                            'Skip tour',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: TextStyle(fontFamily: 'Laila', decoration: TextDecoration.none, fontSize: AppDimensions.font10(context) * 1.6, color: const Color(0xFF8C648A), fontWeight: FontWeight.w700),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    GestureDetector(
                                                                                      onTap: () {
                                                                                        _incrementValue();
                                                                                        if (goal_level > 7) {
                                                                                          setState(() {
                                                                                            _showOverlay = false;
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                      child: Container(
                                                                                        width: AppDimensions.width10(context) * 11.7,
                                                                                        height: AppDimensions.height10(context) * 4.0,
                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 5.0), color: const Color(0xFF5A4D73)),
                                                                                        child: Center(
                                                                                          child: Text(
                                                                                            goal_level == 2
                                                                                                ? '(2/7) Next'
                                                                                                : goal_level == 3
                                                                                                    ? '(3/7) Next'
                                                                                                    : goal_level == 4
                                                                                                        ? '(4/7) Next'
                                                                                                        : goal_level == 5
                                                                                                            ? '(5/7) Next'
                                                                                                            : goal_level == 6
                                                                                                                ? '(6/7) Next'
                                                                                                                : goal_level == 7
                                                                                                                    ? '(7/7) Next'
                                                                                                                    : goal_level == 1
                                                                                                                        ? '(1/7) Next'
                                                                                                                        : '(7/7) Next',
                                                                                            style: TextStyle(decoration: TextDecoration.none, fontFamily: 'Laila', fontSize: AppDimensions.font10(context) * 1.6, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.w600),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        : Container()),


                                    ])),
                              )
                            : noPlanned == true
                                ? SizedBox(
                                    width: double.infinity,
                                    height:
                                        AppDimensions.height10(context) * 19.2,
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            controller: _scrollController,
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  19.2,
                                              margin: EdgeInsets.only(right: 20),
                                              width:
                                                  AppDimensions.width10(context) *
                                                      45.7,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const Alignment(-1, 1),
                                                    child: AnimatedScaleButton(
                                                      onTap: () {
                                                        previous();
                                                        setState(() {
                                                          Loader = true;
                                                        });
                                                        fetchPracticeByDay();
                                                      },
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            7.9,
                                                        width:
                                                            AppDimensions.width10(
                                                                    context) *
                                                                7.9,
                                                        margin: EdgeInsets.only(
                                                            top: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                8.4),
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                width: AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    0.3,
                                                                color:
                                                                    Colors.white),
                                                            color: Colors
                                                                .transparent),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              getFormattedDay(
                                                                      past)
                                                                  .substring(
                                                                      0, 3),
                                                              style: TextStyle(
                                                                  fontSize: AppDimensions
                                                                          .font10(
                                                                              context) *
                                                                      1.2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: const Color(
                                                                      0xFFFBFBFB)),
                                                            ),
                                                            Text(
                                                              '${getFormattedDate(past).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(past).split('-').reversed.join().substring(2, 4)}',
                                                              style: TextStyle(
                                                                  fontSize: AppDimensions
                                                                          .font10(
                                                                              context) *
                                                                      1.4,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Container(
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  2.5,
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  2.5,
                                                              margin: EdgeInsets.only(
                                                                  top: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      0.332),
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    width: AppDimensions
                                                                            .width10(
                                                                                context) *
                                                                        0.1,
                                                                    color: const Color(
                                                                        0xFFFBFBFB)),
                                                              ),
                                                              child: Container(
                                                                  width: AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      1.7,
                                                                  height: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.5,
                                                                  margin: EdgeInsets.only(
                                                                      top: AppDimensions.height10(
                                                                              context) *
                                                                          0.332),
                                                                  // margin: const EdgeInsets.only(left: 1),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '${responseData['previousCompletePractice']}/${responseData['previousTotalPractice']}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              AppDimensions.font10(context) *
                                                                                  1.0,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w400,
                                                                          color: Colors
                                                                              .white),
                                                                    ),
                                                                  )),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const Alignment(0, 0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     FadePageRoute(
                                                        //         page: const view_goals(
                                                        //       missed: false,
                                                        //     )));
                                                      },
                                                      child: Container(
                                                        width:
                                                            AppDimensions.width10(
                                                                    context) *
                                                                8.3,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            8.3,
                                                        //  margin: EdgeInsets.only(right: 121, left: 121),
                                                        padding:
                                                            const EdgeInsets.all(
                                                                4),
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                width: 1,
                                                                color:
                                                                    Colors.white),
                                                            color: Colors
                                                                .transparent),
                                                        child: Container(
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              7.9,
                                                          width: AppDimensions
                                                                  .width10(
                                                                      context) *
                                                              7.9,
                                                          decoration: BoxDecoration(
                                                              shape:
                                                                  BoxShape.circle,
                                                              border: Border.all(
                                                                  width: 3,
                                                                  color: Colors
                                                                      .white),
                                                              color: Colors
                                                                  .transparent),
                                                          child: Stack(
                                                              alignment: Alignment
                                                                  .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const Alignment(
                                                                          0, 0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        getFormattedDay(
                                                                                current)
                                                                            .substring(
                                                                                0,
                                                                                3),
                                                                        style: TextStyle(
                                                                            fontSize: AppDimensions.font10(context) *
                                                                                1.2,
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      Text(
                                                                        '${getFormattedDate(current).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(current).split('-').reversed.join().substring(2, 4)}',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize: AppDimensions.font10(context) *
                                                                                1.4,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                      Container(
                                                                          height: AppDimensions.height10(context) *
                                                                              2.5,
                                                                          width: AppDimensions.width10(context) *
                                                                              2.5,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              DottedBorder(
                                                                            borderType:
                                                                                BorderType.Circle,
                                                                            color:
                                                                                Colors.white,
                                                                            child:
                                                                                Center(
                                                                              child:
                                                                                  Text(
                                                                                '0/0',
                                                                                style: TextStyle(fontSize: AppDimensions.font10(context) * 1.0, fontWeight: FontWeight.w400, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const Alignment(1, 1),
                                                    child: AnimatedScaleButton(
                                                      onTap: () {
                                                        if (!maxViewDate) {
                                                          setState(() {
                                                            Loader = true;
                                                          });
                                                          future();
                                                          fetchPracticeByDay();
                                                        }
                                                      },
                                                      child: Container(
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              7.9,
                                                          width:
                                                              AppDimensions.height10(
                                                                      context) *
                                                                  7.9,
                                                          margin: EdgeInsets.only(
                                                            top: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                8.4,
                                                          ),
                                                          decoration: BoxDecoration(
                                                              shape:
                                                                  BoxShape.circle,
                                                              border: Border.all(
                                                                  width: AppDimensions.height10(
                                                                          context) *
                                                                      0.3,
                                                                  color: Colors
                                                                      .white),
                                                              color: Colors
                                                                  .transparent),
                                                          child: Container(
                                                              child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                getFormattedDay(
                                                                        next)
                                                                    .substring(
                                                                        0, 3),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        AppDimensions.font10(
                                                                                context) *
                                                                            1.2,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              Text(
                                                                '${getFormattedDate(next).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(next).split('-').reversed.join().substring(2, 4)}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        AppDimensions.font10(
                                                                                context) *
                                                                            1.4,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              Container(
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    2.5,
                                                                width: AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    2.5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border.all(
                                                                      width: AppDimensions.height10(
                                                                              context) *
                                                                          0.1,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                child: Container(
                                                                    width: AppDimensions
                                                                            .width10(
                                                                                context) *
                                                                        1.7,
                                                                    height: AppDimensions
                                                                            .width10(
                                                                                context) *
                                                                        1.5,

                                                                    // margin: const EdgeInsets.only(left: 1),
                                                                    child: Center(
                                                                      child: Text(
                                                                        '${responseData['nextCompletePractice']}/${responseData['nextTotalPratice']}',
                                                                        style: TextStyle(
                                                                            fontSize: AppDimensions.font10(context) *
                                                                                1.0,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            color:
                                                                                Colors.white),
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
                                            width:
                                                AppDimensions.width10(context) *
                                                    34.3,
                                            height:
                                                AppDimensions.height10(context) *
                                                    4.9,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    18.9),
                                            child: Text(
                                              'No planned sessions',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  height: AppDimensions.height10(
                                                          context) *
                                                      0.12,
                                                  color: Colors.white,
                                                  fontSize: AppDimensions.font10(
                                                          context) *
                                                      3.0,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Laila'),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    26.9,
                                            height:
                                                AppDimensions.height10(context) *
                                                    5.8,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    0.2),
                                            child: Text(
                                              'There are no scheduled\npractices for this date.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  height: AppDimensions.height10(
                                                          context) *
                                                      0.12,
                                                  fontFamily: 'Laila',
                                                  fontSize: AppDimensions.font10(
                                                          context) *
                                                      1.8,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          AnimatedScaleButton(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page: const record_session(
                                                    past_session: false,
                                                  )));
                                            },
                                            child: Container(
                                              width:
                                                  AppDimensions.width10(context) *
                                                      10.1,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  10.1,
                                              margin: EdgeInsets.only(
                                                  top: AppDimensions.height10(
                                                          context) *
                                                      1.4),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              0.3,
                                                      color: Colors.white)),
                                              child: Center(
                                                child: Text(
                                                  'View\npractice',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      height:
                                                          AppDimensions.height10(
                                                                  context) *
                                                              0.12,
                                                      fontFamily: 'laila',
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.6,
                                                      //add 2 px font size from feedback
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ])))
                                : SizedBox(
                                    width: double.infinity,
                                    height:
                                        AppDimensions.height10(context) * 19.2,
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,

                                        child: Column(children: [
                                          Container(
                                            //  color: Colors.red,
                                            height:
                                                AppDimensions.height10(context) *
                                                    19.2,
                                            // width: AppDimensions.width10(context) * 39.2,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              controller: _scrollController,
                                              child: Row(
                                                children: [
                                                  AnimatedScaleButton(
                                                    onTap: () {
                                                      previous();
                                                      setState(() {
                                                        Loader = true;
                                                      });
                                                      fetchPracticeByDay();
                                                    },
                                                    child: Container(
                                                      height:
                                                          AppDimensions.height10(
                                                                  context) *
                                                              7.9,
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              7.9,
                                                      margin: EdgeInsets.only(
                                                          top: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              8.4),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            width: 3,
                                                            color: Colors.white),
                                                        gradient:
                                                            const LinearGradient(
                                                                begin: Alignment
                                                                    .topCenter,
                                                                end: Alignment
                                                                    .bottomCenter,
                                                                colors: [
                                                              Color(0xffF5F1E0),
                                                              Color(0xffEDDC97)
                                                            ]),
                                                      ),
                                                      child: Container(
                                                          child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            getFormattedDay(past)
                                                                .substring(0, 3),
                                                            style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .font10(
                                                                            context) *
                                                                    1.2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xff5B74A6)),
                                                          ),
                                                          Text(
                                                            '${getFormattedDate(past).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(past).split('-').reversed.join().substring(2, 4)}',
                                                            style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .font10(
                                                                            context) *
                                                                    1.4,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xff5B74A6)),
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
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Color(
                                                                        0xff156F6D)),
                                                            child: Container(
                                                                width: AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    1.7,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.5,

                                                                // margin: const EdgeInsets.only(left: 1),
                                                                child: Center(
                                                                  child: Text(
                                                                    '${responseData['previousCompletePractice']}/${responseData['previousTotalPractice']}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            AppDimensions.font10(context) *
                                                                                1.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                )),
                                                          )
                                                        ],
                                                      )),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: AppDimensions.height10(
                                                            context) *
                                                        8.3,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            8.3,
                                                    margin: const EdgeInsets.only(
                                                        right: 121, left: 121),
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            width: 1,
                                                            color: Colors.white),
                                                        color:
                                                            Colors.transparent),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     FadePageRoute(
                                                        //         page: const view_goals(
                                                        //             missed: false)));
                                                      },
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            7.9,
                                                        width:
                                                            AppDimensions.width10(
                                                                    context) *
                                                                7.9,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                width: 3,
                                                                color:
                                                                    Colors.white),
                                                            gradient: const LinearGradient(
                                                                begin: Alignment
                                                                    .topCenter,
                                                                end: Alignment
                                                                    .bottomCenter,
                                                                colors: [
                                                                  Color(
                                                                      0xffCCCCCA),
                                                                  Color(
                                                                      0xff5E5D5C)
                                                                ])),
                                                        child: Stack(
                                                            alignment:
                                                                Alignment.center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const Alignment(
                                                                        0, 0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      getFormattedDay(
                                                                              current)
                                                                          .substring(
                                                                              0,
                                                                              3),
                                                                      style: TextStyle(
                                                                          height: AppDimensions.height10(context) *
                                                                              0.12,
                                                                          fontSize:
                                                                              AppDimensions.font10(context) *
                                                                                  1.2,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w600,
                                                                          color: const Color(
                                                                              0xFFFBFBFB)),
                                                                    ),
                                                                    Text(
                                                                      '${getFormattedDate(current).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(current).split('-').reversed.join().substring(2, 4)}',
                                                                      style: TextStyle(
                                                                          height: AppDimensions.height10(context) *
                                                                              0.12,
                                                                          color: const Color(
                                                                              0xFFFBFBFB),
                                                                          fontSize:
                                                                              AppDimensions.font10(context) *
                                                                                  1.4,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                    Container(
                                                                        height:
                                                                            AppDimensions.height10(context) *
                                                                                2.5,
                                                                        width: AppDimensions.height10(
                                                                                context) *
                                                                            2.5,
                                                                        margin: EdgeInsets.only(
                                                                            top: AppDimensions.height10(context) *
                                                                                0.3),
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          shape: BoxShape
                                                                              .circle,
                                                                        ),
                                                                        child:
                                                                            DottedBorder(
                                                                          borderType:
                                                                              BorderType.Circle,
                                                                          color: Colors
                                                                              .white,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              '0/0',
                                                                              style: TextStyle(
                                                                                  fontSize: AppDimensions.font10(context) * 1.0,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: Colors.white),
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
                                                  AnimatedScaleButton(
                                                    onTap: () {
                                                      if (!maxViewDate) {
                                                        setState(() {
                                                          Loader = true;
                                                        });
                                                        future();
                                                        fetchPracticeByDay();
                                                      }
                                                    },
                                                    child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            7.9,
                                                        width:
                                                            AppDimensions.width10(
                                                                    context) *
                                                                7.9,
                                                        margin: EdgeInsets.only(
                                                          top: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              8.4,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  0.3,
                                                              color:
                                                                  Colors.white),
                                                          gradient: const LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(0xffF5F1E0),
                                                                Color(0xffEDDC97)
                                                              ]),
                                                        ),
                                                        child: Container(
                                                            child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              getFormattedDay(
                                                                      next)
                                                                  .substring(
                                                                      0, 3),
                                                              style: TextStyle(
                                                                  fontSize: AppDimensions
                                                                          .font10(
                                                                              context) *
                                                                      1.2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: const Color(
                                                                      0xff5B74A6)),
                                                            ),
                                                            Text(
                                                              '${getFormattedDate(next).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(next).split('-').reversed.join().substring(2, 4)}',
                                                              style: TextStyle(
                                                                  fontSize: AppDimensions
                                                                          .font10(
                                                                              context) *
                                                                      1.4,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: const Color(
                                                                      0xff5B74A6)),
                                                            ),
                                                            Container(
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  2.5,
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  2.5,
                                                              decoration: const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Color(
                                                                      0xff156F6D)),
                                                              child: Container(
                                                                  width: AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      1.7,
                                                                  height: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.5,

                                                                  // margin: const EdgeInsets.only(left: 1),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '${responseData['nextCompletePractice']}/${responseData['nextTotalPratice']}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              AppDimensions.font10(context) *
                                                                                  1.0,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w400,
                                                                          color: Colors
                                                                              .white),
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
                                            width:
                                                AppDimensions.width10(context) *
                                                    34.3,
                                            height:
                                                AppDimensions.height10(context) *
                                                    4.9,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    18.9),
                                            child: Center(
                                              child: Text(
                                                'No sessions',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            3.0,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Laila'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    26.9,
                                            height:
                                                AppDimensions.height10(context) *
                                                    5.8,
                                            child: Center(
                                              child: Text(
                                                'There are no recorded\npractices for this date.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Laila',
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.15,
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.8,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                AppDimensions.height10(context) *
                                                    1.4,
                                          ),
                                          AnimatedScaleButton(
                                            onTap: () async {
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page: const record_session(
                                                    past_session: true,
                                                  )));
                                              final SharedPreferences prefs =
                                                  await _prefs;
                                              prefs.setString(
                                                  'record_date',
                                                  getFormattedDate(current)
                                                      .toString());
                                            },
                                            child: Container(
                                              width:
                                                  AppDimensions.width10(context) *
                                                      10.1,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  10.1,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              0.3,
                                                      color: Colors.white)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      height: AppDimensions.height10(
                                                              context) *
                                                          3.5,
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              3.5,
                                                      padding: EdgeInsets.all(
                                                          AppDimensions.height10(
                                                                  context) *
                                                              0.6),
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              width: 1,
                                                              color:
                                                                  Colors.white),
                                                          color:
                                                              Colors.transparent),
                                                      child: Image.asset(
                                                        'assets/images/Add goal.webp',
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.9,
                                                        width:
                                                            AppDimensions.width10(
                                                                    context) *
                                                                2.9,
                                                      )),
                                                  Container(
                                                    child: Center(
                                                      child: Text(
                                                        'Add\npractice',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: 'laila',
                                                            fontSize: AppDimensions
                                                                    .font10(
                                                                        context) *
                                                                1.4,
                                                            fontWeight:
                                                                FontWeight.w400),
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
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 19.2,
                                      width:
                                          AppDimensions.width10(context) * 45.7,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: const Alignment(-1, 1),
                                            child: AnimatedScaleButton(
                                              onTap: () {
                                                previous();
                                                setState(() {
                                                  Loader = true;
                                                });
                                                fetchPracticeByDay();
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
                                                        8.4),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 3,
                                                        color: Colors.white),
                                                    color: Colors.transparent),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      getFormattedDay(past)
                                                          .substring(0, 3),
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.2,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${getFormattedDate(past).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(past).split('-').reversed.join().substring(2, 4)}',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Container(
                                                      height:
                                                          AppDimensions.height10(
                                                                  context) *
                                                              2.7,
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              2.7,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 3.32),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            width: 1,
                                                            color: Colors.white),
                                                      ),
                                                      child: Container(
                                                          width: AppDimensions
                                                                  .width10(
                                                                      context) *
                                                              1.7,
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.5,
                                                          margin: EdgeInsets.only(
                                                              top: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  0.2),
                                                          // margin: const EdgeInsets.only(left: 1),
                                                          child: const Center(
                                                            child: Text(
                                                              '0/2',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const Alignment(0, 0),
                                            child: Container(
                                              width:
                                                  AppDimensions.width10(context) *
                                                      8.3,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  8.3,
                                              //  margin: EdgeInsets.only(right: 121, left: 121),
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              0.1,
                                                      color: Colors.white),
                                                  color: Colors.transparent),
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
                                                        width:
                                                            AppDimensions.width10(
                                                                    context) *
                                                                0.3,
                                                        color: Colors.white),
                                                    color: Colors.transparent),
                                                child: Stack(children: [
                                                  Align(
                                                    alignment:
                                                        const Alignment(0, 0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          getFormattedDay(current)
                                                              .substring(0, 3),
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.4,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          '${getFormattedDate(current).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(current).split('-').reversed.join().substring(2, 4)}',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.3,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Container(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.5,
                                                            width:
                                                                AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    2.5,
                                                            margin: EdgeInsets.only(
                                                                top: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.202),
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape:
                                                                  BoxShape.circle,
                                                            ),
                                                            child: DottedBorder(
                                                              borderType:
                                                                  BorderType
                                                                      .Circle,
                                                              color: Colors.white,
                                                              child: Center(
                                                                child: Text(
                                                                  '0/0',
                                                                  style: TextStyle(
                                                                      fontSize: AppDimensions
                                                                          .font10(
                                                                              context),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const Alignment(1, 1),
                                            child: AnimatedScaleButton(
                                              onTap: () {
                                                setState(() {
                                                  Loader = true;
                                                });
                                                future();
                                                fetchPracticeByDay();
                                              },
                                              child: Container(
                                                  height: AppDimensions.height10(
                                                          context) *
                                                      7.9,
                                                  width:
                                                      AppDimensions.height10(
                                                              context) *
                                                          7.9,
                                                  margin: const EdgeInsets.only(
                                                    top: 84,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: AppDimensions
                                                                  .width10(
                                                                      context) *
                                                              0.3,
                                                          color: Colors.white),
                                                      color: Colors.transparent),
                                                  child: Container(
                                                      //margin: const EdgeInsets.only(top: 10.52),
                                                      child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        getFormattedDay(next)
                                                            .substring(0, 3),
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .font10(
                                                                        context) *
                                                                1.2,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white),
                                                      ),
                                                      Text(
                                                        '${getFormattedDate(next).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(next).split('-').reversed.join().substring(2, 4)}',
                                                        style: const TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                      Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.7,
                                                        width:
                                                            AppDimensions.width10(
                                                                    context) *
                                                                2.7,
                                                        margin:
                                                            const EdgeInsets.only(
                                                                top: 3.32),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              width: 1,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        child: Container(
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.7,
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.5,
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 3.32),
                                                            // margin: const EdgeInsets.only(left: 1),
                                                            child: Center(
                                                              child: Text(
                                                                '0/2',
                                                                style: TextStyle(
                                                                    fontSize: AppDimensions
                                                                        .font10(
                                                                            context),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white),
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
                                    // width: 343,
                                    // height: 49,
                                    margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) * 14.9,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'All your practices\nare inactive',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    3.0,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Laila'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: 269,
                                    // height: 58,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            1.8),
                                    child: Center(
                                      child: Text(
                                        "You don’t have any active or\nplanned practices. Please view\nyour current goals to manage\nand update your practices.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Laila',
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.8,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  AnimatedScaleButton(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const view_all_goals_menu()));
                                    },
                                    child: Container(
                                        height:
                                            AppDimensions.height10(context) * 5.0,
                                        width:
                                            AppDimensions.width10(context) * 24.3,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(context) *
                                                4.6),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xffFCC10D),
                                                Color(0xffFDA210),
                                              ]),
                                          borderRadius: BorderRadius.circular(
                                              AppDimensions.height10(context) *
                                                  5.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'View all goals',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.6,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'poppins'),
                                          ),
                                        )),
                                  )
                                ])))
                    : const DashBoardBehaviour_shimmer())),
      ),
    );
  }
}

class noActivity extends StatelessWidget {
  const noActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: AppDimensions.height10(context) * 19.2,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: AppDimensions.height10(context) * 19.2,
                  width: AppDimensions.width10(context) * 45.7,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(-1, 1),
                        child: AnimatedScaleButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const no_past_session(
                                  missed: false,
                                )));
                          },
                          child: Container(
                            height: AppDimensions.height10(context) * 7.9,
                            width: AppDimensions.width10(context) * 7.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 8.4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                color: Colors.transparent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'MON',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.2,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                const Text(
                                  '02.06',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  height: AppDimensions.height10(context) * 2.7,
                                  width: AppDimensions.width10(context) * 2.7,
                                  margin: const EdgeInsets.only(top: 3.32),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                  ),
                                  child: Container(
                                      width:
                                          AppDimensions.height10(context) * 1.7,
                                      height:
                                          AppDimensions.height10(context) * 1.5,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              0.2),
                                      // margin: const EdgeInsets.only(left: 1),
                                      child: const Center(
                                        child: Text(
                                          '0/2',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0, 0),
                        child: Container(
                          width: AppDimensions.width10(context) * 8.3,
                          height: AppDimensions.height10(context) * 8.3,
                          //  margin: EdgeInsets.only(right: 121, left: 121),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.width10(context) * 0.1,
                                  color: Colors.white),
                              color: Colors.transparent),
                          child: Container(
                            height: AppDimensions.height10(context) * 7.9,
                            width: AppDimensions.width10(context) * 7.9,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.3,
                                    color: Colors.white),
                                color: Colors.transparent),
                            child: Stack(children: [
                              Align(
                                alignment: const Alignment(0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'TUE',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '02.07',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.3,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.5,
                                        width: AppDimensions.width10(context) *
                                            2.5,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.202),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: DottedBorder(
                                          borderType: BorderType.Circle,
                                          color: Colors.white,
                                          child: Center(
                                            child: Text(
                                              '0/0',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                          context),
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(1, 1),
                        child: AnimatedScaleButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const no_planned_session(
                                  missed: false,
                                )));
                          },
                          child: Container(
                              height: AppDimensions.height10(context) * 7.9,
                              width: AppDimensions.width10(context) * 7.9,
                              margin: const EdgeInsets.only(
                                top: 84,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width:
                                          AppDimensions.height10(context) * 0.3,
                                      color: Colors.white),
                                  color: Colors.transparent),
                              child: Container(
                                  //margin: const EdgeInsets.only(top: 10.52),
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'MON',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.2,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  const Text(
                                    '03.07',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 2.7,
                                    width: AppDimensions.width10(context) * 2.7,
                                    margin: const EdgeInsets.only(top: 3.32),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                    ),
                                    child: Container(
                                        width: AppDimensions.width10(context) *
                                            1.7,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.5,
                                        margin:
                                            const EdgeInsets.only(top: 3.32),
                                        // margin: const EdgeInsets.only(left: 1),
                                        child: Center(
                                          child: Text(
                                            '0/2',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                        context),
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
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
                // width: 343,
                // height: 49,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 14.9,
                    bottom: AppDimensions.height10(context) * 2.2),
                child: Center(
                  child: Text(
                    'All your practices are\ninactive',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 3.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                // width: 269,
                // height: 58,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.2),
                child: Center(
                  child: Text(
                    "You don’t have any active or\nplanned practices. Please view\nyour current goals to manage\nand update your practices.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Laila',
                        fontSize: AppDimensions.font10(context) * 1.8,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              AnimatedScaleButton(
                onTap: () {},
                child: Container(
                    height: AppDimensions.height10(context) * 5.0,
                    width: AppDimensions.width10(context) * 24.3,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 4.6),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFCC10D),
                            Color(0xffFDA210),
                          ]),
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 5.0),
                    ),
                    child: Center(
                      child: Text(
                        'View all goals',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.font10(context) * 1.6,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'poppins'),
                      ),
                    )),
              )
            ])));
  }
}
