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
import 'package:potenic_app/Screen/Recording%20Practice%20Session/timepicker.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_goals_menu.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/Widgets/goalWidget.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class practice_summary extends StatefulWidget {
  final bool view;
  final newSession;
  const practice_summary({super.key, required this.view,required this.newSession});

  @override
  State<practice_summary> createState() => _practice_summaryState();
}

class _practice_summaryState extends State<practice_summary> {
  String dateTime = 'Now';
  String time = 'Am';

  String day = '';
  var behaviourRoute;
  String selectedDate = "${DateTime.now().year}:${DateTime.now().month}:${DateTime.now().day}";
  int differenceInDays = 0;
  String goalName = "";
  String identity = "";
  String pracName = "";
  var pracId;
  var pracColor = '0';
  var color = '0';
  String recordedDate = '';
  bool loading = true;
  var report;
  int before = 0;
  int after = 0;
  String feedback = '';
  int session = 0;
  String emotionFeedback = "";
  String sessionFeedBack = "";
  var details;

  void _fetchRoute() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      behaviourRoute = prefs.getBool('behaviour_route');
      report = prefs.getBool('isReportActive');
    });
  }

  getData()async{
    final SharedPreferences prefs = await _prefs;
    setState(() {
      before = prefs.getInt('emotions')??0;
      after = prefs.getInt('afterSession')??0;
      session = prefs.getInt('endOfSession')??0;
      selectedDate = prefs.getString('recordingDate')!;
      afterSessionNotes = prefs.getString('sessionFeedback')??'';
      emotionsNotes = prefs.getString('emotionsFeedback')??'';
      sessionFeedBack = prefs.getString('endSessionFeedback')??'';
    });


  }

  addRecording(){

    RecordingPractice()
        .userAddRecording(
      before,
      after,
      [
        {
          "beforeNote": emotionsNotes,
          "afterNote": afterSessionNotes,
          "endNote": sessionFeedBack
        }
      ],
      session,
      pracId!,
      DateFormat('h:mm a').format(DateTime.now()).toString(),
      selectedDate,
    )
        .then((response) {
          print("Response $response");
      if (response == true) {
        clean();
        Navigator.push(
            context,
            FadePageRoute(
                page: ViewDashboard(
                  missed: false,
                  name: pracName,
                  update: true,
                  helpfulTips: false,
                  record: differenceInDays,
                )));
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(const SnackBar(
        //         content: Text(
        //             "Recording Added Successfully")));

      } else if (response == false) {}
    })
        .catchError((error) {})
        .whenComplete(() {});
  }

  clean()async{
    final SharedPreferences prefs = await _prefs;
    prefs.remove('newSession');
    prefs.remove('emotions');
    prefs.remove('afterSession');
    prefs.remove('sessionFeedback');
    prefs.remove('endOfSession');
    prefs.remove('emotionsFeedback');
    prefs.remove('recording_Time1');
    prefs.remove('endSessionFeedback');
    prefs.remove('recordingDate');
  }

  Future<void> getRecordedDate() async {
    final SharedPreferences prefs = await _prefs;
    var isFuture ;

    DateTime currentDate =
    DateTime.parse(DateTime.now().toString());
    DateTime date1 = DateTime.parse(prefs.getString('record_date')!);

    setState(() {
      differenceInDays = currentDate.difference(date1).inDays;
      isFuture = date1.isAfter(currentDate);
    });
    print("date1 differenceInDays $isFuture $date1 $differenceInDays");
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void _fetchPracticeNames() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        setState(() {
          pracId = response["id"];
          pracName = response["name"];
          pracColor = response["color"];
        });
        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
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
    }).catchError((error) {});
  }



  void recording() {
    RecordingPractice.getUserPracticeRecord().then((response) {
      print("Api Response: $response");
      if (response.length != 0) {
        setState(() {
          details = response;
          before = response['recording']['feelingsBeforeSession'];
          after = response['recording']['feelingsAfterSession'];
          feedback = response['recording']['notes'][0]['afterNote'];
          emotionFeedback = response['recording']['notes'][0]['beforeNote'];
          sessionFeedBack = response['recording']['notes'][0]['endNote'];
          session = response['recording']['practiceSummary'];
          recordedDate = response['recording']['recordingDate'];
          dateTime = response['recording']['timeSlot'];
        });

      }
    });
  }

  late AnimationController controller;

  @override
  initState() {
    super.initState();
    getRecordedDate();
    print("New Session ${widget.newSession}");
    if(widget.newSession == false){
      recording();
    }else{
      getData();
    }

    _fetchRoute();
    _fetchGoalNames();
    _fetchPracticeNames();
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
            child:widget.view?Container(): IconButton(
                onPressed: () {
                  clean();
                  Navigator.push(
                      context,
                      FadePageRouteReverse(
                          page:  ViewDashboard(
                        missed: false,
                        name: '',
                        update: false,
                        helpfulTips: false,
                        record: differenceInDays,
                      )));
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  //  width: AppDimensionsUpdated.width10(context) * 2.6,
                  height: AppDimensionsUpdated.height10(context) * 2.8,
                  fit: BoxFit.contain,
                )),
          ),
          actions: [
            widget.view
                ? IconButton(onPressed: (){
              clean();
              Navigator.pop(context);
            }, icon: Image.asset(
              'assets/images/Close.webp',
              // width: AppDimensionsUpdated.width10(context) * 2.6,
              height: AppDimensionsUpdated.height10(context) * 2.8,
              fit: BoxFit.contain,
            ))
                : Center(
                    child: IconButton(
                        onPressed: () {
                          showAnimatedDialog(
                            animationType: DialogTransitionType.fadeScale,
                            curve: Curves.easeInOut,
                            duration: const Duration(seconds: 1),
                            context: context,
                            builder: (BuildContext context) => SizedBox(
                              width: AppDimensionsUpdated.width10(context) * 27.0,
                              height: AppDimensionsUpdated.height10(context) * 18.2,
                              child: AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                actionsPadding: EdgeInsets.zero,
                                titlePadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensionsUpdated.height10(context) * 1.4)),
                                title: Container(
                                  margin: const EdgeInsets.only(
                                      top: 19, right: 16, left: 16, bottom: 2),
                                  height: AppDimensionsUpdated.height10(context) * 2.2,
                                  width: AppDimensionsUpdated.width10(context) * 23.8,
                                  child: Text(
                                    "Are you sure?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF000000),
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 1.7,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                content: Container(
                                  margin: EdgeInsets.only(
                                      bottom:
                                          AppDimensionsUpdated.height10(context) * 1.9,
                                      left:
                                          AppDimensionsUpdated.height10(context) * 1.6,
                                      right:
                                          AppDimensionsUpdated.width10(context) * 1.6),
                                  height: AppDimensionsUpdated.height10(context) * 3.2,
                                  width: AppDimensionsUpdated.width10(context) * 23.8,
                                  child: Text(
                                    "If you close it now, you will lose all your progress.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: AppDimensionsUpdated.height10(context) *
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
                                            if (behaviourRoute == false) {
                                              clean();
                                              Navigator.pushReplacement(
                                                  context,
                                                  FadePageRouteReverse(
                                                      page: ViewDashboard(
                                                    missed: false,
                                                    name: '',
                                                    update: false,
                                                    helpfulTips: false,
                                                    record: differenceInDays,
                                                  )));
                                            } else {
                                              clean();
                                              Navigator.push(
                                                  context,
                                                  FadePageRouteReverse(
                                                      page: ViewDashboard(
                                                    missed: false,
                                                    name: '',
                                                    update: false,
                                                    helpfulTips: false,
                                                    record: differenceInDays,
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
                          // width: AppDimensionsUpdated.width10(context) * 2.6,
                          height: AppDimensionsUpdated.height10(context) * 2.8,
                          fit: BoxFit.contain,
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
          child: loading == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensionsUpdated.width10(context) * 33.4,
                        height: AppDimensionsUpdated.height10(context) * 3.4,
                        // color: Colors.amber,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 9.0),
                        child: Center(
                          child: Text(
                            AppText().pracRecSum,
                            style: TextStyle(
                                fontSize: AppDimensionsUpdated.font10(context) * 2.8,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontFamily: 'Laila'),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensionsUpdated.width10(context) * 23.2,
                        height: AppDimensionsUpdated.height10(context) * 3.8,
                        //  color: Colors.red,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 0.8),
                        child: Center(
                          child: Text(
                            AppText().pracRecSumBody,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: AppDimensionsUpdated.height10(context) * 0.12,
                                fontSize: AppDimensionsUpdated.font10(context) * 1.7,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'Laila'),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensionsUpdated.width10(context) * 26.8,
                        height: AppDimensionsUpdated.height10(context) * 26.8,
                        //color: Colors.amber,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 2.4),
                        decoration: BoxDecoration(
                            // color: const Color(0xff7c94b6),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(color == '1'
                                    ? "assets/images/red_gradient.webp"
                                    : color == '2'
                                        ? 'assets/images/orange_moon.webp'
                                        : color == '3'
                                            ? "assets/images/lightGrey_gradient.webp"
                                            : color == '4'
                                                ? "assets/images/lightBlue_gradient.webp"
                                                : color == '5'
                                                    ? "assets/images/medBlue_gradient.webp"
                                                    : color == '6'
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
                                width: AppDimensionsUpdated.width10(context) * 24.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensionsUpdated.height10(context) * 2.0),
                                child: Text(
                                  goalName,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 2.0,
                                      fontWeight: FontWeight.w600,
                                      height: AppDimensionsUpdated.height10(context) *
                                          0.14,
                                      color: const Color(0xff5B74A6)),
                                ),
                              )),
                          Align(
                            alignment: const Alignment(0, -0.08),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) * 1.3,
                                  left: AppDimensionsUpdated.width10(context) * 3.2,
                                  right: AppDimensionsUpdated.width10(context) * 3.2),
                              // color: Colors.red,
                              child: Text('"$identity"',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      height: AppDimensionsUpdated.height10(context) *
                                          0.14,
                                      color: const Color(0xff5B74A6))),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.975),
                            child: Container(
                              height: AppDimensionsUpdated.height10(context) * 13.8,
                              width: AppDimensionsUpdated.width10(context) * 13.8,
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensionsUpdated.width10(context)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // border: Border.all(
                                  //     width: 5, color: const Color(0xFF52855E)),
                                  image: DecorationImage(
                                      image: AssetImage(pracColor == '1'
                                          ? "assets/images/Practice_Completed_2.webp"
                                          : pracColor == '2'
                                              ? 'assets/images/Practice_Completed_2.webp'
                                              : pracColor == '3'
                                                  ? "assets/images/Practice_Completed_3.webp"
                                                  : pracColor == '4'
                                                      ? "assets/images/Practice_Completed_4.webp"
                                                      : pracColor == '5'
                                                          ? "assets/images/Practice_Completed_4.webp"
                                                          : 'assets/images/Practice_Completed_2.webp'))),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    left: AppDimensionsUpdated.width10(context) * 1.2,
                                    right:
                                        AppDimensionsUpdated.width10(context) * 1.2),
                                child: Text(
                                  pracName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: const Color(0xff1A481C),
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 1.8,
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
                          // if(widget.newSession) {
                          //   showModalBottomSheet(
                          //       context: context,
                          //       isDismissible: false,
                          //       isScrollControlled: true,
                          //       shape: const RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.vertical(
                          //           top: Radius.circular(16),
                          //         ),
                          //       ),
                          //       builder: (context){
                          //     return SchedulePicker(
                          //       onSelectionChanged: (selectedHour,
                          //           selectedMinute, selectedPeriod,){
                          //         setState(() {
                          //           dateTime = "$selectedHour:$selectedMinute ${selectedPeriod.toLowerCase()}";
                          //         });
                          //       },
                          //       initialHour: '1',
                          //       initialMinute: '00',
                          //       initialPeriod: 'am',
                          //     );
                          //   });
                          //
                          // }
                          //
                          },
                        child: Container(
                          width: AppDimensionsUpdated.width10(context) * 26.8,
                          height: AppDimensionsUpdated.height10(context) * 5.0,
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) * 4.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensionsUpdated.height10(context) * 1.8),
                              border: Border.all(width: 1, color: Colors.white),
                              color: Colors.transparent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  //margin: EdgeInsets.only(left: 92, right: 66),
                                  height: AppDimensionsUpdated.height10(context) * 2.6,
                                  width: AppDimensionsUpdated.width10(context) * 21.0,
                                  child: Center(
                                    child: Text(
                                      dateTime,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            AppDimensionsUpdated.font10(context) * 2.0,
                                        fontFamily: 'Laila',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                             // widget.newSession? const Icon(
                             //    Icons.arrow_drop_down,
                             //    color: Colors.white,
                             //    size: 30,
                             //  ):Container()
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensionsUpdated.width10(context) * 32.6,
                        //height: AppDimensionsUpdated.height10(context) * 5.0,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 4.0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Laila',
                                  height:
                                      AppDimensionsUpdated.height10(context) * 0.15,
                                  fontSize: AppDimensionsUpdated.font10(context) * 2.0,
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
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: emotions(
                                summary: true,
                                pracName: pracName,
                                record: false,
                                selected: before,
                              )));
                        },
                        child: Container(
                          width: AppDimensionsUpdated.width10(context) * 13.4,
                          height: AppDimensionsUpdated.height10(context) * 13.4,
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) * 3.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                              color: before == 1
                                  ? const Color(0xff546096)
                                  : before == 2
                                      ? const Color(0xff7291A0)
                                      : before == 3
                                          ? const Color(0xffE1C44F)
                                          : before == 4
                                              ? const Color(0xffFF7C42)
                                              : before == 5
                                                  ? const Color(0xff219653)
                                                  :  Colors.transparent),
                          child:before == 0?emptyBox(context):  Stack(children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        AppDimensionsUpdated.height10(context) * 0.5),
                                child: Text(
                                  before == 1
                                      ? 'I feel very\nlow &\ndemotivated'
                                      : before == 2
                                          ? 'I feel slightly\nirritated, not\nfussed really'
                                          : before == 3
                                              ? 'I feel ok'
                                              : before == 4
                                                  ? 'Motivated and \nready to start'
                                                  : before == 5
                                                      ? "Great, cannot \nwait to start!"
                                                      : 'I felt good',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 1.6,
                                      height: AppDimensionsUpdated.height10(context) *
                                          0.16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.85),
                              child: Container(
                                  height: AppDimensionsUpdated.height10(context) * 2.4,
                                  width: AppDimensionsUpdated.width10(context) * 2.4,
                                  padding: EdgeInsets.all(
                                      AppDimensionsUpdated.height10(context) * 0.4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: const ImageIcon(
                                    AssetImage('assets/images/edit_icon.webp'),
                                    color: Colors.white,
                                  )),
                            )
                          ]),
                        ),
                      ),
                      emotionFeedback != " " && emotionFeedback.isNotEmpty
                          ? Container(
                              width: AppDimensionsUpdated.width10(context) * 36.0,
                              // height: AppDimensionsUpdated.height10(context) * 7.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) * 4.0),
                              // padding: EdgeInsets.only(
                              //     bottom: AppDimensionsUpdated.height10(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensionsUpdated.height10(context) * 2.0),
                                  color: Colors.white),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensionsUpdated.height10(context) * 1.4,
                                    bottom:
                                        AppDimensionsUpdated.height10(context) * 1.0,
                                    left: AppDimensionsUpdated.width10(context) * 2.0,
                                    right:
                                        AppDimensionsUpdated.height10(context) * 2.0),
                                width: AppDimensionsUpdated.width10(context) * 32.0,
                                child: Text(
                                  emotionFeedback,
                                  style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      height: AppDimensionsUpdated.height10(context) *
                                          0.12,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        width: AppDimensionsUpdated.width10(context) * 32.6,
                        //height: AppDimensionsUpdated.height10(context) * 5.0,
                        //color: Colors.amber,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 4.0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Laila',
                                  height:
                                      AppDimensionsUpdated.height10(context) * 0.15,
                                  fontSize: AppDimensionsUpdated.font10(context) * 2.0,
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
                                    text: ' recording your practice?',
                                  ),
                                ])),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: feelingsAfter(
                                summary: true,
                                selected: after,
                              )));
                        },
                        child: Container(
                          width: AppDimensionsUpdated.width10(context) * 13.4,
                          height: AppDimensionsUpdated.height10(context) * 13.4,
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) * 3.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                              color: after == 1
                                  ? const Color(0xff546096)
                                  : after == 2
                                      ? const Color(0xff7291A0)
                                      : after == 3
                                          ? const Color(0xffE1C44F)
                                          : after == 4
                                              ? const Color(0xffFF7C42)
                                              : after == 5
                                                  ? const Color(0xff219653)
                                                  : Colors.transparent),
                          child:after == 0?emptyBox(context): Stack(children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        AppDimensionsUpdated.height10(context) * 0.5),
                                child: Text(
                                  after == 1
                                      ? 'I feel very low\n& irritated'
                                      : after == 2
                                          ? 'I feel alright,\n but slightly\ndown'
                                          : after == 3
                                              ? 'I feel ok'
                                              : after == 4
                                                  ? 'I feel focused\n& motivated'
                                                  : after == 5
                                                      ? 'I feel excited\nand good in\nmyself'
                                                      : 'I feel focused\n& good',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 1.6,
                                      height: AppDimensionsUpdated.height10(context) *
                                          0.16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.85),
                              child: Container(
                                  height: AppDimensionsUpdated.height10(context) * 2.4,
                                  width: AppDimensionsUpdated.width10(context) * 2.4,
                                  padding: EdgeInsets.all(
                                      AppDimensionsUpdated.height10(context) * 0.4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: const ImageIcon(
                                    AssetImage('assets/images/edit_icon.webp'),
                                    color: Colors.white,
                                  )),
                            )
                          ]),
                        ),
                      ),
                      feedback != " " && feedback.isNotEmpty
                          ? Container(
                              width: AppDimensionsUpdated.width10(context) * 36.0,
                              // height: AppDimensionsUpdated.height10(context) * 7.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) * 4.0),
                              // padding: EdgeInsets.only(
                              //     bottom: AppDimensionsUpdated.height10(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensionsUpdated.height10(context) * 2.0),
                                  color: Colors.white),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensionsUpdated.height10(context) * 1.4,
                                    bottom:
                                        AppDimensionsUpdated.height10(context) * 1.0,
                                    left: AppDimensionsUpdated.width10(context) * 2.0,
                                    right:
                                        AppDimensionsUpdated.height10(context) * 2.0),
                                width: AppDimensionsUpdated.width10(context) * 32.0,
                                child: Text(
                                  feedback.toString(),
                                  style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        //swidth: AppDimensionsUpdated.width10(context) * 32.6,
                        // height: AppDimensionsUpdated.height10(context) * 2.4,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 4.0),
                        child: Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Laila',
                                    height:
                                        AppDimensionsUpdated.height10(context) * 0.15,
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) * 2.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'How did the practice go?',
                                    ),
                                  ])),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: endofSession(
                                summary: true,
                                selected: session,
                              )));
                        },
                        child: Container(
                          width: AppDimensionsUpdated.width10(context) * 13.4,
                          height: AppDimensionsUpdated.height10(context) * 13.2,
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) * 3.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                              gradient:  RadialGradient(
                                radius: 0.5,
                                colors: session == 0?<Color>[
                                  Colors.transparent, // yellow sun
                                  Colors.transparent, // blue sky
                                ]: <Color>[
                                  const Color(0xFFBDA7C2), // yellow sun
                                  const Color(0xFFB38FB4), // blue sky
                                ],
                              )),
                          child:session == 0?emptyBox(context): Stack(children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        AppDimensionsUpdated.height10(context) * 0.5),
                                child: Text(
                                  session == 1
                                      ? 'Not great,\nhaven’t\nenjoyed it'
                                      : session == 2
                                          ? 'I got distracted,\nit was hard to\nfocus'
                                          : session == 3
                                              ? 'It was ok'
                                              : session == 4
                                                  ? 'Good, I quite\nliked it'
                                                  : 'Great,\nI enjoyed the experience',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      height: AppDimensionsUpdated.height10(context) *
                                          0.16,
                                      color: Colors.white,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.85),
                              child: Container(
                                height: AppDimensionsUpdated.height10(context) * 2.4,
                                width: AppDimensionsUpdated.width10(context) * 2.4,
                                padding: EdgeInsets.all(
                                    AppDimensionsUpdated.height10(context) * 0.4),
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
                            )
                          ]),
                        ),
                      ),
                      sessionFeedBack != " " && sessionFeedBack.isNotEmpty
                          ? Container(
                              width: AppDimensionsUpdated.width10(context) * 36.0,
                              // height: AppDimensionsUpdated.height10(context) * 7.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) * 4.0),
                              // padding: EdgeInsets.only(
                              //     bottom: AppDimensionsUpdated.height10(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensionsUpdated.height10(context) * 2.0),
                                  color: Colors.white),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensionsUpdated.height10(context) * 1.4,
                                    bottom:
                                        AppDimensionsUpdated.height10(context) * 1.0,
                                    left: AppDimensionsUpdated.width10(context) * 2.0,
                                    right:
                                        AppDimensionsUpdated.height10(context) * 2.0),
                                width: AppDimensionsUpdated.width10(context) * 32.0,
                                child: Text(
                                  sessionFeedBack,
                                  style: TextStyle(
                                      color: const Color(0xff646464),
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Laila'),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        width: AppDimensionsUpdated.width10(context) * 38.3,
                        height: AppDimensionsUpdated.height10(context) * 5.0,
                        //color: Colors.red,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 6.4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                         widget.newSession == false?     AnimatedScaleButton(
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
                                            width:
                                                AppDimensionsUpdated.width10(context) *
                                                    27.0,
                                            height: AppDimensionsUpdated.height10(
                                                    context) *
                                                21.4,
                                            child: AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppDimensionsUpdated
                                                                  .height10(
                                                                      context) *
                                                              1.4)),
                                              contentPadding: EdgeInsets.zero,
                                              actionsPadding: EdgeInsets.zero,
                                              titlePadding: EdgeInsets.zero,
                                              title: Container(
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensionsUpdated.height10(context) *
                                                          1.9,
                                                      right:
                                                          AppDimensionsUpdated.width10(context) *
                                                              1.6,
                                                      left:
                                                          AppDimensionsUpdated.width10(context) *
                                                              1.6,
                                                      bottom:
                                                          AppDimensionsUpdated.height10(context) *
                                                              0.2),
                                                  height:
                                                      AppDimensionsUpdated.height10(context) *
                                                          4.4,
                                                  width:
                                                      AppDimensionsUpdated.width10(context) *
                                                          23.8,
                                                  child: RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                          style: TextStyle(
                                                              fontFamily: 'laila',
                                                              height: AppDimensionsUpdated.height10(context) * 0.15,
                                                              fontSize: AppDimensionsUpdated.font10(context) * 1.6,
                                                              fontWeight: FontWeight.w400,
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
                                                        AppDimensionsUpdated.height10(
                                                                context) *
                                                            1.5,
                                                    left:
                                                        AppDimensionsUpdated.height10(
                                                                context) *
                                                            1.6,
                                                    right:
                                                        AppDimensionsUpdated.height10(
                                                                context) *
                                                            1.6),
                                                height: AppDimensionsUpdated.height10(
                                                        context) *
                                                    3.4,
                                                width: AppDimensionsUpdated.height10(
                                                        context) *
                                                    23.8,
                                                child: Text(
                                                  "By clicking 'Yes' you confirm that this\nrecording will be deleted permanently. ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF000000),
                                                    fontSize:
                                                        AppDimensionsUpdated.font10(
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
                                                      height: AppDimensionsUpdated
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
                                                      height: AppDimensionsUpdated
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
                                                              fontSize: AppDimensionsUpdated
                                                                      .font10(
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
                                                      height: AppDimensionsUpdated
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
                                                      height: AppDimensionsUpdated
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
                                                                      ViewDashboard(
                                                                    missed: false,
                                                                    name: '',
                                                                    update: false,
                                                                    helpfulTips: false,
                                                                    record: differenceInDays,
                                                                  )));
                                                            } else {}
                                                          });
                                                        },
                                                        child: Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                              fontSize: AppDimensionsUpdated
                                                                      .font10(
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
                                                      height: AppDimensionsUpdated
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

                                child: Container(
                                    height:
                                        AppDimensionsUpdated.height10(context) * 5.0,
                                    width:
                                        AppDimensionsUpdated.width10(context) * 15.7,
                                    margin: EdgeInsets.only(
                                        right: AppDimensionsUpdated.width10(context) *
                                            1.4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff464646),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensionsUpdated.height10(context) *
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
                                              left: AppDimensionsUpdated.height10(
                                                      context) *
                                                  0.8),
                                          child: Text(
                                            AppText().deleteText,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensionsUpdated.font10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ):Container(),
                              AnimatedScaleButton(
                                onTap: () {
                                  if(widget.newSession){
                                    addRecording();
                                  }else{
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: ViewDashboard(
                                            missed: false,
                                            name: pracName,
                                            update: true,
                                            helpfulTips: false,
                                            record: differenceInDays,
                                          )));
                                  _checkDialogDisplay(context, goalName,
                                      identity, color, pracColor, pracName);
                                  if (report == true) {
                                    activeReport(context, goalName, pracName,
                                        int.parse(color), int.parse(pracColor));
                                  }}
                                },
                                child: Container(
                                    height:
                                        AppDimensionsUpdated.height10(context) * 5.0,
                                    width:
                                        AppDimensionsUpdated.width10(context) * 21.2,
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
                                          AppDimensionsUpdated.height10(context) *
                                              5.0),
                                    ),
                                    child: Center(
                                        child: Text(
                                      AppText().savePrac,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensionsUpdated.font10(context) * 2,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ))),
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: AppDimensionsUpdated.height10(context) * 5.0),
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
      height: AppDimensionsUpdated.height10(context) * 30.3,
      padding: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 0.60),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.black,
          fontSize: AppDimensionsUpdated.font10(context) * 2.20,
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


Future<void> _checkDialogDisplay(context, String goalName, String identity, String color,
    String pracColor, String pracName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String lastShownKey = 'last_dialog_shown';
  int currentTime = DateTime.now().millisecondsSinceEpoch;

  // Check the last time the dialog was shown
  int? lastShownTime = prefs.getInt(lastShownKey);

  // 2 weeks in milliseconds
  int twoWeeksInMillis = 14 * 24 * 60 * 60 * 1000;

  // Show the dialog if it's the first time or if more than two weeks have passed
  if (lastShownTime == null || currentTime - lastShownTime >= twoWeeksInMillis) {
    __share_experience(context, goalName, identity, color,
        pracColor, pracName);
    // Update the last shown time to current time
    prefs.setInt(lastShownKey, currentTime);
  }
}

void __share_experience(context, String goalName, String identity, String color,
    String pracColor, String pracName) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensionsUpdated.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensionsUpdated.width10(context) * 39.4,
          margin: EdgeInsets.only(
              left: AppDimensionsUpdated.width10(context) * 1.0,
              right: AppDimensionsUpdated.width10(context) * 1.0,
              bottom: AppDimensionsUpdated.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensionsUpdated.height10(context) * 2.0),
              color: const Color(0xFFF5F5F5)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensionsUpdated.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: AnimatedScaleButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 2.8,
                    height: AppDimensionsUpdated.height10(context) * 2.8,
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 1.5,
                        right: AppDimensionsUpdated.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 2.1,
                    bottom: AppDimensionsUpdated.height10(context) * 2.1),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensionsUpdated.width10(context) * 8.202,
                  height: AppDimensionsUpdated.height10(context) * 11.2,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      bottom: AppDimensionsUpdated.height10(context) * 1.4),
                  child: Text(
                    'Share your experience...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: AppDimensionsUpdated.height10(context) * 0.12,
                        fontSize: AppDimensionsUpdated.font10(context) * 3,
                        // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF437296)),
                  )),
              Container(
                child: Text(
                  'True happiness comes from sharing and\nhelping others who are on the same\njourney as you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensionsUpdated.height10(context) * 0.12,
                      fontSize: AppDimensionsUpdated.font10(context) * 1.8,
                      // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 24.8,
                height: AppDimensionsUpdated.height10(context) * 24.8,
                margin:
                    EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 2.8),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: goalWidget(context, UpdatedDimensions.height10(context) * 28.8, UpdatedDimensions.width10(context) * 28.8, color, goalName, identity, UpdatedDimensions.font10(context) * 2.0, UpdatedDimensions.font10(context) * 1.6, const Color(0xff5B74A6))
                  ),
                  Align(
                    alignment: const Alignment(0.9, 1.4),
                    child: practiceWidget(context, UpdatedDimensions.height10(context) * 12.8, UpdatedDimensions.height10(context) * 12.8, pracColor, pracName, 'completed'),

                  ),
                ]),
              ),
              Container(
                  height: AppDimensionsUpdated.height10(context) * 12.5,
                  width: AppDimensionsUpdated.width10(context) * 12.5,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 1.9,
                      bottom: AppDimensionsUpdated.height10(context) * 3),
                  decoration: const BoxDecoration(
                      //color: Colors.amber,
                      image: DecorationImage(
                          image: AssetImage('assets/images/share_exp.webp'),
                          fit: BoxFit.contain)))
            ],
          )),
    ),
  );
}


emptyBox(context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(height: 10,),
      Container(
          height: AppDimensionsUpdated.height10(context) * 2.8,
          width: AppDimensionsUpdated.width10(context) * 2.8,
          padding: EdgeInsets.all(
              AppDimensionsUpdated.height10(context) * 0.6),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                  width: 1, color: Colors.white)),
          child: const ImageIcon(
            AssetImage('assets/images/edit_icon.webp'),
            color: Colors.white,
          )),
      const SizedBox(height: 5,),
      Text(
        'Update',
        textAlign: TextAlign.center, 
        style: TextStyle(
          fontSize:
          AppDimensionsUpdated.font10(context) * 1.6,
          height: AppDimensionsUpdated.height10(context) *
              0.16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: 'Laila'
      )),
    ],
  );
}
