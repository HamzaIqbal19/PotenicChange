// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/goalEvaluation.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_score.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/circle_container.dart';
import 'package:potenic_app/Widgets/circle_dates.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/menu_buttons.dart';

import '../../Widgets/calender.dart';
import '../../utils/app_dimensions.dart';

class progress_report extends StatefulWidget {
  final int index;
  const progress_report({super.key, required this.index});

  @override
  State<progress_report> createState() => _progress_reportState();
}

class _progress_reportState extends State<progress_report> {
  bool Loader = true;
  bool noData = false;
  var goalDetails;
  var report;
  Map<String, dynamic> practiceProgress = {};
  int days = 20;
  List<Color> outerColor = [];
  int opt1 = 0;
  int opt2 = 0;
  int opt3 = 0;
  int opt4 = 0;
  int opt5 = 0;
  List<Map<String, int>>? options;

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void getReport() {
    PracticeEvaluation.getUserPracticeReportId().then((response) {
      if (response == false) {
        setState(() {
          noData = true;
        });
        loadData();
      } else if (response.length != 0 && response != false) {
        setState(() {
          report = response['report'];
        });

        loadData();

        int count = 0;

        response['report']["howPracticeGoing"].forEach((date, value) {
          if (value is int) {
            if (value == 1) {
              outerColor.add(const Color(0xFF546096));
              setState(() {
                opt1 = opt1 + 1;
              });
            } else if (value == 2) {
              outerColor.add(const Color(0xFF7291A0));
              setState(() {
                opt2 = opt2 + 1;
              });
            } else if (value == 3) {
              outerColor.add(const Color(0xFFE1C44F));
              setState(() {
                opt3 = opt3 + 1;
              });
            } else if (value == 4) {
              outerColor.add(const Color(0xFFFA9458));
              setState(() {
                opt4 = opt4 + 1;
              });
            } else if (value == 5) {
              outerColor.add(const Color(0xFFFF6C2C));
              setState(() {
                opt5 = opt5 + 1;
              });
            } else {
              outerColor.add(const Color(0xFFFBFBFB));
            }
          }
        });
        options = [
          {'option1': opt1},
          {'option2': opt2},
          {'option3': opt3},
          {'option4': opt4},
          {'option5': opt5},
        ];
        options!.sort((a, b) => b.values.first.compareTo(a.values.first));
        practiceProgress = json.decode(response['report']['practiceProgress']);
      }
    }).catchError((error) {
      loadData();
    }).whenComplete(() => null);
  }

  List<Widget> generateCircleContainers(BuildContext context, int count,
      {bool hasImage = false}) {
    return List.generate(count, (index) {
      return Container(
        width: AppDimensions.width10(context) * 2.3,
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
        width: AppDimensions.width10(context) * 2.3,
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
    //_fetchGoalDetails();
    getReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.webp',
                width: AppDimensions.width10(context) * 3.0,
                height: AppDimensions.height10(context) * 3.0,
                fit: BoxFit.cover,
              )),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/GoalReviewBg.webp'),
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
                      width: AppDimensions.width10(context) * 40.872,
                      height: AppDimensions.height10(context) * 11.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 11.1,
                          right: AppDimensions.width10(context) * 10.7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              bottomRight: Radius.circular(
                                  AppDimensions.height10(context) * 2.0)),
                          gradient: const LinearGradient(
                              colors: [Color(0xFF91698C), Color(0xFFC19CA7)])),
                      child: Container(
                        width: AppDimensions.width10(context) * 24.3,
                        height: AppDimensions.height10(context) * 7.0,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppDimensions.width10(context) * 24.3,
                              height: AppDimensions.height10(context) * 2.6,
                              child: Text(
                                'Practice progress report',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.0,
                                    height:
                                        AppDimensions.height10(context) * 0.12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 3.3,
                              height: AppDimensions.height10(context) * 0.2,
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10(context) * 1.7,
                                  top: AppDimensions.height10(context) * 0.45),
                              decoration:
                                  const BoxDecoration(color: Color(0xFFFFFFFF)),
                            ),
                            SizedBox(
                              // width: AppDimensions.width10(context) * 10.1,
                              height: AppDimensions.height10(context) * 2.4,
                              child: Text(
                                noData == true
                                    ? 'No data found'
                                    : report['practice']["name"],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.0,
                                    height:
                                        AppDimensions.height10(context) * 0.12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: AppDimensions.width10(context) * 31.7,
                        height: AppDimensions.height10(context) * 3.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 5.0),
                        child: Text(
                          'Congratulations!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 3.0,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 35.0,
                      height: AppDimensions.height10(context) * 5.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.7),
                      child: Text(
                        'You have been consistently doing\nyour practice for 20 active days ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2.0,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 35.0,
                      height: AppDimensions.height10(context) * 3.3,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 0.5),
                      child: Text(
                        //we will give duration of 20 days
                        noData == true
                            ? 'No data found'
                            : 'from ${formatDate(report["startDate"])} to ${formatDate(report["endDate"])}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.6,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 25.5,
                      height: AppDimensions.height10(context) * 3.9,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.9),
                      child: Text(
                        'You are a rockstar! :)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2.2,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 34.0,
                      height: AppDimensions.height10(context) * 11.2,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 1.5),
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              width: AppDimensions.width10(context) * 7.9,
                              height: AppDimensions.height10(context) * 7.94,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.width10(context) * 0.7,
                                  left: AppDimensions.height10(context) * 0.5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(report['practice']
                                                  ['userGoal']['color'] ==
                                              "1"
                                          ? "assets/images/red_gradient.webp"
                                          : report['practice']['userGoal']
                                                      ['color'] ==
                                                  "2"
                                              ? 'assets/images/orange_moon.webp'
                                              : report['practice']['userGoal']
                                                          ['color'] ==
                                                      "3"
                                                  ? "assets/images/lightGrey_gradient.webp"
                                                  : report['practice']['userGoal']
                                                              ['color'] ==
                                                          "4"
                                                      ? "assets/images/lightBlue_gradient.webp"
                                                      : report['practice']['userGoal']
                                                                  ['color'] ==
                                                              "5"
                                                          ? "assets/images/medBlue_gradient.webp"
                                                          : report['practice']
                                                                          ['userGoal']
                                                                      ['color'] ==
                                                                  6
                                                              ? "assets/images/Blue_gradient.webp"
                                                              : 'assets/images/orange_moon.webp'))),
                              child: Align(
                                alignment: const Alignment(1, 1.1),
                                child: Container(
                                  width: AppDimensions.width10(context) * 4.9,
                                  height: AppDimensions.height10(context) * 4.9,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: AppDimensions.width10(context) *
                                            0.2,
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(report['practice']
                                                      ['color'] ==
                                                  "1"
                                              ? "assets/images/Ellipse orange_wb.webp"
                                              : report['practice']['color'] ==
                                                      "2"
                                                  ? 'assets/images/Ellipse 158_wb.webp'
                                                  : report['practice']
                                                              ['color'] ==
                                                          "3"
                                                      ? "assets/images/Ellipse 157_wb.webp"
                                                      : report['practice']
                                                                  ['color'] ==
                                                              "4"
                                                          ? "assets/images/Ellipse light-blue_wb.webp"
                                                          : report['practice'][
                                                                      'color'] ==
                                                                  "5"
                                                              ? "assets/images/Ellipse blue_wb.webp"
                                                              : 'assets/images/Ellipse 158_wb.webp'))),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 23.9,
                              height: AppDimensions.height10(context) * 5.9,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.4,
                                  top: AppDimensions.height10(context) * 0.8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 3.0,
                                    margin: EdgeInsets.only(
                                      bottom:
                                          AppDimensions.height10(context) * 0.1,
                                    ),
                                    child: Text(
                                      noData == true
                                          ? 'No data found'
                                          : report['practice']["userGoal"]
                                              ["name"],
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  2.0,
                                          height: 1.2,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF437296)),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        AppDimensions.width10(context) * 27.9,
                                    height:
                                        AppDimensions.height10(context) * 2.7,
                                    child: Text(
                                      noData == true
                                          ? 'No data found'
                                          : report['practice']["name"],
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                          height: 1.2,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF156F6D)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // width: AppDimensions.width10(context) * 2.1,
                      //height: AppDimensions.height10(context) * 4.3,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.0),
                      child: Image.asset(
                        'assets/images/Arrow.webp',
                        width: AppDimensions.width10(context) * 4.1,
                        height: AppDimensions.height10(context) * 4.3,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      //padding: EdgeInsets.all(0),
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.7),
                      height: AppDimensions.height10(context) * 63.3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/pro_report_bg#2.webp'),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.width10(context) * 25.4,
                            height: AppDimensions.height10(context) * 2.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 7.0),
                            child: Text(
                              'New identity statement',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 2.4,
                                  height: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.width10(context) * 35.6,
                            height: AppDimensions.height10(context) * 10.9,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(-0.875, -0.5),
                                  child: Container(
                                    width: AppDimensions.width10(context) * 2.5,
                                    height:
                                        AppDimensions.height10(context) * 1.6,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/colon.webp'),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(1, 0),
                                  child: Container(
                                    width:
                                        AppDimensions.width10(context) * 34.7,
                                    height:
                                        AppDimensions.height10(context) * 10.9,
                                    padding: EdgeInsets.all(
                                        AppDimensions.height10(context)),
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            1.9),

                                    ///color: Colors.amber,
                                    child: Center(
                                      child: Text(
                                        noData == true
                                            ? 'No data found'
                                            : report['practice']["userGoal"]
                                                    ["identityStatement"][0]
                                                ['text'],
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            // height: AppDimensions.height10(context) * 0.15,
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.7,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 30.517,
                            margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 3.0,
                              // left: AppDimensions.height10(context) * 2.7
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.width10(context) * 33.153,
                                    height: AppDimensions.height10(context) *
                                        30.517,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.8098,
                                        right: AppDimensions.width10(context) *
                                            1.098),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Rectangle 148.webp'))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.width10(context) * 33.153,
                                    height: AppDimensions.height10(context) *
                                        30.517,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.width10(context) *
                                            1.098),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Rectangle 178.webp'))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 27.2,
                      height: AppDimensions.height10(context) * 5.369,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 7.0),
                      child: Text(
                        'You have completed 20 active days of practice!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2.4,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 40.5,
                      height: AppDimensions.height10(context) * 84.569,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.7),
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
                                : generateCircleEmptyContainers(context, 0) +
                                    generateCircleContainers(context, 20),
                            centerContainer: Container(
                              height: AppDimensions.height10(context) * 20.6,
                              width: AppDimensions.width10(context) * 14.9,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 2.0),

                              // color: Colors.amber,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 13.3,
                                      height:
                                          AppDimensions.height10(context) * 7.7,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            // margin: EdgeInsets.only(left: AppDimensions.height10(context)*1.0),
                                            // height:
                                            //     AppDimensions.height10(context) *
                                            //         7.7,
                                            child: Text(
                                              noData == true ? '-' : '20',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          7.4,
                                                  color:
                                                      const Color(0xFF156F6D),
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                7.7,
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              '/20',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          2.4,
                                                  color:
                                                      const Color(0xFF646464),
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 4.6,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              0.5),
                                      child: Text(
                                        'Active days\ncompleted!',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.8,
                                            color: const Color(0xFF156F6D),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 8.0,
                            width: AppDimensions.width10(context) * 23,
                            child: Center(
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'laila',
                                        height: 1.2,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.4,
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
                                                fontWeight: FontWeight.w700))
                                      ])),
                            ),
                          ),
                          Container(
                              height: AppDimensions.height10(context) * 46.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0)),
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
                                    : report['practiceProgress'],
                                limitCalender: true,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      // width: AppDimensions.width10(context) * 2.1,
                      //height: AppDimensions.height10(context) * 4.3,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.7),
                      child: Image.asset(
                        'assets/images/Arrow.webp',
                        width: AppDimensions.width10(context) * 4.1,
                        height: AppDimensions.height10(context) * 4.3,
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 27.2,
                      height: AppDimensions.height10(context) * 8.5,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 4.0),
                      child: Text(
                        'This is how you felt\nimplementing your new\npractice',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2.4,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 38.2,
                      //height: AppDimensions.height10(context) * 147.8,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: const Color(0xFFFFFFFF)),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.width10(context) * 38.2,
                            //height: AppDimensions.height10(context) * 55.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(
                                      AppDimensions.height10(context) * 2.0),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: options![0].containsKey('option5')
                                        ? [
                                            const Color(0xFFFFFBF9),
                                            const Color(0xFFFF6C2C)
                                                .withOpacity(0.30)
                                          ]
                                        : options![0].containsKey('option4')
                                            ? [
                                                const Color(0xFFFFFFFF),
                                                const Color(0xFFFA9458)
                                                    .withOpacity(0.31)
                                              ]
                                            : options![0].containsKey('option3')
                                                ? [
                                                    const Color(0xFFFFFFFF),
                                                    const Color(0xFFE1C44F)
                                                        .withOpacity(0.10)
                                                  ]
                                                : options![0]
                                                        .containsKey('option2')
                                                    ? [
                                                        const Color(0xFFF4FCFF),
                                                        const Color(0xFF7291A0)
                                                            .withOpacity(0.20)
                                                      ]
                                                    : [
                                                        const Color(0xFF546096)
                                                            .withOpacity(0.01),
                                                        const Color(0xFF546096)
                                                            .withOpacity(0.20)
                                                      ])),
                            child: Column(
                              children: [
                                Container(
                                    width:
                                        AppDimensions.width10(context) * 20.0,
                                    height:
                                        AppDimensions.height10(context) * 20.0,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            AppDimensions.height10(context) *
                                                3.0,
                                        top: AppDimensions.height10(context) *
                                            4.0),
                                    child: CircularFormation(
                                        size: 150,
                                        circleColor: Colors.transparent,
                                        selection: options![0]
                                                .containsKey('option5')
                                            ? 5
                                            : options![0].containsKey('option4')
                                                ? 4
                                                : options![0]
                                                        .containsKey('option3')
                                                    ? 3
                                                    : options![0].containsKey(
                                                            'option2')
                                                        ? 2
                                                        : 1,
                                        outerCircleColors: outerColor)),
                                Container(
                                  width: AppDimensions.width10(context) * 8.4,
                                  height: AppDimensions.height10(context) * 0.2,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.9),
                                  color: const Color(0xFFF5F5F5),
                                ),
                                Container(
                                  width: AppDimensions.width10(context) * 30.9,
                                  height: AppDimensions.height10(context) * 2.2,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          3.0),
                                  child: Center(
                                    child: Text(
                                      'Majority of the time',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                          color: options![0]
                                                  .containsKey('option5')
                                              ? const Color(0xFFFF6C2C)
                                              : options![0]
                                                      .containsKey('option4')
                                                  ? const Color(0xFFFA9458)
                                                  : options![0].containsKey(
                                                          'option3')
                                                      ? const Color(0xFFE1C44F)
                                                      : options![0].containsKey(
                                                              'option2')
                                                          ? const Color(
                                                              0xFF7291A0)
                                                          : const Color(
                                                              0xFF546096)),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 30.9,
                                      height:
                                          AppDimensions.height10(context) * 6.8,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Center(
                                        child: Text(
                                          options![0].containsKey('option5')
                                              ? '“I feel excited and\ngood in myself”'
                                              : options![0]
                                                      .containsKey('option4')
                                                  ? '“I feel focused and\nmotivated”'
                                                  : options![0].containsKey(
                                                          'option3')
                                                      ? '“I feel ok”'
                                                      : options![0].containsKey(
                                                              'option2')
                                                          ? '“I feel alright, but\nslightly down”'
                                                          : '“I feel very low\n& irritated”',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.15,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  2.8,
                                              fontWeight: FontWeight.w700,
                                              color: options![0]
                                                      .containsKey('option5')
                                                  ? const Color(0xFFFF6C2C)
                                                  : options![0].containsKey(
                                                          'option4')
                                                      ? const Color(0xFFFA9458)
                                                      : options![0].containsKey(
                                                              'option3')
                                                          ? const Color(
                                                              0xFFE1C44F)
                                                          : options![0]
                                                                  .containsKey(
                                                                      'option2')
                                                              ? const Color(
                                                                  0xFF7291A0)
                                                              : const Color(
                                                                  0xFF546096)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.2),
                                      child: RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  fontSize: AppDimensions
                                                          .font10(context) *
                                                      4.5,
                                                  fontFamily: 'laila',
                                                  height: 1.2,
                                                  fontWeight: FontWeight.w400,
                                                  color: options![0]
                                                          .containsKey(
                                                              'option5')
                                                      ? const Color(0xFFFF6C2C)
                                                      : options![0].containsKey(
                                                              'option4')
                                                          ? const Color(
                                                              0xFFFA9458)
                                                          : options![0]
                                                                  .containsKey(
                                                                      'option3')
                                                              ? const Color(
                                                                  0xFFE1C44F)
                                                              : options![0]
                                                                      .containsKey(
                                                                          'option2')
                                                                  ? const Color(
                                                                      0xFF7291A0)
                                                                  : const Color(
                                                                      0xFF546096)),
                                              children: [
                                            TextSpan(
                                                text: options!
                                                    .elementAt(0)
                                                    .values
                                                    .toString()
                                                    .replaceAll('(', '')
                                                    .replaceAll(')', '')),
                                            TextSpan(
                                                text: 'x',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            2.0))
                                          ])),
                                    ),
                                    circlesInRowColored(
                                        context,
                                        int.parse(options!
                                            .elementAt(0)
                                            .values
                                            .toString()
                                            .replaceAll('(', '')
                                            .replaceAll(')', '')),
                                        options![0].containsKey('option5')
                                            ? const Color(0xFFFF6C2C)
                                            : options![0].containsKey('option4')
                                                ? const Color(0xFFFA9458)
                                                : options![0]
                                                        .containsKey('option3')
                                                    ? const Color(0xFFE1C44F)
                                                    : options![0].containsKey(
                                                            'option2')
                                                        ? const Color(
                                                            0xFF7291A0)
                                                        : const Color(
                                                            0xFF546096)),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 2,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: options!.length - 1,
                              itemBuilder: (((context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 30.9,
                                      height:
                                          AppDimensions.height10(context) * 6.8,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              4.0),
                                      child: Center(
                                        child: Text(
                                          options![index + 1]
                                                  .containsKey('option5')
                                              ? '“I feel excited and\ngood in myself”'
                                              : options![index + 1]
                                                      .containsKey('option4')
                                                  ? '“I feel focused and\nmotivated”'
                                                  : options![index + 1]
                                                          .containsKey(
                                                              'option3')
                                                      ? '“I feel ok”'
                                                      : options![index + 1]
                                                              .containsKey(
                                                                  'option2')
                                                          ? '“I feel alright, but\nslightly down”'
                                                          : '“I feel very low\n& irritated”',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.15,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  2.8,
                                              fontWeight: FontWeight.w700,
                                              color: options![index + 1]
                                                      .containsKey('option5')
                                                  ? const Color(0xFFFF6C2C)
                                                  : options![index + 1]
                                                          .containsKey(
                                                              'option4')
                                                      ? const Color(0xFFFA9458)
                                                      : options![index + 1]
                                                              .containsKey(
                                                                  'option3')
                                                          ? const Color(
                                                              0xFFE1C44F)
                                                          : options![index + 1]
                                                                  .containsKey(
                                                                      'option2')
                                                              ? const Color(
                                                                  0xFF7291A0)
                                                              : const Color(
                                                                  0xFF546096)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.2),
                                      child: RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          4.5,
                                                  fontFamily: 'laila',
                                                  height: 1.2,
                                                  fontWeight: FontWeight.w400,
                                                  color: options![index + 1]
                                                          .containsKey(
                                                              'option5')
                                                      ? const Color(0xFFFF6C2C)
                                                      : options![index + 1]
                                                              .containsKey(
                                                                  'option4')
                                                          ? const Color(
                                                              0xFFFA9458)
                                                          : options![index + 1]
                                                                  .containsKey(
                                                                      'option3')
                                                              ? const Color(
                                                                  0xFFE1C44F)
                                                              : options![index +
                                                                          1]
                                                                      .containsKey(
                                                                          'option2')
                                                                  ? const Color(
                                                                      0xFF7291A0)
                                                                  : const Color(
                                                                      0xFF546096)),
                                              children: [
                                            TextSpan(
                                                text: options!
                                                    .elementAt(index + 1)
                                                    .values
                                                    .toString()
                                                    .replaceAll('(', '')
                                                    .replaceAll(')', '')),
                                            TextSpan(
                                                text: 'x',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            2.0))
                                          ])),
                                    ),
                                    circlesInRowColored(
                                        context,
                                        int.parse(options!
                                            .elementAt(index + 1)
                                            .values
                                            .toString()
                                            .replaceAll('(', '')
                                            .replaceAll(')', '')),
                                        options![index + 1]
                                                .containsKey('option5')
                                            ? const Color(0xFFFF6C2C)
                                            : options![index + 1]
                                                    .containsKey('option4')
                                                ? const Color(0xFFFA9458)
                                                : options![index + 1]
                                                        .containsKey('option3')
                                                    ? const Color(0xFFE1C44F)
                                                    : options![index + 1]
                                                            .containsKey(
                                                                'option2')
                                                        ? const Color(
                                                            0xFF7291A0)
                                                        : const Color(
                                                            0xFF546096)),
                                    index != 3
                                        ? Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    8.4,
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.2,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    4.0),
                                            color: const Color(0xFFBDBDBD),
                                          )
                                        : Container(),
                                  ],
                                );
                              }))),
                          SizedBox(
                            height: AppDimensions.height10(context) * 4,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: AppDimensions.height10(context) * 22.9,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 12.1),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF91698C), Color(0xFFC19CA7)])),
                      child: Container(
                        width: AppDimensions.width10(context) * 36.0,
                        height: AppDimensions.height10(context) * 16.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: AppDimensions.width10(context) * 36.0,
                              height: AppDimensions.height10(context) * 1.9,
                              child: Text(
                                'Practice Assessment',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.6,
                                    height: 1.2,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFF5F5F5)),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 35.0,
                              height: AppDimensions.height10(context) * 1.8,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.8,
                                  bottom:
                                      AppDimensions.height10(context) * 1.2),
                              child: Text(
                                'Your latest 20 active day evaluation.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.4,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFF5F5F5)),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                if (noData != true) {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: prac_score(
                                        route: 'report',
                                        secondaryRoute: '',
                                        index: widget.index,
                                      )));
                                }
                              },
                              child: button_feilds(
                                feild_text: 'Practice score ',
                                icon_viible: true,
                                text_color: 0xff646464,
                                premium: true,
                                feild_text_2: '(',
                                text_color_2: 0xff8EA1B1,
                                feild_text_3: noData == true
                                    ? '-'
                                    : report['practice']['practiceEvaluations']
                                                [0]['totalPoint'] !=
                                            null
                                        ? report['practice']
                                                    ['practiceEvaluations'][0]
                                                ['totalPoint']
                                            .toString()
                                        : '-',
                                feild_text_4: '/5)',
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: AppDimensions.width10(context) * 36.0,
                                height: AppDimensions.height10(context) * 6.0,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 1.2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width:
                                          AppDimensions.height10(context) * 0.1,
                                      color: const Color(0xFFFFFFFF)),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0),
                                ),
                                child: Center(
                                  child: Container(
                                    //  width: AppDimensions.width10(context) * 7.2,
                                    height:
                                        AppDimensions.height10(context) * 2.1,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            0.2),
                                    child: Center(
                                      child: Text(
                                        'Exit report',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.8,
                                            height: 1.2,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
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

void report(context) {
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
          width: AppDimensions.width10(context) * 39.4,
          height: AppDimensions.height10(context) * 51.3,
          margin: EdgeInsets.only(
              left: AppDimensions.height10(context) * 1.0,
              right: AppDimensions.width10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.3),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFFE1B3B7), Color(0XffC9B9CB)]),
            image: const DecorationImage(
                opacity: 0.7,
                image: AssetImage('assets/images/timeline_2.webp'),
                fit: BoxFit.cover),
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 2.0),
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
                    width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              SizedBox(
                width: AppDimensions.width10(context) * 23.8,
                height: AppDimensions.height10(context) * 3.4,
                // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 3.2),
                child: Text(
                  'Congratulations!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppDimensions.font10(context) * 2.8,
                      color: const Color(0xff437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 32.8,
                height: AppDimensions.height10(context) * 2.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.5),
                child: Text(
                  'Your 20 active day report is ready',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.12,
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimensions.font10(context) * 2.0,
                      color: const Color(0xff437296)),
                ),
              ),
              Container(
                //  width: AppDimensions.width10(context) * 33.8,
                // height: AppDimensions.height10(context) * 6.8,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 1.5),
                child: Text(
                  'You have been consistently working on your\npractice for 20 active days now. We’ve put together\na progress report for you to review and evaluate\nyour journey.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: AppDimensions.font10(context) * 1.4,
                      color: const Color(0xff437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 23.7,
                height: AppDimensions.height10(context) * 25.5,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.2),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/Report card.webp')),
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                ),
              )
            ],
          ),
        )),
  );
}

String formatDate(String inputDate) {
  DateTime date = DateTime.parse(inputDate);
  String formattedDate =
      "${date.day}/${_getMonthName(date.month)}/${date.year}";
  return formattedDate;
}

String _getMonthName(int month) {
  switch (month) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "Apr";
    case 5:
      return "May";
    case 6:
      return "Jun";
    case 7:
      return "Jul";
    case 8:
      return "Aug";
    case 9:
      return "Sep";
    case 10:
      return "Oct";
    case 11:
      return "Nov";
    case 12:
      return "Dec";
    default:
      return "";
  }
}

circlesInRowColored(BuildContext context, int itteration, Color circleColor) {
  return Container(
    //width: AppDimensions.width10(context) * 16.0,
    // height: AppDimensions.height10(context) * 1.0,
    margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        (itteration / 5).ceil(),
        (rowIndex) => Container(
          margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (rowIndex == (itteration / 5).floor()
                  ? (itteration % 5)
                  : 5), // Replace 5 with the number of containers you want to create
              (index) => Container(
                width: AppDimensions.width10(context) * 1.5,
                height: AppDimensions.height10(context) * 1.5,
                margin: EdgeInsets.symmetric(
                    horizontal: AppDimensions.height10(context) * 0.25),
                decoration:
                    BoxDecoration(color: circleColor, shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
