import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
// import 'package:flutter_offline/flutter_offline.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeStopwatch.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';

import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';

class emotions extends StatefulWidget {
  final bool summary;
  final String pracName;
  final bool record;
  final int selected;
  const emotions(
      {super.key,
      required this.summary,
      required this.pracName,
      required this.record,
      required this.selected});

  @override
  State<emotions> createState() => _emotionsState();
}

TextEditingController feedback = TextEditingController();

class _emotionsState extends State<emotions> {
  int pracEmotions = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var behaviour_route;

  //int pracEmotions = 0;

  var endSession;
  var afterSessionNotes;
  var emotionsNotes;
  void onLoad() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      behaviour_route = prefs.getBool('behaviour_route');
    });
  }

  @override
  void initState() {
    super.initState();
    feedback.clear();
    setState(() {
      pracEmotions = 0;
    });
    setState(() {
      pracEmotions = widget.selected;
    });
    if (widget.summary == true) {
      onLoad();
      recording();
    }
  }

  void recording() {
    RecordingPractice.getUserPracticeRecord().then((response) {
      if (response.length != 0) {
        String SessionFeedBack = '';
        setState(() {
          afterSessionNotes =
              response['recording']['notes'][0]['afterNote'].toString();
          endSession = response['recording']['notes'][0]['endNote'].toString();
          SessionFeedBack =
              response['recording']['notes'][0]['beforeNote'].toString().isEmpty
                  ? ''
                  : response['recording']['notes'][0]['beforeNote'];
          pracEmotions = response['recording']['feelingsBeforeSession'];
        });
        if (SessionFeedBack != '') {
          feedback.text = SessionFeedBack;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // Navigator.push(
        //   context,
        //   FadePageRoute(
        //     page: const practiceMenu(goal_eval: false, goalName: goalName, pracName: pracName, pracColor: pracColor, color: color),
        //   ),
        // );
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    widget.record || widget.summary
                        ? Navigator.pop(context)
                        : showAnimatedDialog(
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
                                            if (behaviour_route == false) {
                                              if (widget.summary == false) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    FadePageRouteReverse(
                                                      page: const dashBoard(
                                                        saved: false,
                                                        helpful_tips: false,
                                                        membership: true,
                                                        dashboard_ctrl: false,
                                                        cancel: false,
                                                        trial: false,
                                                      ),
                                                    ));
                                              }
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  FadePageRouteReverse(
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
                    width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
                  )),
            )
          ],
          automaticallyImplyLeading: false,
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
          child: Stack(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: AppDimensions.width10(context) * 30,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 10.5,
                        top: AppDimensions.height10(context) * 5.0),
                    alignment: Alignment.center,
                    child: Text(
                      widget.pracName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 35.9,
                    height: AppDimensions.height10(context) * 14.8,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 8.6),
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 2.8,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Laila',
                                  color: const Color(0xFFFBFBFB)),
                              children: const [
                                TextSpan(
                                  text: 'How do you feel\n',
                                ),
                                TextSpan(
                                  text: 'before',
                                  style: TextStyle(color: Color(0xff8C648A)),
                                ),
                                TextSpan(
                                  text: ' your practice?',
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 5.2,
                        left: AppDimensions.height10(context) * 1.0),
                    height: AppDimensions.height10(context) * 13.7,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        AnimatedScaleButton(
                          onTap: () {
                            setState(() {
                              pracEmotions = 1;
                            });
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 4.0,
                                right: AppDimensions.width10(context) * 1.5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: pracEmotions == 1
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.width10(context) * 12.5,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xff546096),
                              ),
                              child: Text(
                                'I feel very \nlow & \ndemotivated',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            setState(() {
                              pracEmotions = 2;
                            });
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 1.5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: pracEmotions == 2
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.width10(context) * 12.5,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xff7291A0),
                              ),
                              child: Text(
                                'I feel slightly \nirritated, not \nfussed really',
                                style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            setState(() {
                              pracEmotions = 3;
                            });
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 1.5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: pracEmotions == 3
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.width10(context) * 12.5,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xffE1C44F),
                              ),
                              child: Text(
                                'I feel ok',
                                style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            setState(() {
                              pracEmotions = 4;
                            });
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 1.5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: pracEmotions == 4
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.width10(context) * 12.5,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xffFA9458),
                              ),
                              child: Text(
                                'Motivated and \nready to start',
                                style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            setState(() {
                              pracEmotions = 5;
                            });
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 5.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: pracEmotions == 5
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.width10(context) * 12.5,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xffFF7C42),
                              ),
                              child: Text(
                                'Great, cannot \nwait to start!',
                                style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  addNotes(state_: widget.summary),
                  /*
                  Container(
                    width: AppDimensions.width10(context) * 7.6,
                    height: AppDimensions.height10(context) * 7.6,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 11.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.width10(context) * 5.0,
                          height: AppDimensions.height10(context) * 5.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.width10(context) * 0.2,
                                  color: Colors.white)),
                          child: Container(
                            height: AppDimensions.height10(context) * 2.7,
                            width: AppDimensions.width10(context) * 2.7,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 0.3),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_note,
                                  //size: 27,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 7.6,
                          height: AppDimensions.height10(context) * 1.9,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.6),
                          child: Text(
                            'Add Notes',
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                 */

                  SizedBox(
                    //width: AppDimensions.width10(context) * 32.5,
                    height: AppDimensions.height10(context) * 6.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.summary
                              ? AnimatedScaleButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      height:
                                          AppDimensions.height10(context) * 5.0,
                                      width:
                                          AppDimensions.width10(context) * 14.3,
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  1.2),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              AppDimensions.height10(context) *
                                                  5.0),
                                          border: Border.all(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.2,
                                              color: const Color(0xffFA9934))),
                                      child: Center(
                                          child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: const Color(0xffFA9934),
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w600),
                                      ))),
                                )
                              : Container(),
                          AnimatedScaleButton(
                            onTap: () async {
                              if (pracEmotions != 0) {
                                final SharedPreferences prefs = await _prefs;
                                var emotionResult =
                                    prefs.setInt('emotions', pracEmotions);
                                var newPrac = prefs.setString(
                                    'pracName', widget.pracName);
                                var afterSessionFeedback = feedback.text
                                        .toString()
                                        .isNotEmpty
                                    ? prefs.setString('emotionsFeedback',
                                        feedback.text.toString())
                                    : prefs.setString('emotionsFeedback', " ");

                                if (widget.summary == true) {
                                  RecordingPractice().updateRecording(
                                      'feelingsBeforeSession', pracEmotions, [
                                    {
                                      "beforeNote": feedback.text.isNotEmpty
                                          ? feedback.text.toString()
                                          : " ",
                                      "afterNote": afterSessionNotes == null
                                          ? " "
                                          : afterSessionNotes,
                                      "endNote":
                                          endSession == null ? " " : endSession
                                    }
                                  ]).then((reaponse) {
                                    if (reaponse == true) {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const practice_summary(
                                            view: false,
                                          )));
                                    } else {
                                      print("Api Failed");
                                    }
                                  });
                                } else {
                                  Navigator.push(context,
                                      FadePageRoute(page: const clocks()));
                                }
                              }
                            },
                            child: Container(
                              height: AppDimensions.height10(context) * 5.0,
                              width: widget.summary
                                  ? AppDimensions.width10(context) * 21.0
                                  : AppDimensions.width10(context) * 25.4,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: pracEmotions != 0
                                      ? [
                                          const Color(0xffFCC10D),
                                          const Color(0xffFDA210),
                                        ]
                                      : [
                                          const Color(0xffFCC10D)
                                              .withOpacity(0.5),
                                          const Color(0xffFDA210)
                                              .withOpacity(0.5),
                                        ],
                                ),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 5.0),
                              ),
                              child: Center(
                                child: widget.summary
                                    ? Text(
                                        'Update Summary',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w600),
                                      )
                                    : Text(
                                        'Next',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w600),
                                      ),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            // OfflineBuilder(
            //     debounceDuration: const Duration(milliseconds: 3),
            //     connectivityBuilder: (
            //       BuildContext context,
            //       ConnectivityResult connectivity,
            //       Widget child,
            //     ) {
            //       final bool connected = connectivity != ConnectivityResult.none;
            //       return Stack(
            //         fit: StackFit.expand,
            //         children: [
            //           Positioned(
            //               child: Align(
            //             alignment: Alignment.bottomCenter,
            //             child: Container(
            //               width: double.infinity,
            //               height: AppDimensions.height10(context) * 3.0,
            //               color: connected
            //                   ? const Color(0xFF27AE60)
            //                   : const Color(0xFFFE6624),
            //               child: Center(
            //                 child: Text(
            //                   connected ? 'Back Online' : 'You’re Offline',
            //                   style: TextStyle(
            //                       fontSize: AppDimensions.font10(context) * 1.4,
            //                       fontWeight: FontWeight.w400,
            //                       color: const Color(0xFFFBFBFB)),
            //                 ),
            //               ),
            //             ),
            //           ))
            //         ],
            //       );
            //     },
            //     child: Container())
          ]),
        ),
      ),
    );
  }
}

class addNotes extends StatefulWidget {
  final bool state_;
  const addNotes({
    super.key,
    required this.state_,
  });

  @override
  State<addNotes> createState() => _addNotesState();
}

class _addNotesState extends State<addNotes> {
  int icon_color = 0xffffffff;
  int back_color = 0x000000ff;
  bool note_check = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: AppDimensions.width10(context) * 7.6,
          height: AppDimensions.height10(context) * 7.6,
          //margin: EdgeInsets.only(bottom: 113),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScaleButton(
                onTap: () {
                  note_check
                      ? setState(() {
                          back_color = 0x000000ff;
                          icon_color = 0xffffffff;
                          note_check = false;
                        })
                      : setState(() {
                          back_color = 0xffffffff;
                          icon_color = 0xffFA9934;
                          note_check = true;
                          // icon_color = 0xffFA9934,
                        });
                },
                child: Container(
                  width: AppDimensions.width10(context) * 5.0,
                  height: AppDimensions.height10(context) * 5.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(back_color),
                      border: Border.all(
                          width: AppDimensions.width10(context) * 0.2,
                          color: Color(icon_color))),
                  child: Container(
                    height: AppDimensions.height10(context) * 2.7,
                    width: AppDimensions.width10(context) * 2.7,
                    margin: const EdgeInsets.only(left: 3),
                    child: Center(
                        child: Icon(
                      Icons.edit_note,
                      //size: 27,
                      color: Color(icon_color),
                    )),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 7.6,
                height: AppDimensions.height10(context) * 1.9,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.6),
                child: Text(
                  'Add Notes',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.6,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Container(
            child: note_check
                ? Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.0,
                        bottom: AppDimensions.height10(context) * 2.0),
                    child: notes(
                      state: widget.state_,
                    ))
                : SizedBox(
                    height: AppDimensions.height10(context) * 11.1,
                  )),
      ],
    );
  }
}

class notes extends StatelessWidget {
  final bool state;
  const notes({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppDimensions.width10(context) * 36.0,
          // height: AppDimensions.height10(context) * 11.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.height10(context) * 1.8)),
              color: Colors.white),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: feedback,
                  maxLength: 200,
                  maxLines: null,
                  minLines: null,
                  decoration: InputDecoration(
                      hintText: 'Add notes here',
                      hintStyle: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.6,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff646464),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
