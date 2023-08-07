// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/API/PracticeModal.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_noPast_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_no_planned_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_record_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/goal_menu_missed_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/loaders/dashboard_behaviour_shimmer.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/bottom_navigation.dart';
import '../../Widgets/fading.dart';
import '../../Widgets/mult_circles.dart';
import '../../utils/app_dimensions.dart';
import 'calender_bottom_sheet.dart';
import 'menu_dashboard_behaviour.dart';

class view_goals extends StatefulWidget {
  final bool missed;

  const view_goals({super.key, required this.missed});

  @override
  State<view_goals> createState() => _view_goalsState();
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class _view_goalsState extends State<view_goals> {
  var allGoals;
  var allPractice;
  bool noActive = false;
  bool Loader = true;
  int removeDay = 0;

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

  @override
  void initState() {
    super.initState();
    // _fetchUserGoal();
    fetchPracticeByDay();
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

  void fetchPracticeByDay() {
    PracticeGoalApi.getUserPracticeByDay(getFormattedDate(current))
        .then((response) {
      print(response);
      print("Api Called");

      if (response != false) {
        setState(() {
          allGoals = response['filteredUserPractices'];
          noActive = false;
        });
        print('====================');
        print(noActive);
        print(allGoals.length);
        loadData();
        print(allGoals[0]['userGoal']['color']);
        print('====================');
      } else if (response == false) {
        loadData();
        setState(() {
          noActive = true;
        });
      }
      print('______________________________-----------------------');
      //print(allGoals.length);
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
    print("LoadingCompleted");
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
                      Navigator.push(
                          context,
                          FadePageRoute(
                              page: record_session(
                            past_session: true,
                            day: getFormattedDay(current),
                            id: allGoals[0]['userGoalId'],
                          )));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.7),
                      child: Image.asset(
                        'assets/images/Add goal.webp',
                        height: AppDimensions.height10(context) * 2.4,
                        width: AppDimensions.height10(context) * 2.4,
                      ),
                    ),
                  ),
                  GestureDetector(
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
                              print(current);
                              print(next);
                              print(past);
                            },
                          );
                        },
                      );

                      /*
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: AppDimensions.height10(context) * 30.3,
                              child: Column(
                                children: [
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 3.8,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: const Color(0xFF828282),
                                                width: AppDimensions.height10(
                                                        context) *
                                                    0.1))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                5.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.1,
                                            margin: EdgeInsets.only(
                                                right: AppDimensions.height10(
                                                        context) *
                                                    2.0),
                                            child: Text(
                                              'Cancel',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFF2F80ED)),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                3.7,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.1,
                                            margin: EdgeInsets.only(
                                                right: AppDimensions.height10(
                                                        context) *
                                                    1.9),
                                            child: Text(
                                              'Done',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFF2F80ED)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 26.0,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (DateTime value) {},
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                   */
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Mask Group.webp'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: AppDimensions.height10(context) * 79.8,
            child: Loader == false
                ? noActive == false
                    ? SizedBox(
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
                                    child: AnimatedScaleButton(
                                      onTap: () {
                                        setState(() {
                                          Loader = true;

                                          // past = past - 1;
                                          // next = next - 1;
                                        });
                                        previous();
                                        print('$current');
                                        fetchPracticeByDay();
                                        // Navigator.push(
                                        //     context,
                                        //     FadePageRoute(
                                        //         page: no_past_session(
                                        //       missed: widget.missed,
                                        //     )));
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
                                                    getFormattedDay(past)
                                                        .substring(0, 3),
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
                                                    '${getFormattedDate(past).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(past).split('-').reversed.join().substring(2, 4)}',
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
                                                  getFormattedDay(current)
                                                      .substring(0, 3),
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
                                                  '${getFormattedDate(current).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(current).split('-').reversed.join().substring(2, 4)}',
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
                                    child: AnimatedScaleButton(
                                      onTap: () {
                                        setState(() {
                                          Loader = true;
                                        });
                                        future();
                                        fetchPracticeByDay();
                                        // Navigator.push(
                                        //     context,
                                        //     FadePageRoute(
                                        //         page: no_planned_session(
                                        //       missed: widget.missed,
                                        //     )));
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
                                                getFormattedDay(next)
                                                    .substring(0, 3),
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
                                                '${getFormattedDate(next).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(next).split('-').reversed.join().substring(2, 4)}',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff5B74A6)),
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
                                                      color: const Color(
                                                          0xFFFBFBFB)),
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
                              top: AppDimensions.height10(context) * 23.0,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
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
                                            Column(
                                              children: [
                                                Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      35.6,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.2,
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
                                                  child: Column(children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        allGoals[index]
                                                                    ['schedule']
                                                                [0]['time1']
                                                            .toString()
                                                            .substring(0, 5),
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
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.2,
                                                      color: Colors.white,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        allGoals[index]
                                                                    ['schedule']
                                                                [0]['time1']
                                                            .toString()
                                                            .substring(5, 7)
                                                            .toUpperCase(),
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
                                                    ),
                                                  ]),
                                                ),
                                                Column(
                                                  children: [
                                                    AnimatedScaleButton(
                                                      onTap: () async {
                                                        final SharedPreferences
                                                            prefs =
                                                            await _prefs;
                                                        var pracName =
                                                            prefs.setString(
                                                                'dash_pracName',
                                                                allGoals[index]
                                                                    ['name']);
                                                        var time = prefs.setString(
                                                            'recording_Time1',
                                                            allGoals[index]
                                                                    ['schedule']
                                                                [0]['time1']);
                                                        var date =
                                                            prefs.setString(
                                                                'record_date',
                                                                getFormattedDate(
                                                                    current));
                                                        var goalName =
                                                            prefs.setString(
                                                                'dash_goalName',
                                                                allGoals[index][
                                                                        'userGoal']
                                                                    ['name']);
                                                        var pracColor = allGoals[
                                                                        index]
                                                                    ['color'] !=
                                                                null
                                                            ? prefs.setString(
                                                                'dash_pracColor',
                                                                allGoals[index]
                                                                    ['color'])
                                                            : prefs.setString(
                                                                'dash_pracColor',
                                                                '0');
                                                        var goalColor = allGoals[
                                                                            index]
                                                                        [
                                                                        'userGoal']
                                                                    ['color'] !=
                                                                null
                                                            ? prefs.setString(
                                                                'dash_goalColor',
                                                                allGoals[index][
                                                                        'userGoal']
                                                                    ['color'])
                                                            : '0';
                                                        if (allGoals[index][
                                                                'recordingStatusTime1'] ==
                                                            "Not Started") {
                                                          print("CON 2");
                                                          // ignore: use_build_context_synchronously
                                                          Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page: practiceMenu(
                                                                      goal_eval:
                                                                          false,
                                                                      goalName: allGoals[index]
                                                                              ['userGoal']
                                                                          [
                                                                          'name'],
                                                                      pracName:
                                                                          allGoals[index]
                                                                              [
                                                                              'name'],
                                                                      pracColor: allGoals[index]['color'] ==
                                                                              null
                                                                          ? "0"
                                                                          : allGoals[index]['color']
                                                                              .toString(),
                                                                      color: allGoals[index]['userGoal']['color'] !=
                                                                              null
                                                                          ? allGoals[index]['userGoal']['color']
                                                                              .toString()
                                                                          : "0")));
                                                        } else if (allGoals[
                                                                    index][
                                                                'recordingStatusTime1'] ==
                                                            "missed") {
                                                          print("CON 3");
                                                          Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page:
                                                                       missed_Menu(pracName:  allGoals[index]
                                                                              [
                                                                              'name'],)));
                                                        } else {
                                                          print("CON 1");
                                                          print(
                                                              "${allGoals[index]['color']}");
                                                          // ignore: use_build_context_synchronously
                                                          Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page:
                                                                      const menu_behaviour()));
                                                        }
                                                      },
                                                      child: Center(
                                                          child: align_circles(
                                                        asset_1: allGoals[index]
                                                                        ['userGoal']
                                                                    ['color'] ==
                                                                1
                                                            ? "assets/images/red_gradient.webp"
                                                            : allGoals[index]
                                                                            ['userGoal']
                                                                        [
                                                                        'color'] ==
                                                                    2
                                                                ? 'assets/images/orange_moon.webp'
                                                                : allGoals[index]['userGoal']
                                                                            [
                                                                            'color'] ==
                                                                        3
                                                                    ? "assets/images/lightGrey_gradient.webp"
                                                                    : allGoals[index]['userGoal']['color'] ==
                                                                            4
                                                                        ? "assets/images/lightBlue_gradient.webp"
                                                                        : allGoals[index]['userGoal']['color'] ==
                                                                                5
                                                                            ? "assets/images/medBlue_gradient.webp"
                                                                            : allGoals[index]['userGoal']['color'] == 6
                                                                                ? "assets/images/Blue_gradient.webp"
                                                                                : 'assets/images/orange_moon.webp',
                                                        s_circle_text:
                                                            allGoals[index]
                                                                ['name'],
                                                        asset_2: allGoals[index][
                                                                    'recordingStatusTime1'] ==
                                                                "missed"
                                                            ? allGoals[index][
                                                                        'color'] ==
                                                                    1
                                                                ? 'assets/images/Missed_3.webp'
                                                                : allGoals[index]['color'] ==
                                                                        2
                                                                    ? 'assets/images/Missed_1.webp'
                                                                    : allGoals[index]['color'] ==
                                                                            3
                                                                        ? "assets/images/Missed_2.webp"
                                                                        : allGoals[index]['color'] ==
                                                                                4
                                                                            ? "assets/images/Missed_4.webp"
                                                                            : allGoals[index]['color'] ==
                                                                                    5
                                                                                ? "assets/images/Missed_4.webp"
                                                                                : 'assets/images/Missed_2.webp'
                                                            : allGoals[index][
                                                                        'recordingStatusTime1'] ==
                                                                    "completed"
                                                                ? allGoals[index]
                                                                            ['color'] ==
                                                                        1
                                                                    ? "assets/images/Practice_Completed_1.webp"
                                                                    : allGoals[index]['color'] == 2
                                                                        ? 'assets/images/Practice_Completed_2.webp'
                                                                        : allGoals[index]['color'] == 3
                                                                            ? "assets/images/Practice_Completed_3.webp"
                                                                            : allGoals[index]['color'] == 4
                                                                                ? "assets/images/Practice_Completed_4.webp"
                                                                                : allGoals[index]['color'] == 5
                                                                                    ? "assets/images/Practice_Completed_4.webp"
                                                                                    : 'assets/images/Practice_Completed_2.webp'
                                                                : allGoals[index]['color'] == 1
                                                                    ? "assets/images/Ellipse orange_wb.webp"
                                                                    : allGoals[index]['color'] == 2
                                                                        ? 'assets/images/Ellipse 158_wb.webp'
                                                                        : allGoals[index]['color'] == 3
                                                                            ? "assets/images/Ellipse 157_wb.webp"
                                                                            : allGoals[index]['color'] == 4
                                                                                ? "assets/images/Ellipse light-blue_wb.webp"
                                                                                : allGoals[index]['color'] == 5
                                                                                    ? "assets/images/Ellipse blue_wb.webp"
                                                                                    : 'assets/images/Ellipse 158_wb.webp',
                                                        head_text:
                                                            allGoals[index]
                                                                    ['userGoal']
                                                                ['name'],
                                                        body_text: allGoals[
                                                                        index]
                                                                    ['userGoal']
                                                                [
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
                                                            allGoals[index][
                                                                        'recordingStatusTime1'] ==
                                                                    "missed"
                                                                ? 0xffFD6727
                                                                : 0xFFFBFBFB,
                                                      )),
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.0,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            allGoals[index]['schedule'][0]
                                                        ['time2']
                                                    .toString()
                                                    .isNotEmpty
                                                ? Column(
                                                    children: [
                                                      Container(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            35.6,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.2,
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
                                                        child:
                                                            Column(children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              allGoals[index][
                                                                          'schedule'][0]
                                                                      ['time2']
                                                                  .toString()
                                                                  .substring(
                                                                      0, 5),
                                                              style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          Divider(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.2,
                                                            color: Colors.white,
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              allGoals[index][
                                                                          'schedule'][0]
                                                                      ['time2']
                                                                  .toString()
                                                                  .substring(
                                                                      5, 7)
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                      ),
                                                      Column(
                                                        children: [
                                                          AnimatedScaleButton(
                                                            onTap: () async {
                                                              final SharedPreferences
                                                                  prefs =
                                                                  await _prefs;
                                                              var pracId =
                                                                  prefs.setInt(
                                                                      'prac_num',
                                                                      allGoals[
                                                                              index]
                                                                          [
                                                                          'id']);
                                                              var pracName = prefs.setString(
                                                                  'dash_pracName',
                                                                  allGoals[
                                                                          index]
                                                                      ['name']);
                                                              var goalName = prefs.setString(
                                                                  'dash_goalName',
                                                                  allGoals[index]
                                                                          [
                                                                          'userGoal']
                                                                      ['name']);
                                                              var date = prefs.setString(
                                                                  'recordDate',
                                                                  getFormattedDate(
                                                                      current));
                                                              var pracColor = allGoals[
                                                                              index]
                                                                          [
                                                                          'color'] !=
                                                                      null
                                                                  ? prefs.setString(
                                                                      'dash_pracColor',
                                                                      allGoals[
                                                                              index]
                                                                          [
                                                                          'color'])
                                                                  : prefs.setString(
                                                                      'dash_pracColor',
                                                                      '0');
                                                              var time = prefs.setString(
                                                                  'recording_Time1',
                                                                  allGoals[index]
                                                                          [
                                                                          'schedule'][0]
                                                                      [
                                                                      'time2']);
                                                              var dash_boardRoute =
                                                                  prefs.setBool(
                                                                      'behaviour_route',
                                                                      true);
                                                              var goalColor = allGoals[index]
                                                                              ['userGoal']
                                                                          [
                                                                          'color'] !=
                                                                      null
                                                                  ? prefs.setString(
                                                                      'dash_goalColor',
                                                                      allGoals[index]
                                                                              [
                                                                              'userGoal']
                                                                          [
                                                                          'color'])
                                                                  : '0';
                                                              if (allGoals[
                                                                          index]
                                                                      [
                                                                      'recordingStatusTime2'] ==
                                                                  "Not Started") {
                                                                print("CON 2");
                                                                // ignore: use_build_context_synchronously
                                                                Navigator.push(
                                                                    context,
                                                                    FadePageRoute(
                                                                        page: practiceMenu(
                                                                            goal_eval:
                                                                                false,
                                                                            goalName: allGoals[index]['userGoal'][
                                                                                'name'],
                                                                            pracName: allGoals[index][
                                                                                'name'],
                                                                            pracColor: allGoals[index]['color'] == null
                                                                                ? "0"
                                                                                : allGoals[index]['color'].toString(),
                                                                            color: allGoals[index]['userGoal']['color'] != null ? allGoals[index]['userGoal']['color'].toString() : "0")));
                                                              } else if (allGoals[
                                                                          index]
                                                                      [
                                                                      'recordingStatusTime2'] ==
                                                                  "missed") {
                                                                print("CON 3");
                                                                Navigator.push(
                                                                    context,
                                                                    FadePageRoute(
                                                                        page:
                                                                           missed_Menu(pracName:  allGoals[index]
                                                                              [
                                                                              'name'],)));
                                                              } else {
                                                                print("CON 1");
                                                                print(
                                                                    "${allGoals[index]['color']}");
                                                                // ignore: use_build_context_synchronously
                                                                Navigator.push(
                                                                    context,
                                                                    FadePageRoute(
                                                                        page:
                                                                            const menu_behaviour()));
                                                              }
                                                            },
                                                            child: Center(
                                                                child:
                                                                    align_circles(
                                                              asset_1: allGoals[index]
                                                                              [
                                                                              'userGoal']
                                                                          [
                                                                          'color'] ==
                                                                      1
                                                                  ? "assets/images/red_gradient.webp"
                                                                  : allGoals[index]['userGoal']
                                                                              [
                                                                              'color'] ==
                                                                          2
                                                                      ? 'assets/images/orange_moon.webp'
                                                                      : allGoals[index]['userGoal']['color'] ==
                                                                              3
                                                                          ? "assets/images/lightGrey_gradient.webp"
                                                                          : allGoals[index]['userGoal']['color'] == 4
                                                                              ? "assets/images/lightBlue_gradient.webp"
                                                                              : allGoals[index]['userGoal']['color'] == 5
                                                                                  ? "assets/images/medBlue_gradient.webp"
                                                                                  : allGoals[index]['userGoal']['color'] == 6
                                                                                      ? "assets/images/Blue_gradient.webp"
                                                                                      : 'assets/images/orange_moon.webp',
                                                              s_circle_text:
                                                                  allGoals[
                                                                          index]
                                                                      ['name'],
                                                              asset_2: allGoals[
                                                                              index]
                                                                          [
                                                                          'recordingStatusTime2'] ==
                                                                      "missed"
                                                                  ? allGoals[index]
                                                                              [
                                                                              'color'] ==
                                                                          1
                                                                      ? 'assets/images/Missed_3.webp'
                                                                      : allGoals[index]['color'] ==
                                                                              2
                                                                          ? 'assets/images/Missed_1.webp'
                                                                          : allGoals[index]['color'] == 3
                                                                              ? "assets/images/Missed_2.webp"
                                                                              : allGoals[index]['color'] == 4
                                                                                  ? "assets/images/Missed_4.webp"
                                                                                  : allGoals[index]['color'] == 5
                                                                                      ? "assets/images/Missed_4.webp"
                                                                                      : 'assets/images/Missed_2.webp'
                                                                  : allGoals[index]['recordingStatusTime2'] == "completed"
                                                                      ? allGoals[index]['color'] == 1
                                                                          ? "assets/images/Practice_Completed_1.webp"
                                                                          : allGoals[index]['color'] == 2
                                                                              ? 'assets/images/Practice_Completed_2.webp'
                                                                              : allGoals[index]['color'] == 3
                                                                                  ? "assets/images/Practice_Completed_3.webp"
                                                                                  : allGoals[index]['color'] == 4
                                                                                      ? "assets/images/Practice_Completed_4.webp"
                                                                                      : allGoals[index]['color'] == 5
                                                                                          ? "assets/images/Practice_Completed_4.webp"
                                                                                          : 'assets/images/Practice_Completed_2.webp'
                                                                      : allGoals[index]['color'] == 1
                                                                          ? "assets/images/Ellipse orange_wb.webp"
                                                                          : allGoals[index]['color'] == 2
                                                                              ? 'assets/images/Ellipse 158_wb.webp'
                                                                              : allGoals[index]['color'] == 3
                                                                                  ? "assets/images/Ellipse 157_wb.webp"
                                                                                  : allGoals[index]['color'] == 4
                                                                                      ? "assets/images/Ellipse light-blue_wb.webp"
                                                                                      : allGoals[index]['color'] == 5
                                                                                          ? "assets/images/Ellipse blue_wb.webp"
                                                                                          : 'assets/images/Ellipse 158_wb.webp',
                                                              head_text: allGoals[
                                                                          index]
                                                                      [
                                                                      'userGoal']
                                                                  ['name'],
                                                              body_text: allGoals[
                                                                          index]
                                                                      [
                                                                      'userGoal']
                                                                  [
                                                                  'identityStatement'][0]['text'],
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
                                                                  allGoals[index]
                                                                              [
                                                                              'recordingStatusTime2'] ==
                                                                          "missed"
                                                                      ? 0xffFD6727
                                                                      : 0xFFFBFBFB,
                                                            )),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                3.0,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        );
                                      })),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 13,
                                  )
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
                    : SizedBox(
                        width: double.infinity,
                        height: AppDimensions.height10(context) * 19.2,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(children: [
                              SizedBox(
                                height: AppDimensions.height10(context) * 19.2,
                                width: AppDimensions.height10(context) * 39.2,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
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
                                              AppDimensions.height10(context) *
                                                  7.9,
                                          width:
                                              AppDimensions.height10(context) *
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
                                                getFormattedDay(past)
                                                    .substring(0, 3),
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
                                                '${getFormattedDate(past).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(past).split('-').reversed.join().substring(2, 4)}',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff5B74A6)),
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
                                                    width:
                                                        AppDimensions.height10(
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
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )),
                                              )
                                            ],
                                          )),
                                        ),
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
                                            // Navigator.push(
                                            //     context,
                                            //     FadePageRoute(
                                            //         page: const view_goals(
                                            //             missed: false)));
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
                                                          getFormattedDay(
                                                                  current)
                                                              .substring(0, 3),
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
                                                          '${getFormattedDate(current).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(current).split('-').reversed.join().substring(2, 4)}',
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
                                      AnimatedScaleButton(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     FadePageRoute(
                                          //         page: const view_goals(
                                          //             missed: false)));
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
                                                  getFormattedDay(next)
                                                      .substring(0, 3),
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
                                                  '${getFormattedDate(next).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(next).split('-').reversed.join().substring(2, 4)}',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.4,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff5B74A6)),
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
                                  // Navigator.push(
                                  //     context,
                                  //     FadePageRoute(
                                  //         page: record_session(
                                  //             past_session: true,
                                  //             day: ,
                                  //             id: allGoals[0]['userGoalId'])));
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
                : const DashBoardBehaviour_shimmer()));
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
                  width: AppDimensions.height10(context) * 45.7,
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
                            width: AppDimensions.height10(context) * 7.9,
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
                                          AppDimensions.height10(context) * 1.2,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                const Text(
                                  '02.06',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  height: AppDimensions.height10(context) * 2.7,
                                  width: AppDimensions.height10(context) * 2.7,
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
                          width: AppDimensions.height10(context) * 8.3,
                          height: AppDimensions.height10(context) * 8.3,
                          //  margin: EdgeInsets.only(right: 121, left: 121),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.1,
                                  color: Colors.white),
                              color: Colors.transparent),
                          child: Container(
                            height: AppDimensions.height10(context) * 7.9,
                            width: AppDimensions.height10(context) * 7.9,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.3,
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
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '02.07',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.3,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.5,
                                        width: AppDimensions.height10(context) *
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
                              width: AppDimensions.height10(context) * 7.9,
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
                                            AppDimensions.height10(context) *
                                                1.2,
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
                                    width:
                                        AppDimensions.height10(context) * 2.7,
                                    margin: const EdgeInsets.only(top: 3.32),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                    ),
                                    child: Container(
                                        width: AppDimensions.height10(context) *
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
                        fontSize: AppDimensions.height10(context) * 3.0,
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
                        fontSize: AppDimensions.height10(context) * 1.8,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              AnimatedScaleButton(
                onTap: () {},
                child: Container(
                    height: AppDimensions.height10(context) * 5.0,
                    width: AppDimensions.height10(context) * 24.3,
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
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'poppins'),
                      ),
                    )),
              )
            ])));
  }
}
