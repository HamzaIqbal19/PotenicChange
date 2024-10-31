import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeEndosSession.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeSummary.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/appBarWidgets.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import 'widgets/SessionDialogs.dart';
import 'widgets/SessionNotes.dart';
import 'widgets/optionCircles.dart';

bool noteCheck = false;
int EmotionsAfter = 0;
TextEditingController feedback2 = TextEditingController();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
var endSession;
var afterSessionNotes;
var emotionsNotes;

class feelingsAfter extends StatefulWidget {
  final bool summary;
  final int selected;

  const feelingsAfter(
      {super.key, required this.summary, required this.selected});

  @override
  State<feelingsAfter> createState() => _feelingsAfterState();
}

class _feelingsAfterState extends State<feelingsAfter> {
  String pracName = "";
  var behaviour_route;
  var newSession;

  @override
  void initState() {
    super.initState();
    feedback2.clear();
    setState(() {
      EmotionsAfter = 0;
    });
    setState(() {
      EmotionsAfter = widget.selected;
    });
    _fetchPracticeNames();
    if (widget.summary == true) {
      onLoad();
      recording();
    }
  }

  var endSession;
  var afterSessionNotes;
  var emotionsNotes;
  void onLoad() async {
    final SharedPreferences prefs = await _prefs;
    newSession = prefs.getBool('newSession');
    behaviour_route = prefs.getBool('behaviour_route');
  }

  void _fetchPracticeNames() async {
    final SharedPreferences prefs = await _prefs;
    var name = prefs.getString('pracName');

    setState(() {
      pracName = '$name';
    });
  }

  void recording() {
    RecordingPractice.getUserPracticeRecord().then((response) {
      if (response.length != 0) {
        String sessionFeedBack = '';

        setState(() {
          emotionsNotes = response['recording']['notes'][0]['beforeNote'];
          endSession = response['recording']['notes'][0]['endNote'];
          sessionFeedBack =
              response['recording']['notes'][0]['afterNote'].toString().isEmpty
                  ? ''
                  : response['recording']['notes'][0]['afterNote'];
          EmotionsAfter = response['recording']['feelingsAfterSession'];
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
        if (widget.summary == false) {
          Navigator.push(
            context,
            FadePageRouteReverse(
              page: emotions(
                summary: false,
                pracName: pracName,
                record: false,
                selected: 0,
              ),
            ),
          );
        } else {
          Navigator.pop(context);
        }

        return Future.value(false);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          extendBody: true,
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: AppDimensionsUpdated.height10(context) * 6.0,
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
                                AppDimensionsUpdated.height10(context) * 5.0,
                            width: AppDimensionsUpdated.width10(context) * 14.3,
                            margin: EdgeInsets.only(
                                right: AppDimensionsUpdated.height10(context) *
                                    1.2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    AppDimensionsUpdated.height10(context) *
                                        5.0),
                                border: Border.all(
                                    width:
                                        AppDimensionsUpdated.width10(context) *
                                            0.2,
                                    color: const Color(0xffFA9934))),
                            child: Center(
                                child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: const Color(0xffFA9934),
                                  fontSize:
                                      UpdatedDimensions.font10(context) * 2,
                                  fontWeight: FontWeight.w600),
                            ))),
                      )
                    : Container(),
                AnimatedScaleButton(
                  onTap: () async {
                    if (EmotionsAfter != 0) {
                      final SharedPreferences prefs = await _prefs;
                      await prefs.setInt('afterSession', EmotionsAfter);
                      await prefs.setString(
                          'sessionFeedback',
                          feedback2.text.toString().isNotEmpty
                              ? feedback.text.toString()
                              : " ");

                      if (widget.summary == true) {
                        if (newSession == true) {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const practice_summary(
                                      view: false, newSession: true)));
                        } else {
                          RecordingPractice().updateRecording(
                              "feelingsAfterSession", EmotionsAfter, [
                            {
                              "beforeNote": emotionsNotes ?? " ",
                              "afterNote": feedback.text.toString().isNotEmpty
                                  ? feedback.text.toString()
                                  : " ",
                              "endNote": endSession ?? " "
                            }
                          ]).then((value) {
                            if (value == true) {
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const practice_summary(
                                          view: false, newSession: false)));
                            }
                          });
                        }
                      } else {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const endofSession(
                              summary: false,
                              selected: 0,
                            )));
                      }

                      setState(() {
                        noteCheck = false;
                      });
                    }
                  },
                  child: Container(
                      height: AppDimensionsUpdated.height10(context) * 5.0,
                      width: widget.summary
                          ? AppDimensionsUpdated.width10(context) * 21.0
                          : AppDimensionsUpdated.width10(context) * 25.4,
                      // margin: EdgeInsets.only(bottom: 62, top: 46),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: EmotionsAfter != 0
                                ? [
                                    const Color(0xffFCC10D),
                                    const Color(0xffFDA210),
                                  ]
                                : [
                                    const Color(0xffFCC10D).withOpacity(0.5),
                                    const Color(0xffFDA210).withOpacity(0.5),
                                  ]),
                        borderRadius: BorderRadius.circular(
                            AppDimensionsUpdated.height10(context) * 5.0),
                      ),
                      child: Center(
                        child: Text(
                          widget.summary ? 'Update Summary' : 'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: UpdatedDimensions.font10(context) * 2,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: appBarTitle(context, pracName,false),
            leading: Center(
              child: IconButton(
                  onPressed: () {
                    if (widget.summary == false) {
                      Navigator.push(
                        context,
                        FadePageRouteReverse(
                          page: emotions(
                            summary: false,
                            pracName: pracName,
                            record: false,
                            selected: 0,
                          ),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: Image.asset(
                    'assets/images/Back.webp',
                    // width: AppDimensionsUpdated.width10(context) * 2.6,
                    height: AppDimensionsUpdated.height10(context) * 2.8,
                    fit: BoxFit.contain,
                  )),
            ),
            actions: [
              Buttons().closeButton(context, () {
                if (widget.summary) {
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
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              //scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: AppDimensionsUpdated.height10(context) * 10.5,
                        top: AppDimensionsUpdated.height10(context) * 5.0),
                  ),

                  SizedBox(
                    width: AppDimensionsUpdated.width10(context) * 35.9,
                    height: AppDimensionsUpdated.height10(context) * 14.8,
                    // alignment: Alignment.center,

                    child: RichText(
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
                              text: 'How do you feel',
                            ),
                            TextSpan(
                              text: ' after',
                              style: TextStyle(color: Color(0xff8C648A)),
                            ),
                            TextSpan(
                              text: '\nrecording your practice?',
                            ),
                          ]),
                    ),
                  ),
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 8.7,
                        )
                      : SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 0,
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
                                EmotionsAfter = index + 1;
                              });
                            },
                            child: sessonCircles(context,
                                EmotionsAfter == index + 1, index, false,false),
                          );
                        }),
                  ),

                  addNotes(
                    state_: widget.summary,
                    controller: feedback2,
                  ),

                  SizedBox(
                    height: AppDimensionsUpdated.height10(context) * 2,
                  )
                  // Padding(
                  //     padding: EdgeInsets.only(
                  //         bottom: MediaQuery.of(context).viewInsets.bottom))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class next_botton extends StatefulWidget {
  final bool state;
  const next_botton({super.key, required this.state});

  @override
  State<next_botton> createState() => _next_bottonState();
}

class _next_bottonState extends State<next_botton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.state
            ? AnimatedScaleButton(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: AppDimensionsUpdated.height10(context) * 5.0,
                    width: AppDimensionsUpdated.width10(context) * 14.3,
                    margin: EdgeInsets.only(
                        right: AppDimensionsUpdated.width10(context) * 1.2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            AppDimensionsUpdated.height10(context) * 5.0),
                        border: Border.all(
                            width: AppDimensionsUpdated.width10(context) * 0.2,
                            color: const Color(0xffFA9934))),
                    child: Center(
                        child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: const Color(0xffFA9934),
                          fontSize: AppDimensionsUpdated.font10(context) * 2,
                          fontWeight: FontWeight.w600),
                    ))),
              )
            : Container(),
        AnimatedScaleButton(
          onTap: () async {
            if (EmotionsAfter != 0) {
              final SharedPreferences prefs = await _prefs;
              await prefs.setInt('afterSession', EmotionsAfter);
              await prefs.setString(
                  'sessionFeedback',
                  feedback.text.toString().isNotEmpty
                      ? feedback.text.toString()
                      : " ");

              if (widget.state == true) {
                RecordingPractice()
                    .updateRecording("feelingsAfterSession", EmotionsAfter, [
                  {
                    "beforeNote": emotionsNotes ?? " ",
                    "afterNote": feedback.text.toString().isNotEmpty
                        ? feedback.text.toString()
                        : " ",
                    "endNote": endSession ?? " "
                  }
                ]).then((value) {
                  if (value == true) {
                    Navigator.push(
                        context,
                        FadePageRoute(
                            page: const practice_summary(
                                view: false, newSession: false)));
                  }
                });
              } else {
                Navigator.push(
                    context,
                    FadePageRoute(
                        page: const endofSession(
                      summary: false,
                      selected: 0,
                    )));
              }

              setState(() {
                noteCheck = false;
              });
            }
          },
          child: Container(
              height: AppDimensionsUpdated.height10(context) * 5.0,
              width: widget.state
                  ? AppDimensionsUpdated.width10(context) * 21.0
                  : AppDimensionsUpdated.width10(context) * 25.4,
              // margin: EdgeInsets.only(bottom: 62, top: 46),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: EmotionsAfter != 0
                        ? [
                            const Color(0xffFCC10D),
                            const Color(0xffFDA210),
                          ]
                        : [
                            const Color(0xffFCC10D).withOpacity(0.5),
                            const Color(0xffFDA210).withOpacity(0.5),
                          ]),
                borderRadius: BorderRadius.circular(
                    AppDimensionsUpdated.height10(context) * 5.0),
              ),
              child: Center(
                child: Text(
                  widget.state ? 'Update Summary' : 'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensionsUpdated.font10(context) * 2,
                      fontWeight: FontWeight.w600),
                ),
              )),
        ),
      ],
    );
  }
}
