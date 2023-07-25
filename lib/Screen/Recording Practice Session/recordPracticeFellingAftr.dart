import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEndosSession.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

bool note_check = false;
int EmotionsAfter = 0;
TextEditingController feedback = TextEditingController();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class feelingsAfter extends StatefulWidget {
  final bool summary;

  const feelingsAfter({super.key, required this.summary});

  @override
  State<feelingsAfter> createState() => _feelingsAfterState();
}

class _feelingsAfterState extends State<feelingsAfter> {
  String pracName = "";

  @override
  void initState() {
    super.initState();
    _fetchPracticeNames();
  }

  void _fetchPracticeNames() async {
    final SharedPreferences prefs = await _prefs;
    var Name = prefs.getString('pracName');

    setState(() {
      pracName = '$Name';
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
          context,
          FadePageRoute3(
            exitPage: const feelingsAfter(summary: false),
            enterPage: emotions(
              summary: false,
              pracName: pracName,
            ),
          ),
        );
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
                    Navigator.push(
                      context,
                      FadePageRoute3(
                        exitPage: const feelingsAfter(summary: false),
                        enterPage: emotions(
                          summary: false,
                          pracName: pracName,
                        ),
                      ),
                    );
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
                                color: const Color(0xff8C648A)),
                          ),
                          TextSpan(
                            text: ' recording your\npractice?',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.8,
                                fontWeight: FontWeight.w700,
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
                        top: AppDimensions.height10(context) * 1.0),
                    child: notes(
                      state: widget.state_,
                    ))
                : Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 10.1,
                        bottom: AppDimensions.height10(context) * 4.4),
                    child: next_botton(state: widget.state_),
                  )),

        // Container(margin: EdgeInsets.only(top: 10), child: notes()),

        // //next button
        // next_botton()
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
        Container(
            margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 4.6,
                bottom: AppDimensions.height10(context) * 2.6),
            child: next_botton(
              state: state,
            )),
        note_check
            ? SizedBox(
                // height: AppDimensions.height10(context) * 2.6,
                child: Container(
                  color: Colors.amber,
                ),
              )
            : Container()
      ],
    );
  }
}

class next_botton extends StatelessWidget {
  final bool state;
  const next_botton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return AnimatedScaleButton(
      onTap: () async {
        if (EmotionsAfter != 0) {
          final SharedPreferences prefs = await _prefs;
          var emotionResult = prefs.setInt('afterSession', EmotionsAfter);
          var afterSessionFeedback =
              prefs.setString('sessionFeedback', '${feedback.text.toString()}');
          print("======================>$EmotionsAfter");
          print("================>${feedback.text.toString()}");
          if (state == true) {
            RecordingPractice()
                .updateRecording("feelingsAfterSession", EmotionsAfter)
                .then((value) {
              if (value == true) {
                RecordingPractice()
                    .updateRecording(
                        'practiceFeedback', '${feedback.text.toString()}')
                    .then((value) {
                  if (value == true) {
                    print('After updated');
                    Navigator.push(
                        context,
                        FadePageRoute2(true,
                            exitPage: const feelingsAfter(summary: true),
                            enterPage: const practice_summary()));
                  } else {
                    print('Update Failde');
                  }
                });
              }
            });
          } else {
            Navigator.push(
                context,
                FadePageRoute2(true,
                    exitPage: const feelingsAfter(summary: false),
                    enterPage: const endofSession(
                      summary: false,
                    )));
          }
        }
      },
      child: Container(
          height: AppDimensions.height10(context) * 5.0,
          width: AppDimensions.height10(context) * 25.4,
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
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 5.0),
          ),
          child: Center(
            child: Text(
              state ? 'Update Summary' : 'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: AppDimensions.height10(context) * 1.6,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }
}
