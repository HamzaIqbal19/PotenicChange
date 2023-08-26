import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEndosSession.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import 'dashboardViewgoals.dart';

bool note_check = false;
int EmotionsAfter = 0;
TextEditingController feedback = TextEditingController();
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

  @override
  void initState() {
    super.initState();
    feedback.clear();
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

    behaviour_route = prefs.getBool('behaviour_route');
  }

  void _fetchPracticeNames() async {
    final SharedPreferences prefs = await _prefs;
    var Name = prefs.getString('pracName');

    setState(() {
      pracName = '$Name';
    });
  }

  void recording() {
    RecordingPractice.getUserPracticeRecord().then((response) {
      if (response.length != 0) {
        print(
            '===================================================$response===');
        print(response['recording']['notes'][0]['endNote']);
        String SessionFeedBack = '';

        setState(() {
          emotionsNotes = response['recording']['notes'][0]['beforeNote'];
          endSession = response['recording']['notes'][0]['endNote'];
          SessionFeedBack =
              response['recording']['notes'][0]['afterNote'].toString().isEmpty
                  ? ''
                  : response['recording']['notes'][0]['afterNote'];
          EmotionsAfter = response['recording']['feelingsAfterSession'];
        });
        if (SessionFeedBack != '') {
          feedback.text = SessionFeedBack;
        }

        //print(response);
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
            FadePageRoute(
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
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  if (widget.summary == false) {
                    Navigator.push(
                      context,
                      FadePageRoute(
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
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
                )),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    widget.summary == false
                        ? showAnimatedDialog(
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
                                                      page: const dashBoard(
                                                    saved: false,
                                                    helpful_tips: false,
                                                    membership: true,
                                                    dashboard_ctrl: false,
                                                    cancel: false,
                                                    trial: false,
                                                  )));
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page: const view_goals(
                                                          missed: false)));
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
                          )
                        : Navigator.pop(context);
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
                  width: AppDimensions.height10(context) * 30,
                  height: AppDimensions.height10(context) * 2.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.0),
                  child: Center(
                    child: Text(
                      pracName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 10.5,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 0,
                      ),
                Container(
                  width: AppDimensions.height10(context) * 35.9,
                  height: AppDimensions.height10(context) * 14.8,
                  // alignment: Alignment.center,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'How do you feel',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.8,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'after',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.8,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Laila',
                                color: const Color(0xff8C648A)),
                          ),
                          TextSpan(
                            text: ' recording your\npractice?',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.8,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Laila',
                                color: Colors.white),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 8.7,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 0,
                      ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 6.3,
                      left: AppDimensions.height10(context) * 1.0),
                  height: AppDimensions.height10(context) * 13.7,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      AnimatedScaleButton(
                        onTap: () {
                          setState(() {
                            EmotionsAfter = 1;
                          });
                          print(EmotionsAfter);
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
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: EmotionsAfter == 1
                                      ? Colors.white
                                      : Colors.transparent)),
                          child: Container(
                            height: AppDimensions.height10(context) * 12.7,
                            width: AppDimensions.height10(context) * 12.5,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.height10(context) * 0.3),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                              color: const Color(0xff546096),
                            ),
                            child: Text(
                              'I feel very low\n& irritated',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                            EmotionsAfter = 2;
                          });
                          print(EmotionsAfter);
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
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: EmotionsAfter == 2
                                      ? Colors.white
                                      : Colors.transparent)),
                          child: Container(
                            height: AppDimensions.height10(context) * 12.7,
                            width: AppDimensions.height10(context) * 12.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.height10(context) * 0.3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: Colors.white),
                              color: const Color(0xff7291A0),
                            ),
                            child: Text(
                              'I feel alright,\n but slightly\ndown',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                            EmotionsAfter = 3;
                          });
                          print(EmotionsAfter);
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
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: EmotionsAfter == 3
                                      ? Colors.white
                                      : Colors.transparent)),
                          child: Container(
                            height: AppDimensions.height10(context) * 12.7,
                            width: AppDimensions.height10(context) * 12.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.height10(context) * 0.3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: Colors.white),
                              color: const Color(0xffE1C44F),
                            ),
                            child: Text(
                              'I feel ok',
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                            EmotionsAfter = 4;
                          });
                          print(EmotionsAfter);
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
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: EmotionsAfter == 4
                                      ? Colors.white
                                      : Colors.transparent)),
                          child: Container(
                            height: AppDimensions.height10(context) * 12.7,
                            width: AppDimensions.height10(context) * 12.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.height10(context) * 0.3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: Colors.white),
                              color: const Color(0xffFA9458),
                            ),
                            child: Text(
                              ' I feel focused\nand motivated',
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                            EmotionsAfter = 5;
                          });
                          print(EmotionsAfter);
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
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: EmotionsAfter == 5
                                      ? Colors.white
                                      : Colors.transparent)),
                          child: Container(
                            height: AppDimensions.height10(context) * 12.7,
                            width: AppDimensions.height10(context) * 12.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.height10(context) * 0.3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.2,
                                  color: Colors.white),
                              color: const Color(0xffFF7C42),
                            ),
                            child: Text(
                              'I feel excited\nand good in\nmyself',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                addNotes(
                  state_: widget.summary,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.summary
                        ? AnimatedScaleButton(
                            onTap: () {
                              Navigator.pop(context);
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
                                  'Cancel',
                                  style: TextStyle(
                                      color: const Color(0xffFA9934),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w600),
                                ))),
                          )
                        : Container(),
                    AnimatedScaleButton(
                      onTap: () async {
                        if (EmotionsAfter != 0) {
                          final SharedPreferences prefs = await _prefs;
                          var emotionResult =
                              prefs.setInt('afterSession', EmotionsAfter);
                          var afterSessionFeedback = prefs.setString(
                              'sessionFeedback',
                              feedback.text.toString().isNotEmpty
                                  ? feedback.text.toString()
                                  : " ");
                          print("======================>$EmotionsAfter");
                          print("================>${feedback.text.toString()}");

                          if (widget.summary == true) {
                            print(emotionsNotes);
                            print(endSession);
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
                                        page: const practice_summary()));
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
                            note_check = false;
                          });
                        }
                      },
                      child: Container(
                          height: AppDimensions.height10(context) * 5.0,
                          width: widget.summary
                              ? AppDimensions.width10(context) * 21.0
                              : AppDimensions.width10(context) * 25.4,
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
                                        const Color(0xffFCC10D)
                                            .withOpacity(0.5),
                                        const Color(0xffFDA210)
                                            .withOpacity(0.5),
                                      ]),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 5.0),
                          ),
                          child: Center(
                            child: Text(
                              widget.summary ? 'Update Summary' : 'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                  ],
                )
                // Padding(
                //     padding: EdgeInsets.only(
                //         bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppDimensions.height10(context) * 7.6,
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
                  width: AppDimensions.height10(context) * 5.0,
                  height: AppDimensions.height10(context) * 5.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(back_color),
                      border: Border.all(
                          width: AppDimensions.height10(context) * 0.2,
                          color: Color(icon_color))),
                  child: Container(
                    height: AppDimensions.height10(context) * 2.7,
                    width: AppDimensions.height10(context) * 2.7,
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
                width: AppDimensions.height10(context) * 7.6,
                height: AppDimensions.height10(context) * 1.9,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.6),
                child: Text(
                  'Add Notes',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 1.6,
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
          width: AppDimensions.height10(context) * 36.0,
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
                        fontSize: AppDimensions.height10(context) * 1.6,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff646464),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
              // SizedBox(
              //   height: AppDimensions.height10(context) * 1.4,
              // ),
              // Container(
              //   //alignment: Alignment(0, 0),
              //   margin: EdgeInsets.only(
              //       right: AppDimensions.height10(context) * 21.2),
              //   width: AppDimensions.height10(context) * 13.1,
              //   height: AppDimensions.height10(context) * 2.0,
              //   child: Row(
              //     children: [
              //       Text(
              //         'Character count: ',
              //         style: TextStyle(
              //             fontSize: AppDimensions.height10(context) * 1.3,
              //             fontWeight: FontWeight.w400,
              //             color: const Color(0xff464646)),
              //       ),
              //       Text(
              //         '200',
              //         style: TextStyle(
              //             fontSize: AppDimensions.height10(context) * 1.3,
              //             fontWeight: FontWeight.w700,
              //             color: const Color(0xff464646)),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ],
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
                    height: AppDimensions.height10(context) * 5.0,
                    width: AppDimensions.height10(context) * 14.3,
                    margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 1.2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 5.0),
                        border: Border.all(
                            width: AppDimensions.height10(context) * 0.2,
                            color: const Color(0xffFA9934))),
                    child: Center(
                        child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: const Color(0xffFA9934),
                          fontSize: AppDimensions.height10(context) * 1.6,
                          fontWeight: FontWeight.w600),
                    ))),
              )
            : Container(),
        AnimatedScaleButton(
          onTap: () async {
            if (EmotionsAfter != 0) {
              final SharedPreferences prefs = await _prefs;
              var emotionResult = prefs.setInt('afterSession', EmotionsAfter);
              var afterSessionFeedback = prefs.setString(
                  'sessionFeedback',
                  feedback.text.toString().isNotEmpty
                      ? feedback.text.toString()
                      : " ");
              print("======================>$EmotionsAfter");
              print("================>${feedback.text.toString()}");

              if (widget.state == true) {
                print(emotionsNotes);
                print(endSession);
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
                        context, FadePageRoute(page: const practice_summary()));
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
                note_check = false;
              });
            }
          },
          child: Container(
              height: AppDimensions.height10(context) * 5.0,
              width: widget.state
                  ? AppDimensions.width10(context) * 21.0
                  : AppDimensions.width10(context) * 25.4,
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
                    AppDimensions.height10(context) * 5.0),
              ),
              child: Center(
                child: Text(
                  widget.state ? 'Update Summary' : 'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 1.6,
                      fontWeight: FontWeight.w600),
                ),
              )),
        ),
      ],
    );
  }
}
