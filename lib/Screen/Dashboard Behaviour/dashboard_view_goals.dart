import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/MyServices/Notification/notificationApis.dart';
import 'package:potenic_app/MyServices/Notification/notificationController.dart';
import 'package:potenic_app/Screen/Alerts/message_center.dart';
import 'package:potenic_app/Screen/Alerts/widgets/notificationSheet.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_record_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/goal_menu_missed_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/loaders/dashboard_behaviour_shimmer.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/widgets/dashboardUI.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/widgets/helpfulTips.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/widgets/noPlannedUi.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/widgets/noSessions.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/widgets/practiceSessionComponent.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/Widgets/redaMessage.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:potenic_app/utils/formattedTime.dart';
import 'package:potenic_app/utils/inappreview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../MyServices/Notification/emailLauncher.dart';
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
  bool loader = true;
  bool redaVisble = false;
 var getSubscription = '';
  bool maxViewDate = false;
  List<Map<String, dynamic>> timesList = [];
  int pastPracCompleted = -1;
  int presentPracCompleted = -1;
  int nextPracCompleted = -1;
  bool contain = false;
  bool single = false;
  int removeDay = 0;
  String recordDate = '';
  int goalLevel = 0;
  var notificationBody;
  var notificationRoute;
  var notificationId;
  var notificationUrl;
  final ScrollController _scrollController = ScrollController();
  bool isVisible = true;

  void _incrementValue() {
    setState(() {
      goalLevel++;
    });
  }

getUserNotifications(){
  notificationApi.getUserNotification();
}

  // getNotificationData() async {
  //   final notificationController controller = Get.find<notificationController>();
  //   notificationBody = controller.getNotificationBody;
  //   notificationRoute = controller.getNotificationRoute;
  //   notificationId = controller.getNotificationId;
  //   notificationUrl = controller.getNotificationUrl;
  //   print("Natification data: $notificationBody");
  // }

  Future<void> getGoalUpdates() async {
    final SharedPreferences prefs = await _prefs;
    var levelChange = prefs.getBool('goalLevelUpdate');
    var goalUpdate = prefs.getString('goalLevelUpOrDown');
    // var length = prefs.getInt('goalAchievedLenght');
     getSubscription = prefs.getString('subscriptionStatus').toString();
    var goalData = prefs.getString('goalAcieved');
    var newData = json.decode(goalData!);

    if (levelChange.toString() == 'true') {
      if (goalUpdate.toString() == 'up') {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context, FadePageRoute(page: const congratulations()));
        });
      } else if (goalUpdate.toString() == 'down') {
        print('Goal Achieved');
        Timer(const Duration(seconds: 5), () {
          goal_achieved_sheet(context, newData, getSubscription, 0);
        });
      }
      await prefs.setBool('goalLevelUpdate', false);
    }
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
    getUserNotifications();

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
        goalLevel = 1;
      });
    }
    getGoalUpdates();

  }


  void _scrollToCurrentIndex() {
    _scrollController.animateTo(
      noPlanned
          ? 20
          : noActive
              ? 35
              : 15,
      duration: const Duration(microseconds: 10),
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
              recordDate = parsedDate.toString();
            });

            if (difference.isNegative && difference != 0) {
              setState(() {
                noPlanned = false;
              });
            } else if (difference == 0) {
              setState(() {
                noPlanned = false;
              });
            } else {
              setState(() {
                noPlanned = true;
              });
            }
          }
        });
      } else if (response == 404) {
        setState(() {
          noData = true;
          loader = false;
        });
      }
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }


  void onDoneLoading() {
    setState(() {
      loader = false;
    });
    Future.delayed(
        const Duration(milliseconds: 50), () => _scrollToCurrentIndex());
  }

  getSixthday() {
    var currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var providedDate = getFormattedDate(current);

    // Check if the provided date is in the future
    if (DateTime.parse(providedDate).isBefore(DateTime.parse(currentDate))) {
    } else {
      var difference = DateTime.parse(providedDate)
          .difference(DateTime.parse(currentDate))
          .inDays;
      if (difference >= 6) {
        maxViewDate = true;
      } else {
        maxViewDate = false;
      }
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
   // getNotificationData();
    bool smallScreen = MediaQuery.of(context).size.height < 690;
    final notificationController notificationsController = Get.find<notificationController>();

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
                toolbarOpacity: 0.0,
                actions: [
                  Row(
                    children: [
                      noActive == true
                          ? AnimatedScaleButton(
                              onTap: () {
                                setState(() {
                                  loader = true;
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
                                    UpdatedDimensions.height10(context) * 1.32),
                                child: Image.asset(
                                  'assets/images/Asset 10 2.webp',
                                  height: UpdatedDimensions.width10(context) * 4.0,
                                  width: UpdatedDimensions.width10(context) * 3.977,
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
                              right: UpdatedDimensions.width10(context) * 1.7),
                          child: Image.asset(
                            'assets/images/Add goal.webp',
                            height: UpdatedDimensions.width10(context) * 2.4,
                            width: UpdatedDimensions.width10(context) * 2.4,
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
                                    loader = true;
                                  });
                                  fetchPracticeByDay();
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: UpdatedDimensions.width10(context) * 1.32),
                          child: Image.asset(
                            'assets/images/calendar_month_black_24dp 1.webp',
                            height: UpdatedDimensions.width10(context) * 2.4,
                            width: UpdatedDimensions.width10(context) * 2.4,
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
                    margin:
                        EdgeInsets.all(UpdatedDimensions.height10(context) * 1.8),
                    child: updateBox(
                        headText: widget.missed ? 'Missed' : 'SAVED',
                        bodyText: widget.name,
                        edit: widget.missed ? false : true,
                        onTap1: () {},
                        FadeFunction: () {},
                        functionText: widget.missed ? 'Undo' : 'Edit'),
                  )
                :  BottomAppBar(
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    notchMargin: 0,
                    color: const Color(0xffD9B4B4),
                    child: Navigation_Bar(
                      bg_colored: true,subscription: getSubscription.toString(),
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
                height: UpdatedDimensions.height10(context) * 79.8,
                child: loader == false
                    ? noData == false
                        ? noActive == false
                            ? GestureDetector(
                                onTap: () {
                                  if (widget.helpfulTips) {
                                    if (goalLevel == 0) {
                                      _incrementValue();
                                    }
                                  }
                                },
                                child: SizedBox(
                                    width: double.infinity,
                                    height:
                                    UpdatedDimensions.height10(context) * 19.2,
                                    child: Stack(children: [
                                      Stack(
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            controller: _scrollController,
                                            child: SizedBox(
                                              height: UpdatedDimensions.height10(
                                                      context) *
                                                  19.2,
                                              width: UpdatedDimensions.width10(
                                                      context) *
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
                                                            loader = true;
                                                          });
                                                          previous();
                                                          fetchPracticeByDay();
                                                          setState(() {
                                                            contain = false;
                                                          });
                                                        } else {
                                                          if (goalLevel == 0) {
                                                            _incrementValue();
                                                          }
                                                        }
                                                      },
                                                      child: Container(
                                                        height: UpdatedDimensions
                                                                .height10(
                                                                    context) *
                                                            7.9,
                                                        width: UpdatedDimensions
                                                                .height10(
                                                                    context) *
                                                            7.9,
                                                        decoration:
                                                            BoxDecoration(
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
                                                                    0xffF5F1E0),
                                                                Color(
                                                                    0xffEDDC97)
                                                              ]),
                                                        ),
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  height: UpdatedDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.7,

                                                                  // color: Colors.blue,
                                                                  child: Text(
                                                                    getFormattedDay(
                                                                            past)
                                                                        .substring(
                                                                            0,
                                                                            3),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        UpdatedDimensions.font10(context) *
                                                                                1.2,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: const Color(
                                                                            0xff5B74A6)),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: UpdatedDimensions
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
                                                                        UpdatedDimensions.font10(context) *
                                                                                1.4),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    height:
                                                                    UpdatedDimensions.width10(context) *
                                                                            2.0,
                                                                    width: UpdatedDimensions.width10(
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
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
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
                                                      height: UpdatedDimensions
                                                              .height10(
                                                                  context) *
                                                          19.2,
                                                      width:
                                                      UpdatedDimensions.width10(
                                                                  context) *
                                                              18.8,
                                                      // margin: EdgeInsets.only(left: 55.5, right: 55.5),
                                                      child: Container(
                                                        height: UpdatedDimensions
                                                                .height10(
                                                                    context) *
                                                            13.81,
                                                        width: UpdatedDimensions
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
                                                                    0.185,
                                                                    0.215),
                                                            child: Container(
                                                              height: UpdatedDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.4,
                                                              width: UpdatedDimensions
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
                                                                      UpdatedDimensions.font10(context) *
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
                                                                      UpdatedDimensions.height10(context) *
                                                                              1.4,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                Container(
                                                                    height:
                                                                    UpdatedDimensions.height10(context) *
                                                                            2.8,
                                                                    width: UpdatedDimensions.width10(
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
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
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
                                                              loader = true;
                                                            });
                                                            future();
                                                            fetchPracticeByDay();
                                                            setState(() {
                                                              contain = false;
                                                            });
                                                          } else {}
                                                        } else {
                                                          if (goalLevel == 0) {
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
                                                          height: UpdatedDimensions
                                                                  .height10(
                                                                      context) *
                                                              7.9,
                                                          width:
                                                          UpdatedDimensions.height10(
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
                                                                  color: Colors
                                                                      .white),
                                                              gradient: const LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment.bottomCenter,
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
                                                                    UpdatedDimensions.font10(context) *
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
                                                                    UpdatedDimensions.font10(context) *
                                                                            1.4,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xff5B74A6)),
                                                              ),
                                                              Container(
                                                                height: UpdatedDimensions
                                                                        .height10(
                                                                            context) *
                                                                    3,
                                                                width: UpdatedDimensions
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
                                                                    width: UpdatedDimensions.width10(
                                                                            context) *
                                                                        1.7,
                                                                    height:
                                                                    UpdatedDimensions.height10(context) *
                                                                            1.5,
                                                                    // margin:
                                                                    //     const EdgeInsets.only(top: 3.32),
                                                                    // margin: const EdgeInsets.only(left: 1),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
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
                                              top: UpdatedDimensions.height10(
                                                      context) *
                                                  20.0,
                                            ),

                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  ListView.builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemCount:
                                                          timesList.length,
                                                      shrinkWrap: true,
                                                      padding: EdgeInsets.zero,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        return dashBoardSessionComponent(context, timesList[index], () {

                                                            _scrollToCurrentIndex();
                                                          }, () async {
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
                                                            await prefs.setInt(
                                                                'goal_num',
                                                                timesList[index]['data']['userGoal']['id']);

                                                            await prefs.setString(
                                                                'goal_menu_route',
                                                                'dashboard');
                                                          } else {
                                                            if (goalLevel ==
                                                                0) {
                                                              _incrementValue();
                                                            }
                                                          }
                                                        }, () async {
                                                          if (_showOverlay ==
                                                              false) {
                                                            final SharedPreferences
                                                            prefs =
                                                            await _prefs;
                                                            await prefs.setString(
                                                                'prac_menu_route',
                                                                'dashboard');
                                                            await prefs.setInt(
                                                                'prac_num',
                                                                timesList[index]['data']['id']);
                                                            await prefs.setInt(
                                                                'goal_num',
                                                                timesList[index]['data']['userGoal']['id']);

                                                            await prefs.setString(
                                                                'dash_pracName',
                                                                timesList[index]['data']['name']);
                                                            await prefs.setString(
                                                                'dash_goalName',
                                                                timesList[index]['data']['userGoal']['name']);
                                                            await prefs.setString(
                                                                'record_date',
                                                                getFormattedDate(current).toString());

                                                            await timesList[index]['data']['color'] != null
                                                                ? prefs.setString('dash_pracColor', timesList[index]['data']['color'])
                                                                : prefs.setString('dash_pracColor', '0');
                                                            await prefs.setString(
                                                                'recording_Time1',
                                                                timesList[index]['time']);
                                                            await prefs.setBool(
                                                                'behaviour_route',
                                                                true);
                                                            await timesList[index]['data']['userGoal']['color'] != null
                                                                ? prefs.setString('dash_goalColor', timesList[index]['data']['userGoal']['color'])
                                                                : '0';
                                                            if (timesList[index]['status'] ==
                                                                "Not Started") {
                                                              Navigator.push(context,
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
                                                              Navigator.push(context,
                                                                  FadePageRoute(page: const menu_behaviour()));
                                                            }
                                                          } else {
                                                            if (goalLevel ==
                                                                0) {
                                                              _incrementValue();
                                                            }
                                                          }
                                                        });
                                                      })),
                                                  SizedBox(height: UpdatedDimensions.height10(
                                                      context) *
                                                      20.0,)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                       Positioned(
                                              top:smallScreen? UpdatedDimensions.height10(
                                                  context) *
                                                  50.0:UpdatedDimensions.height10(
                                                      context) *
                                                  54.0,
                                              left: UpdatedDimensions.height10(
                                                      context) *
                                                  1.3,
                                              child: Stack(
                                                children: [
                                               isVisible?   Obx((){
                                                    if (notificationsController.getNotificationBody.isEmpty ) {
                                                      return const SizedBox(); // Return an empty widget if the string is empty
                                                    } else {
                                                      return reda(
                                                          context,"Hi, it's Reda here", notificationsController.getNotificationBody, true, notificationsController.getNotificationRoute, notificationsController.getNotificationUrl, (){
                                                        setState(() {
                                                          isVisible = !isVisible;
                                                        });
                                                        print("isVisible $isVisible");
                                                      });
                                                    }
                                                  }):AnimatedScaleButton(
                                                 onTap: () {
                                                  // notifications_sheet(context);
                                                   setState(() {
                                                     isVisible = !isVisible;
                                                   });
                                                 },
                                                 child: Container(
                                                   width: UpdatedDimensions
                                                       .height10(
                                                       context) *
                                                       4,
                                                   height: UpdatedDimensions
                                                       .height10(
                                                       context) *
                                                       4,
                                                   padding: EdgeInsets.all(
                                                       UpdatedDimensions
                                                           .height10(
                                                           context) *
                                                           0.4),
                                                   decoration:
                                                   const BoxDecoration(
                                                       shape: BoxShape
                                                           .circle,
                                                       color:
                                                       Colors.white),
                                                   child: Container(
                                                     width: UpdatedDimensions
                                                         .width10(
                                                         context) *
                                                         3.5,
                                                     height: UpdatedDimensions
                                                         .height10(
                                                         context) *
                                                         3.5,
                                                     decoration: const BoxDecoration(
                                                         shape:
                                                         BoxShape.circle,
                                                         color: Colors.white,
                                                         image: DecorationImage(
                                                             image: AssetImage(
                                                                 'assets/images/Smart Object_1.webp'))),
                                                     child: Align(
                                                       alignment:
                                                       const Alignment(
                                                           0, 2.8),
                                                       child: Container(
                                                         width: UpdatedDimensions
                                                             .width10(
                                                             context) *
                                                             1.7,
                                                         height: UpdatedDimensions
                                                             .height10(
                                                             context) *
                                                             1.7,
                                                         decoration:
                                                         const BoxDecoration(
                                                           shape: BoxShape
                                                               .circle,
                                                           color:
                                                           Colors.white,
                                                         ),
                                                         child: Center(
                                                           child: Text(
                                                             allGoals.length
                                                                 .toString(),
                                                             style: TextStyle(
                                                                 fontSize:
                                                                 UpdatedDimensions.font10(context) *
                                                                     1,
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
                                               )


                                                ],
                                              )),
                                      if (_showOverlay)
                                        FutureBuilder(
                                            future: Future.delayed(
                                                const Duration(
                                                    milliseconds: 200)),
                                            builder:
                                                (c, s) =>
                                                    s.connectionState ==
                                                            ConnectionState.done
                                                        ? helpFulTips(context, goalLevel, single, (){setState(() {
    _showOverlay = false;
    });}, (){_incrementValue();
                                                    if (goalLevel > 7) {
                                                      setState(() {
                                                        _showOverlay = false;
                                                      });
                                                    }})
                                                        : Container()),

                                    ])),
                              )
                            : noPlanned == true
                                ? noPlannedUi(context, responseData, _scrollController, past, current, next, () {
                  previous();
                  setState(() {
                    loader = true;
                  });
                  fetchPracticeByDay();
                }, () {
                  if (!maxViewDate) {
                    setState(() {
                      loader = true;
                    });
                    future();
                    fetchPracticeByDay();
                  }
                }, () {
                  Navigator.push(
                      context,
                      FadePageRoute(
                          page:
                          const record_session(
                            past_session: false,
                          )));
                })
                                : noSessions(context, responseData, _scrollController, past, current, next, () {
                  previous();
                  setState(() {
                    loader = true;
                  });
                  fetchPracticeByDay();
                },() {
                  if (!maxViewDate) {
                    setState(() {
                      loader = true;
                    });
                    future();
                    fetchPracticeByDay();
                  }
                })
                        : dashboardPlaceHolder(context, past, current, next, () {
                  previous();
                  setState(() {
                    loader = true;
                  });
                  fetchPracticeByDay();
                }, () {
                  setState(() {
                    loader = true;
                  });
                  future();
                  fetchPracticeByDay();
                }, () {
                  Navigator.push(
                      context,
                      FadePageRoute(
                          page:
                          const view_all_goals_menu()));
                })
                    : const DashBoardBehaviour_shimmer())),
      ),
    );
  }
}
