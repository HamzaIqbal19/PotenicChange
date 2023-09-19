import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/goalEvaluation.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/goal_menu_missed_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/menu_dashboard_behaviour.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_assesment_history.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/progress_report.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/Widgets/calender.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../Widgets/circle_dates.dart';
import '../../utils/app_dimensions.dart';

String activity_duration = 'Past month';
String _selected_activity = '';

class practice_progress extends StatefulWidget {
  final int days;
  final String route;
  const practice_progress({super.key, required this.days, required this.route});

  @override
  State<practice_progress> createState() => _practice_progressState();
}

class _practice_progressState extends State<practice_progress> {
  bool Loader = true;
  bool noData = false;
  var goalDetails;
  var report;
  var evaluation;
  int days = 30;

  int completedCount = 0;
  int missed = 0;

  Map<String, dynamic> practiceProgress = {};

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void getReport() {
    PracticeEvaluation.getUserPracticeReportIdBydays(widget.days)
        .then((response) {
      print(days);
      if (response == false) {
        loadData();
        setState(() {
          noData = true;
        });
      } else if (response.length != 0 && response != false) {
        print('===============================');
        setState(() {
          report = response['report'];
          evaluation = response['report']['practice']['practiceEvaluations'];
          noData = false;
        });

        print(response['report']['practice']['practiceEvaluations']);
        report['practiceProgress'].forEach((date, status) {
          if (status == "completed") {
            setState(() {
              completedCount = completedCount + 1;
            });
          }
        });

        report['practiceProgress'].forEach((date, status) {
          if (status == "missed") {
            setState(() {
              missed = missed + 1;
            });
          }
        });
        loadData();
        print(completedCount);
        print(missed);

        print('Report===============================');
        print(evaluation[evaluation.length - 1]);
        print(report);
        print(evaluation);
        // convertToFormattedProgress();

        print('Done===============================');
      }
      //print(response);
    }).catchError((error) {
      print('Faliure');
      setState(() {
        noData = true;
      });
      loadData();
    }).whenComplete(() => null);
  }

  List<Widget> generateCircleContainers(BuildContext context, int count,
      {bool hasImage = false}) {
    return List.generate(count, (index) {
      return Container(
        width: AppDimensions.height10(context) * 2.3,
        height: AppDimensions.height10(context) * 2.3,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: null,
          image: DecorationImage(
            image: AssetImage('assets/images/Tick_dates.webp'),
          ),
        ),
      );
    });
  }

  List<Widget> generateCircleEmptyContainers(
    BuildContext context,
    int count,
  ) {
    return List.generate(count, (index) {
      return Container(
        width: AppDimensions.height10(context) * 2.3,
        height: AppDimensions.height10(context) * 2.3,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF2F2F2),
          image: null,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    getReport();
    if (widget.days == 30) {
      setState(() {
        activity_duration == 'Past month';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (widget.route == 'pracice_menu_completed') {
          Navigator.push(context, FadePageRoute(page: const menu_behaviour()));
        } else if (widget.route == 'pracice_menu') {
          Navigator.push(
              context,
              FadePageRoute(
                  page: const practiceMenu(
                goal_eval: false,
              )));
        } else {
          Navigator.push(
              context,
              FadePageRoute(
                  page: const missed_Menu(
                pracName: '',
              )));
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  if (widget.route == 'pracice_menu_completed') {
                    Navigator.push(
                        context, FadePageRoute(page: const menu_behaviour()));
                  } else if (widget.route == 'pracice_menu') {
                    Navigator.push(
                        context,
                        FadePageRoute(
                            page: const practiceMenu(
                          goal_eval: false,
                        )));
                  } else {
                    Navigator.push(
                        context,
                        FadePageRoute(
                            page: const missed_Menu(
                          pracName: '',
                        )));
                  }
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: Loader == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      // mainAxisAlignment: ,
                      children: [
                        Container(
                          // width: AppDimensions.height10(context) * 12.5,
                          height: AppDimensions.height10(context) * 2.3,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 5.2),
                          child: Text(
                            'Practice Progress',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.2,
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          //width: AppDimensions.height10(context) * 17.1,
                          height: AppDimensions.height10(context) * 2.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.5),
                          child: Text(
                            noData == true
                                ? 'No data found'
                                : report['practice']["userGoal"]["name"],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 2.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 30.0,
                          height: AppDimensions.height10(context) * 11.2,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.6,
                              left: AppDimensions.height10(context) * 5),
                          // color: Colors.blue,
                          child: Row(
                            children: [
                              SizedBox(
                                width: AppDimensions.height10(context) * 7.5,
                                height: AppDimensions.height10(context) * 7.5,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const Alignment(-1, -0.3),
                                      child: Container(
                                        width: AppDimensions.height10(context) *
                                            6.5,
                                        height:
                                            AppDimensions.height10(context) *
                                                6.5,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: noData == true
                                                  ? const AssetImage(
                                                      'assets/images/orange_moon.webp')
                                                  : AssetImage(report['practice']
                                                                  ['userGoal']
                                                              ['color'] ==
                                                          "1"
                                                      ? "assets/images/red_gradient.webp"
                                                      : report['practice']
                                                                      ['userGoal']
                                                                  ['color'] ==
                                                              "2"
                                                          ? 'assets/images/orange_moon.webp'
                                                          : report['practice']
                                                                          ['userGoal']
                                                                      [
                                                                      'color'] ==
                                                                  "3"
                                                              ? "assets/images/lightGrey_gradient.webp"
                                                              : report['practice']
                                                                              ['userGoal']
                                                                          ['color'] ==
                                                                      "4"
                                                                  ? "assets/images/lightBlue_gradient.webp"
                                                                  : report['practice']['userGoal']['color'] == "5"
                                                                      ? "assets/images/medBlue_gradient.webp"
                                                                      : report['practice']['userGoal']['color'] == 6
                                                                          ? "assets/images/Blue_gradient.webp"
                                                                          : 'assets/images/orange_moon.webp'),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const Alignment(0.8, -0.2),
                                      child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                4.1,
                                        width: AppDimensions.height10(context) *
                                            4.061,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: noData == true
                                                    ? const AssetImage(
                                                        'assets/images/Ellipse 158_wb.webp')
                                                    : AssetImage(report[
                                                                    'practice']
                                                                ['color'] ==
                                                            "1"
                                                        ? "assets/images/Ellipse orange_wb.webp"
                                                        : report['practice']
                                                                    ['color'] ==
                                                                "2"
                                                            ? 'assets/images/Ellipse 158_wb.webp'
                                                            : report['practice']
                                                                        [
                                                                        'color'] ==
                                                                    "3"
                                                                ? "assets/images/Ellipse 157_wb.webp"
                                                                : report['practice']
                                                                            [
                                                                            'color'] ==
                                                                        "4"
                                                                    ? "assets/images/Ellipse light-blue_wb.webp"
                                                                    : report['practice']['color'] ==
                                                                            "5"
                                                                        ? "assets/images/Ellipse blue_wb.webp"
                                                                        : noData ==
                                                                                true
                                                                            ? 'assets/images/Ellipse 158_wb.webp'
                                                                            : 'assets/images/Ellipse 158_wb.webp'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.height10(context) * 21.6,
                                height: AppDimensions.height10(context) * 2.4,
                                child: Text(
                                  noData == true
                                      ? 'No data found'
                                      : report['practice']["name"],
                                  style: TextStyle(
                                      color: const Color(0xff156F6D),
                                      height: 1.2,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 37.6,
                          height: AppDimensions.height10(context) * 7.2,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.9),
                          child: Center(
                            child: Text(
                              'Your practice\nsessions summary',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.2,
                                  color: const Color(0xFFFBFBFB),
                                  fontSize:
                                      AppDimensions.height10(context) * 3.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 30.3,
                            height: AppDimensions.height10(context) * 5.1,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 1.8),
                              border: Border.all(
                                  width: 1, color: const Color(0xFFFBFBFB)),
                            ),
                            child: Center(
                              child: Container(
                                //width: AppDimensions.height10(context) * 21.0,
                                height: AppDimensions.height10(context) * 2.6,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 0.8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      //width: AppDimensions.height10(context) * 16.7,
                                      height:
                                          AppDimensions.height10(context) * 2.6,
                                      child: RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFFFBFBFB),
                                                  fontFamily: 'laila',
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.2,
                                                  fontWeight: FontWeight.w400),
                                              children: [
                                            const TextSpan(text: 'View: '),
                                            TextSpan(
                                                text: activity_duration,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ])),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.8,
                                            left: AppDimensions.height10(
                                                    context) *
                                                1.2),
                                        // width: AppDimensions.height10(context) * 2.4,
                                        // height: AppDimensions.height10(context) * 2.4,
                                        // color: Colors.green,
                                        child: Image.asset(
                                          'assets/images/Polygon 9.webp',
                                          width:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: AppDimensions.height10(context) * 38.2,
                            //height: AppDimensions.height10(context) * 66.4,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: const Color(0xFFF5F5F5)),
                            child: Column(
                              children: [
                                Container(
                                  width: AppDimensions.height10(context) * 33.4,
                                  height: AppDimensions.height10(context) * 9.1,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          5.0),
                                  child: Center(
                                    child: Text(
                                      'How did you feel after\nfinishing your practice?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: const Color(0xFF437296),
                                          height: 1.2,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  2.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                int.parse(report['afterRecording'][4]
                                            ['AfterTotal']) !=
                                        0
                                    ? Column(
                                        children: [
                                          Container(
                                            // width: AppDimensions.height10(context) * 22.0,

                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      22.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.0,
                                                  // color: Colors.amber,
                                                  child: Center(
                                                    child: Text(
                                                      '“I felt excited & good in myself”',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFFB695B7),
                                                          height: 1.2,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // width: AppDimensions.height10(context) *
                                                  //     3.9,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          3.4,
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Center(
                                                    child: Text(
                                                      noData == true
                                                          ? '0'
                                                          : '${int.parse(report['afterRecording'][4]['AfterTotal'])}x',
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFFB695B7),
                                                          height: 1.2,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.8,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                circlesInRow(
                                                    context,
                                                    int.parse(
                                                        report['afterRecording']
                                                            [4]['AfterTotal']))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                8.4,
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.2,
                                            color: const Color(0xFF437296),
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    2.7,
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    2.7),
                                          ),
                                        ],
                                      )
                                    : Container(),
                                int.parse(report['afterRecording'][3]
                                            ['AfterTotal']) !=
                                        0
                                    ? Column(
                                        children: [
                                          Container(
                                            // width: AppDimensions.height10(context) * 22.0,

                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      22.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  // color: Colors.amber,
                                                  child: Center(
                                                    child: Text(
                                                      '“I felt focused & good”',
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFFB695B7),
                                                          height: 1.2,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // width: AppDimensions.height10(context) *
                                                  //     3.9,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          3.4,
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Center(
                                                    child: Text(
                                                      noData == true
                                                          ? '0'
                                                          : '${int.parse(report['afterRecording'][3]['AfterTotal'])}x',
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFFB695B7),
                                                          height: 1.2,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.8,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                circlesInRow(
                                                    context,
                                                    int.parse(
                                                        report['afterRecording']
                                                            [3]['AfterTotal']))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                8.4,
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.2,
                                            color: const Color(0xFF437296),
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    2.7,
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    2.7),
                                          ),
                                        ],
                                      )
                                    : Container(),
                                int.parse(report['afterRecording'][2]
                                            ['AfterTotal']) !=
                                        0
                                    ? Column(
                                        children: [
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                22.0,
                                            //height: AppDimensions.height10(context) * 8.8,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      22.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  // color: Colors.amber,
                                                  child: Center(
                                                    child: Text(
                                                      '“I felt ok”',
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFFB695B7),
                                                          height: 1.2,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // width: AppDimensions.height10(context) *
                                                  //     3.9,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          3.4,
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Center(
                                                    child: Text(
                                                      noData == true
                                                          ? '0'
                                                          : '${report['afterRecording'][2]['AfterTotal']}x',
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFFB695B7),
                                                          height: 1.2,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.8,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                circlesInRow(
                                                    context,
                                                    int.parse(
                                                        report['afterRecording']
                                                            [2]['AfterTotal']))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                8.4,
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.2,
                                            color: const Color(0xFF437296),
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    2.7,
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    2.7),
                                          ),
                                        ],
                                      )
                                    : Container(),
                                int.parse(report['afterRecording'][1]
                                            ['AfterTotal']) !=
                                        0
                                    ? Column(
                                        children: [
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                22.0,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      22.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          3.4,
                                                  // color: Colors.amber,
                                                  child: Center(
                                                    child: Text(
                                                      '“I felt slightly down”',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFFB695B7),
                                                          height: 1.2,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // width: AppDimensions.height10(context) *
                                                  //     3.9,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          3.4,
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Center(
                                                    child: Text(
                                                      noData == true
                                                          ? '0'
                                                          : '${int.parse(report['afterRecording'][1]['AfterTotal'])}x',
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFFB695B7),
                                                          height: 1.2,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.8,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                circlesInRow(
                                                    context,
                                                    int.parse(
                                                        report['afterRecording']
                                                            [1]['AfterTotal']))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                8.4,
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.2,
                                            color: const Color(0xFF437296),
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    2.7,
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    2.7),
                                          ),
                                        ],
                                      )
                                    : Container(),
                                int.parse(report['afterRecording'][0]
                                            ['AfterTotal']) !=
                                        0
                                    ? Container(
                                        // width: AppDimensions.height10(context) * 22.0,

                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                1.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  22.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.0,
                                              // color: Colors.amber,
                                              child: Center(
                                                child: Text(
                                                  '“I felt low & irritated”',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xFFB695B7),
                                                      height: 1.2,
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // width: AppDimensions.height10(context) *
                                              //     3.9,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.4,
                                              margin: EdgeInsets.only(
                                                  top: AppDimensions.height10(
                                                          context) *
                                                      1.0),
                                              child: Center(
                                                child: Text(
                                                  noData == true
                                                      ? '0'
                                                      : '${int.parse(report['afterRecording'][0]['AfterTotal'])}x',
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xFFB695B7),
                                                      height: 1.2,
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.8,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                            circlesInRow(
                                                context,
                                                int.parse(
                                                    report['afterRecording'][0]
                                                        ['AfterTotal']))
                                          ],
                                        ),
                                      )
                                    : Container(),
                                Container(
                                    height:
                                        AppDimensions.height10(context) * 6.0,
                                    width:
                                        AppDimensions.height10(context) * 34.2,
                                    margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 2.7,
                                      // left: AppDimensions.height10(context) * 2.0,
                                      //right: AppDimensions.height10(context) * 1.9,
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFB695B7),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                23.9,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.2,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.99),
                                            child: GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                  'View timeline',
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF828282),
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.8,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                                          ),
                                          Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  2.4,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.39,
                                              margin: EdgeInsets.only(
                                                  right: AppDimensions.height10(
                                                          context) *
                                                      2.391),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Image.asset(
                                                  'assets/images/BTN Back.webp',
                                                  //width: AppDimensions.height10(context) * 2.6,
                                                  //height: AppDimensions.height10(context) * 2.6,
                                                  color:
                                                      const Color(0xFF828282),
                                                  fit: BoxFit.cover,
                                                ),
                                              ))
                                        ])),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 4,
                                )
                              ],
                            )),
                        Container(
                          width: AppDimensions.height10(context) * 38.2,
                          //height: AppDimensions.height10(context) * 59.6,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: const Color(0xFFF5F5F5)),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10(context) * 33.4,
                                height: AppDimensions.height10(context) * 9.1,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 5.0),
                                child: Center(
                                  child: Text(
                                    'How has your practice\nbeen going?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: const Color(0xFF437296),
                                        height: 1.2,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              report['endRecording'][4]['AfterTotal'] != '0'
                                  ? Column(
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  22.0,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    22.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                // color: Colors.amber,
                                                child: Center(
                                                  child: Text(
                                                    '“Good, I liked it”',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.9,
                                                margin: EdgeInsets.only(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        1.0),
                                                child: Center(
                                                  child: Text(
                                                    noData == true
                                                        ? '0'
                                                        : '${report['endRecording'][4]['AfterTotal']}x',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.8,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                              circlesInRow(
                                                  context,
                                                  int.parse(
                                                      report['endRecording'][4]
                                                          ['AfterTotal']))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.2,
                                          color: const Color(0xFF437296),
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  2.7,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  2.7),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              report['endRecording'][5]['AfterTotal'] != '0'
                                  ? Column(
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  22.0,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    22.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.8,
                                                // color: Colors.amber,
                                                child: Center(
                                                  child: Text(
                                                    '“Great, in the\nzone”',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                margin: EdgeInsets.only(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        1.0),
                                                child: Center(
                                                  child: Text(
                                                    noData == true
                                                        ? '0'
                                                        : '${report['endRecording'][5]['AfterTotal']}x',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.8,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                              circlesInRow(
                                                  context,
                                                  int.parse(
                                                      report['endRecording'][5]
                                                          ['AfterTotal']))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.2,
                                          color: const Color(0xFF437296),
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  2.7,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  2.7),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              report['endRecording'][3]['AfterTotal'] != '0'
                                  ? Column(
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  22.0,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    22.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.8,
                                                // color: Colors.amber,
                                                child: Center(
                                                  child: Text(
                                                    '“It was ok”',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                margin: EdgeInsets.only(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        1.0),
                                                child: Center(
                                                  child: Text(
                                                    noData == true
                                                        ? '0'
                                                        : '${report['endRecording'][3]['AfterTotal']}x',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.8,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                              circlesInRow(
                                                  context,
                                                  int.parse(
                                                      report['endRecording'][3]
                                                          ['AfterTotal']))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.2,
                                          color: const Color(0xFF437296),
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  2.7,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  2.7),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              report['endRecording'][2]['AfterTotal'] != '0'
                                  ? Column(
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  22.0,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    22.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.8,
                                                // color: Colors.amber,
                                                child: Center(
                                                  child: Text(
                                                    '“Had distractions, it\nwas hard to focus”',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                margin: EdgeInsets.only(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        1.0),
                                                child: Center(
                                                  child: Text(
                                                    noData == true
                                                        ? '0'
                                                        : '${report['endRecording'][2]['AfterTotal']}x',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.8,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                              circlesInRow(
                                                  context,
                                                  int.parse(
                                                      report['endRecording'][2]
                                                          ['AfterTotal']))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.2,
                                          color: const Color(0xFF437296),
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  2.7,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  2.7),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              report['endRecording'][1]['AfterTotal'] != '0'
                                  ? Column(
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  22.0,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    22.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.8,
                                                // color: Colors.amber,
                                                child: Center(
                                                  child: Text(
                                                    '“Found it difficult”',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                margin: EdgeInsets.only(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        1.0),
                                                child: Center(
                                                  child: Text(
                                                    noData == true
                                                        ? '0'
                                                        : '${report['endRecording'][1]['AfterTotal']}x',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.8,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                              circlesInRow(
                                                  context,
                                                  int.parse(
                                                      report['endRecording'][1]
                                                          ['AfterTotal']))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.2,
                                          color: const Color(0xFF437296),
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  2.7,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  2.7),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              report['endRecording'][0]['AfterTotal'] != '0'
                                  ? Column(
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  22.0,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    22.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.8,
                                                // color: Colors.amber,
                                                child: Center(
                                                  child: Text(
                                                    '“Hated it”',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                margin: EdgeInsets.only(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        1.0),
                                                child: Center(
                                                  child: Text(
                                                    noData == true
                                                        ? '0'
                                                        : '${report['endRecording'][0]['AfterTotal']}x',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFB695B7),
                                                        height: 1.2,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.8,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                              circlesInRow(
                                                  context,
                                                  int.parse(
                                                      report['endRecording'][0]
                                                          ['AfterTotal']))
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: AppDimensions.height10(context) * 4,
                              )
                            ],
                          ),
                        ),
                        Container(
                          // width: AppDimensions.height10(context) * 2.1,
                          //height: AppDimensions.height10(context) * 4.3,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensions.height10(context) * 4.1,
                            height: AppDimensions.height10(context) * 4.3,
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 37.1,
                          height: AppDimensions.height10(context) * 5.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0),
                          child: Center(
                            child: Text(
                              'Your last practice progress\nevaluation for periods',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: AppDimensions.height10(context) * 0.12,
                                fontSize: AppDimensions.height10(context) * 2.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFBFBFB),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 37.1,
                          height: AppDimensions.height10(context) * 3.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.6),
                          child: Center(
                            child: Text(
                              noData == true
                                  ? 'DD/MMM/YY to DD/MMM/YY.'
                                  : '${formatDate(report["startDate"].toString().substring(0, 10))} to ${formatDate(report["endDate"].toString().substring(0, 10))}',
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.0,
                                height: AppDimensions.height10(context) * 0.12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFBFBFB),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 38.2,
                          //height: AppDimensions.height10(context) * 111.2,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: const Color(0xFFF5F5F5)),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10(context) * 34.2,
                                height: AppDimensions.height10(context) * 7.2,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 5.0),
                                child: Center(
                                  child: Text(
                                    'How effective has this practice\nbeen in moving you closer towards\nyour goal?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: const Color(0xFF437296),
                                        height:
                                            AppDimensions.height10(context) *
                                                0.12,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 28.6,
                                height: AppDimensions.height10(context) * 10.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 7.6,
                                      height:
                                          AppDimensions.height10(context) * 5.3,
                                      child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    fontFamily: 'laila',
                                                    height: 1.2,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.4,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                children: [
                                              TextSpan(
                                                text: noData == true
                                                    ? "0"
                                                    : evaluation.length == 0
                                                        ? '-'
                                                        : '${evaluation[evaluation.length - 1]['question1']}',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    height: 1.2,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.5,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const TextSpan(text: '/5')
                                            ])),
                                      ),
                                    ),
                                    Container(
                                      width: AppDimensions.height10(context) *
                                          28.6,
                                      height:
                                          AppDimensions.height10(context) * 2.4,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Center(
                                        child: Text(
                                          '“There is good improvement”',
                                          style: TextStyle(
                                              color: const Color(0xFFB695B7),
                                              height: 1.2,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 1.0,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                              noData == true
                                                  ? 0
                                                  : evaluation.length == 0
                                                      ? 0
                                                      : int.parse(evaluation[
                                                              evaluation
                                                                      .length -
                                                                  1]['question1']
                                                          .toString()),
                                              (index) => Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    1.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    1.0,
                                                margin: EdgeInsets.only(
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.5),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFB695B7),
                                                ),
                                              ),
                                            ),
                                          ),
                                          noData == true
                                              ? Container()
                                              : evaluation.length == 0
                                                  ? Container()
                                                  : Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: List.generate(
                                                        5 -
                                                            int.parse(evaluation[
                                                                        evaluation.length -
                                                                            1][
                                                                    'question1']
                                                                .toString()),
                                                        (index) => Container(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                          margin: EdgeInsets.only(
                                                              right: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  0.5),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: const Color(
                                                                      0xFFB695B7))),
                                                        ),
                                                      ),
                                                    ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 8.4,
                                height: AppDimensions.height10(context) * 0.2,
                                color: const Color(0xFF437296),
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.7,
                                    bottom:
                                        AppDimensions.height10(context) * 2.7),
                              ),
                              SizedBox(
                                width: AppDimensions.height10(context) * 30.0,
                                height: AppDimensions.height10(context) * 17.5,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10(context) *
                                          30.0,
                                      height:
                                          AppDimensions.height10(context) * 4.8,
                                      child: Center(
                                        child: Text(
                                          'How much have you enjoyed\nthe journey during this period?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: const Color(0xFF437296),
                                              height: 1.2,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.6,
                                      height:
                                          AppDimensions.height10(context) * 5.3,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              2.0),
                                      child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    fontFamily: 'laila',
                                                    height: 1.2,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.4,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                children: [
                                              TextSpan(
                                                text: noData == true
                                                    ? '0'
                                                    : evaluation.length == 0
                                                        ? '-'
                                                        : '${evaluation[evaluation.length - 1]['question2']}',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    height: 1.2,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.5,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const TextSpan(text: '/5')
                                            ])),
                                      ),
                                    ),
                                    Container(
                                      width: AppDimensions.height10(context) *
                                          28.6,
                                      height:
                                          AppDimensions.height10(context) * 2.4,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Center(
                                        child: Text(
                                          '“It is not bad ”',
                                          style: TextStyle(
                                              color: const Color(0xFFB695B7),
                                              height: 1.2,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width:
                                      //     AppDimensions.height10(context) * 7.0,
                                      height:
                                          AppDimensions.height10(context) * 1.0,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                              noData == true
                                                  ? 0
                                                  : evaluation.length == 0
                                                      ? 0
                                                      : int.parse(evaluation[
                                                              evaluation
                                                                      .length -
                                                                  1]['question2']
                                                          .toString()),
                                              (index) => Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    1.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    1.0,
                                                margin: EdgeInsets.only(
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.5),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFB695B7),
                                                ),
                                              ),
                                            ),
                                          ),
                                          noData == true
                                              ? Container()
                                              : evaluation.length == 0
                                                  ? Container()
                                                  : Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: List.generate(
                                                        5 -
                                                            int.parse(evaluation[
                                                                        evaluation.length -
                                                                            1][
                                                                    'question2']
                                                                .toString()),
                                                        (index) => Container(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                          margin: EdgeInsets.only(
                                                              right: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  0.5),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: const Color(
                                                                      0xFFB695B7))),
                                                        ),
                                                      ),
                                                    ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 8.4,
                                height: AppDimensions.height10(context) * 0.2,
                                color: const Color(0xFF437296),
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.7,
                                    bottom:
                                        AppDimensions.height10(context) * 2.7),
                              ),
                              SizedBox(
                                width: AppDimensions.height10(context) * 34.8,
                                height: AppDimensions.height10(context) * 19.9,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10(context) *
                                          34.8,
                                      height:
                                          AppDimensions.height10(context) * 7.2,
                                      child: Center(
                                        child: Text(
                                          'How confident are you that this\npractice will help move you\ncloser towards achieving your goal?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: const Color(0xFF437296),
                                              height: 1.2,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width:
                                      //     AppDimensions.height10(context) * 7.6,
                                      height:
                                          AppDimensions.height10(context) * 5.3,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              2.00),
                                      child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    fontFamily: 'laila',
                                                    height: 1.2,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.4,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                children: [
                                              TextSpan(
                                                text: noData == true
                                                    ? '0'
                                                    : evaluation.length == 0
                                                        ? '-'
                                                        : '${evaluation[evaluation.length - 1]['question3']}',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    height: 1.2,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.5,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const TextSpan(text: '/5')
                                            ])),
                                      ),
                                    ),
                                    Container(
                                      width: AppDimensions.height10(context) *
                                          28.6,
                                      height:
                                          AppDimensions.height10(context) * 2.4,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Center(
                                        child: Text(
                                          '“I feel there is a good chance  ”',
                                          style: TextStyle(
                                              color: const Color(0xFFB695B7),
                                              height: 1.2,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width:
                                      //     AppDimensions.height10(context) * 7.0,
                                      height:
                                          AppDimensions.height10(context) * 1.0,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                              noData == true
                                                  ? 0
                                                  : evaluation.length == 0
                                                      ? 0
                                                      : int.parse(evaluation[
                                                              evaluation
                                                                      .length -
                                                                  1]['question3']
                                                          .toString()),
                                              (index) => Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    1.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    1.0,
                                                margin: EdgeInsets.only(
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.5),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFB695B7),
                                                ),
                                              ),
                                            ),
                                          ),
                                          noData == true
                                              ? Container()
                                              : evaluation.length == 0
                                                  ? Container()
                                                  : Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: List.generate(
                                                        5 -
                                                            int.parse(evaluation[
                                                                        evaluation.length -
                                                                            1][
                                                                    'question3']
                                                                .toString()),
                                                        (index) => Container(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                          margin: EdgeInsets.only(
                                                              right: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  0.5),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: const Color(
                                                                      0xFFB695B7))),
                                                        ),
                                                      ),
                                                    ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 8.4,
                                height: AppDimensions.height10(context) * 0.2,
                                color: const Color(0xFF437296),
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.7,
                                    bottom:
                                        AppDimensions.height10(context) * 2.7),
                              ),
                              SizedBox(
                                width: AppDimensions.height10(context) * 34.8,
                                height: AppDimensions.height10(context) * 19.9,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10(context) *
                                          34.8,
                                      height:
                                          AppDimensions.height10(context) * 7.2,
                                      child: Center(
                                        child: Text(
                                          'How easy is it to implement\nthis practice in to your life?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: const Color(0xFF437296),
                                              height: 1.2,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.6,
                                      height:
                                          AppDimensions.height10(context) * 5.3,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              2.00),
                                      child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    fontFamily: 'laila',
                                                    height: 1.2,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.4,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                children: [
                                              TextSpan(
                                                text: noData == true
                                                    ? '0'
                                                    : evaluation.length == 0
                                                        ? '-'
                                                        : '${evaluation[evaluation.length - 1]['question4']}',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    height: 1.2,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.5,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const TextSpan(text: '/5')
                                            ])),
                                      ),
                                    ),
                                    Container(
                                      /// width: AppDimensions.height10(context) * 28.6,
                                      height:
                                          AppDimensions.height10(context) * 2.4,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Center(
                                        child: Text(
                                          '“I have more hard days than easy ”',
                                          style: TextStyle(
                                              color: const Color(0xFFB695B7),
                                              height: 1.2,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width:
                                      //     AppDimensions.height10(context) * 7.0,
                                      height:
                                          AppDimensions.height10(context) * 1.0,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                              noData == true
                                                  ? 0
                                                  : evaluation.length == 0
                                                      ? 0
                                                      : int.parse(evaluation[
                                                              evaluation
                                                                      .length -
                                                                  1]['question4']
                                                          .toString()),
                                              (index) => Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    1.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    1.0,
                                                margin: EdgeInsets.only(
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.5),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFB695B7),
                                                ),
                                              ),
                                            ),
                                          ),
                                          noData == true
                                              ? Container()
                                              : evaluation.length == 0
                                                  ? Container()
                                                  : Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: List.generate(
                                                        5 -
                                                            int.parse(evaluation[
                                                                        evaluation.length -
                                                                            1][
                                                                    'question4']
                                                                .toString()),
                                                        (index) => Container(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                          margin: EdgeInsets.only(
                                                              right: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  0.5),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: const Color(
                                                                      0xFFB695B7))),
                                                        ),
                                                      ),
                                                    ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 8.4,
                                height: AppDimensions.height10(context) * 0.2,
                                color: const Color(0xFF437296),
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.7,
                                    bottom:
                                        AppDimensions.height10(context) * 2.7),
                              ),
                              AnimatedScaleButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const practice_assesment()));
                                },
                                child: Container(
                                    height:
                                        AppDimensions.height10(context) * 6.0,
                                    width:
                                        AppDimensions.height10(context) * 34.2,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFB695B7),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                23.9,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.2,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.99),
                                            child: Text(
                                              'Practice assessment history',
                                              style: TextStyle(
                                                color: const Color(0xFF828282),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  2.4,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.39,
                                              margin: EdgeInsets.only(
                                                  right: AppDimensions.height10(
                                                          context) *
                                                      2.391),
                                              child: Image.asset(
                                                'assets/images/BTN Back.webp',
                                                //width: AppDimensions.height10(context) * 2.6,
                                                //height: AppDimensions.height10(context) * 2.6,
                                                color: const Color(0xFF828282),
                                                fit: BoxFit.cover,
                                              ))
                                        ])),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 4,
                              )
                            ],
                          ),
                        ),
                        Container(
                          // width: AppDimensions.height10(context) * 2.1,
                          //height: AppDimensions.height10(context) * 4.3,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensions.height10(context) * 4.1,
                            height: AppDimensions.height10(context) * 4.3,
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 35.8,
                          height: AppDimensions.height10(context) * 5.2,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0),
                          child: Center(
                            child: Text(
                              noData == true
                                  ? 'Your next practice report will be\ndelivered in 20 Active Days'
                                  : 'Your next practice report will be\ndelivered in ${20 - report["activeDaysInMonth"]} Active Days',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: AppDimensions.height10(context) * 0.12,
                                fontSize: AppDimensions.height10(context) * 2.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFBFBFB),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 38.5,
                          //height: AppDimensions.height10(context) * 84.669,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: const Color(0xFFFFFFFF)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: AppDimensions.height10(context) * 5.0,
                              ),
                              Circulardates(
                                size: AppDimensions.height10(context) * 24.0,
                                outerCircleContainers: noData == true
                                    ? []
                                    : generateCircleEmptyContainers(
                                            context, 20 - completedCount) +
                                        generateCircleContainers(
                                            context, completedCount),
                                centerContainer: Container(
                                  height:
                                      AppDimensions.height10(context) * 20.6,
                                  width: AppDimensions.height10(context) * 14.9,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          2.0),

                                  // color: Colors.amber,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  13.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  7.7,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                // margin: EdgeInsets.only(left: AppDimensions.height10(context)*1.0),
                                                // height: AppDimensions.height10(
                                                //         context) *
                                                //     7.7,
                                                child: Text(
                                                  noData == true
                                                      ? '-'
                                                      : completedCount
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          7.4,
                                                      color: const Color(
                                                          0xFF156F6D),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    7.7,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  '/20',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.4,
                                                      color: const Color(
                                                          0xFF646464),
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  9.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.3,
                                          child: Text(
                                            'Active days',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8,
                                                color: const Color(0xFF156F6D),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  9.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.3,
                                          child: Text(
                                            'completed!',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8,
                                                color: const Color(0xFF156F6D),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 8.0,
                                width: AppDimensions.height10(context) * 23,
                                child: Center(
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          style: TextStyle(
                                            height: 1.2,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF5B74A6),
                                          ),
                                          children: const [
                                            TextSpan(
                                                text:
                                                    'You have completed this\nover '),
                                            TextSpan(
                                                text: '2 months',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ])),
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 46.8,
                                child: CalendarWithRadioButtons(
                                    status: true,
                                    dateStatus: noData == true
                                        ? {
                                            "2023-07-18": "completed",
                                            "2023-07-19": "completed",
                                            "2023-07-20": "completed",
                                            "2023-07-21": "completed",
                                            "2023-07-22": "completed",
                                            "2023-07-23": "completed",
                                            "2023-07-24": "completed",
                                            "2023-07-25": "completed",
                                            "2023-07-26": "completed",
                                            "2023-07-27": "completed",
                                            "2023-07-28": "completed",
                                            "2023-07-29": "completed",
                                            "2023-07-30": "completed",
                                            "2023-07-31": "missed",
                                            "2023-08-01": "completed",
                                            "2023-08-02": "completed",
                                            "2023-08-03": "completed",
                                            "2023-08-04": "completed",
                                            "2023-08-05": "completed",
                                            "2023-08-06": "missed"
                                          }
                                        : report['practiceProgress']),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 3.6,
                        )
                      ]),
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MyBottomSheet();
      },
    ).then((value) {
      if (value != null) {
        // Do something with the selected statement

        print(value);
        if (value == 0) {
          setState(() {
            //  Loader = true;
            days = 7;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 7,
                route: widget.route,
              )));
          // getReport();
        } else if (value == 1) {
          setState(() {
            //  Loader = true;
            days = 14;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 14,
                route: widget.route,
              )));
          //  getReport();
        } else if (value == 2) {
          setState(() {
            // Loader = true;
            days = 30;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 30,
                route: widget.route,
              )));
          //  getReport();
        } else if (value == 3) {
          setState(() {
            days = 60;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 60,
                route: widget.route,
              )));
          //getReport();
        } else if (value == 4) {
          setState(() {
            days = 90;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 90,
                route: widget.route,
              )));
          //getReport();
        }
      } else if (value == null) {
        //   setState(() {
        //     Loader = true;
        //     days = 7;
        //   });
        //   getReport();
      }
    });
  }
}

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int _selectedIndex = 0;
  int index = 0;
  final List<String> _statements = [
    'Past week',
    'Past 2 weeks ',
    'Past month ',
    'Past 2 month ',
    'Past 3 month ',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height10(context) *
          31.3, // Set the height of the bottom sheet
      child: Column(
        children: [
          Container(
            height: AppDimensions.height10(context) * 3.8,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: const Color(0xFF828282),
                        width: AppDimensions.height10(context) * 0.1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 5.0,
                    height: AppDimensions.height10(context) * 2.1,
                    margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 2.0),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //activity_duration = _selected_activity;
                      activity_duration = _statements[_selectedIndex];
                    });

                    Navigator.of(context).pop(_selectedIndex);
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 3.7,
                    height: AppDimensions.height10(context) * 2.1,
                    margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 1.9),
                    child: Text(
                      'Done',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 40,
              magnification: 1.4,
              useMagnifier: true, // Set the height of each statement
              children: _statements
                  .map((statement) => Text(statement,
                      style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 2.0,
                        fontWeight: FontWeight.w400,
                      )))
                  .toList(),

              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                  activity_duration = _statements[_selectedIndex];
                  _selected_activity = _statements[_selectedIndex];
                });
              },
            ),
          ),
          SizedBox(height: AppDimensions.height10(context) * 3.6),
        ],
      ),
    );
  }
}

circlesInRow(BuildContext context, int itteration) {
  return Container(
    //width: AppDimensions.height10(context) * 16.0,
    // height: AppDimensions.height10(context) * 1.0,
    margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.8),
    child: Column(
      children: List.generate(
        (itteration / 10).ceil(),
        (rowIndex) => Container(
          margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (rowIndex == (itteration / 10).floor()
                  ? (itteration % 10)
                  : 10), // Replace 5 with the number of containers you want to create
              (index) => Container(
                width: AppDimensions.height10(context) * 1.0,
                height: AppDimensions.height10(context) * 1.0,
                margin: EdgeInsets.symmetric(
                    horizontal: AppDimensions.height10(context) * 0.25),
                decoration: const BoxDecoration(
                    color: Color(0xFFB695B7), shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
