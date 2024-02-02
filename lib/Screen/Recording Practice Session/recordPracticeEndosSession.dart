import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeFellingAftr.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class endofSession extends StatefulWidget {
  final bool summary;
  final int selected;

  const endofSession(
      {super.key, required this.summary, required this.selected});

  @override
  State<endofSession> createState() => _endofSessionState();
}

TextEditingController feedback3 = TextEditingController();

class _endofSessionState extends State<endofSession> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int sessionEnd = 0;
  String pracName = "";
  var behaviour_route;

  var timeSlot;
  var emotions;
  var afterSession;
  var afterSessionNotes;
  var emotionsNotes;
  var selectedDate;
  //var sessionFeedback;
  int pracNum = 0;

  @override
  void initState() {
    super.initState();
    feedback3.clear();
    setState(() {
      sessionEnd = 0;
    });
    setState(() {
      sessionEnd = widget.selected;
    });
    onLoad();

    _fetchPracticeNames();
  }

  void _fetchPracticeNames() async {
    final SharedPreferences prefs = await _prefs;
    var name = prefs.getString('pracName');

    setState(() {
      pracName = '$name';
    });
    onLoad();
    if (widget.summary == true) {
      recording();
    }
  }
  // String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void onLoad() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      pracNum = prefs.getInt("prac_num")!;
      emotions = prefs.getInt('emotions');
      afterSession = prefs.getInt('afterSession');
      afterSessionNotes = prefs.getString('sessionFeedback');
      emotionsNotes = prefs.getString('emotionsFeedback');
      timeSlot = prefs.getString('recording_Time1') ?? "12:00 am";
      behaviour_route = prefs.getBool('behaviour_route');
      selectedDate = prefs.getString('record_date') ?? "2023:08:12";
    });

    feedback3.text = prefs.getString('endSessionFeedback')!;
    if (widget.summary == false) {
      feedback3.clear();
    }
  }

  void recording() {
    RecordingPractice.getUserPracticeRecord().then((response) {
      if (response.length != 0) {
        String SessionFeedBack = '';

        setState(() {
          afterSessionNotes =
              response['recording']['notes'][0]['afterNote'].toString();
          emotionsNotes =
              response['recording']['notes'][0]['beforeNote'].toString();
          SessionFeedBack =
              response['recording']['notes'][0]['endNote'].toString().isEmpty
                  ? ''
                  : response['recording']['notes'][0]['endNote'];
          sessionEnd = response['recording']['practiceSummary'];
        });
        if (SessionFeedBack != '') {
          feedback3.text = SessionFeedBack;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  feedback3.clear();
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  //  width: AppDimensions.width10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.8,
                  fit: BoxFit.contain,
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
                                          AppDimensions.width10(context) * 1.6,
                                      right: AppDimensions.height10(context) *
                                          1.6),
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
                                            feedback3.clear();
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
                          )
                        : Navigator.pop(context);
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
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: AppDimensions.width10(context) * 30.0,
                  height: AppDimensions.height10(context) * 2.4,
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 10.5,
                      top: AppDimensions.height10(context) * 5.0),
                  alignment: Alignment.center,
                  child: Text(
                    pracName,
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
                      bottom: AppDimensions.height10(context) * 8.3),
                  child: RichText(
                      text: TextSpan(
                    text: 'How did the practice go?',
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 2.8,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'laila',
                        color: Colors.white),
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 5.2,
                      left: AppDimensions.width10(context) * 1.0),
                  height: AppDimensions.width10(context) * 13.7,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      AnimatedScaleButton(
                        onTap: () {
                          setState(() {
                            sessionEnd = 1;
                          });
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.7,
                          height: AppDimensions.width10(context) * 13.7,
                          margin: EdgeInsets.only(
                              left: AppDimensions.width10(context) * 4.0,
                              right: AppDimensions.width10(context) * 1.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: AppDimensions.width10(context) * 0.2,
                                color: sessionEnd == 1
                                    ? Colors.white
                                    : Colors.transparent),
                          ),
                          child: Container(
                            height: AppDimensions.width10(context) * 12.7,
                            width: AppDimensions.width10(context) * 12.5,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.width10(context) * 0.3),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                gradient: RadialGradient(
                                  // radius: 0.5,
                                  colors: <Color>[
                                    const Color(0xFFBDA7C2)
                                        .withOpacity(0.19), // yellow sun
                                    const Color(0xFFB38FB4)
                                        .withOpacity(.81), // blue sky
                                  ],
                                )),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: 'Not great,\nhaven’t\nenjoyed it',
                                      ),
                                      // TextSpan(text: ' it')
                                    ])),
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          setState(() {
                            sessionEnd = 2;
                          });
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.7,
                          height: AppDimensions.width10(context) * 13.7,
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 1.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: AppDimensions.width10(context) * 0.2,
                                color: sessionEnd == 2
                                    ? Colors.white
                                    : Colors.transparent),
                          ),
                          child: Container(
                            height: AppDimensions.width10(context) * 12.7,
                            width: AppDimensions.width10(context) * 12.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.width10(context) * 0.3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                gradient: RadialGradient(
                                  // radius: 0.5,
                                  colors: <Color>[
                                    const Color(0xFFBDA7C2)
                                        .withOpacity(0.19), // yellow sun
                                    const Color(0xFFB38FB4)
                                        .withOpacity(.81), // blue sky
                                  ],
                                )),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text:
                                            'I got\ndistracted, it\nwas hard to\nfocus',
                                      ),
                                      // TextSpan(
                                      //   text: 'difficult',
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.bold),
                                      // )
                                    ])),
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          setState(() {
                            sessionEnd = 3;
                          });
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.7,
                          height: AppDimensions.width10(context) * 13.7,
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 1.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: AppDimensions.width10(context) * 0.2,
                                color: sessionEnd == 3
                                    ? Colors.white
                                    : Colors.transparent),
                          ),
                          child: Container(
                            height: AppDimensions.width10(context) * 12.7,
                            width: AppDimensions.width10(context) * 12.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.width10(context) * 0.3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                gradient: RadialGradient(
                                  //radius: 0.5,
                                  colors: <Color>[
                                    const Color(0xFFBDA7C2)
                                        .withOpacity(0.19), // yellow sun
                                    const Color(0xFFB38FB4)
                                        .withOpacity(.81), // blue sky
                                  ],
                                )),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    children: const [
                                      TextSpan(text: 'It was ok'),
                                      // TextSpan(
                                      //   text: ' distractions',
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      // TextSpan(text: ',\nit was hard to\nfocus')
                                    ])),
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          setState(() {
                            sessionEnd = 4;
                          });
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.7,
                          height: AppDimensions.width10(context) * 13.7,
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 1.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: AppDimensions.width10(context) * 0.2,
                                color: sessionEnd == 4
                                    ? Colors.white
                                    : Colors.transparent),
                          ),
                          child: Container(
                            height: AppDimensions.width10(context) * 12.7,
                            width: AppDimensions.width10(context) * 12.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.width10(context) * 0.3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                gradient: RadialGradient(
                                  // radius: 0.5,
                                  colors: <Color>[
                                    const Color(0xFFBDA7C2)
                                        .withOpacity(0.19), // yellow sun
                                    const Color(0xFFB38FB4)
                                        .withOpacity(.81), // blue sky
                                  ],
                                )),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: 'Good, I quite\nliked it',
                                      ),
                                      // TextSpan(
                                      //     text: 'ok',
                                      //     style: TextStyle(
                                      //         fontWeight: FontWeight.bold))
                                    ])),
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          setState(() {
                            sessionEnd = 5;
                          });
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.7,
                          height: AppDimensions.width10(context) * 13.7,
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: AppDimensions.width10(context) * 0.2,
                                color: sessionEnd == 5
                                    ? Colors.white
                                    : Colors.transparent),
                          ),
                          child: Container(
                            height: AppDimensions.width10(context) * 12.7,
                            width: AppDimensions.width10(context) * 12.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10(context) * 0.4,
                                horizontal:
                                    AppDimensions.width10(context) * 0.3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                gradient: RadialGradient(
                                  // radius: 0.5,
                                  colors: <Color>[
                                    const Color(0xFFBDA7C2)
                                        .withOpacity(0.19), // yellow sun
                                    const Color(0xFFB38FB4)
                                        .withOpacity(.81), // blue sky
                                  ],
                                )),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    children: const [
                                      // TextSpan(
                                      //   text: 'Good',
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      TextSpan(
                                          text:
                                              'Great, I\nenjoyed the\nexperience')
                                    ])),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                addNotes(state_: widget.summary),
                Container(
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 1.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.summary
                          ? AnimatedScaleButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  height: AppDimensions.height10(context) * 5.0,
                                  width: AppDimensions.width10(context) * 14.3,
                                  margin: EdgeInsets.only(
                                      right: AppDimensions.height10(context) *
                                          1.2),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              5.0),
                                      border: Border.all(
                                          width:
                                              AppDimensions.width10(context) *
                                                  0.2,
                                          color: const Color(0xffFA9934))),
                                  child: Center(
                                      child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: const Color(0xffFA9934),
                                        fontSize:
                                            AppDimensions.font10(context) * 2.0,
                                        fontWeight: FontWeight.w600),
                                  ))),
                            )
                          : Container(),
                      AnimatedScaleButton(
                        onTap: () async {
                          if (sessionEnd != 0) {
                            final SharedPreferences prefs = await _prefs;
                            feedback.text.isNotEmpty
                                ? prefs.setString('endSessionFeedback',
                                    feedback3.text.toString())
                                : prefs.setString('endSessionFeedback', " ");
                            if (widget.summary == true) {
                              RecordingPractice().updateRecording(
                                'practiceSummary',
                                sessionEnd,
                                [
                                  {
                                    "beforeNote": emotionsNotes,
                                    "afterNote": afterSessionNotes,
                                    "endNote": feedback3.text.isNotEmpty
                                        ? feedback3.text.toString()
                                        : " "
                                  }
                                ],
                              ).then((value) {
                                if (value == true) {
                                  feedback3.clear();
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const practice_summary(
                                        view: false,
                                      )));
                                } else {}
                              });
                            } else {
                              RecordingPractice()
                                  .userAddRecording(
                                    '$emotions',
                                    '$afterSession',
                                    [
                                      {
                                        "beforeNote": emotionsNotes,
                                        "afterNote": afterSessionNotes,
                                        "endNote": feedback3.text.isNotEmpty
                                            ? feedback3.text.toString()
                                            : " "
                                      }
                                    ],
                                    '$sessionEnd',
                                    pracNum,
                                    timeSlot.toString(),
                                    selectedDate,
                                  )
                                  .then((response) {
                                    if (response == true) {
                                      feedback.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Recording Added Successfully")));
                                      feedback3.clear();
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const practice_summary(
                                            view: false,
                                          )));
                                    } else if (response == false) {}
                                  })
                                  .catchError((error) {})
                                  .whenComplete(() {});
                            }
                          }
                        },
                        child: Container(
                            height: AppDimensions.height10(context) * 5.0,
                            width: widget.summary
                                ? AppDimensions.height10(context) * 21.0
                                : AppDimensions.height10(context) * 25.4,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: sessionEnd != 0
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
                                widget.summary ? 'Update Summary' : 'Summary',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.font10(context) * 2,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateFormat {}

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
  int iconColor = 0xffffffff;
  int backColor = 0x000000ff;
  bool noteCheck = false;

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
                  noteCheck
                      ? setState(() {
                          backColor = 0x000000ff;
                          iconColor = 0xffffffff;
                          noteCheck = false;
                        })
                      : setState(() {
                          backColor = 0xffffffff;
                          iconColor = 0xffFA9934;
                          noteCheck = true;
                          // icon_color = 0xffFA9934,
                        });
                },
                child: Container(
                  width: AppDimensions.width10(context) * 5.0,
                  height: AppDimensions.height10(context) * 5.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(backColor),
                      border: Border.all(
                          width: AppDimensions.width10(context) * 0.2,
                          color: Color(iconColor))),
                  child: Container(
                    height: AppDimensions.height10(context) * 2.7,
                    width: AppDimensions.width10(context) * 2.7,
                    margin: const EdgeInsets.only(left: 3),
                    child: Center(
                        child: Icon(
                      Icons.edit_note,
                      //size: 27,
                      color: Color(iconColor),
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
                  textAlign: TextAlign.center,
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
            child: noteCheck
                ? Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.0,
                        bottom: AppDimensions.height10(context) * 2.0),
                    child: notes(
                      state: widget.state_,
                    ))
                : SizedBox(
                    height: AppDimensions.height10(context) * 9.1,
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
              TextField(
                controller: feedback3,
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
            ],
          ),
        ),
      ],
    );
  }
}
