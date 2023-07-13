import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
// import 'package:flutter_offline/flutter_offline.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeStopwatch.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';

import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeWelldone.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';

class emotions extends StatefulWidget {
  final bool summary;
  final String pracName;
  const emotions({super.key, required this.summary, required this.pracName});

  @override
  State<emotions> createState() => _emotionsState();
}

class _emotionsState extends State<emotions> {
  int pracEmotions = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //int pracEmotions = 0;

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
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    showAnimatedDialog(
                      animationType: DialogTransitionType.fadeScale,
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      context: context,
                      builder: (BuildContext context) => Container(
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
                                fontSize: AppDimensions.height10(context) * 1.7,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          content: Container(
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 1.9,
                                left: AppDimensions.height10(context) * 1.6,
                                right: AppDimensions.height10(context) * 1.6),
                            height: AppDimensions.height10(context) * 3.2,
                            width: AppDimensions.height10(context) * 23.8,
                            child: Text(
                              "If you close it now, you will lose all your progress.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: AppDimensions.height10(context) * 0.15,
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
                                      if (widget.summary == false) {
                                        Navigator.pushReplacement(
                                            context,
                                            FadePageRoute3(
                                                enterPage: const dashBoard(
                                                  saved: false,
                                                  helpful_tips: false,
                                                  membership: true,
                                                  dashboard_ctrl: false,
                                                  cancel: false,
                                                  trial: false,
                                                ),
                                                exitPage: emotions(
                                                  summary: false,
                                                  pracName: widget.pracName,
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
                                Container(
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
                    // width: AppDimensions.height10(context) * 18.6,
                    height: AppDimensions.height10(context) * 2.4,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 10.5,
                        top: AppDimensions.height10(context) * 4.6),
                    alignment: Alignment.center,
                    child: Text(
                      widget.pracName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 35.9,
                    height: AppDimensions.height10(context) * 14.8,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 8.6),
                    child: Column(
                      children: [
                        Text(
                          'How do you feel',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 2.8,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'before',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 2.8,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff8C648A)),
                            ),
                            Text(
                              ' your practice?',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 2.8,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
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
                            print(pracEmotions);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 4.0,
                                right: AppDimensions.height10(context) * 1.5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: pracEmotions == 1
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.height10(context) * 12.5,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xff546096),
                              ),
                              child: Text(
                                'I feel very \nlow & \ndemotivated',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
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
                            print(pracEmotions);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 1.5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: pracEmotions == 2
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.height10(context) * 12.5,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xff7291A0),
                              ),
                              child: Text(
                                'I feel slightly \nirritated, not \nfussed really',
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
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
                            print(pracEmotions);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 1.5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: pracEmotions == 3
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.height10(context) * 12.5,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xffE1C44F),
                              ),
                              child: Text(
                                'I feel ok',
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
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
                            print(pracEmotions);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 1.5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: pracEmotions == 4
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.height10(context) * 12.5,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xffFA9458),
                              ),
                              child: Text(
                                'Motivated and \nready to start',
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
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
                            print(pracEmotions);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 13.7,
                            height: AppDimensions.height10(context) * 13.7,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 5.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: pracEmotions == 5
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: Container(
                              height: AppDimensions.height10(context) * 12.7,
                              width: AppDimensions.height10(context) * 12.5,
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      AppDimensions.height10(context) * 0.4,
                                  horizontal:
                                      AppDimensions.height10(context) * 0.3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: Colors.white),
                                color: const Color(0xffFF7C42),
                              ),
                              child: Text(
                                'Great, cannot \nwait to start!',
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
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
                  Container(
                    width: AppDimensions.height10(context) * 7.6,
                    height: AppDimensions.height10(context) * 7.6,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 11.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.height10(context) * 5.0,
                          height: AppDimensions.height10(context) * 5.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: Colors.white)),
                          child: Container(
                            height: AppDimensions.height10(context) * 2.7,
                            width: AppDimensions.height10(context) * 2.7,
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
                          width: AppDimensions.height10(context) * 7.6,
                          height: AppDimensions.height10(context) * 1.9,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.6),
                          child: Text(
                            'Add Notes',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 32.5,
                    height: AppDimensions.height10(context) * 6.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedScaleButton(
                            onTap: () {
                              if (pracEmotions != 0) {
                                widget.summary
                                    ? Navigator.pop(context)
                                    : Navigator.push(
                                        context, FadePageRoute(page: clocks()));
                              }
                            },
                            child: Container(
                                height: AppDimensions.height10(context) * 5.0,
                                width: AppDimensions.height10(context) * 14.3,
                                margin: EdgeInsets.only(
                                    right:
                                        AppDimensions.height10(context) * 1.2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 5.0),
                                    border: Border.all(
                                        width: AppDimensions.height10(context) *
                                            0.2,
                                        color: const Color(0xffFA9934))),
                                child: Center(
                                    child: Text(
                                  widget.summary ? 'Cancel' : 'Use Timer',
                                  style: TextStyle(
                                      color: const Color(0xffFA9934),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w600),
                                ))),
                          ),
                          AnimatedScaleButton(
                            onTap: () async {
                              if (pracEmotions != 0) {
                                final SharedPreferences prefs = await _prefs;
                                var emotionResult =
                                    prefs.setInt('emotions', pracEmotions);
                                var newPrac = prefs.setString(
                                    'pracName', widget.pracName);
                                print("======================>$pracEmotions");
                                if (widget.summary == true) {
                                  RecordingPractice()
                                      .updateRecording(
                                          'feelingsBeforeSession', pracEmotions)
                                      .then((reaponse) {
                                    if (reaponse == true) {
                                      print("Emotions Updated");
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const practice_summary()));
                                    } else {
                                      print("Api Failed");
                                    }
                                  });
                                } else {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const welldone_splash()));
                                }
                              }
                            },
                            child: Container(
                              height: AppDimensions.height10(context) * 5.0,
                              width: AppDimensions.height10(context) * 17.0,
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
                                    AppDimensions.height10(context) * 5.0),
                              ),
                              child: Center(
                                child: widget.summary
                                    ? Text(
                                        'Update Summary',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w600),
                                      )
                                    : Text(
                                        'Finished practice',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
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
            //                       fontSize: AppDimensions.height10(context) * 1.4,
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
