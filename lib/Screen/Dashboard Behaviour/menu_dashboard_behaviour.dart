import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practiceReportUnsub.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_assesment_history.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_progress.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_score.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/progress_report.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';
import 'package:potenic_app/Screen/timeline/timeline.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/goalAndPracticeName.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/fading.dart';
import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';
import '../Recording Practice Session/recordPracticeMenu.dart';
import 'dashboard_view_goals.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class menu_behaviour extends StatefulWidget {
  const menu_behaviour({
    super.key,
  });

  @override
  State<menu_behaviour> createState() => _menu_behaviourState();
}

class _menu_behaviourState extends State<menu_behaviour> {
  String goalName = '';
  String pracName = '';
  String goalColor = '';
  String pracColor = '';
  String reportDate = '';
  String recordDate = '';
  String subscripption = '';
  int differenceInDays = 0;

  var pracDetails;

  Future<void> getRecordedDate() async {
    final SharedPreferences prefs = await _prefs;

    DateTime currentDate =
        DateTime.parse(DateTime.now().toString().substring(0, 10));
    DateTime date1 = DateTime.parse(prefs.getString('record_date')!);
    setState(() {
      differenceInDays = currentDate.difference(date1).inDays;
    });
  }

  void getRecorDetails() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      goalName = prefs.getString('dash_goalName')!;
      pracColor = prefs.getString('dash_pracColor')!;
      pracName = prefs.getString('dash_pracName')!;
      goalColor = prefs.getString('dash_goalColor')!;
    });
  }

  void getSubscription() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      subscripption = prefs.getString('subscriptionStatus')!;
    });
  }

  void _fetchPracticeDetails() async {
    PracticeGoalApi.getUserPractice().then((response) async {
      if (response.length != 0) {
        setState(() {
          pracDetails = response;
          reportDate = response['practiceEvaluations'] != null
              ? response['practiceEvaluations']['endDate'] ?? ''
              : '';
        });

        loadData();
        AdminGoal.getUserGoalById(response['userGoalId']).then(
          (value) {
            if (value.length != 0) {
              setState(() {
                goalName = value["name"];
              });
            }
          },
        );
        if (response["goalEvaluations"] != null) {
          final SharedPreferences prefs = await _prefs;

          await prefs.setInt('goal_eval_id', response["goalEvaluations"]["id"]);
        }
      } else {}
    }).catchError((error) {});
  }

  bool loader = true;
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loader = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getRecordedDate();
    getRecorDetails();
    getSubscription();
    _fetchPracticeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
          context,
          FadePageRouteReverse(
            page: ViewDashboard(
              missed: false,
              name: '',
              update: false,
              helpfulTips: false,
              record: differenceInDays,
            ),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            // title: Align(
            //   alignment: Alignment.center,
            //   child: Text(
            //     'Practice Menu',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600),
            //   ),
            // ),
            automaticallyImplyLeading: false,
            actions: [
              Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        FadePageRouteReverse(
                          page: const ViewDashboard(
                            missed: false,
                            name: '',
                            update: false,
                            helpfulTips: false,
                            record: 0,
                          ),
                        ),
                      );
                    },
                    icon: Image.asset(
                      'assets/images/Close.webp',
                      //  width: AppDimensions.width10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.8,
                      fit: BoxFit.contain,
                    )),
              )
            ]),
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
                    children: [
                      Container(
                        //width: AppDimensions.width10(context) * 30.4,
                        height: AppDimensions.height10(context) * 18.9,
                        // color: Colors.grey.withOpacity(0.5),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 5.0,
                            bottom: AppDimensions.height10(context) * 1.0),
                        child: Column(
                          children: [
                            Text(
                              AppText().pracMenu,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.font10(context) * 2.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: AppDimensions.width10(context) * 30,
                              child: Center(
                                child: Text(
                                  goalName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          AppDimensions.font10(context) * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            goalAndPractice(
                                context, goalColor, pracColor, pracName),
                            // Container(
                            //   width: AppDimensions.width10(context) * 40.0,
                            //   height: AppDimensions.height10(context) * 11.2,
                            //   margin: EdgeInsets.only(
                            //       top: AppDimensions.height10(context) * 1.6),
                            //   // color: Colors.blue,
                            //   child: Stack(
                            //     children: [
                            //       Align(
                            //         alignment: const Alignment(-0.84, -0.32),
                            //         child: Container(
                            //           width:
                            //               AppDimensions.width10(context) * 7.9,
                            //           height:
                            //               AppDimensions.height10(context) * 7.9,
                            //           decoration: BoxDecoration(
                            //             // color: Colors.amber,
                            //             image: DecorationImage(
                            //                 image: AssetImage(goalColor == '1'
                            //                     ? "assets/images/red_gradient.webp"
                            //                     : goalColor == '2'
                            //                         ? 'assets/images/orange_moon.webp'
                            //                         : goalColor == '3'
                            //                             ? "assets/images/lightGrey_gradient.webp"
                            //                             : goalColor == '4'
                            //                                 ? "assets/images/lightBlue_gradient.webp"
                            //                                 : goalColor == '5'
                            //                                     ? "assets/images/medBlue_gradient.webp"
                            //                                     : goalColor ==
                            //                                             '6'
                            //                                         ? "assets/images/Blue_gradient.webp"
                            //                                         : 'assets/images/orange_moon.webp'),
                            //                 fit: BoxFit.contain),
                            //           ),
                            //         ),
                            //       ),
                            //       Align(
                            //         alignment: const Alignment(-0.6, -0.2),
                            //         child: Container(
                            //           height:
                            //               AppDimensions.height10(context) * 5.0,
                            //           width:
                            //               AppDimensions.width10(context) * 4.6,
                            //           decoration: BoxDecoration(
                            //               //color: Colors.amber,
                            //               image: DecorationImage(
                            //                   image: AssetImage(pracColor == '1'
                            //                       ? "assets/images/Practice_Completed_1.webp"
                            //                       : pracColor == '2'
                            //                           ? 'assets/images/Practice_Completed_2.webp'
                            //                           : pracColor == '3'
                            //                               ? "assets/images/Practice_Completed_3.webp"
                            //                               : pracColor == '4'
                            //                                   ? "assets/images/Practice_Completed_4.webp"
                            //                                   : pracColor == '5'
                            //                                       ? "assets/images/Practice_Completed_4.webp"
                            //                                       : 'assets/images/Practice_Completed_1.webp'),
                            //                   fit: BoxFit.contain)),
                            //         ),
                            //       ),
                            //       Align(
                            //         alignment: const Alignment(1.3, 6),
                            //         child: SizedBox(
                            //           width:
                            //               AppDimensions.width10(context) * 21,
                            //           height: AppDimensions.height10(context) *
                            //               10.6,
                            //           // color: Colors.amber.withOpacity(0.2),
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Text(
                            //                 pracName,
                            //                 textAlign: TextAlign.left,
                            //                 overflow: TextOverflow.ellipsis,
                            //                 style: TextStyle(
                            //                     color: const Color(0xffffffff),
                            //                     fontSize: AppDimensions.font10(
                            //                             context) *
                            //                         2.0,
                            //                     fontWeight: FontWeight.w600),
                            //               ),
                            //               SizedBox(
                            //                 height: AppDimensions.height10(
                            //                         context) *
                            //                     2.5,
                            //                 child: Text(
                            //                   'Session completed',
                            //                   style: TextStyle(
                            //                       fontSize:
                            //                           AppDimensions.font10(
                            //                                   context) *
                            //                               1.6,
                            //                       fontWeight: FontWeight.w500,
                            //                       color:
                            //                           const Color(0xff156F6D)),
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            //
                          ],
                        ),
                      ),

                      SizedBox(
                        width: AppDimensions.width10(context) * 21.1,
                        height: AppDimensions.height10(context) * 11.8,
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            SizedBox(
                              width: AppDimensions.width10(context) * 9.6,
                              height: AppDimensions.height10(context) * 11.8,
                              //margin: EdgeInsets.only(bottom: 19),
                              child: Column(
                                children: [
                                  AnimatedScaleButton(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const practice_summary(
                                                  view: true)));
                                    },
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 7.0,
                                      height:
                                          AppDimensions.height10(context) * 7.0,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xffFCC10D),
                                                Color(0xffFDA210),
                                              ]),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.3,
                                              color: Colors.white)),
                                      child: Center(
                                          child: Image.asset(
                                        'assets/images/visibility_black_24dp 1.webp',
                                        height:
                                            AppDimensions.height10(context) *
                                                2.9,
                                        width: AppDimensions.width10(context) *
                                            21.9,
                                      )),
                                    ),
                                  ),
                                  Text(
                                    'View/Edit',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'session',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.12,
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: AppDimensions.width10(context) * 9.3,
                              height: AppDimensions.height10(context) * 11.8,
                              //margin: EdgeInsets.only(bottom: 19),
                              child: Column(
                                children: [
                                  AnimatedScaleButton(
                                    onTap: () => showAnimatedDialog(
                                        animationType:
                                            DialogTransitionType.fadeScale,
                                        curve: Curves.easeInOut,
                                        duration: const Duration(seconds: 1),
                                        context: context,
                                        builder:
                                            (BuildContext context) => SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      27.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          18.2,
                                                  child: AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4)),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    actionsPadding:
                                                        EdgeInsets.zero,
                                                    titlePadding:
                                                        EdgeInsets.zero,
                                                    title: Container(
                                                        margin: EdgeInsets.only(
                                                            top: AppDimensions.height10(context) *
                                                                1.9,
                                                            right: AppDimensions.width10(context) *
                                                                1.6,
                                                            left: AppDimensions.width10(context) *
                                                                1.6,
                                                            bottom: AppDimensions.height10(context) *
                                                                0.2),
                                                        height: AppDimensions.height10(context) *
                                                            2.2,
                                                        width:
                                                            AppDimensions.height10(context) *
                                                                23.8,
                                                        child: RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'laila',
                                                                    fontSize:
                                                                        AppDimensions.height10(context) * 1.7,
                                                                    fontWeight: FontWeight.w400,
                                                                    color: const Color(0xFF000000)),
                                                                children: const [
                                                                  TextSpan(
                                                                      text:
                                                                          'Are you sure?'),
                                                                ]))),
                                                    content: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.5,
                                                          left: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6,
                                                          right: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6),
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.4,
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              23.8,
                                                      child: Text(
                                                        "Are you sure you want to change this\nscheduled session to missed?",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.3,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.1,
                                                            child: Divider(
                                                              color: const Color(
                                                                      0XFF3C3C43)
                                                                  .withOpacity(
                                                                      0.29),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                4.2,
                                                            width:
                                                                double.infinity,
                                                            color: const Color(
                                                                0xFF007AFF),
                                                            child: TextButton(
                                                              onPressed: () {
                                                                RecordingPractice()
                                                                    .updateRecordingStatus(
                                                                        "missed")
                                                                    .then(
                                                                        (response) {
                                                                  if (response ==
                                                                      true) {
                                                                    Navigator.push(
                                                                        context,
                                                                        FadePageRoute(
                                                                            page: ViewDashboard(
                                                                          missed:
                                                                              true,
                                                                          name:
                                                                              pracName,
                                                                          update:
                                                                              true,
                                                                          helpfulTips:
                                                                              false,
                                                                          record:
                                                                              differenceInDays,
                                                                        )));
                                                                  }
                                                                });
                                                              },
                                                              child: Text(
                                                                'Yes',
                                                                style: TextStyle(
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    fontSize:
                                                                        AppDimensions.height10(context) *
                                                                            1.7,
                                                                    fontFamily:
                                                                        "Laila",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.1,
                                                            child: Divider(
                                                              color: const Color(
                                                                      0XFF3C3C43)
                                                                  .withOpacity(
                                                                      0.29),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                4.4,
                                                            width:
                                                                double.infinity,
                                                            child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        AppDimensions.height10(context) *
                                                                            1.7,
                                                                    fontFamily:
                                                                        "Laila",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xFF007AFF)),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.1,
                                                            child: Divider(
                                                              color: const Color(
                                                                      0XFF3C3C43)
                                                                  .withOpacity(
                                                                      0.29),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 7.0,
                                      height:
                                          AppDimensions.height10(context) * 7.0,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xffFCC10D),
                                                Color(0xffFDA210),
                                              ]),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.3,
                                              color: Colors.white)),
                                      child: Center(
                                        child: Container(
                                          width:
                                              AppDimensions.width10(context) *
                                                  2.9,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.9,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red,
                                          ),
                                          child: Image.asset(
                                            'assets/images/ic_clear.webp',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Missed',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'session',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.12,
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: 360,
                      //   child: Divider(
                      //     thickness: 1,
                      //     height: 1,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      Container(
                        width: double.infinity,
                        height: AppDimensions.height10(context) * 0.1,
                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                        // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 41.3,
                        height: AppDimensions.height10(context) * 22.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.2),
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
                              width: AppDimensions.width10(context) * 36.0,
                              height: AppDimensions.height10(context) * 26.7,
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.width10(context) * 36.0,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.2),
                                    child: Column(children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          AppText().pracAssess,
                                          style: TextStyle(
                                              //increase font size by 2 px
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.8,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xfff5f5f5)),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.2),
                                        child: Text(
                                          AppText().eval20,
                                          style: TextStyle(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.15,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xfff5f5f5)),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.3),
                                        child: pracDetails['activeDays'] == 20
                                            ? Text(
                                                'You can now evaluate your progress',
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.15,
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xfff5f5f5)),
                                              )
                                            : RichText(
                                                text: TextSpan(
                                                    style: TextStyle(
                                                        fontFamily: 'laila',
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.15,
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.4,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xfff5f5f5)),
                                                    children: [
                                                    const TextSpan(
                                                        text:
                                                            'Next assessment is in '),
                                                    TextSpan(
                                                        text:
                                                            '${pracDetails['activeDays'] - 20} active days.',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))
                                                  ])),
                                      )
                                    ]),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.2),
                                        child: AnimatedScaleButton(
                                          onTap: () async {
                                            if (pracDetails['report'] == true &&
                                                subscripption == 'active') {
                                              final SharedPreferences prefs =
                                                  await _prefs;
                                              await prefs.setString(
                                                  'lastReportDate',
                                                  pracDetails[
                                                          'practiceEvaluations']
                                                      ['activeDate']);
                                              await prefs.setString(
                                                  'lastReportEnd',
                                                  pracDetails[
                                                          'practiceEvaluations']
                                                      ['endDate']);
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page:
                                                          const progress_report(
                                                    index: 0,
                                                  )));
                                            } else if (subscripption !=
                                                'active') {
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page:
                                                          const progress_report_unsub()));
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          "Practice report is not active")));
                                            }
                                          },
                                          child: button_feilds(
                                            feild_text: 'Progress report',
                                            icon_viible: true,
                                            text_color: 0xff646464,
                                            premium: subscripption == 'active',
                                            feild_text_2: reportDate != ''
                                                ? '   ${formatDate(reportDate)}'
                                                : '',
                                            text_color_2: 0xff8EA1B1,
                                            feild_text_3: '',
                                            feild_text_4: '',
                                          ),
                                        ),
                                      ),
                                      AnimatedScaleButton(
                                        onTap: () {
                                          if (pracDetails['report'] == true) {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: const prac_score(
                                                  route:
                                                      'pracice_menu_completed',
                                                  secondaryRoute: '',
                                                  index: 0,
                                                )));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Practice score is not active")));
                                          }
                                        },
                                        child: button_feilds(
                                          feild_text: 'Evaluation level ',
                                          icon_viible: true,
                                          text_color: 0xff646464,
                                          premium: true,
                                          feild_text_2: '(',
                                          text_color_2: 0xff8EA1B1,
                                          feild_text_3: pracDetails[
                                                          'practiceLevel'] ==
                                                      null ||
                                                  pracDetails[
                                                          'practiceLevel'] ==
                                                      0 ||
                                                  pracDetails[
                                                          'practiceEvaluations'] ==
                                                      null
                                              ? '-'
                                              : pracDetails[
                                                          'practiceEvaluations']
                                                      ['totalPoint']
                                                  .toString(),
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
                        // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
                      ),

                      Container(
                        height: AppDimensions.height10(context) * 28.0,
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 2.5,
                            top: AppDimensions.height10(context) * 3.0),
                        child: Column(
                          children: [
                            AnimatedScaleButton(
                              onTap: () {
                                if (pracDetails['report'] == true) {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const practice_progress(
                                        days: 0,
                                        route: 'pracice_menu_completed',
                                      )));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Practice progress is not active")));
                                }
                              },
                              child: const button_feilds(
                                feild_text: 'View practice progress',
                                icon_viible: true,
                                text_color: 0xff646464,
                                feild_text_2: '',
                                text_color_2: 0xffEA1B1,
                                feild_text_3: '',
                                feild_text_4: '',
                                premium: true,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10(context) * 1.0,
                                  top: AppDimensions.height10(context) * 1.0),
                              child: AnimatedScaleButton(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const PracticeReview()));
                                  final SharedPreferences prefs = await _prefs;
                                  await prefs.setString(
                                      'practice_review', 'practice_completed');
                                },
                                child: const button_feilds(
                                  feild_text: 'View practice settings',
                                  icon_viible: true,
                                  text_color: 0xff646464,
                                  feild_text_2: '',
                                  text_color_2: 0xffEA1B1,
                                  feild_text_3: '',
                                  feild_text_4: '',
                                  premium: true,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom:
                                      AppDimensions.height10(context) * 1.0),
                              child: AnimatedScaleButton(
                                onTap: () async {
                                  final SharedPreferences prefs = await _prefs;
                                  if (subscripption == 'active') {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: timeline(
                                          goalId: null,
                                          pracId: prefs.getInt("prac_num"),
                                        )));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "This feature is only available for premium members")));
                                  }
                                },
                                child: button_feilds(
                                  feild_text: 'Timeline',
                                  icon_viible: subscripption == 'active',
                                  text_color: 0xff646464,
                                  feild_text_2: '',
                                  text_color_2: 0xffEA1B1,
                                  feild_text_3: '',
                                  feild_text_4: '',
                                  premium: subscripption == 'active',
                                ),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () async {
                                if (pracDetails['report'] == true) {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const practice_assesment(
                                        days: 0,
                                        route: '',
                                      )));
                                  final SharedPreferences prefs = await _prefs;
                                  await prefs.setString(
                                      'assesmentRoute', 'practice_completed');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Practice assessment is activated after first practice evaluation.")));
                                }
                              },
                              child: button_feilds(
                                feild_text: 'Practice assessment history',
                                icon_viible: true,
                                text_color: 0xff646464,
                                feild_text_2: '',
                                text_color_2: 0xffEA1B1,
                                feild_text_3: '',
                                feild_text_4: '',
                                premium: subscripption == 'active',
                              ),
                            )
                          ],
                        ),
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
      ),
    );
  }
}
