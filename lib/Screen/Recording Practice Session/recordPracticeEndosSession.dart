import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeFellingAftr.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class endofSession extends StatefulWidget {
  final bool summary;

  const endofSession({super.key, required this.summary});

  @override
  State<endofSession> createState() => _endofSessionState();
}

class _endofSessionState extends State<endofSession> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String pracName = "";
  int sessionEnd = 0;

  var emotions;
  var afterSession;
  var sessionFeedback;
  var prac_num;

  @override
  void initState() {
    onLoad();
    super.initState();
    _fetchGoalNames();
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          // Loading = false;

          pracName = response["userPractices"][0]["name"];
        });
      } else {
        setState(() {
          //Loading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        // Loading = false;
      });
      print("error");
    });

    // setState(() {
    //   goalName = AdminGoal().getUserGoal();
    // });
    // print('GoalName: $goalName');
  }

  void onLoad() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prac_num = prefs.getInt("prac_num");
      emotions = prefs.getInt('emotions');
      afterSession = prefs.getInt('afterSession');
      sessionFeedback = prefs.getString('sessionFeedback');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {},
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
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                //width: AppDimensions.height10(context) * 18.6,
                height: AppDimensions.height10(context) * 2.4,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 10.5,
                    top: AppDimensions.height10(context) * 5.0),
                alignment: Alignment.center,
                child: Text(
                  pracName,
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
                    bottom: AppDimensions.height10(context) * 8.3),
                child: Text(
                  'How did the practice go?',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 5.2,
                    left: AppDimensions.height10(context) * 1.0),
                height: AppDimensions.height10(context) * 15.4,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    AnimatedScaleButton(
                      onTap: () {
                        setState(() {
                          sessionEnd = 1;
                        });
                        print(sessionEnd);
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 15.4,
                        width: AppDimensions.height10(context) * 15.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.2,
                              color: sessionEnd == 1
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                        child: Container(
                          height: AppDimensions.height10(context) * 13.4,
                          width: AppDimensions.height10(context) * 13.4,
                          margin: EdgeInsets.all(
                              AppDimensions.height10(context) * 0.9),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.white),
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
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'Hated',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(text: ' it')
                                  ])),
                        ),
                      ),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        setState(() {
                          sessionEnd = 2;
                        });
                        print(sessionEnd);
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 15.4,
                        width: AppDimensions.height10(context) * 15.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.2,
                              color: sessionEnd == 2
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                        child: Container(
                          height: AppDimensions.height10(context) * 13.4,
                          width: AppDimensions.height10(context) * 13.4,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(
                              AppDimensions.height10(context) * 0.9),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.white),
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
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'Found it\n',
                                    ),
                                    TextSpan(
                                      text: 'difficult',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                        ),
                      ),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        setState(() {
                          sessionEnd = 3;
                        });
                        print(sessionEnd);
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 15.4,
                        width: AppDimensions.height10(context) * 15.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.2,
                              color: sessionEnd == 3
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                        child: Container(
                          height: AppDimensions.height10(context) * 13.4,
                          width: AppDimensions.height10(context) * 13.4,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(
                              AppDimensions.height10(context) * 0.9),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.white),
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
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  children: const [
                                    TextSpan(text: 'Had\n'),
                                    TextSpan(
                                      text: ' distractions',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(text: ',\nit was hard to\nfocus')
                                  ])),
                        ),
                      ),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        setState(() {
                          sessionEnd = 4;
                        });
                        print(sessionEnd);
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 15.4,
                        width: AppDimensions.height10(context) * 15.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.2,
                              color: sessionEnd == 4
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                        child: Container(
                          height: AppDimensions.height10(context) * 13.4,
                          width: AppDimensions.height10(context) * 13.4,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(
                              AppDimensions.height10(context) * 0.9),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.white),
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
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'It was ',
                                    ),
                                    TextSpan(
                                        text: 'ok',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ])),
                        ),
                      ),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        setState(() {
                          sessionEnd = 5;
                        });
                        print(sessionEnd);
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 15.4,
                        width: AppDimensions.height10(context) * 15.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.2,
                              color: sessionEnd == 5
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                        child: Container(
                          height: AppDimensions.height10(context) * 13.4,
                          width: AppDimensions.height10(context) * 13.4,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(
                              AppDimensions.height10(context) * 0.9),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.white),
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
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'Good',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(text: ', I liked\nit')
                                  ])),
                        ),
                      ),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        setState(() {
                          sessionEnd = 6;
                        });
                        print(sessionEnd);
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 15.4,
                        width: AppDimensions.height10(context) * 15.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.2,
                              color: sessionEnd == 6
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                        child: Container(
                          height: AppDimensions.height10(context) * 13.4,
                          width: AppDimensions.height10(context) * 13.4,
                          margin: EdgeInsets.all(
                              AppDimensions.height10(context) * 0.9),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.white),
                              gradient: RadialGradient(
                                //radius: 0.5,

                                colors: [
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
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'Great',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(text: ', in the \nzone')
                                  ])),
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
                    bottom: AppDimensions.height10(context) * 10.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedScaleButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
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
                          child: const Center(
                              child: Icon(
                            Icons.edit_note,
                            //size: 27,
                            color: Colors.white,
                          )),
                        ),
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
              AnimatedScaleButton(
                onTap: () {
                  if (sessionEnd != 0) {
                    if (widget.summary == true) {
                      RecordingPractice()
                          .updateRecording('practiceSummary', sessionEnd)
                          .then((value) {
                        if (value == true) {
                          print('Updated Summary');
                          Navigator.push(
                              context,
                              FadePageRoute2(true,
                                  exitPage: const endofSession(summary: true),
                                  enterPage: const practice_summary()));
                        } else {
                          print('Update Failed');
                        }
                      });
                    } else {
                      RecordingPractice()
                          .userAddRecording(
                        '$emotions',
                        '$afterSession',
                        sessionFeedback,
                        '$sessionEnd',
                        prac_num,
                      )
                          .then((response) {
                        if (response == true) {
                          print("Api called");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Recording Added Successfully!!")));
                          print('========Done');
                          Navigator.push(
                              context,
                              FadePageRoute2(true,
                                  exitPage: const endofSession(summary: false),
                                  enterPage: const practice_summary()));
                        } else if (response == false) {
                          print('Api call failed');
                        }
                      }).catchError((error) {
                        print('===>error');
                      }).whenComplete(() {
                        print('Completed');
                      });
                    }
                  }
                },
                child: Container(
                    height: AppDimensions.height10(context) * 5.0,
                    width: AppDimensions.height10(context) * 25.4,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 6.3),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFCC10D),
                            Color(0xffFDA210),
                          ]),
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 5.0),
                    ),
                    child: Center(
                      child: Text(
                        widget.summary ? 'Update Summary' : 'Summary',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
