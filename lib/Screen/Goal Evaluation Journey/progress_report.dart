import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/goalEvaluation.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';
import 'practice_score.dart';
import 'widgets/habitColors.dart';
import 'widgets/identityComponent.dart';
import 'widgets/inspirationComponents.dart';
import 'widgets/reportCalender.dart';
import 'widgets/sideWidgets.dart';

class ProgressReport extends StatefulWidget {
  final int index;
  const ProgressReport({super.key, required this.index});

  @override
  State<ProgressReport> createState() => ProgressReportState();
}

class ProgressReportState extends State<ProgressReport> {
  bool loader = true;
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
      loader = false;
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
              outerColor.add(const Color(0xFFFF7C42));
              setState(() {
                opt4 = opt4 + 1;
              });
            } else if (value == 5) {
              outerColor.add(const Color(0xFF219653));
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
        leading: Buttons().backButton(context, () {
            Navigator.pop(context);
          }),
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
        child: loader == false
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    sideWidget(context, noData, report['practice']["name"]),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 5.0),
                      child: Text(
                        'Congratulations!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: UpdatedDimensions.font10(context) * 3.0,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.7),
                      child: Text(
                        'You have been consistently doing\nyour practice for 20 active days ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: UpdatedDimensions.font10(context) * 2.0,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 0.5),
                      child: Text(
                        //we will give duration of 20 days
                        noData == true
                            ? 'No data found'
                            : 'from ${formatDate(report["startDate"])} to ${formatDate(report["endDate"])}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: UpdatedDimensions.font10(context) * 1.6,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.9),
                      child: Text(
                        'You are a rockstar! :)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: UpdatedDimensions.font10(context) * 2.2,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: AppDimensions.width10(context) * 34.0,
                      //height: AppDimensions.height10(context) * 11.2,
                      margin: EdgeInsets.only(
                          left: AppDimensions.width10(context) * 1.5),
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              width: AppDimensions.width10(context) * 7.9,
                              height: AppDimensions.height10(context) * 7.94,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.width10(context) * 0.7,
                                  left: AppDimensions.width10(context) * 0.5),
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
                                  left: AppDimensions.width10(context) * 0.4,
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
                     // height: AppDimensions.height10(context) * 69.3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/pro_report_bg#2.webp'),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 7.0),
                            child: Text(
                              'Your new\nidentity statement',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: UpdatedDimensions.font10(context) * 2.4,
                                  height: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                for (int i = 0; i < report['practice']['userGoal']['reason'].length; i++) ...[
                                  identityComponent(context,i,report['practice']['userGoal']['reason'][i]['text'])
                                ]
                              ],
                            )
                          ),
                          const SizedBox(height: 50,),
                          Text(
                            'Your inspirations',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: UpdatedDimensions.font10(context) * 2.4,
                                height: 1.2,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF)),
                          ),
                          const SizedBox(height: 30,),
                          report['userInspirations'].length == 0? emptyInspiration(context): SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < report['userInspirations'].length; i++) ... [
                                  inspirationComponent(context, report['userInspirations'][i]['inspirationId'].toString(), report['userInspirations'][i]['file']??'', report['userInspirations'][i]['description']??'',i)
                                ]
                              ],
                            ),
                          ),
                          const SizedBox(height: 80,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 7.0),
                      child: Text(
                        'You have completed 20\nactive days of practice!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: UpdatedDimensions.font10(context) * 2.4,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    calender(context, noData, report,20),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.7),
                      child: Image.asset(
                        'assets/images/Arrow.webp',
                        width: AppDimensions.width10(context) * 4.1,
                        height: AppDimensions.height10(context) * 4.3,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 4.0),
                      child: Text(
                        'This is how you felt\nimplementing your new\npractice',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: UpdatedDimensions.font10(context) * 2.4,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    habitComponent(context,options,outerColor,'active',true),
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
                              //height: AppDimensions.height10(context) * 1.9,
                              child: Text(
                                'Practice Assessment',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                    UpdatedDimensions.font10(context) * 1.6,
                                    height: 1.2,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFF5F5F5)),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 35.0,
                              //height: AppDimensions.height10(context) * 1.8,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.8,
                                  bottom:
                                      AppDimensions.height10(context) * 1.2),
                              child: Text(
                                'Your latest 20 active day evaluation.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                    UpdatedDimensions.font10(context) * 1.4,
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
                              child: ButtonFields(
                                fieldText: 'Practice score ',
                                iconVisible: true,
                                textColor: 0xff646464,
                                premium: true,
                                fieldText2: '(',
                                textColor2: 0xff8EA1B1,
                                fieldText3: noData == true
                                    ? '-'
                                    : report['practice']['practiceEvaluations']
                                                [0]['totalPoint'] !=
                                            null
                                        ? report['practice']
                                                    ['practiceEvaluations'][0]
                                                ['totalPoint']
                                            .toString()
                                        : '-',
                                fieldText4: '/5)',
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
                                    // height:
                                    //     AppDimensions.height10(context) * 2.1,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            0.2),
                                    child: Center(
                                      child: Text(
                                        'Exit report',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                            UpdatedDimensions.font10(context) *
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
