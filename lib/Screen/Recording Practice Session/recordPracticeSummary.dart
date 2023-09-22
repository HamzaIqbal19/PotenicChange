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
  String date_time = 'Now';
  String time = 'Am';
  String day = '';
  var behaviour_route;

  String goalName = "";
  String identity = "";
  String pracName = "";
  var pracColor = '0';
  var color = '0';
  String recordedDate = '';
  int differenceInDays1 = 0;
  bool Loading = true;
  var report;
  int Before = 0;
  int After = 0;
  String Feedback = '';
  int Session = 0;
  String EmotionFeedback = "";
  String SessionFeedBack = "";
  var details;

  void _fetchRoute() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      behaviour_route = prefs.getBool('behaviour_route');
      report = prefs.getBool('isReportActive');
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchPracticeNames() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        print("---------------------------------");
        setState(() {
          pracName = response["name"];
          pracColor = response["color"];
        });
        loadData();
        print("---------------------------------");
        print("response123:$pracName");
        print("response123:$pracColor");
      } else {
        loadData();
        print("response:$response");
      }
    }).catchError((error) {
      loadData();
      print("hell");
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
    }).catchError((error) {
      //  loadData();
      print("error");
    });

    // setState(() {
    //   goalName = AdminGoal().getUserGoal();
    // });
    // print('GoalName: $goalName');
  }

  void recording() {
    RecordingPractice.getUserPracticeRecord().then((response) {
      if (response.length != 0) {
        print('======================================================');
        print(response['recording']['notes'][0]['afterNote']);
        print(response);
        setState(() {
          details = response;
          Before = response['recording']['feelingsBeforeSession'];
          After = response['recording']['feelingsAfterSession'];
          Feedback = response['recording']['notes'][0]['afterNote'];
          EmotionFeedback = response['recording']['notes'][0]['beforeNote'];
          SessionFeedBack = response['recording']['notes'][0]['endNote'];
          Session = response['recording']['practiceSummary'];
          recordedDate = response['recording']['recordingDate'];
        });
        DateTime currentDate =
            DateTime.parse(DateTime.now().toString().substring(0, 10));
        DateTime date1 = DateTime.parse(recordedDate);
        setState(() {
          differenceInDays1 = currentDate.difference(date1).inDays;
        });

        print('Difference in days $differenceInDays1');
        print("DEtails ======================================$details");
        print(Before);
        print(After);
        print(Feedback);
        print(Session);
        //print(response);
      }
    });
  }

  late AnimationController controller;
  //late Animation<double> opacityAnimation;

  @override
  initState() {
    super.initState();
    recording();
    _fetchRoute();
    print("Details++++++++++++++++++++$details");
    _fetchGoalNames();
    _fetchPracticeNames();

    // Initialize AnimationController
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
                      FadePageRoute(
                          page: const view_goals(
                        missed: false,
                        name: '',
                        update: false,
                        helpfulTips: false,
                        record: 0,
                      )));
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
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
                              width: AppDimensions.height10(context) * 27.0,
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
                                  width: AppDimensions.height10(context) * 23.8,
                                  child: Text(
                                    "Are you sure?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF000000),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.7,
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
                                      right: AppDimensions.height10(context) *
                                          1.6),
                                  height: AppDimensions.height10(context) * 3.2,
                                  width: AppDimensions.height10(context) * 23.8,
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
                                            if (behaviour_route == false) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  FadePageRoute(
                                                      page: const view_goals(
                                                    missed: false,
                                                    name: '',
                                                    update: false,
                                                    helpfulTips: false,
                                                    record: 0,
                                                  )));
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page: const view_goals(
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
                          width: AppDimensions.height10(context) * 2.6,
                          height: AppDimensions.height10(context) * 2.6,
                          fit: BoxFit.cover,
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
          child: Loading == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10(context) * 33.4,
                        height: AppDimensions.height10(context) * 3.4,
                        // color: Colors.amber,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 6.0),
                        child: Center(
                          child: Text(
                            'Your Practice Summary',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.8,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontFamily: 'Laila'),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 23.2,
                        height: AppDimensions.height10(context) * 3.8,
                        //  color: Colors.red,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.5),
                        child: Center(
                          child: Text(
                            'Well done for recording\nyour practice!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: AppDimensions.height10(context) * 0.12,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Laila'),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 26.8,
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
                                width: AppDimensions.height10(context) * 24.0,
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
                                          AppDimensions.height10(context) * 2.0,
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
                                          AppDimensions.height10(context) * 1.6,
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
                              width: AppDimensions.height10(context) * 13.8,
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.height10(context)),
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
                                          AppDimensions.height10(context) * 1.8,
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
                                            //print(time);
                                          });
                                        }
                                      });
                                      setState(() => date_time =
                                          " ${day}:${newDateTime.hour}:${newDateTime.minute}:$time");
                                      print(
                                          "${newDateTime.weekday}:${newDateTime.hour}:${newDateTime.minute}:$time");
                                    }
                                  }));
                            },
                          );
                        },
                        child: Container(
                          width: AppDimensions.height10(context) * 26.8,
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
                                  width: AppDimensions.height10(context) * 21.0,
                                  child: Text(
                                    date_time,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
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
                        width: AppDimensions.height10(context) * 32.6,
                        height: AppDimensions.height10(context) * 4.8,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 4.0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Laila',
                                  height:
                                      AppDimensions.height10(context) * 0.12,
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
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
                      Container(
                        width: AppDimensions.height10(context) * 13.4,
                        height: AppDimensions.height10(context) * 13.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 3.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.white),
                            color: Before == 1
                                ? const Color(0xff546096)
                                : Before == 2
                                    ? const Color(0xff7291A0)
                                    : Before == 3
                                        ? const Color(0xffE1C44F)
                                        : Before == 4
                                            ? const Color(0xffFA9458)
                                            : Before == 5
                                                ? const Color(0xffFA9458)
                                                : const Color(0xffFA9458)),
                        child: Stack(children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      AppDimensions.height10(context) * 0.5),
                              child: Text(
                                Before == 1
                                    ? 'I felt very\nlow &\ndemotivated'
                                    : Before == 2
                                        ? 'I felt slightly\nirritated, not\nfussed really'
                                        : Before == 3
                                            ? 'I felt good'
                                            : Before == 4
                                                ? 'Motivated and \nready to start'
                                                : Before == 5
                                                    ? "Great, could'nt \nwait to started!"
                                                    : 'I felt good',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    height:
                                        AppDimensions.height10(context) * 0.16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Laila'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.85),
                            child: AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: emotions(
                                      summary: true,
                                      pracName: pracName,
                                      record: false,
                                      selected: Before,
                                    )));
                              },
                              child: Container(
                                  height: AppDimensions.height10(context) * 2.4,
                                  width: AppDimensions.height10(context) * 2.4,
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
                            ),
                          )
                        ]),
                      ),
                      EmotionFeedback != " "
                          ? Container(
                              width: AppDimensions.height10(context) * 36.0,
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
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 2.0),
                                width: AppDimensions.height10(context) * 32.0,
                                child: Text(
                                  EmotionFeedback,
                                  style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      height: AppDimensions.height10(context) *
                                          0.12,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        width: AppDimensions.height10(context) * 32.6,
                        height: AppDimensions.height10(context) * 4.8,
                        //color: Colors.amber,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 4.0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Laila',
                                  height:
                                      AppDimensions.height10(context) * 0.12,
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
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
                                    text: ' your practice?',
                                  ),
                                ])),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 13.4,
                        height: AppDimensions.height10(context) * 13.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 3.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.white),
                            color: After == 1
                                ? const Color(0xff546096)
                                : After == 2
                                    ? const Color(0xff7291A0)
                                    : After == 3
                                        ? const Color(0xffE1C44F)
                                        : After == 4
                                            ? const Color(0xffFA9458)
                                            : After == 5
                                                ? const Color(0xffFA9458)
                                                : const Color(0xffFA9458)),
                        child: Stack(children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      AppDimensions.height10(context) * 0.5),
                              child: Text(
                                After == 1
                                    ? 'I feel very low\n& irritated'
                                    : After == 2
                                        ? 'I feel alright,\n but slightly\ndown'
                                        : After == 3
                                            ? 'I feel ok'
                                            : After == 4
                                                ? 'I feel focused\n& good'
                                                : After == 5
                                                    ? 'I feel excited\nand good in\nmyself'
                                                    : 'I feel focused\n& good',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    height:
                                        AppDimensions.height10(context) * 0.16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Laila'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.85),
                            child: AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: feelingsAfter(
                                      summary: true,
                                      selected: After,
                                    )));
                              },
                              child: Container(
                                  height: AppDimensions.height10(context) * 2.4,
                                  width: AppDimensions.height10(context) * 2.4,
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
                            ),
                          )
                        ]),
                      ),
                      Feedback != " "
                          ? Container(
                              width: AppDimensions.height10(context) * 36.0,
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
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 2.0),
                                width: AppDimensions.height10(context) * 32.0,
                                child: Text(
                                  Feedback.toString(),
                                  style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        //swidth: AppDimensions.height10(context) * 32.6,
                        // height: AppDimensions.height10(context) * 2.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 4.0),
                        child: Center(
                          child: Text(
                            'How did the practice go?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.0,
                                fontWeight: FontWeight.w600,
                                height: AppDimensions.height10(context) * 0.12,
                                color: Colors.white,
                                fontFamily: 'Laila'),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 13.4,
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
                                Session == 1
                                    ? 'Hated it'
                                    : Session == 2
                                        ? 'Found it\ndifficult'
                                        : Session == 3
                                            ? 'Had distractins,\nit was hard to\nfocus'
                                            : Session == 4
                                                ? 'It was ok'
                                                : Session == 5
                                                    ? 'Good, I liked\nit'
                                                    : 'Great,\nin the zone.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    height:
                                        AppDimensions.height10(context) * 0.16,
                                    color: Colors.white,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.85),
                            child: AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: endofSession(
                                      summary: true,
                                      selected: Session,
                                    )));
                              },
                              child: Container(
                                height: AppDimensions.height10(context) * 2.4,
                                width: AppDimensions.height10(context) * 2.4,
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
                            ),
                          )
                        ]),
                      ),
                      SessionFeedBack != " "
                          ? Container(
                              width: AppDimensions.height10(context) * 36.0,
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
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 2.0),
                                width: AppDimensions.height10(context) * 32.0,
                                child: Text(
                                  SessionFeedBack,
                                  style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        width: AppDimensions.height10(context) * 38.3,
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
                                            width: AppDimensions.height10(
                                                    context) *
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
                                                      right: AppDimensions.height10(context) *
                                                          1.6,
                                                      left: AppDimensions.height10(context) *
                                                          1.6,
                                                      bottom: AppDimensions.height10(context) *
                                                          0.2),
                                                  height: AppDimensions.height10(context) *
                                                      4.4,
                                                  width: AppDimensions.height10(context) *
                                                      23.8,
                                                  child: RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                          style: TextStyle(
                                                              fontSize:
                                                                  AppDimensions.height10(context) *
                                                                      1.7,
                                                              fontWeight:
                                                                  FontWeight.w400,
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
                                                        AppDimensions.height10(
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
                                                                      .height10(
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
                                                                          view_goals(
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

                                                              print(
                                                                  'Api call success');
                                                            } else {
                                                              print(
                                                                  'Api failed');
                                                            }
                                                          });
                                                        },
                                                        child: Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
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

                                //   RecordingPractice()
                                //       .deleteUserRecording()
                                //       .then((value) {
                                //     if (value == true) {
                                //       print('Api call success');
                                //     } else {
                                //       print('Api failed');
                                //     }
                                //   });
                                // },

                                child: Container(
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    width:
                                        AppDimensions.height10(context) * 15.7,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10(context) *
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
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
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
                                          enterPage: view_goals(
                                            missed: false,
                                            name: goalName,
                                            update: true,
                                            helpfulTips: false,
                                            record: differenceInDays1,
                                          )));
                                  if (report == true) {
                                    activeReport(context, goalName, pracName,
                                        int.parse(color), int.parse(pracColor));
                                  }
                                },
                                child: Container(
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    width:
                                        AppDimensions.height10(context) * 21.2,
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
                                      'Save Practice',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ))),
                              )
                            ]),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 17.0,
                        height: AppDimensions.height10(context) * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0),
                        ),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 3.7,
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
          fontSize: AppDimensions.height10(context) * 2.20,
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
