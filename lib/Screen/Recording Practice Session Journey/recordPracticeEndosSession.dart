import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/recordingPractice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeFellingAftr.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeSummary.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/widgets/optionCircles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/appBarWidgets.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import 'widgets/SessionDialogs.dart';
import 'widgets/SessionNotes.dart';

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
  var newSession;
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

  clean() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('newSession');
    prefs.remove('emotions');
    prefs.remove('afterSession');
    prefs.remove('sessionFeedback');
    prefs.remove('emotionsFeedback');
    prefs.remove('recording_Time1');
    prefs.getBool('behaviour_route');
    prefs.remove('record_date');
  }

  void onLoad() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      newSession = prefs.getBool('newSession');
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
                                  width: AppDimensionsUpdated.width10(context) *
                                      0.2,
                                  color: const Color(0xffFA9934))),
                          child: Center(
                              child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: const Color(0xffFA9934),
                                fontSize:
                                    UpdatedDimensions.font10(context) * 2.0,
                                fontWeight: FontWeight.w600),
                          ))),
                    )
                  : Container(),
              AnimatedScaleButton(
                onTap: () async {
                  if (sessionEnd != 0) {
                    final SharedPreferences prefs = await _prefs;
                    feedback3.text.isNotEmpty
                        ? prefs.setString(
                            'endSessionFeedback', feedback3.text.toString())
                        : prefs.setString('endSessionFeedback', " ");
                    if (widget.summary == true) {
                      if (newSession == true) {
                        await prefs.setInt('endOfSession', sessionEnd);
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const practice_summary(
                                    view: false, newSession: true)));
                      } else {
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
                                        view: false, newSession: false)));
                          } else {}
                        });
                      }
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
                              feedback3.clear();
                              clean();
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(const SnackBar(
                              //         content: Text(
                              //             "Recording Added Successfully")));
                              feedback3.clear();
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const practice_summary(
                                          view: false, newSession: false)));
                            } else if (response == false) {}
                          })
                          .catchError((error) {})
                          .whenComplete(() {});
                    }
                  }
                },
                child: Container(
                    height: AppDimensionsUpdated.height10(context) * 5.0,
                    width: widget.summary
                        ? AppDimensionsUpdated.height10(context) * 21.0
                        : AppDimensionsUpdated.height10(context) * 25.4,
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
                                  const Color(0xffFCC10D).withOpacity(0.5),
                                  const Color(0xffFDA210).withOpacity(0.5),
                                ]),
                      borderRadius: BorderRadius.circular(
                          AppDimensionsUpdated.height10(context) * 5.0),
                    ),
                    child: Center(
                      child: Text(
                        widget.summary ? 'Update Summary' : 'Summary',
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
          leading: Buttons().backButton(context, (){
            Navigator.pop(context);
            feedback3.clear();
          }),
          centerTitle: true,
          title: appBarTitle(context, pracName,false),
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
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: AppDimensionsUpdated.height10(context) * 10.5,
                      top: AppDimensionsUpdated.height10(context) * 7.0),
                ),
                Container(
                  width: AppDimensionsUpdated.width10(context) * 35.9,
                  height: AppDimensionsUpdated.height10(context) * 14.8,
                 // alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      bottom: AppDimensionsUpdated.height10(context) * 8.3),
                  child: RichText(
                    textAlign: TextAlign.center,
                      text: TextSpan(
                    text: 'How did the practice go?',
                    style: TextStyle(
                        fontSize: AppDimensionsUpdated.font10(context) * 2.8,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'laila',
                        color: Colors.white),
                  )),
                ),
                Container(
                  height: AppDimensionsUpdated.width10(context) * 15.7,
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
                              sessionEnd = index + 1;
                            });
                          },
                          child: sessonCircles(context,
                              sessionEnd == index + 1, index, false,true),
                        );
                      }),
                ),
                addNotes(
                  state_: widget.summary,
                  controller: feedback3,
                ),
                SizedBox(
                  height: AppDimensionsUpdated.height10(context) * 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
