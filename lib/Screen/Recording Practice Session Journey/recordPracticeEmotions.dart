import 'package:flutter/material.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeStopwatch.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeSummary.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/widgets/SessionDialogs.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/widgets/SessionNotes.dart';

import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';
import 'widgets/optionCircles.dart';

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
  var newSession;

  //int pracEmotions = 0;

  var endSession;
  var afterSessionNotes;
  var emotionsNotes;
  void onLoad() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      newSession = prefs.getBool('newSession');
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
        String sessionFeedBack = '';
        setState(() {
          afterSessionNotes =
              response['recording']['notes'][0]['afterNote'].toString();
          endSession = response['recording']['notes'][0]['endNote'].toString();
          sessionFeedBack =
              response['recording']['notes'][0]['beforeNote'].toString().isEmpty
                  ? ''
                  : response['recording']['notes'][0]['beforeNote'];
          pracEmotions = response['recording']['feelingsBeforeSession'];
        });
        if (sessionFeedBack != '') {
          feedback.text = sessionFeedBack;
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
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: AppDimensionsUpdated.height10(context) * 6.0,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              widget.summary
                  ? AnimatedScaleButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: AppDimensionsUpdated.height10(context) * 5.0,
                          width: AppDimensionsUpdated.width10(context) * 14.3,
                          margin: EdgeInsets.only(
                              right:
                                  AppDimensionsUpdated.height10(context) * 1.2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  AppDimensionsUpdated.height10(context) * 5.0),
                              border: Border.all(
                                  width:
                                      AppDimensionsUpdated.height10(context) *
                                          0.2,
                                  color: const Color(0xffFA9934))),
                          child: Center(
                              child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: const Color(0xffFA9934),
                                fontSize: UpdatedDimensions.font10(context) * 2,
                                fontWeight: FontWeight.w600),
                          ))),
                    )
                  : Container(),
              AnimatedScaleButton(
                onTap: () async {
                  if (pracEmotions != 0) {
                    final SharedPreferences prefs = await _prefs;
                    await prefs.setInt('emotions', pracEmotions);

                    await prefs.setString('pracName', widget.pracName);
                    feedback.text.toString().isNotEmpty
                        ? prefs.setString(
                            'emotionsFeedback', feedback.text.toString())
                        : prefs.setString('emotionsFeedback', " ");

                    if (widget.summary == true) {
                      if (newSession == true) {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const practice_summary(
                                    view: false, newSession: true)));
                      } else {
                        RecordingPractice().updateRecording(
                            'feelingsBeforeSession', pracEmotions, [
                          {
                            "beforeNote": feedback.text.isNotEmpty
                                ? feedback.text.toString()
                                : " ",
                            "afterNote": afterSessionNotes ?? " ",
                            "endNote": endSession ?? " "
                          }
                        ]).then((reaponse) {
                          if (reaponse == true) {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const practice_summary(
                                        view: false, newSession: false)));
                          } else {}
                        });
                      }
                    } else {
                      Navigator.push(
                          context, FadePageRoute(page: const clocks()));
                    }
                  }
                },
                child: Container(
                  height: AppDimensionsUpdated.height10(context) * 5.0,
                  width: widget.summary
                      ? AppDimensionsUpdated.width10(context) * 21.0
                      : AppDimensionsUpdated.width10(context) * 25.4,
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
                              const Color(0xffFCC10D).withOpacity(0.5),
                              const Color(0xffFDA210).withOpacity(0.5),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(
                        AppDimensionsUpdated.height10(context) * 5.0),
                  ),
                  child: Center(
                      child: Text(
                    widget.summary ? 'Update Summary' : "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: UpdatedDimensions.font10(context) * 2,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              )
            ]),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              widget.pracName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: AppDimensionsUpdated.font10(context) * 2.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            actions: [
              Buttons().closeButton(context, () {
                if (widget.record || widget.summary) {
                  Navigator.pop(context);
                } else {
                  sessionDialog(context, () {
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
                  });
                }
              })
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
                      margin: EdgeInsets.only(
                          bottom: AppDimensionsUpdated.height10(context) * 10.5,
                          top: AppDimensionsUpdated.height10(context) * 5.0),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 35.9,
                      height: AppDimensionsUpdated.height10(context) * 14.8,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          bottom: AppDimensionsUpdated.height10(context) * 8.6),
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            2.8,
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
                      height: AppDimensionsUpdated.width10(context) * 13.7,
                      margin: EdgeInsets.only(
                          bottom: AppDimensionsUpdated.height10(context) * 5.2,
                          left: AppDimensionsUpdated.width10(context) * 1.0),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return AnimatedScaleButton(
                              onTap: () {
                                setState(() {
                                  pracEmotions = index + 1;
                                });
                              },
                              child: sessonCircles(context,
                                  pracEmotions == index + 1, index, true),
                            );
                          }),
                    ),
                    addNotes(
                      state_: widget.summary,
                      controller: feedback,
                    ),
                    SizedBox(
                      height: AppDimensionsUpdated.height10(context) * 2,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
