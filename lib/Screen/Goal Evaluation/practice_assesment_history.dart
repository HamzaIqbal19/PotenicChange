import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/goalEvaluation.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/goal_menu_missed_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/menu_dashboard_behaviour.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_progress.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_score.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'progress_report.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class practice_assesment extends StatefulWidget {
  final int days;
  final String route;
  const practice_assesment(
      {super.key, required this.days, required this.route});

  @override
  State<practice_assesment> createState() => _practice_assesmentState();
}

class _practice_assesmentState extends State<practice_assesment> {
  var goalDetails;
  var pracDetails;
  bool Loader = true;
  String route = '';

  Future<void> _getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var incoming = prefs.getString('assesmentRoute');
    setState(() {
      route = incoming!;
    });
  }

  void fetchGoalDetails() async {
    final SharedPreferences prefs = await _prefs;

    AdminGoal.getUserGoalById(prefs.get('goal_num')).then((response) async {
      if (response.length != 0) {
        setState(() {
          goalDetails = response;
          pracDetails = response['userPractices'];
        });
        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {
      print("error");
    }).whenComplete(() {});
  }

  void fetchPracticeAssesment() async {
    PracticeEvaluation.getPracriceAssesment().then((response) {
      if (response.length != 0) {
        setState(() {
          pracDetails = response['practiceEvaluations'];
        });
        loadData();
      }
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _getRoute();
    fetchPracticeAssesment();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (route == 'practice_menu') {
          Navigator.pushReplacement(
              context,
              FadePageRouteReverse(
                  page: const practiceMenu(
                goal_eval: false,
              )));
        } else if (route == 'practice_menu_missed') {
          Navigator.pushReplacement(
              context,
              FadePageRouteReverse(
                  page: const missed_Menu(
                pracName: '',
              )));
        } else if (route == 'practice_completed') {
          Navigator.pushReplacement(
              context, FadePageRouteReverse(page: const menu_behaviour()));
        } else if (route == 'practice_completed') {
          Navigator.pushReplacement(
              context,
              FadePageRouteReverse(
                  page: practice_progress(
                days: widget.days,
                route: widget.route,
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
                  if (route == 'practice_menu') {
                    Navigator.pushReplacement(
                        context,
                        FadePageRouteReverse(
                            page: const practiceMenu(
                          goal_eval: false,
                        )));
                  } else if (route == 'practice_menu_missed') {
                    Navigator.pushReplacement(
                        context,
                        FadePageRouteReverse(
                            page: const missed_Menu(
                          pracName: '',
                        )));
                  } else if (route == 'practice_completed') {
                    Navigator.pushReplacement(context,
                        FadePageRouteReverse(page: const menu_behaviour()));
                  } else if (route == 'practice_completed') {
                    Navigator.pushReplacement(
                        context,
                        FadePageRouteReverse(
                            page: practice_progress(
                          days: widget.days,
                          route: widget.route,
                        )));
                  }
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                //  width: AppDimensions.width10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.contain,
                )),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    if (route == 'practice_menu') {
                      Navigator.pushReplacement(
                          context,
                          FadePageRouteReverse(
                              page: const practiceMenu(
                            goal_eval: false,
                          )));
                    } else if (route == 'practice_menu_missed') {
                      Navigator.pushReplacement(
                          context,
                          FadePageRouteReverse(
                              page: const missed_Menu(
                            pracName: '',
                          )));
                    } else if (route == 'practice_completed') {
                      Navigator.pushReplacement(context,
                          FadePageRouteReverse(page: const menu_behaviour()));
                    } else if (route == 'practice_completed') {
                      Navigator.pushReplacement(
                          context,
                          FadePageRouteReverse(
                              page: practice_progress(
                            days: widget.days,
                            route: widget.route,
                          )));
                    }
                  },
                  icon: Image.asset(
                    'assets/images/Close.webp',
                   // width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.contain,
                  )),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
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
                  child: Column(
                  children: [
                    Container(
                      // width: AppDimensions.width10(context) * 27.9,
                      // alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 5.2),
                      child: const Text(
                        'Practice Assessment History',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 2.5,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            pracDetails.length, // Half of the items, rounded up
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                width: AppDimensions.width10(context) * 41.3,
                                height: AppDimensions.height10(context) * 22.9,
                                margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 2.0,
                                ),
                                child: Stack(children: [
                                  Align(
                                    alignment: const Alignment(1, -1.3),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: AppDimensions.height10(context) * 0.5),
                                      child: IconButton(
                                          onPressed: () {
                                            info_sheet(context);
                                          },
                                          icon: Image.asset(
                                            'assets/images/ic_info_outline.webp',
                                            height:
                                            AppDimensions.height10(context) * 3.0,
                                            width: AppDimensions.width10(context) * 3.0,
                                          )),
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0, -1),
                                    child: SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 36.0,
                                      height: AppDimensions.height10(context) *
                                          24.7,
                                      child: Column(
                                        children: [
                                          Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    36.0,
                                            margin: EdgeInsets.only(
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    1.2),
                                            child: Column(children: [
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.1,
                                                child: Text(
                                                  'Practice Assessment',
                                                  style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.8,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: const Color(
                                                          0xfff5f5f5)),
                                                ),
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions.height10(context) *
                                                          0.3),
                                                  child: index == 0
                                                      ? RichText(
                                                          textAlign:
                                                              TextAlign.center,
                                                          text: TextSpan(
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'laila',
                                                                  height: AppDimensions.height10(context) *
                                                                      0.15,
                                                                  fontSize: AppDimensions.font10(context) *
                                                                      1.4,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: const Color(
                                                                      0xfff5f5f5)),
                                                              children: [
                                                                const TextSpan(
                                                                    text:
                                                                        'Here is your latest 20 active day evaluation.\n'),
                                                                const TextSpan(
                                                                    text:
                                                                        'Next assessment is in '),
                                                                TextSpan(
                                                                    text: pracDetails[index]['practiceTotalActiveDays'] ==
                                                                                0 ||
                                                                            pracDetails[index]['practiceTotalActiveDays'] ==
                                                                                null
                                                                        ? '-20 active days.'
                                                                        : '${pracDetails[index]['practiceTotalActiveDays'] - 20} active days.',
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w700))
                                                              ]))
                                                      : RichText(
                                                          textAlign:
                                                              TextAlign.center,
                                                          text: TextSpan(
                                                              style: TextStyle(
                                                                  fontFamily: 'laila',
                                                                  height: AppDimensions.height10(context) * 0.15,
                                                                  fontSize: AppDimensions.font10(context) * 1.4,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: const Color(0xfff5f5f5)),
                                                              children: [
                                                                const TextSpan(
                                                                    text:
                                                                        'Here is your 20 active day evaluation for periods\n'),
                                                                TextSpan(
                                                                  text: formatDate(
                                                                      pracDetails[
                                                                              index]
                                                                          [
                                                                          'activeDate']),
                                                                ),
                                                                const TextSpan(
                                                                    text:
                                                                        ' to '),
                                                                TextSpan(
                                                                  text: formatDate(
                                                                      pracDetails[
                                                                              index]
                                                                          [
                                                                          'endDate']),
                                                                )
                                                              ])))
                                            ]),
                                          ),
                                          Column(
                                            children: [
                                              AnimatedScaleButton(
                                                onTap: () async {
                                                  final SharedPreferences
                                                      prefs = await _prefs;
                                                  await prefs.setString(
                                                      'lastReportDate',
                                                      pracDetails[index]
                                                          ['activeDate']);
                                                  await prefs.setString(
                                                      'lastReportEnd',
                                                      pracDetails[index]
                                                          ['endDate']);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      FadePageRoute(
                                                          page: progress_report(
                                                        index: index,
                                                      )));
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.2),
                                                  child: button_feilds(
                                                    feild_text:
                                                        'Progress report',
                                                    premium: true,
                                                    icon_viible: true,
                                                    text_color: 0xff646464,
                                                    feild_text_2:
                                                        " ${formatDate(pracDetails[index]['endDate'])}",
                                                    text_color_2: 0xff8EA1B1,
                                                    feild_text_3: '',
                                                    feild_text_4: '',
                                                  ),
                                                ),
                                              ),
                                              AnimatedScaleButton(
                                                onTap: () async {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      FadePageRoute(
                                                          page: prac_score(
                                                        route: 'assesment',
                                                        index: index,
                                                        secondaryRoute: route,
                                                      )));
                                                  final SharedPreferences
                                                      prefs = await _prefs;
                                                  await prefs.setString(
                                                      'lastReportDate',
                                                      pracDetails[index]
                                                          ['endDate']);
                                                  await prefs.setInt(
                                                      'prac_eval_id',
                                                      pracDetails[index]["id"]);
                                                },
                                                child: button_feilds(
                                                  feild_text:
                                                      'Evaluation level ',
                                                  premium: true,
                                                  icon_viible: true,
                                                  text_color: 0xff646464,
                                                  feild_text_2: '(',
                                                  text_color_2: 0xff8EA1B1,
                                                  feild_text_3:
                                                      "${pracDetails[index]['totalPoint']}",
                                                  feild_text_4: '/5)',
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                width: double.infinity,
                                height: AppDimensions.height10(context) * 0.1,
                                color: const Color(0xFFFFFFFF).withOpacity(0.5),
                              ),
                            ],
                          );
                        }),
                  ],
                ))
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
}
