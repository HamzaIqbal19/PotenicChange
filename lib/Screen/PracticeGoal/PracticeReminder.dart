import 'dart:convert';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/PracticeGoal/Created%20Practice.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/Widgets/routinecommitment.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../HomeScreen/HomeScreen.dart';
import '../ReviewPractice/practiceReview.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class PracticeReminder extends StatefulWidget {
  final bool comingFromEditScreen;
  const PracticeReminder({Key? key, required this.comingFromEditScreen})
      : super(key: key);

  @override
  State<PracticeReminder> createState() => _PracticeReminderState();
}

class _PracticeReminderState extends State<PracticeReminder> {
  bool radio1 = false;
  bool radio2 = false;
  bool reminderSelected = false;
  var Start_time;
  var End_time;
  var reminder;

  void _fetchPracticeDetails() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        print("---------------------------------");
        setState(() {
          reminder = response["reminder"];
          radio1 = reminder;
          radio2 = !reminder;
        });

        print('====================>$reminder');
      } else {
        print("response:$response");
      }
    }).catchError((error) {
      print("hell");
    });

    // setState(() {
    //   goalName = AdminGoal().getUserGoal();
    // });
    // print('GoalName: $goalName');
  }

  String currentDay = DateFormat('EEEE').format(DateTime.now());

  var mygoal = TextEditingController();
  var practiceName = TextEditingController();
  var practice = TextEditingController();
  var color;
  bool Loader = false;

  @override
  void initState() {
    getGoalName();
    super.initState();
    if (widget.comingFromEditScreen) {
      _fetchPracticeDetails();
    }
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getGoalName() async {
    print("hello world1224");
    final SharedPreferences prefs = await _prefs;
    var my_goal = prefs.getString("goalName");
    var practice_Name = prefs.getString('pracName');
    var goalColor = prefs.getString('goalColor');
    setState(() {
      color = goalColor;
      mygoal.text = my_goal!;
      practice.text = practice_Name!;
      practiceName.text = practice_Name;
    });
    print('=======================>$color');
  }

  Future<List<Map<String, dynamic>>> loadTimesPerDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON-encoded string from shared preferences
    String? timesPerDayJson = prefs.getString('timesPerDay');

    if (timesPerDayJson != null) {
      // Convert the string back to a list of maps
      List<dynamic> decodedList = json.decode(timesPerDayJson);

      // Cast each map in the list to Map<String, dynamic>
      List<Map<String, dynamic>> loadedList =
          decodedList.map((item) => Map<String, dynamic>.from(item)).toList();

      return loadedList;
    } else {
      // If the value is not found, return an empty list
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppDimensions.height10(context) * 5.0),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
            leading: Center(
              // alignment: Alignment.center,
              child: IconButton(
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 3,
                  height: AppDimensions.height10(context) * 3,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeScreen(),
                  //   ),
                  // );
                  // Add code for performing close action
                },
              ),
            ),
            actions: [
              Center(
                // alignment: Alignment.center,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    width: AppDimensions.height10(context) * 3.0,
                    height: AppDimensions.height10(context) * 3.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            login: true,
                          ),
                        ));

                    // showDialog<String>(
                    //   context: context,
                    //   builder: (BuildContext context) => Container(
                    //     width: AppDimensions.height10(context) * 27.0,
                    //     height: AppDimensions.height10(context) * 15.8,
                    //     child: AlertDialog(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(
                    //               AppDimensions.height10(context) * 1.4)),
                    //       contentPadding: EdgeInsets.zero,
                    //       actionsPadding: EdgeInsets.zero,
                    //       titlePadding: EdgeInsets.zero,
                    //       title: Container(
                    //         margin: const EdgeInsets.only(
                    //             top: 19, right: 16, left: 16, bottom: 0),
                    //         height: AppDimensions.height10(context) * 2.4,
                    //         width: AppDimensions.height10(context) * 23.8,
                    //         child: Text(
                    //           "Exit Practice?",
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             fontSize: AppDimensions.height10(context) * 1.7,
                    //             fontWeight: FontWeight.w600,
                    //           ),
                    //         ),
                    //       ),
                    //       content: Container(
                    //         margin: EdgeInsets.only(
                    //             bottom: AppDimensions.height10(context) * 1.9,
                    //             left: AppDimensions.height10(context) * 1.6,
                    //             right: AppDimensions.height10(context) * 1.6),
                    //         height: AppDimensions.height10(context) * 1.8,
                    //         width: AppDimensions.height10(context) * 23.8,
                    //         child: const Text(
                    //           "Are you sure you want to exit?",
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             fontSize: 13,
                    //             fontWeight: FontWeight.w400,
                    //           ),
                    //         ),
                    //       ),
                    //       actions: <Widget>[
                    //         Column(
                    //           children: [
                    //             Container(
                    //               height: 42,
                    //               width: double.infinity,
                    //               color: const Color(0xFF007AFF),
                    //               child: TextButton(
                    //                 onPressed: () {
                    //                   Navigator.pushReplacement(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                       builder: (context) => HomeScreen(
                    //                         login: true,
                    //                       ),
                    //                     ),
                    //                   );
                    //                 },
                    //                 child: const Text(
                    //                   'Yes',
                    //                   style: TextStyle(
                    //                       color: Color(0xFFFFFFFF),
                    //                       fontSize: 17,
                    //                       fontFamily: "Laila",
                    //                       fontWeight: FontWeight.w400),
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //               height: 44,
                    //               width: double.infinity,
                    //               child: TextButton(
                    //                 onPressed: () {
                    //                   Navigator.pop(context);
                    //                 },
                    //                 child: const Text(
                    //                   'No',
                    //                   style: TextStyle(
                    //                       fontSize: 17,
                    //                       fontFamily: "Laila",
                    //                       fontWeight: FontWeight.w400,
                    //                       color: Color(0xFF007AFF)),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          )),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.comingFromEditScreen
                    ? AssetImage("assets/images/GoalReviewBg.webp")
                    : AssetImage("assets/images/Categories.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.3),
                  child: Center(
                    child: Text(
                      widget.comingFromEditScreen
                          ? "View and edit mode"
                          : "Practice Creation 3/3",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.5,
                ),
                Container(
                  width: AppDimensions.height10(context) * 30,
                  child: Center(
                    child: Text(
                      mygoal.text.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 7.9,
                      height: AppDimensions.height10(context) * 7.9,
                      // color: Colors.amber,

                      // color: Colors.blue,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-3, 0),
                            child: Container(
                              width: AppDimensions.height10(context) * 7.9,
                              height: AppDimensions.height10(context) * 7.9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.amber,
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
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(1.5, 0),
                            child: Container(
                              height: AppDimensions.height10(context) * 4.9,
                              width: AppDimensions.height10(context) * 4.9,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse 158_wb.webp'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        //width: AppDimensions.height10(context) * 22,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.5),
                        child: practice.text.toString().length > 20
                            ? Text(
                                capitalizeFirstLetter(
                                  practice.text.substring(0, 19) + '...',
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF156F6D),
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                ),
                              )
                            : Text(
                                capitalizeFirstLetter(
                                  practice.text.toString(),
                                ),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF156F6D),
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                ),
                              )),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.3,
                ),
                Container(
                  height: AppDimensions.height10(context) * 3.4,
                  width: AppDimensions.height10(context) * 22.3,
                  child: Center(
                    child: Text(
                      "Your Reminders",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) - 2,
                ),
                Container(
                  height: AppDimensions.height10(context) * 8.6,
                  width: AppDimensions.height10(context) * 37.2,
                  padding: EdgeInsets.only(
                      left: AppDimensions.height10(context) * 2.1,
                      right: AppDimensions.height10(context) * 2.1),
                  child: Center(
                    child: Text(
                      "In order to build consistent behaviour, \n allow us to gently nudge you to remind you to do your practice.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontFamily: 'Laila',
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                ),
                Container(
                  height: AppDimensions.height10(context) * 17.0,
                  width: AppDimensions.height10(context) * 38.2,
                  // padding:  EdgeInsets.only(top: AppDimensions.height10(context) *2, bottom: AppDimensions.height10(context) *4.8, left: AppDimensions.height10(context) *2.0,right: AppDimensions.height10(context) *3.5),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE8776D),
                            Color(0xFFEF939D),
                            Color(0xFFD6C4C6)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(
                          AppDimensions.height10(context) * 2.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.blue,
                            width: AppDimensions.height10(context) * 25.9,
                            height: AppDimensions.height10(context) * 3.6,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 3.5,
                                    height:
                                        AppDimensions.height10(context) * 3.5,
                                    child: Image.asset(
                                      "assets/images/notifications.webp",
                                      fit: BoxFit.contain,
                                    )),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 20.4,
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    child: Text(
                                      "Yes, remind me",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Laila",
                                        color: const Color(0xFFFFFFFF),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (radio1 == true) {
                                setState(() {
                                  radio1 = false;
                                  reminderSelected = false;
                                });
                              } else if (radio1 == false) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => Container(
                                    width:
                                        AppDimensions.height10(context) * 27.0,
                                    height:
                                        AppDimensions.height10(context) * 18.8,
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              AppDimensions.height10(context) *
                                                  1.4)),
                                      contentPadding: EdgeInsets.zero,
                                      actionsPadding: EdgeInsets.zero,
                                      titlePadding: EdgeInsets.zero,
                                      title: Container(
                                        margin: const EdgeInsets.only(
                                            top: 19,
                                            right: 16,
                                            left: 16,
                                            bottom: 2),
                                        height:
                                            AppDimensions.height10(context) *
                                                4.4,
                                        width: AppDimensions.height10(context) *
                                            23.8,
                                        child: Text(
                                          "Notification permission is \nneeded",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.7,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      content: Container(
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.9,
                                            left: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            right: AppDimensions.height10(
                                                    context) *
                                                1.6),
                                        height:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        width: AppDimensions.height10(context) *
                                            23.8,
                                        child: const Text(
                                          "Please enable it in Phone’s setting",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
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
                                                  setState(() {
                                                    radio1 = true;
                                                    radio2 = false;
                                                    reminderSelected = true;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Enable Notification',
                                                  style: TextStyle(
                                                      color: Color(0xFFFFFFFF),
                                                      fontSize: 17,
                                                      fontFamily: "Laila",
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                              }
                            },
                            child: Container(
                                width: AppDimensions.height10(context) * 3.3,
                                height: AppDimensions.height10(context) * 3.3,
                                child: radio1 == true
                                    ? Image.asset(
                                        "assets/images/uncheckradio.webp",
                                        width: AppDimensions.height10(context) *
                                            3.3,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.3,
                                      )
                                    : Image.asset(
                                        "assets/images/circle.webp",
                                        width: AppDimensions.height10(context) *
                                            3.3,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.3,
                                      )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // height: AppDimensions.height10(context) * 5.1,
                            width: AppDimensions.height10(context) * 34.5,
                            padding: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 2.0,
                                left: AppDimensions.height10(context) * 1.7),
                            child: Text(
                              "We will check in with you to remind you about your practices.You would be able to customise your notifications later in your Account Settings. ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Laila",
                                height: AppDimensions.height10(context) * 0.14,
                                color: const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.height10(context) * 1.6,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.0,
                ),
                Container(
                  height: AppDimensions.height10(context) * 17.0,
                  width: AppDimensions.height10(context) * 38.2,
                  // padding:  EdgeInsets.only(top: AppDimensions.height10(context) *2, bottom: AppDimensions.height10(context) *4.8, left: AppDimensions.height10(context) *2.0,right: AppDimensions.height10(context) *3.5),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      // color: Colors.white,
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE8776D),
                            Color(0xFFEF939D),
                            Color(0xFFD6C4C6)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(
                          AppDimensions.height10(context) * 2.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.blue,
                            width: AppDimensions.height10(context) * 25.9,
                            height: AppDimensions.height10(context) * 3.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 3.5,
                                    height:
                                        AppDimensions.height10(context) * 3.5,
                                    child: Image.asset(
                                      "assets/images/notificationsoff.webp",
                                      fit: BoxFit.contain,
                                    )),
                                Container(
                                  width: AppDimensions.height10(context) * 20.4,
                                  height: AppDimensions.height10(context) * 2.4,
                                  child: Text(
                                    "No, don’t remind me",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFFFFFF),
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (radio2 == false) {
                                setState(() {
                                  radio2 = true;

                                  radio1 = false;
                                  reminderSelected = true;
                                });
                              } else {
                                setState(() {
                                  radio2 = false;
                                  reminderSelected = false;
                                });
                              }
                            },
                            child: Container(
                                width: AppDimensions.height10(context) * 3.3,
                                height: AppDimensions.height10(context) * 3.3,
                                child: radio2 == true
                                    ? Image.asset(
                                        "assets/images/uncheckradio.webp")
                                    : Image.asset("assets/images/circle.webp")),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 1.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // height: AppDimensions.height10(context) * 6.8,
                            width: AppDimensions.height10(context) * 34.5,
                            padding: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 2.0,
                                left: AppDimensions.height10(context) * 1.7),
                            child: Text(
                              "You confirm that you don’t want us to send you reminders and notifications to perform your\npractices. You can always enable and update your notification preferences later in Account Settings. ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Laila",
                                height: AppDimensions.height10(context) * 0.14,
                                color: const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.height10(context) * 1.6,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 7.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.comingFromEditScreen
                        ? Container(
                            width: AppDimensions.height10(context) * 10.0,
                            height: AppDimensions.height10(context) * 5.0,
                            decoration: reminderSelected
                                ? BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color(0xffFA9934)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                  )
                                : BoxDecoration(
                                    // color: Color(0xFFFF7D50),
                                    border: Border.all(
                                        color: const Color(0xff282828)),
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                  ),
                            child: AnimatedScaleButton(
                              onTap: () {
                                //   signupSheet(context, "Sign up / login", "login");
                              },
                              child: Center(
                                  child: Text(
                                "Reset",
                                style: TextStyle(
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w600,
                                    color: reminderSelected
                                        ? Color(0xffFA9934)
                                        : Color(0xff282828),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8),
                              )),
                            ))
                        : Container(
                            // color: Colors.blue,
                            width: AppDimensions.height10(context) * 5.0,
                            height: AppDimensions.height10(context) * 5.0,
                            child: Image.asset(
                              "assets/images/Moreactions.webp",
                              fit: BoxFit.contain,
                            )),
                    Stack(alignment: Alignment.center, children: [
                      AnimatedScaleButton(
                        onTap: () async {
                          if (widget.comingFromEditScreen) {
                            if (reminderSelected == true) {
                              setState(() {
                                Loader =
                                    true; // Show loader when the API call starts
                              });

                              List<Map<String, dynamic>> loadedTimesPerDay =
                                  await loadTimesPerDay();
                              final SharedPreferences prefs = await _prefs;

                              var reminder =
                                  prefs.setBool('pracReminder', radio1);
                              //add Id
                              PracticeGoalApi()
                                  .userAddPractice(
                                practiceName.text.toString(),
                                radio1,
                                loadedTimesPerDay,
                              )
                                  .then((response) {
                                print('$response');
                                if (response == true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Practice updated Successfully!!")));
                                  print('========Done');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PracticeReview(),
                                      ));
                                } else if (response == false) {
                                  print('Api call failed');
                                }
                              }).catchError((error) {
                                print('===>Error');
                              }).whenComplete(() {
                                setState(() {
                                  Loader =
                                      false; // Hide loader when the API call completes
                                });
                              });
                            }
                          } else {
                            if (reminderSelected == true) {
                              setState(() {
                                Loader =
                                    true; // Show loader when the API call starts
                              });

                              List<Map<String, dynamic>> loadedTimesPerDay =
                                  await loadTimesPerDay();
                              final SharedPreferences prefs = await _prefs;

                              var reminder =
                                  prefs.setBool('pracReminder', radio1);
                              //add Id
                              PracticeGoalApi()
                                  .userAddPractice(
                                practiceName.text.toString(),
                                radio1,
                                loadedTimesPerDay,
                              )
                                  .then((response) {
                                print('$response');
                                if (response == true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Practice Added Successfully!!")));
                                  print('========Done');
                                  Navigator.pushReplacement(
                                    context,
                                    FadePageRoute2(
                                      true,
                                      exitPage: PracticeReminder(
                                        comingFromEditScreen: false,
                                      ),
                                      enterPage: const PracticeFinished(),
                                    ),
                                  );
                                } else if (response == false) {
                                  print('Api call failed');
                                }
                              }).catchError((error) {
                                print('===>Error');
                              }).whenComplete(() {
                                setState(() {
                                  Loader =
                                      false; // Hide loader when the API call completes
                                });
                              });
                            }
                          }
                        },
                        child: Container(
                          height: AppDimensions.height10(context) * 5,
                          width: AppDimensions.height10(context) * 31.3,
                          decoration: BoxDecoration(
                            // color: Color(0xFFFF7D50),
                            border: Border.all(color: Colors.transparent),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: reminderSelected
                                    ? [
                                        const Color(0xFFFCC10D),
                                        const Color(0xFFFDA210)
                                      ]
                                    : [
                                        const Color(0xFFFCC10D)
                                            .withOpacity(0.5),
                                        const Color(0xFFFDA210).withOpacity(0.5)
                                      ]),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Center(
                            child: Loader
                                ? SpinKitThreeBounce(
                                    color: const Color(0xFF8C648A),
                                    // delay: Duration(milliseconds: 0),
                                    size: AppDimensions.height10(context) * 3.5,
                                  )
                                : Text(
                                    widget.comingFromEditScreen
                                        ? "Save"
                                        : "Finished",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Laila",
                                      // height: AppDimensions.height10(context) *0.1,
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.5,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          )
        ],
      ),
    );
  }
}
