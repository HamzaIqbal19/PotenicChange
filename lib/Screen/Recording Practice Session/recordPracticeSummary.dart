import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEndosSession.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeFellingAftr.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_goals_menu.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class practice_summary extends StatefulWidget {
  final bool view;
  const practice_summary({super.key, required this.view});

  @override
  State<practice_summary> createState() => _practice_summaryState();
}

class _practice_summaryState extends State<practice_summary> {
  String dateTime = 'Now';
  String time = 'Am';
  String day = '';
  var behaviourRoute;

  String goalName = "";
  String identity = "";
  String pracName = "";
  var pracColor = '0';
  var color = '0';
  String recordedDate = '';
  int differenceInDays1 = 0;
  bool loading = true;
  var report;
  int before = 0;
  int after = 0;
  String feedback = '';
  int session = 0;
  String emotionFeedback = "";
  String sessionFeedBack = "";
  var details;

  void _fetchRoute() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      behaviourRoute = prefs.getBool('behaviour_route');
      report = prefs.getBool('isReportActive');
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void _fetchPracticeNames() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        setState(() {
          pracName = response["name"];
          pracColor = response["color"];
        });
        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
    });
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          // Loading = false;
          goalName = response["name"];
          identity = response["identityStatement"][0]["text"];
          color = response["color"];
        });

        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {});
  }

  void recording() {
    RecordingPractice.getUserPracticeRecord().then((response) {
      if (response.length != 0) {
        setState(() {
          details = response;
          before = response['recording']['feelingsBeforeSession'];
          after = response['recording']['feelingsAfterSession'];
          feedback = response['recording']['notes'][0]['afterNote'];
          emotionFeedback = response['recording']['notes'][0]['beforeNote'];
          sessionFeedBack = response['recording']['notes'][0]['endNote'];
          session = response['recording']['practiceSummary'];
          recordedDate = response['recording']['recordingDate'];
        });
        DateTime currentDate =
            DateTime.parse(DateTime.now().toString().substring(0, 10));
        DateTime date1 = DateTime.parse(recordedDate);
        setState(() {
          differenceInDays1 = currentDate.difference(date1).inDays;
        });
      }
    });
  }

  late AnimationController controller;

  @override
  initState() {
    super.initState();
    recording();
    _fetchRoute();
    _fetchGoalNames();
    _fetchPracticeNames();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
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
                      )));
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  //  width: AppDimensions.width10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.8,
                  fit: BoxFit.contain,
                )),
          ),
          actions: [
            widget.view
                ? Container()
                : Center(
                    child: IconButton(
                        onPressed: () {
                          showAnimatedDialog(
                            animationType: DialogTransitionType.fadeScale,
                            curve: Curves.easeInOut,
                            duration: const Duration(seconds: 1),
                            context: context,
                            builder: (BuildContext context) => SizedBox(
                              width: AppDimensions.width10(context) * 27.0,
                              height: AppDimensions.height10(context) * 18.2,
                              child: AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                actionsPadding: EdgeInsets.zero,
                                titlePadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 1.4)),
                                title: Container(
                                  margin: const EdgeInsets.only(
                                      top: 19, right: 16, left: 16, bottom: 2),
                                  height: AppDimensions.height10(context) * 2.2,
                                  width: AppDimensions.width10(context) * 23.8,
                                  child: Text(
                                    "Are you sure?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF000000),
                                      fontSize:
                                          AppDimensions.font10(context) * 1.7,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                content: Container(
                                  margin: EdgeInsets.only(
                                      bottom:
                                          AppDimensions.height10(context) * 1.9,
                                      left:
                                          AppDimensions.height10(context) * 1.6,
                                      right:
                                          AppDimensions.width10(context) * 1.6),
                                  height: AppDimensions.height10(context) * 3.2,
                                  width: AppDimensions.width10(context) * 23.8,
                                  child: Text(
                                    "If you close it now, you will lose all your progress.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: AppDimensions.height10(context) *
                                          0.15,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  Column(
                                    children: [
                                      Container(
                                        height: 42,
                                        width: double.infinity,
                                        color: const Color(0xFF007AFF),
                                        child: TextButton(
                                          onPressed: () {
                                            if (behaviourRoute == false) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  FadePageRouteReverse(
                                                      page: const ViewDashboard(
                                                    missed: false,
                                                    name: '',
                                                    update: false,
                                                    helpfulTips: false,
                                                    record: 0,
                                                  )));
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  FadePageRouteReverse(
                                                      page: const ViewDashboard(
                                                    missed: false,
                                                    name: '',
                                                    update: false,
                                                    helpfulTips: false,
                                                    record: 0,
                                                  )));
                                            }
                                          },
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 44,
                                        width: double.infinity,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF007AFF)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          child: loading == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.width10(context) * 33.4,
                        height: AppDimensions.height10(context) * 3.4,
                        // color: Colors.amber,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 9.0),
                        child: Center(
                          child: Text(
                            AppText().pracRecSum,
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 2.8,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontFamily: 'Laila'),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 23.2,
                        height: AppDimensions.height10(context) * 3.8,
                        //  color: Colors.red,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.8),
                        child: Center(
                          child: Text(
                            AppText().pracRecSumBody,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: AppDimensions.height10(context) * 0.12,
                                fontSize: AppDimensions.font10(context) * 1.7,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Laila'),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 26.8,
                        height: AppDimensions.height10(context) * 26.8,
                        //color: Colors.amber,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.4),
                        decoration: BoxDecoration(
                            // color: const Color(0xff7c94b6),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('$color' == '1'
                                    ? "assets/images/red_gradient.webp"
                                    : '$color' == '2'
                                        ? 'assets/images/orange_moon.webp'
                                        : '$color' == '3'
                                            ? "assets/images/lightGrey_gradient.webp"
                                            : '$color' == '4'
                                                ? "assets/images/lightBlue_gradient.webp"
                                                : '$color' == '5'
                                                    ? "assets/images/medBlue_gradient.webp"
                                                    : '$color' == '6'
                                                        ? "assets/images/Blue_gradient.webp"
                                                        : 'assets/images/orange_moon.webp'),
                                colorFilter: const ColorFilter.mode(
                                    Color.fromRGBO(0, 0, 0, 0.5),
                                    BlendMode.dstATop),
                                fit: BoxFit.cover)),
                        child: Stack(children: [
                          Align(
                              alignment: const Alignment(0, -0.30),
                              child: Container(
                                width: AppDimensions.width10(context) * 24.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensions.height10(context) * 2.0),
                                child: Text(
                                  goalName,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 2.0,
                                      fontWeight: FontWeight.w600,
                                      height: AppDimensions.height10(context) *
                                          0.14,
                                      color: const Color(0xff5B74A6)),
                                ),
                              )),
                          Align(
                            alignment: const Alignment(0, -0.08),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.3,
                                  left: AppDimensions.width10(context) * 3.2,
                                  right: AppDimensions.width10(context) * 3.2),
                              // color: Colors.red,
                              child: Text('"$identity"',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      height: AppDimensions.height10(context) *
                                          0.14,
                                      color: const Color(0xff5B74A6))),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.975),
                            child: Container(
                              height: AppDimensions.height10(context) * 13.8,
                              width: AppDimensions.width10(context) * 13.8,
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.width10(context)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // border: Border.all(
                                  //     width: 5, color: const Color(0xFF52855E)),
                                  image: DecorationImage(
                                      image: AssetImage('$pracColor' == '1'
                                          ? "assets/images/Practice_Completed_2.webp"
                                          : '$pracColor' == '2'
                                              ? 'assets/images/Practice_Completed_2.webp'
                                              : '$pracColor' == '3'
                                                  ? "assets/images/Practice_Completed_3.webp"
                                                  : '$pracColor' == '4'
                                                      ? "assets/images/Practice_Completed_4.webp"
                                                      : '$pracColor' == '5'
                                                          ? "assets/images/Practice_Completed_4.webp"
                                                          : 'assets/images/Practice_Completed_2.webp'))),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 1.2,
                                    right:
                                        AppDimensions.width10(context) * 1.2),
                                child: Text(
                                  pracName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: const Color(0xff1A481C),
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Laila'),
                                ),
                              )),
                            ),
                          ),
                        ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildBottomPicker(CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.dateAndTime,
                                  //initialDateTime: date_time,
                                  onDateTimeChanged: (DateTime newDateTime) {
                                    if (mounted) {
                                      setState(() {
                                        if (newDateTime.weekday == 2) {
                                          setState(() {
                                            day = 'Tue';
                                          });
                                        } else if (newDateTime.weekday == 3) {
                                          setState(() {
                                            day = 'Wed';
                                          });
                                        } else if (newDateTime.weekday == 4) {
                                          setState(() {
                                            day = 'Thu';
                                          });
                                        } else if (newDateTime.weekday == 5) {
                                          setState(() {
                                            day = 'Fri';
                                          });
                                        } else if (newDateTime.weekday == 6) {
                                          setState(() {
                                            day = 'Sat';
                                          });
                                        } else if (newDateTime.weekday == 7) {
                                          setState(() {
                                            day = 'Sun';
                                          });
                                        } else {
                                          setState(() {
                                            day = 'Mon';
                                          });
                                        }
                                      });
                                      setState(() {
                                        if (newDateTime.hour > 11) {
                                          setState(() {
                                            time = 'Pm';
                                          });
                                        } else {
                                          setState(() {
                                            time = 'Am';
                                          });
                                        }
                                      });
                                      setState(() => dateTime =
                                          " $day:${newDateTime.hour}:${newDateTime.minute}:$time");
                                    }
                                  }));
                            },
                          );
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 26.8,
                          height: AppDimensions.height10(context) * 5.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 1.8),
                              border: Border.all(width: 1, color: Colors.white),
                              color: Colors.transparent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  //margin: EdgeInsets.only(left: 92, right: 66),
                                  height: AppDimensions.height10(context) * 2.6,
                                  width: AppDimensions.width10(context) * 21.0,
                                  child: Text(
                                    dateTime,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 2.0,
                                      fontFamily: 'Laila',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  )),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 32.6,
                        //height: AppDimensions.height10(context) * 5.0,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 4.0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Laila',
                                  height:
                                      AppDimensions.height10(context) * 0.15,
                                  fontSize: AppDimensions.font10(context) * 2.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'How did you feel',
                                  ),
                                  TextSpan(
                                      text: '\nbefore',
                                      style:
                                          TextStyle(color: Color(0xff8C648A))),
                                  TextSpan(
                                    text: ' your practice?',
                                  ),
                                ])),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: emotions(
                                summary: true,
                                pracName: pracName,
                                record: false,
                                selected: before,
                              )));
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.4,
                          height: AppDimensions.height10(context) * 13.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 3.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                              color: before == 1
                                  ? const Color(0xff546096)
                                  : before == 2
                                      ? const Color(0xff7291A0)
                                      : before == 3
                                          ? const Color(0xffE1C44F)
                                          : before == 4
                                              ? const Color(0xffFF7C42)
                                              : before == 5
                                                  ? const Color(0xff219653)
                                                  : const Color(0xffFA9458)),
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 0.5),
                                child: Text(
                                  before == 1
                                      ? 'I feel very\nlow &\ndemotivated'
                                      : before == 2
                                          ? 'I feel slightly\nirritated, not\nfussed really'
                                          : before == 3
                                              ? 'I feel ok'
                                              : before == 4
                                                  ? 'Motivated and \nready to start'
                                                  : before == 5
                                                      ? "Great, cannot \nwait to start!"
                                                      : 'I felt good',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      height: AppDimensions.height10(context) *
                                          0.16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.85),
                              child: Container(
                                  height: AppDimensions.height10(context) * 2.4,
                                  width: AppDimensions.width10(context) * 2.4,
                                  padding: EdgeInsets.all(
                                      AppDimensions.height10(context) * 0.4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: const ImageIcon(
                                    AssetImage('assets/images/edit_icon.webp'),
                                    color: Colors.white,
                                  )),
                            )
                          ]),
                        ),
                      ),
                      emotionFeedback != " " && emotionFeedback.isNotEmpty
                          ? Container(
                              width: AppDimensions.width10(context) * 36.0,
                              // height: AppDimensions.height10(context) * 7.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 4.0),
                              // padding: EdgeInsets.only(
                              //     bottom: AppDimensions.height10(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0),
                                  color: Colors.white),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 1.4,
                                    bottom:
                                        AppDimensions.height10(context) * 1.0,
                                    left: AppDimensions.width10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 2.0),
                                width: AppDimensions.width10(context) * 32.0,
                                child: Text(
                                  emotionFeedback,
                                  style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      height: AppDimensions.height10(context) *
                                          0.12,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        width: AppDimensions.width10(context) * 32.6,
                        //height: AppDimensions.height10(context) * 5.0,
                        //color: Colors.amber,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 4.0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Laila',
                                  height:
                                      AppDimensions.height10(context) * 0.15,
                                  fontSize: AppDimensions.font10(context) * 2.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'How do you feel',
                                  ),
                                  TextSpan(
                                      text: '\nafter',
                                      style:
                                          TextStyle(color: Color(0xff8C648A))),
                                  TextSpan(
                                    text: ' recording your practice?',
                                  ),
                                ])),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: feelingsAfter(
                                summary: true,
                                selected: after,
                              )));
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.4,
                          height: AppDimensions.height10(context) * 13.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 3.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                              color: after == 1
                                  ? const Color(0xff546096)
                                  : after == 2
                                      ? const Color(0xff7291A0)
                                      : after == 3
                                          ? const Color(0xffE1C44F)
                                          : after == 4
                                              ? const Color(0xffFF7C42)
                                              : after == 5
                                                  ? const Color(0xff219653)
                                                  : const Color(0xffFA9458)),
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 0.5),
                                child: Text(
                                  after == 1
                                      ? 'I feel very low\n& irritated'
                                      : after == 2
                                          ? 'I feel alright,\n but slightly\ndown'
                                          : after == 3
                                              ? 'I feel ok'
                                              : after == 4
                                                  ? 'I feel focused\n& motivated'
                                                  : after == 5
                                                      ? 'I feel excited\nand good in\nmyself'
                                                      : 'I feel focused\n& good',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      height: AppDimensions.height10(context) *
                                          0.16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.85),
                              child: Container(
                                  height: AppDimensions.height10(context) * 2.4,
                                  width: AppDimensions.width10(context) * 2.4,
                                  padding: EdgeInsets.all(
                                      AppDimensions.height10(context) * 0.4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: const ImageIcon(
                                    AssetImage('assets/images/edit_icon.webp'),
                                    color: Colors.white,
                                  )),
                            )
                          ]),
                        ),
                      ),
                      feedback != " " && feedback.isNotEmpty
                          ? Container(
                              width: AppDimensions.width10(context) * 36.0,
                              // height: AppDimensions.height10(context) * 7.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 4.0),
                              // padding: EdgeInsets.only(
                              //     bottom: AppDimensions.height10(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0),
                                  color: Colors.white),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 1.4,
                                    bottom:
                                        AppDimensions.height10(context) * 1.0,
                                    left: AppDimensions.width10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 2.0),
                                width: AppDimensions.width10(context) * 32.0,
                                child: Text(
                                  feedback.toString(),
                                  style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        //swidth: AppDimensions.width10(context) * 32.6,
                        // height: AppDimensions.height10(context) * 2.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 4.0),
                        child: Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Laila',
                                    height:
                                        AppDimensions.height10(context) * 0.15,
                                    fontSize:
                                        AppDimensions.font10(context) * 2.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'How did the practice go?',
                                    ),
                                  ])),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: endofSession(
                                summary: true,
                                selected: session,
                              )));
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.4,
                          height: AppDimensions.height10(context) * 13.2,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 3.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                              gradient: const RadialGradient(
                                radius: 0.5,
                                colors: <Color>[
                                  Color(0xFFBDA7C2), // yellow sun
                                  Color(0xFFB38FB4), // blue sky
                                ],
                              )),
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 0.5),
                                child: Text(
                                  session == 1
                                      ? 'Not great,\nhaven’t\nenjoyed it'
                                      : session == 2
                                          ? 'I got distracted,\nit was hard to\nfocus'
                                          : session == 3
                                              ? 'It was ok'
                                              : session == 4
                                                  ? 'Good, I quite\nliked it'
                                                  : 'Great,\nI enjoyed the experience',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      height: AppDimensions.height10(context) *
                                          0.16,
                                      color: Colors.white,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.85),
                              child: Container(
                                height: AppDimensions.height10(context) * 2.4,
                                width: AppDimensions.width10(context) * 2.4,
                                padding: EdgeInsets.all(
                                    AppDimensions.height10(context) * 0.4),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: const ImageIcon(
                                  AssetImage('assets/images/edit_icon.webp'),
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                      sessionFeedBack != " " && sessionFeedBack.isNotEmpty
                          ? Container(
                              width: AppDimensions.width10(context) * 36.0,
                              // height: AppDimensions.height10(context) * 7.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 4.0),
                              // padding: EdgeInsets.only(
                              //     bottom: AppDimensions.height10(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0),
                                  color: Colors.white),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 1.4,
                                    bottom:
                                        AppDimensions.height10(context) * 1.0,
                                    left: AppDimensions.width10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 2.0),
                                width: AppDimensions.width10(context) * 32.0,
                                child: Text(
                                  sessionFeedBack,
                                  style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        width: AppDimensions.width10(context) * 38.3,
                        height: AppDimensions.height10(context) * 5.0,
                        //color: Colors.red,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 6.4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedScaleButton(
                                // onTap: () {

                                onTap: () {
                                  return showAnimatedDialog(
                                      animationType:
                                          DialogTransitionType.fadeScale,
                                      curve: Curves.easeInOut,
                                      duration: const Duration(seconds: 1),
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SizedBox(
                                            width:
                                                AppDimensions.width10(context) *
                                                    27.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                21.4,
                                            child: AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4)),
                                              contentPadding: EdgeInsets.zero,
                                              actionsPadding: EdgeInsets.zero,
                                              titlePadding: EdgeInsets.zero,
                                              title: Container(
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions.height10(context) *
                                                          1.9,
                                                      right:
                                                          AppDimensions.width10(context) *
                                                              1.6,
                                                      left:
                                                          AppDimensions.width10(context) *
                                                              1.6,
                                                      bottom:
                                                          AppDimensions.height10(context) *
                                                              0.2),
                                                  height:
                                                      AppDimensions.height10(context) *
                                                          4.4,
                                                  width:
                                                      AppDimensions.width10(context) *
                                                          23.8,
                                                  child: RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                          style: TextStyle(
                                                              fontFamily: 'laila',
                                                              height: AppDimensions.height10(context) * 0.15,
                                                              fontSize: AppDimensions.font10(context) * 1.6,
                                                              fontWeight: FontWeight.w400,
                                                              color: const Color(0xFF000000)),
                                                          children: const [
                                                            TextSpan(
                                                                text:
                                                                    'Are you sure you want\nto'),
                                                            TextSpan(
                                                              text: ' delete ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    'this recording?')
                                                          ]))),
                                              content: Container(
                                                margin: EdgeInsets.only(
                                                    bottom:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.5,
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.6,
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.6),
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    23.8,
                                                child: Text(
                                                  "By clicking 'Yes' you confirm that this\nrecording will be deleted permanently. ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF000000),
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.3,
                                                    fontWeight: FontWeight.w400,
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
                                                            .withOpacity(0.29),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.2,
                                                      width: double.infinity,
                                                      color: const Color(
                                                          0xFF007AFF),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'No',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xFFFFFFFF),
                                                              fontSize: AppDimensions
                                                                      .font10(
                                                                          context) *
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
                                                            .withOpacity(0.29),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.4,
                                                      width: double.infinity,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          RecordingPractice()
                                                              .deleteUserRecording()
                                                              .then((value) {
                                                            if (value == true) {
                                                              Navigator.push(
                                                                  context,
                                                                  FadePageRoute(
                                                                      page:
                                                                      ViewDashboard(
                                                                    missed:
                                                                        false,
                                                                    name: '',
                                                                    update:
                                                                        false,
                                                                    helpfulTips:
                                                                        false,
                                                                    record:
                                                                        differenceInDays1,
                                                                  )));
                                                            } else {}
                                                          });
                                                        },
                                                        child: Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .font10(
                                                                          context) *
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
                                                            .withOpacity(0.29),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ));
                                },

                                child: Container(
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    width:
                                        AppDimensions.width10(context) * 15.7,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.width10(context) *
                                            1.4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff464646),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              5.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  0.8),
                                          child: Text(
                                            AppText().deleteText,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              AnimatedScaleButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute2(true,
                                          exitPage: practice_summary(
                                            view: widget.view,
                                          ),
                                          enterPage: ViewDashboard(
                                            missed: false,
                                            name: pracName,
                                            update: true,
                                            helpfulTips: false,
                                            record: differenceInDays1,
                                          )));

                                  if (report == true) {
                                    activeReport(context, goalName, pracName,
                                        int.parse(color), int.parse(pracColor));
                                  } else {
                                    // __share_experience(context, goalName,
                                    //     identity, color, pracColor, pracName);
                                  }
                                },
                                child: Container(
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    width:
                                        AppDimensions.width10(context) * 21.2,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffFCC10D),
                                          Color(0xffFDA210),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              5.0),
                                    ),
                                    child: Center(
                                        child: Text(
                                      AppText().savePrac,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.font10(context) * 2,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ))),
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 5.0),
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
      ),
    );
  }
}

Widget _buildBottomPicker(Widget picker) {
  return Builder(builder: (context) {
    return Container(
      height: AppDimensions.height10(context) * 30.3,
      padding: EdgeInsets.only(top: AppDimensions.height10(context) * 0.60),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.black,
          fontSize: AppDimensions.font10(context) * 2.20,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  });
}

void __share_experience(context, String goalName, String identity, String color,
    String pracColor, String pracName) {
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
          width: AppDimensions.width10(context) * 39.4,
          margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 1.0,
              right: AppDimensions.width10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              color: const Color(0xFFF5F5F5)),
          child: Column(
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
                    width: AppDimensions.width10(context) * 2.8,
                    height: AppDimensions.height10(context) * 2.8,
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
                    top: AppDimensions.height10(context) * 2.1,
                    bottom: AppDimensions.height10(context) * 2.1),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.width10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 1.4),
                  child: Text(
                    'Share your\nfirst experience...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: AppDimensions.height10(context) * 0.12,
                        fontSize: AppDimensions.font10(context) * 3,
                        // letterSpacing: AppDimensions.height10(context) * 0.2,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF437296)),
                  )),
              Container(
                child: Text(
                  'True happiness comes from sharing and helping\nothers who are on the same journey as you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.12,
                      fontSize: AppDimensions.font10(context) * 1.6,
                      // letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 24.8,
                height: AppDimensions.height10(context) * 24.8,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.8),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: AppDimensions.width10(context) * 24.8,
                      height: AppDimensions.height10(context) * 24.8,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(color == '1'
                                  ? "assets/images/red_gradient.webp"
                                  : color == '2'
                                      ? 'assets/images/orange_moon.webp'
                                      : color == '3'
                                          ? "assets/images/lightGrey_gradient.webp"
                                          : color == '4'
                                              ? "assets/images/lightBlue_gradient.webp"
                                              : color == '5'
                                                  ? "assets/images/medBlue_gradient.webp"
                                                  : color == '6'
                                                      ? "assets/images/Blue_gradient.webp"
                                                      : 'assets/images/orange_moon.webp'),
                              fit: BoxFit.cover)),
                      child: Stack(
                        children: [
                          Align(
                              alignment: const Alignment(0, -0.45),
                              child: Container(
                                width: AppDimensions.width10(context) * 24.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensions.height10(context) * 2.0),
                                child: Text(
                                  goalName,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 2.0,
                                      height: AppDimensions.height10(context) *
                                          0.14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff5B74A6)),
                                ),
                              )),
                          Align(
                            alignment: const Alignment(0, -0.3),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppDimensions.height10(context) * 2.0),
                              child: Text(identity,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff5B74A6))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.9, 1),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: AppDimensions.height10(context) * 14.8,
                        width: AppDimensions.width10(context) * 14.8,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.height10(context) * 0.7),
                        decoration: BoxDecoration(
                            //color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage(pracColor == '1'
                                    ? "assets/images/Practice_Completed_1.webp"
                                    : pracColor == '2'
                                        ? 'assets/images/Practice_Completed_2.webp'
                                        : pracColor == '3'
                                            ? "assets/images/Practice_Completed_3.webp"
                                            : pracColor == '4'
                                                ? "assets/images/Practice_Completed_4.webp"
                                                : pracColor == '5'
                                                    ? "assets/images/Practice_Completed_4.webp"
                                                    : 'assets/images/Practice_Completed_1.webp'),
                                fit: BoxFit.contain)),
                        child: Center(
                          child: Text(
                            pracName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: pracColor == "1"
                                    ? const Color(0XFFFC7133)
                                    : pracColor == "2"
                                        ? const Color(0xFF1A481C)
                                        : pracColor == "3"
                                            ? const Color(0xFF6D4B77)
                                            : pracColor == "4"
                                                ? const Color(0xFF5C75A6)
                                                : pracColor == "5"
                                                    ? const Color(0xFF315291)
                                                    : const Color(0XFFFC7133),
                                fontSize: AppDimensions.font10(context) * 1.8,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                  height: AppDimensions.height10(context) * 12.5,
                  width: AppDimensions.width10(context) * 12.5,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9,
                      bottom: AppDimensions.height10(context) * 3),
                  decoration: const BoxDecoration(
                      //color: Colors.amber,
                      image: DecorationImage(
                          image: AssetImage('assets/images/share_exp.webp'),
                          fit: BoxFit.contain)))
            ],
          )),
    ),
  );
}
