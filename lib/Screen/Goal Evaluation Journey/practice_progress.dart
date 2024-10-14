import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/goalEvaluation.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/widgets/practiceProgressSheet.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeMenu.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/goalAndPracticeName.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_dimensions.dart';
import 'practice_assesment_history.dart';
import 'progress_report.dart';
import 'widgets/habitColors.dart';
import 'widgets/reportCalender.dart';

String activity_duration = 'Past month';
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class practice_progress extends StatefulWidget {
  final int days;
  final String route;
  const practice_progress({super.key, required this.days, required this.route});

  @override
  State<practice_progress> createState() => _practice_progressState();
}

class _practice_progressState extends State<practice_progress> {
  bool loader = true;
  bool noData = false;
  var goalDetails;
  var report;
  var evaluation;
  int days = 30;
  String subscription = '';
  List<Color> outerColor = [];
  List<Map<String, int>>? options;
  int completedCount = 0;
  int missed = 0;
  int opt1 = 0;
  int opt2 = 0;
  int opt3 = 0;
  int opt4 = 0;
  int opt5 = 0;
  Map<String, dynamic> practiceProgress = {};

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loader = false;
    });
  }

  void getSubscription() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      subscription = prefs.getString('subscriptionStatus')!;
    });
  }

  void getReport() {
    PracticeEvaluation.getUserPracticeReportIdBydays(widget.days)
        .then((response) {
      if (response == false) {
        loadData();
        setState(() {
          noData = true;
        });
      } else if (response.length != 0 && response != false) {
        setState(() {
          report = response['report'];
          evaluation = response['report']['practice']['practiceEvaluations'];
          noData = false;
        });

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
        loadData();
      }
    }).catchError((error) {
      setState(() {
        noData = true;
      });
      loadData();
    }).whenComplete(() => null);
  }

  @override
  void initState() {
    super.initState();
    if (widget.days == 0) {
      setState(() {
        activity_duration = 'Select Duration';
      });
    }
    getSubscription();
    getReport();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        setState(() {
          activity_duration = 'Select Duration';
        });
        if (widget.route == 'pracice_menu_completed') {
          Navigator.push(
              context,
              FadePageRouteReverse(
                  page: const practiceMenu(
                goal_eval: false,
                completed: false,
              )));
        } else if (widget.route == 'pracice_menu') {
          Navigator.push(
              context,
              FadePageRouteReverse(
                  page: const practiceMenu(
                goal_eval: false,
                completed: false,
              )));
        }

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: Buttons().backButton(context, () {
              setState(() {
                activity_duration = 'Select Duration';
              });
              if (widget.route == 'pracice_menu_completed') {
                Navigator.push(
                    context,
                    FadePageRouteReverse(
                        page: const practiceMenu(
                      goal_eval: false,
                      completed: false,
                    )));
              } else if (widget.route == 'pracice_menu') {
                Navigator.push(
                    context,
                    FadePageRouteReverse(
                        page: const practiceMenu(
                      goal_eval: false,
                      completed: false,
                    )));
              }
            })),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: loader == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      // mainAxisAlignment: ,
                      children: [
                        Container(
                          // width: AppDimensions.width10(context) * 12.5,
                          //height: AppDimensions.height10(context) * 2.3,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 5.2),
                          child: Text(
                            'Practice Progress',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.2,
                                color: Colors.white,
                                fontSize:
                                    UpdatedDimensions.font10(context) * 1.8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 30,
                          //height: AppDimensions.height10(context) * 2.6,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.5),
                          child: Text(
                            noData == true
                                ? 'No data found'
                                : report['practice']["userGoal"]["name"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: UpdatedDimensions.font10(context) * 2.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        goalAndPractice(
                          context,
                          noData
                              ? "2"
                              : report['practice']['userGoal']['color'],
                          noData ? "2" : report['practice']['color'],
                          noData ? " " : report['practice']["name"],
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 37.6,
                          //  height: AppDimensions.height10(context) * 7.2,
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
                                      UpdatedDimensions.font10(context) * 3.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 30.3,
                            height: AppDimensions.height10(context) * 5.7,
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
                                //width: AppDimensions.width10(context) * 21.0,
                                height: AppDimensions.height10(context) * 3.2,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 0.8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      //width: AppDimensions.width10(context) * 16.7,
                                      height:
                                          AppDimensions.height10(context) * 2.8,
                                      child: RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFFFBFBFB),
                                                  fontFamily: 'laila',
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          2,
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
                                        // width: AppDimensions.width10(context) * 2.4,
                                        // height: AppDimensions.height10(context) * 2.4,
                                        // color: Colors.green,
                                        child: Image.asset(
                                          'assets/images/Polygon 9.webp',
                                          width:
                                              AppDimensions.width10(context) *
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
                        habitComponent(
                            context, options, outerColor, subscription, false),
                        habitAfterSessionComponent(
                            context, noData ? null : report['afterRecording']),
                        Container(
                          // width: AppDimensions.width10(context) * 2.1,
                          //height: AppDimensions.height10(context) * 4.3,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensions.width10(context) * 4.1,
                            height: AppDimensions.height10(context) * 4.3,
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 37.1,
                          //height: AppDimensions.height10(context) * 5.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0),
                          child: Center(
                            child: Text(
                              'Your last practice progress\nevaluation for periods',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: AppDimensions.height10(context) * 0.12,
                                fontSize:
                                    UpdatedDimensions.font10(context) * 2.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFBFBFB),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 37.1,
                          //height: AppDimensions.height10(context) * 3.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.6),
                          child: Center(
                            child: Text(
                              noData == true
                                  ? 'DD/MMM/YY to DD/MMM/YY.'
                                  : evaluation.length == 0
                                      ? 'DD/MMM/YY to DD/MMM/YY.'
                                      : '${formatDate(evaluation[0]["activeDate"].toString().substring(0, 10))} to ${formatDate(evaluation[0]["endDate"].toString().substring(0, 10))}',
                              style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 2.0,
                                height:
                                    UpdatedDimensions.height10(context) * 0.12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFBFBFB),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 38.2,
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
                                width: AppDimensions.width10(context) * 30,
                                //height: AppDimensions.height10(context) * 7.2,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 5.0),
                                child: Center(
                                  child: Text(
                                    'How effective has this practice been in moving you closer towards your goal?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: const Color(0xFF437296),
                                        height:
                                            AppDimensions.height10(context) *
                                                0.12,
                                        fontSize:
                                            UpdatedDimensions.font10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.width10(context) * 28.6,
                                //height: AppDimensions.height10(context) * 10.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 7.6,
                                      // height:
                                      //     AppDimensions.height10(context) * 5.3,
                                      child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    fontFamily: 'laila',
                                                    height: 1.2,
                                                    fontSize: UpdatedDimensions
                                                            .font10(context) *
                                                        2.4,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                children: [
                                              TextSpan(
                                                text: noData == true
                                                    ? "0"
                                                    : evaluation.length == 0 ||
                                                            evaluation[0][
                                                                        'question1']
                                                                    .toString() ==
                                                                "null"
                                                        ? '-'
                                                        : '${evaluation[0]['question1']}',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    height: 1.2,
                                                    fontSize: UpdatedDimensions
                                                            .font10(context) *
                                                        4.5,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const TextSpan(text: '/5')
                                            ])),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 28.6,
                                      // height:
                                      //     AppDimensions.height10(context) * 2.4,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Center(
                                        child: Text(
                                          '“There is good improvement”',
                                          style: TextStyle(
                                              color: const Color(0xFFB695B7),
                                              height: 1.2,
                                              fontSize:
                                                  UpdatedDimensions.font10(
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
                                                  : evaluation.length == 0 ||
                                                          evaluation[0][
                                                                      'question1']
                                                                  .toString() ==
                                                              "null"
                                                      ? 0
                                                      : int.parse(evaluation[0]
                                                              ['question1']
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
                                              : evaluation.length == 0 ||
                                                      evaluation[0]['question1']
                                                              .toString() ==
                                                          "null"
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
                                                                        0][
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
                                width: AppDimensions.width10(context) * 8.4,
                                height: AppDimensions.height10(context) * 0.2,
                                color: const Color(0xFF437296),
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.7,
                                    bottom:
                                        AppDimensions.height10(context) * 2.7),
                              ),
                              SizedBox(
                                width: AppDimensions.width10(context) * 30.0,
                                //height: AppDimensions.height10(context) * 17.5,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 30.0,
                                      // height:
                                      //     AppDimensions.height10(context) * 4.8,
                                      child: Center(
                                        child: Text(
                                          'How much have you enjoyed the journey during this period?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: const Color(0xFF437296),
                                              height: 1.2,
                                              fontSize:
                                                  UpdatedDimensions.font10(
                                                          context) *
                                                      2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.6,
                                      // height:
                                      //     AppDimensions.height10(context) * 5.3,
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
                                                        AppDimensions.font10(
                                                                context) *
                                                            2.4,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                children: [
                                              TextSpan(
                                                text: noData == true
                                                    ? '0'
                                                    : evaluation.length == 0 ||
                                                            evaluation[0][
                                                                        'question2']
                                                                    .toString() ==
                                                                "null"
                                                        ? '-'
                                                        : '${evaluation[0]['question2']}',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    height: 1.2,
                                                    fontSize: UpdatedDimensions
                                                            .font10(context) *
                                                        4.5,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const TextSpan(text: '/5')
                                            ])),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 28.6,
                                      // height:
                                      //     AppDimensions.height10(context) * 2.4,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Center(
                                        child: Text(
                                          '“It is not bad”',
                                          style: TextStyle(
                                              color: const Color(0xFFB695B7),
                                              height: 1.2,
                                              fontSize:
                                                  UpdatedDimensions.font10(
                                                          context) *
                                                      2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width:
                                      //     AppDimensions.height10(context) * 7.0,
                                      // height:
                                      //     AppDimensions.height10(context) * 1.0,
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
                                                  : evaluation.length == 0 ||
                                                          evaluation[0][
                                                                      'question2']
                                                                  .toString() ==
                                                              "null"
                                                      ? 0
                                                      : int.parse(evaluation[0]
                                                              ['question2']
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
                                              : evaluation.length == 0 ||
                                                      evaluation[0]['question2']
                                                              .toString() ==
                                                          "null"
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
                                                                        0][
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
                                width: AppDimensions.width10(context) * 8.4,
                                height: AppDimensions.height10(context) * 0.2,
                                color: const Color(0xFF437296),
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.7,
                                    bottom:
                                        AppDimensions.height10(context) * 2.7),
                              ),
                              SizedBox(
                                width: AppDimensions.width10(context) * 34.8,
                                //height: AppDimensions.height10(context) * 19.9,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 34.8,
                                      // height:
                                      //     AppDimensions.height10(context) * 7.2,
                                      child: Center(
                                        child: Text(
                                          'How confident are you that this practice will help move you closer towards achieving your goal?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: const Color(0xFF437296),
                                              height: 1.2,
                                              fontSize:
                                                  UpdatedDimensions.font10(
                                                          context) *
                                                      2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width:
                                      //     AppDimensions.height10(context) * 7.6,
                                      // height:
                                      //     AppDimensions.height10(context) * 5.3,
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
                                                    fontSize: UpdatedDimensions
                                                            .font10(context) *
                                                        2.4,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                children: [
                                              TextSpan(
                                                text: noData == true
                                                    ? '0'
                                                    : evaluation.length == 0 ||
                                                            evaluation[0][
                                                                        'question3']
                                                                    .toString() ==
                                                                "null"
                                                        ? '-'
                                                        : '${evaluation[0]['question3']}',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    height: 1.2,
                                                    fontSize: UpdatedDimensions
                                                            .font10(context) *
                                                        4.5,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const TextSpan(text: '/5')
                                            ])),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 28.6,
                                      // height:
                                      //     AppDimensions.height10(context) * 2.4,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Center(
                                        child: Text(
                                          '“I feel there is a good chance”',
                                          style: TextStyle(
                                              color: const Color(0xFFB695B7),
                                              height: 1.2,
                                              fontSize:
                                                  UpdatedDimensions.font10(
                                                          context) *
                                                      2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width:
                                      //     AppDimensions.height10(context) * 7.0,
                                      // height:
                                      //     AppDimensions.height10(context) * 1.0,
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
                                                  : evaluation.length == 0 ||
                                                          evaluation[0][
                                                                      'question3']
                                                                  .toString() ==
                                                              "null"
                                                      ? 0
                                                      : int.parse(evaluation[0]
                                                              ['question3']
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
                                              : evaluation.length == 0 ||
                                                      evaluation[0]['question3']
                                                              .toString() ==
                                                          "null"
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
                                                                        0][
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
                                width: AppDimensions.width10(context) * 8.4,
                                height: AppDimensions.height10(context) * 0.2,
                                color: const Color(0xFF437296),
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.7,
                                    bottom:
                                        AppDimensions.height10(context) * 2.7),
                              ),
                              SizedBox(
                                width: AppDimensions.width10(context) * 34.8,
                                //height: AppDimensions.height10(context) * 19.9,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 34.8,
                                      // height:
                                      //     AppDimensions.height10(context) * 7.2,
                                      child: Center(
                                        child: Text(
                                          'How easy is it to implement this practice in to your life?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: const Color(0xFF437296),
                                              height: 1.2,
                                              fontSize:
                                                  UpdatedDimensions.font10(
                                                          context) *
                                                      2.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.6,
                                      // height:
                                      //     AppDimensions.height10(context) * 5.3,
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
                                                    fontSize: UpdatedDimensions
                                                            .font10(context) *
                                                        2.4,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                children: [
                                              TextSpan(
                                                text: noData == true
                                                    ? '0'
                                                    : evaluation.length == 0 ||
                                                            evaluation[0][
                                                                        'question4']
                                                                    .toString() ==
                                                                "null"
                                                        ? '-'
                                                        : '${evaluation[0]['question4']}',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFB695B7),
                                                    height: 1.2,
                                                    fontSize: UpdatedDimensions
                                                            .font10(context) *
                                                        4.5,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const TextSpan(text: '/5')
                                            ])),
                                      ),
                                    ),
                                    Container(
                                      /// width: AppDimensions.width10(context) * 28.6,
                                      // height:
                                      //     AppDimensions.height10(context) * 2.4,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.0),
                                      child: Center(
                                        child: Text(
                                          '“I have more hard days than easy”',
                                          style: TextStyle(
                                              color: const Color(0xFFB695B7),
                                              height: 1.2,
                                              fontSize:
                                                  UpdatedDimensions.font10(
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
                                                  : evaluation.length == 0 ||
                                                          evaluation[0][
                                                                      'question4']
                                                                  .toString() ==
                                                              "null"
                                                      ? 0
                                                      : int.parse(evaluation[0]
                                                              ['question4']
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
                                              : evaluation.length == 0 ||
                                                      evaluation[0]['question4']
                                                              .toString() ==
                                                          "null"
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
                                                                        0][
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
                                width: AppDimensions.width10(context) * 8.4,
                                height: AppDimensions.height10(context) * 0.2,
                                color: const Color(0xFF437296),
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.7,
                                    bottom:
                                        AppDimensions.height10(context) * 2.7),
                              ),
                              AnimatedScaleButton(
                                  onTap: () async {
                                    if (evaluation.length != 0) {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: practice_assesment(
                                            days: widget.days,
                                            route: widget.route,
                                          )));
                                      final SharedPreferences prefs =
                                          await _prefs;
                                      await prefs.setString('assesmentRoute',
                                          'practice_progress');
                                    }
                                  },
                                  child: Container(
                                      height:
                                          AppDimensions.height10(context) * 6.0,
                                      width:
                                          AppDimensions.width10(context) * 34.2,
                                      margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            2.7,
                                        // left: AppDimensions.width10(context) * 2.0,
                                        //right: AppDimensions.width10(context) * 1.9,
                                      ),
                                      decoration: BoxDecoration(
                                          color: subscription == 'active'
                                              ? Color(0xFF5F5F5)
                                              : Colors.black.withOpacity(0.1),
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
                                              margin: EdgeInsets.only(
                                                  left: AppDimensions.height10(
                                                          context) *
                                                      1.99),
                                              child: Text(
                                                'Practice assessment history',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF828282),
                                                  fontSize:
                                                      UpdatedDimensions.font10(
                                                              context) *
                                                          2,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Container(
                                                width: AppDimensions.width10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    1.39,
                                                margin: EdgeInsets.only(
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.391),
                                                child: Image.asset(
                                                  'assets/images/BTN Back.webp',
                                                  //width: AppDimensions.width10(context) * 2.6,
                                                  //height: AppDimensions.height10(context) * 2.6,
                                                  color:
                                                      const Color(0xFF828282),
                                                  fit: BoxFit.cover,
                                                ))
                                          ]))),
                              SizedBox(
                                height: AppDimensions.height10(context) * 4,
                              )
                            ],
                          ),
                        ),
                        Container(
                          // width: AppDimensions.width10(context) * 2.1,
                          //height: AppDimensions.height10(context) * 4.3,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensions.width10(context) * 4.1,
                            height: AppDimensions.height10(context) * 4.3,
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 35.8,
                          // height: AppDimensions.height10(context) * 5.2,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0),
                          child: Center(
                            child: Text(
                              noData == true
                                  ? 'Your next practice report will be delivered in 20 Active Days'
                                  : 'Your next practice report will be delivered in ${20 - report["activeDaysInMonth"]} Active Days',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: AppDimensions.height10(context) * 0.12,
                                fontSize:
                                    UpdatedDimensions.font10(context) * 2.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFBFBFB),
                              ),
                            ),
                          ),
                        ),
                        calender(context, noData, report, completedCount),
                        SizedBox(
                          height: AppDimensions.height10(context) * 8,
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return MyBottomSheet();
      },
    ).then((value) {
      if (value != null) {
        if (value == 0) {
          setState(() {
            //  Loader = true;
            days = 0;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 0,
                route: widget.route,
              )));
          // getReport();
        } else if (value == 1) {
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
          //  getReport();
        } else if (value == 2) {
          setState(() {
            // Loader = true;
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
        } else if (value == 3) {
          setState(() {
            days = 30;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 30,
                route: widget.route,
              )));
          //getReport();
        } else if (value == 4) {
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
        } else if (value == 5) {
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
        } else if (value == 6) {
          setState(() {
            //  Loader = true;
            days = 180;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 180,
                route: widget.route,
              )));
          // getReport();
        } else if (value == 7) {
          setState(() {
            //  Loader = true;
            days = 274;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 274,
                route: widget.route,
              )));
          //  getReport();
        } else if (value == 8) {
          setState(() {
            // Loader = true;
            days = 365;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 365,
                route: widget.route,
              )));
          //  getReport();
        } else if (value == 9) {
          setState(() {
            days = 730;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 730,
                route: widget.route,
              )));
          //getReport();
        } else if (value == 10) {
          setState(() {
            days = 1095;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 1095,
                route: widget.route,
              )));
          //getReport();
        } else if (value == 11) {
          setState(() {
            days = 1460;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 1460,
                route: widget.route,
              )));
          //getReport();
        } else if (value == 12) {
          setState(() {
            days = 1825;
          });
          Navigator.push(
              context,
              FadePageRoute(
                  page: practice_progress(
                days: 1825,
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
