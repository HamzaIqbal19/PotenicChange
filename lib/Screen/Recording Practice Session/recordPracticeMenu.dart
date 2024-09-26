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
import 'package:potenic_app/Screen/Goal%20Evaluation/progress_report.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Screen/timeline/timeline.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/Widgets/goalAndPracticeName.dart';
import 'package:potenic_app/Widgets/webVisit.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_link.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';
import '../../Widgets/menu_buttons.dart';
import '../Dashboard Behaviour/dashboard_view_goals.dart';
import '../Goal Evaluation/practice_score.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class practiceMenu extends StatefulWidget {
  final bool goal_eval;
  final bool completed;

  const practiceMenu({
    super.key,
    required this.goal_eval, required this.completed,
  });

  @override
  State<practiceMenu> createState() => _practiceMenuState();
}

class _practiceMenuState extends State<practiceMenu> {

  String reportDate = '';
  String subscripption = '';
  String route = '';

  var pracDetails;
  bool Loader = true;

  int differenceInDays = 0;

  Future<void> getRecordedDate() async {
    final SharedPreferences prefs = await _prefs;
    var isFuture ;

    DateTime currentDate =
        DateTime.parse(DateTime.now().toString());
    DateTime date1 = DateTime.parse(prefs.getString('record_date')!);

    print("differenceInDays $date1");
    setState(() {
      differenceInDays = currentDate.difference(date1).inDays;
       isFuture = date1.isAfter(currentDate);
    });
    print("date1 differenceInDays $isFuture $date1 $differenceInDays");
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
          (value) async {
            if (value.length != 0) {
              setState(() {
              });
              if (value["goalEvaluations"] != null) {
                final SharedPreferences prefs = await _prefs;
                await prefs.setInt(
                    'goal_eval_id', value["goalEvaluations"]["id"]);
              }
            }
          },
        );
      } else {}
      getSubscription();
    }).catchError((error) {});
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  getRoute() async {
    final SharedPreferences prefs = await _prefs;

    var menuRoute = prefs.getString('prac_menu_route');
    setState(() {
      route = menuRoute!;
    });
  }

  @override
  initState() {
    super.initState();
    // _fetchGoalNames();
    getRoute();
    getRecordedDate();
    _fetchPracticeDetails();
    // Initialize AnimationController
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (route != 'goal_menu') {
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
        } else {
          Navigator.push(
              context,
              FadePageRouteReverse(
                  page: const goal_menu_inactive(
                      isActive: false, goal_evaluation: false)));
        }

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  if (route != 'goal_menu') {
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
                  } else {
                    Navigator.push(
                        context,
                        FadePageRouteReverse(
                            page: const goal_menu_inactive(
                                isActive: false, goal_evaluation: false)));
                  }
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  // width: AppDimensions.width10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.8,
                  fit: BoxFit.contain,
                )),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    if (route == 'dashboard') {
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
                    } else {
                      Navigator.push(
                          context,
                          FadePageRouteReverse(
                              page: const goal_menu_inactive(
                                  isActive: false, goal_evaluation: false)));
                    }
                  },
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    // width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.8,
                    fit: BoxFit.contain,
                  )),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/prac_assesment.webp'),
              fit: BoxFit.cover,
            )),
            width: double.infinity,
            height: double.infinity,
            child: Stack(children: [
              Loader == false
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            //width: AppDimensions.width10(context) * 30.4,
                            height: AppDimensions.height10(context) * 18.2,
                            margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 6.2,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: AppDimensions.height10(context) * 2.4,
                                  child: Text(
                                    AppText().pracMenu,
                                    style: TextStyle(
                                        color: Colors.white,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.12,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.width10(context) * 30,
                                  child: Center(
                                    child: Text(
                                      pracDetails['userGoal']['name'],
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.12,
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  2.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                goalAndPractice(
                                    context, pracDetails['userGoal']['color'], pracDetails['color'], pracDetails['name']),
                              ],
                            ),
                          ),
                        widget.completed? SizedBox(
                          width: AppDimensions.width10(context) * 21.1,
                          height: AppDimensions.height10(context) * 11.8,
                          // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: AppDimensions.width10(context) * 9.6,
                                height: AppDimensions.height10(context) * 11.8,
                                //margin: EdgeInsets.only(bottom: 19),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedScaleButton(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: const practice_summary(
                                                    view: true,newSession: false)));
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
                                    const SizedBox(height: 5,),
                                    Text(
                                      'View/Edit\nsession',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          height:
                                          AppDimensions.height10(context) *
                                              0.14,
                                          fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                          fontWeight: FontWeight.w500),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(width: AppDimensions.width10(context) * 2,),
                              SizedBox(
                                width: AppDimensions.width10(context) * 9.3,
                                height: AppDimensions.height10(context) * 11.8,
                                //margin: EdgeInsets.only(bottom: 19),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                                                            pracDetails['name'],
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
                                    const SizedBox(height: 5,),
                                    Text(
                                      'Missed\nsession',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          height:
                                          AppDimensions.height10(context) *
                                              0.14,
                                          fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                          fontWeight: FontWeight.w500),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ):  Container(
                            width: AppDimensions.width10(context) * 9.36,
                            height: AppDimensions.height10(context) * 12.0,
                            //color: Colors.amber,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 1.6),
                            child: Column(
                              children: [
                                AnimatedScaleButton(
                                  onTap: () {
                                    if (differenceInDays.isNegative) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Recording is not availble for future dates")));
                                    } else {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(page: emotions(
                                                summary: false,
                                                pracName: pracDetails['name'],
                                                record: false,
                                                selected: 0,
                                              )));
                                    }
                                  },
                                  child: Container(
                                    width: AppDimensions.width10(context) * 7.0,
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
                                        // borderRadius: BorderRadius.all(
                                        //     Radius.circular(AppDimensions
                                        //             .height10(context) *
                                        //         13.9)),
                                        border: Border.all(
                                            width:
                                                AppDimensions.width10(context) *
                                                    0.3,
                                            color: Colors.white)),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_task,
                                        color: Colors.white,
                                        // fill: AppDimensions.height10(context) * 0.10,
                                        size: AppDimensions.height10(context) *
                                            2.8,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  // color: Colors.red,
                                  height:
                                      AppDimensions.height10(context) * 4.921,
                                  width: AppDimensions.width10(context) * 9.36,
                                  child: Center(
                                    child: Text(
                                      AppText().pracRec,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.12,
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
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
                                alignment: const Alignment(1, -1.125),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: AppDimensions.height10(context) *
                                          0.5),
                                  child: AnimatedScaleButton(
                                      onTap: () {
                                        info_sheet(context);
                                      },
                                      child: Image.asset(
                                        'assets/images/ic_info_outline.webp',
                                        height:
                                            AppDimensions.height10(context) *
                                                3.0,
                                        width: AppDimensions.height10(context) *
                                            3.0,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0, -1),
                                child: SizedBox(
                                  width: AppDimensions.width10(context) * 36.0,
                                  height: widget.goal_eval
                                      ? AppDimensions.height10(context) * 26.7
                                      : AppDimensions.height10(context) * 20.8,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            36.0,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.2),
                                        child: Column(children: [
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.9,
                                            child: Text(
                                              AppText().pracAssess,
                                              style: TextStyle(
                                                  //increase font size by 2 px
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      const Color(0xfff5f5f5)),
                                            ),
                                          ),
                                          widget.goal_eval
                                              ? Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.9,
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.2),
                                                  child: Text(
                                                    AppText().eval20,
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.4,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xfff5f5f5)),
                                                  ),
                                                )
                                              : Container(),
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.9,
                                            margin: EdgeInsets.only(
                                                top: widget.goal_eval
                                                    ? AppDimensions.height10(
                                                            context) *
                                                        0.3
                                                    : AppDimensions.height10(
                                                            context) *
                                                        0.8),
                                            child: pracDetails['activeDays'] ==
                                                    20
                                                ? Text(
                                                    'You can now evaluate your progress',
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
                                                                    .height10(
                                                                        context) *
                                                                1.4,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xfff5f5f5)),
                                                        children: [
                                                        TextSpan(
                                                            text: widget
                                                                    .goal_eval
                                                                ? 'Next assessment is in '
                                                                : 'You can evaluate your progress in '),
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
                                                if (pracDetails['report'] ==
                                                        true &&
                                                    subscripption == 'active') {
                                                  final SharedPreferences
                                                      prefs = await _prefs;
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
                                                              const ProgressReport(
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
                                              child: ButtonFields(
                                                fieldText: 'Progress report',
                                                iconVisible: widget.goal_eval
                                                    ? true
                                                    : false,
                                                textColor: 0xff646464,
                                                premium:
                                                    subscripption == 'active',
                                                fieldText2: reportDate != ''
                                                    ? '   ${formatDate(reportDate)}'
                                                    : '',
                                                textColor2: 0xff8EA1B1,
                                                fieldText3: '',
                                                fieldText4: '',
                                              ),
                                            ),
                                          ),
                                          AnimatedScaleButton(
                                            onTap: () {
                                              if (pracDetails['report'] ==
                                                  true) {
                                                Navigator.push(
                                                    context,
                                                    FadePageRoute(
                                                        page: const prac_score(
                                                      route: 'pracice_menu',
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
                                            child: ButtonFields(
                                              fieldText: 'Evaluation level ',
                                              iconVisible: widget.goal_eval
                                                  ? true
                                                  : false,
                                              textColor: 0xff646464,
                                              fieldText2: '(',
                                              textColor2: 0xff8EA1B1,
                                              premium: true,
                                              fieldText3: pracDetails[
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
                                              fieldText4: '/5)',
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
                            width: AppDimensions.width10(context) * 36.0,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 2.5,
                                top: AppDimensions.height10(context) * 3.0),
                            child: Column(
                              children: [
                                AnimatedScaleButton(
                                  onTap: () {
                                    // if (pracDetails['report'] == true) {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const practice_progress(
                                          days: 0,
                                          route: 'pracice_menu',
                                        )));
                                    // } else {
                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(const SnackBar(
                                    //           content: Text(
                                    //               "Practice progress is not active")));
                                    // }
                                  },
                                  child: const ButtonFields(
                                    fieldText: 'View practice progress',
                                    iconVisible: true,
                                    textColor: 0xff646464,
                                    fieldText2: '',
                                    textColor2: 0xff8EA1B1,
                                    fieldText4: '',
                                    fieldText3: '',
                                    premium: true,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom:
                                          AppDimensions.height10(context) * 1.0,
                                      top: AppDimensions.height10(context) *
                                          1.0),
                                  child: AnimatedScaleButton(
                                    onTap: () async {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const PracticeReview()));
                                      final SharedPreferences prefs =
                                          await _prefs;
                                      await prefs.setString(
                                          'practice_review', 'practice_menu');
                                    },
                                    child: const ButtonFields(
                                      fieldText: 'View practice settings',
                                      iconVisible: true,
                                      textColor: 0xff646464,
                                      fieldText2: '',
                                      textColor2: 0xffEA1B1,
                                      fieldText3: '',
                                      fieldText4: '',
                                      premium: true,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
                                          1.0),
                                  child: AnimatedScaleButton(
                                    onTap: () async {
                                      final SharedPreferences prefs =
                                          await _prefs;
                                      if (subscripption == 'active') {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: timeline(
                                              goalId: null,
                                              pracId: prefs.getInt("prac_num"),
                                            )));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "This feature is only available for premium members")));
                                      }
                                    },
                                    child: ButtonFields(
                                      fieldText: 'Timeline',
                                      iconVisible: true,
                                      textColor: 0xff646464,
                                      premium: subscripption == 'active',
                                      fieldText2: '',
                                      textColor2: 0xffEA1B1,
                                      fieldText3: subscripption == 'active'
                                          ? ''
                                          : ' (Premium)',
                                      fieldText4: '',
                                    ),
                                  ),
                                ),
                                AnimatedScaleButton(
                                  onTap: () async {
                                    if(subscripption == 'active'){
                                    if (pracDetails['report'] == true) {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const practice_assesment(
                                            days: 0,
                                            route: '',
                                          )));
                                      final SharedPreferences prefs =
                                          await _prefs;
                                      await prefs.setString(
                                          'assesmentRoute', 'practice_menu');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Practice assessment is activated after first practice evaluation.")));
                                    }}
                                  },
                                  child: ButtonFields(
                                    fieldText: 'Practice assesment history',
                                    iconVisible: true,
                                    textColor: 0xff646464,
                                    fieldText2: '',
                                    textColor2: 0xffEA1B1,
                                    fieldText3: '',
                                    fieldText4: '',
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
              // OfflineBuilder(
              //     debounceDuration: Duration(milliseconds: 3),
              //     connectivityBuilder: (
              //       BuildContext context,
              //       ConnectivityResult connectivity,
              //       Widget child,
              //     ) {
              //       final bool connected =
              //           connectivity != ConnectivityResult.none;
              //       return Stack(
              //         fit: StackFit.expand,
              //         children: [
              //           Positioned(
              //               child: Align(
              //             alignment: Alignment.bottomCenter,
              //             child: Container(
              //               width: double.infinity,
              //               height: AppDimensions.height10(context) * 3.0,
              //               color:
              //                   connected ? Color(0xFF27AE60) : Color(0xFFFE6624),
              //               child: Center(
              //                 child: Text(
              //                   connected ? 'Back Online' : 'You’re Offline',
              //                   style: TextStyle(
              //                       fontSize:
              //                           AppDimensions.height10(context) * 1.4,
              //                       fontWeight: FontWeight.w400,
              //                       color: Color(0xFFFBFBFB)),
              //                 ),
              //               ),
              //             ),
              //           ))
              //         ],
              //       );
              //     },
              //     child: Container())
            ])),
      ),
    );
  }
}

void info_sheet(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.width10(context) * 40,
          // height: AppDimensions.height10(context) * 62.3,
          padding: EdgeInsets.only(bottom: AppDimensions.height10(context) * 3),
          margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 1.0,
              right: AppDimensions.width10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              color: const Color(0xFFF5F5F5)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: AnimatedScaleButton(
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
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.9,
                    bottom: AppDimensions.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.width10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                // width: AppDimensions.width10(context) * 28.7,
                height: AppDimensions.height10(context) * 3.4,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'Practice Assessment',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.8,
                      // letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 33.2,
                //height: AppDimensions.height10(context) * 26.9,
                //color: Colors.grey,
                margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 1.2,
                ),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontFamily: 'laila',
                          fontSize: AppDimensions.font10(context) * 1.6,
                          height: AppDimensions.height10(context) * 0.15,

                          //  letterSpacing: AppDimensions.height10(context),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF437296)),
                      children: [
                        const TextSpan(
                            text:
                                'For each practice, you can evaluate your last 20 active days, and asses it to see if it is working for you or not.\n\n'),
                        const TextSpan(
                            text: 'Practice Assessment ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(
                            text:
                                'is broken down into two main sections:\n\n'),
                        TextSpan(
                            text: '1.Progress Report\n',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    AppDimensions.height10(context) * 1.8)),
                        const TextSpan(text: 'See your '),
                        const TextSpan(
                            text: 'overall practice progress',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(
                            text:
                                ', gain visibility on how your personal development journey is going and whether you’re making any progress to towards your goal.\n\n'),
                        TextSpan(
                            text: '2.Practice Score\n',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    AppDimensions.height10(context) * 1.8)),
                        const TextSpan(text: 'Here you can'),
                        const TextSpan(
                            text: ' assess your practice effectiveness ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(text: 'based on our scoring criteria.')
                      ]),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2,
              ),
              AnimatedScaleButton(
                onTap: () {
                  webVisit(AppLinks().recordPracticeTutorial);
                },
                child: Container(
                  width: AppDimensions.height10(context) * 37.5,
                  height: AppDimensions.height10(context) * 5,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10(context) * 2.4,
                        height: AppDimensions.height10(context) * 2.4,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/youtubeIcon.png'),
                              fit: BoxFit.contain,
                            )),
                      ),
                      SizedBox(
                        width: AppDimensions.height10(context),
                      ),
                      Text(
                        'Watch Demo',
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF646464),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    ),
  );
}
