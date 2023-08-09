import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/PracticeGoal/Create%20Practice.dart';
import 'package:potenic_app/Screen/PracticeGoal/Created%20Practice.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReview.dart';
import 'package:potenic_app/Widgets/TimeWidget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading3.dart';

import 'package:potenic_app/Widgets/routinecommitment.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Practice.dart';
import '../PracticeGoal/PracticeName.dart';
import '../PracticeGoal/PracticeReminder.dart';

class PracticeReview extends StatefulWidget {
  const PracticeReview({Key? key}) : super(key: key);

  @override
  State<PracticeReview> createState() => _PracticeReviewState();
}

bool color1 = false;
bool color2 = false;
bool color3 = false;
bool color4 = false;
bool color5 = false;
bool color6 = false;

class _PracticeReviewState extends State<PracticeReview> {
  bool Loading = true;

  Future<List<String>>? _goalNamesFuture;
  var pracName;
  String goalName = '';
  var reminder;
  var starttime;
  var color;
  var pracColor;
  var visualize;

  @override
  void initState() {
    //  getGoalDetail();
    super.initState();
    _fetchGoalNames();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // getGoalDetail() async {
  //   final SharedPreferences prefs = await _prefs;
  //   var my_goal = prefs.getString("goalName");

  //   setState(() {
  //     goalName.text = my_goal!;
  //   });
  // }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          goalName = response["name"];
          color = response["color"];
        });
        _fetchPracticeDetails();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
      print("error");
    });
  }

  void _fetchPracticeDetails() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        print("---------------------------------");
        setState(() {
          pracName = response["name"];
          reminder = response["reminder"];
          pracColor = response["color"];
          starttime = response["schedule"][0]['time1'];
        });
        loadData();
        print("---------------------------------");
        print("response123:$pracName");
        print('====================>$reminder');
      } else {
        loadData();
        print("response:$response");
      }
    }).catchError((error) {
      loadData();
      print("hell");
    });

    // setState(() {
    //   goalName = AdminGoal().getUserGoal();
    // });
    // print('GoalName: $goalName');
  }

  @override
  Widget build(BuildContext context) {
    print("Reminder========> $reminder");
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          // title: Text("Review",style: TextStyle(color: Color(0xFF5B74A6),fontWeight: FontWeight.w600,fontSize: AppDimensions.height10(context) *2.0),),
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
                Navigator.push(
                  context,
                  FadePageRoute(
                    page: const PracticeFinished(),
                  ),
                );

                //Navigator.pop(context);
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
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/GoalReviewBg.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Loading == false
                ? SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 5.2),
                          child: Center(
                            child: Text(
                              "Review",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF5B74A6),
                                fontSize: AppDimensions.height10(context) * 1.8,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 0.0,
                        ),
                        SizedBox(
                          width: AppDimensions.height10(context) * 30,
                          child: Center(
                            child: Text(
                              goalName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF5B74A6),
                                fontSize: AppDimensions.height10(context) * 2.2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context),
                        ),
                        Container(
                          //width: AppDimensions.height10(context) * 2.0,
                          height: AppDimensions.height10(context) * 9.3,
                          // color: Colors.amber,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.6),
                          // color: Colors.blue,
                          child: Stack(
                            children: [
                              Align(
                                alignment: const Alignment(-0.48, -0.3),
                                child: Container(
                                  width: AppDimensions.height10(context) * 6.56,
                                  height:
                                      AppDimensions.height10(context) * 6.56,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // color: Colors.amber,
                                    image: DecorationImage(
                                        image: AssetImage('$color' == '1'
                                            ? "assets/images/red_gradient.webp"
                                            : '$color' == '2'
                                                ? 'assets/images/orange_moon.webp'
                                                : '$color' == '3'
                                                    ? "assets/images/lightGrey_gradient.webp"
                                                    : '$color' == '4'
                                                        ? "assets/images/lightBlue_gradient.webp"
                                                        : '$color' == '5'
                                                            ? "assets/images/medBlue_gradient.webp"
                                                            : '$color' == '6'
                                                                ? "assets/images/Blue_gradient.webp"
                                                                : 'assets/images/orange_moon.webp'),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(-0.355, -0.2),
                                child: Container(
                                  height: AppDimensions.height10(context) * 4.1,
                                  width: AppDimensions.height10(context) * 4.1,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage('$pracColor' ==
                                                      '1' ||
                                                  color1 == true
                                              ? "assets/images/Ellipse orange_wb.webp"
                                              : '$pracColor' == '2' ||
                                                      color2 == true
                                                  ? 'assets/images/Ellipse 158_wb.webp'
                                                  : '$pracColor' == '3' ||
                                                          color3 == true
                                                      ? "assets/images/Ellipse 157_wb.webp"
                                                      : '$pracColor' == '4' ||
                                                              color4 == true
                                                          ? "assets/images/Ellipse light-blue_wb.webp"
                                                          : '$pracColor' ==
                                                                      '5' ||
                                                                  color5 == true
                                                              ? "assets/images/Ellipse blue_wb.webp"
                                                              : 'assets/images/Ellipse 158_wb.webp'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0.55, -0.28),
                                child: SizedBox(
                                  width: AppDimensions.height10(context) * 20.6,
                                  height: AppDimensions.height10(context) * 2.4,
                                  child: Text(
                                    pracName,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: const Color(0xff156F6D),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 1.6,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "Practice Details",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF437296),
                                fontSize: AppDimensions.height10(context) * 3.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 0.7,
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 2.2,
                          width: AppDimensions.height10(context) * 23.9,
                          child: Center(
                            child: Text(
                              "Review your summary here.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF5B74A6)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 3.4,
                        ),
                        Container(
                            width: AppDimensions.height10(context) * 38.2,
                            height: AppDimensions.height10(context) * 40.6,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFBFBFB),
                                border: Border.all(
                                    color: const Color(0xFFFBFBFB),
                                    width:
                                        AppDimensions.height10(context) * 0.2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      AppDimensions.height10(context) * 39.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.7,
                                            width: AppDimensions.height10(
                                                    context) *
                                                28.0,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    2.5),

                                            // color: Colors.blue,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/reviewsearch.webp"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),

                                          // SizedBox(width: ),

                                          AnimatedScaleButton(
                                            onTap: () {
                                              print("new");
                                              Navigator.push(
                                                context,
                                                FadePageRoute3(
                                                  exitPage: PracticeReview(),
                                                  enterPage: PracticeName(
                                                    comingFromEditScreen: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.0,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  3.0,

                                              // color: Colors.blue,
                                              margin: EdgeInsets.only(
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    1.5,
                                              ),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/btnedit.webp"),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.5,
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        width: AppDimensions.height10(context) *
                                            23.9,
                                        child: Center(
                                          child: Text(
                                            "Your Practice Name",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF5B74A6)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.3,
                                      ),
                                      inner_text1("$pracName"),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        width: AppDimensions.height10(context) *
                                            23.9,
                                        child: Center(
                                          child: Text(
                                            "Select colour",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF5B74A6)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.6,
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                12.6,
                                        width: AppDimensions.height10(context) *
                                            22.1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  6.0,
                                              child: Row(
                                                children: [
                                                  AnimatedScaleButton(
                                                    onTap: () {
                                                      setState(() {
                                                        color1 = true;
                                                        color2 = false;
                                                        color3 = false;
                                                        color4 = false;
                                                        color5 = false;
                                                        color6 = false;
                                                      });
                                                      if (color1 == true) {
                                                        PracticeGoalApi()
                                                            .updateUserPracticeColor(
                                                                '1')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                            print("Success");
                                                          } else {
                                                            print("Failure");
                                                          }
                                                        }).catchError((error) {
                                                          print("error");
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      padding: EdgeInsets.all(
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.2),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: color1
                                                                ? const Color(
                                                                    0xFFE69662)
                                                                : Colors
                                                                    .transparent,
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        //   color: Colors.blue,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/Ellipse orange_wb.webp"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                  ),
                                                  AnimatedScaleButton(
                                                    onTap: () {
                                                      setState(() {
                                                        color1 = false;
                                                        color2 = true;
                                                        color3 = false;
                                                        color4 = false;
                                                        color5 = false;
                                                        color6 = false;
                                                      });
                                                      if (color2 == true) {
                                                        //  #FFFEE8, #F9B410
                                                        PracticeGoalApi()
                                                            .updateUserPracticeColor(
                                                                '2')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                            print("Success");
                                                          } else {
                                                            print("Failure");
                                                          }
                                                        }).catchError((error) {
                                                          print("error");
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      padding: EdgeInsets.all(
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.2),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: color2
                                                                ? const Color(
                                                                    0xFFE69662)
                                                                : Colors
                                                                    .transparent,
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        //   color: Colors.blue,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/Ellipse 158_wb.webp"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                  ),
                                                  AnimatedScaleButton(
                                                    onTap: () {
                                                      setState(() {
                                                        color1 = false;
                                                        color2 = false;
                                                        color3 = true;
                                                        color4 = false;
                                                        color5 = false;
                                                        color6 = false;
                                                      });
                                                      if (color3 == true) {
                                                        // #FFFFFF, #DEDEDE
                                                        PracticeGoalApi()
                                                            .updateUserPracticeColor(
                                                                '3')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                            print("Success");
                                                          } else {
                                                            print("Failure");
                                                          }
                                                        }).catchError((error) {
                                                          print("error");
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      padding: EdgeInsets.all(
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.2),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: color3
                                                                ? const Color(
                                                                    0xFFE69662)
                                                                : Colors
                                                                    .transparent,
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        //   color: Colors.blue,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/Ellipse 157_wb.webp"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  6.0,
                                              child: Row(
                                                children: [
                                                  AnimatedScaleButton(
                                                    onTap: () {
                                                      setState(() {
                                                        color1 = false;
                                                        color2 = false;
                                                        color3 = false;
                                                        color4 = true;
                                                        color5 = false;
                                                        color6 = false;
                                                      });
                                                      if (color4 == true) {
                                                        // #FFFFFF, #CAD2F8
                                                        PracticeGoalApi()
                                                            .updateUserPracticeColor(
                                                                '4')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                            print("Success");
                                                          } else {
                                                            print("Failure");
                                                          }
                                                        }).catchError((error) {
                                                          print("error");
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      padding: EdgeInsets.all(
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.2),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: color4
                                                                ? const Color(
                                                                    0xFFE69662)
                                                                : Colors
                                                                    .transparent,
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        //   color: Colors.blue,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/Ellipse light-blue_wb.webp"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                  ),
                                                  AnimatedScaleButton(
                                                    onTap: () {
                                                      setState(() {
                                                        color1 = false;
                                                        color2 = false;
                                                        color3 = false;
                                                        color4 = false;
                                                        color5 = true;
                                                        color6 = false;
                                                      });
                                                      if (color5 == true) {
                                                        // #96AEE4, #315291
                                                        PracticeGoalApi()
                                                            .updateUserPracticeColor(
                                                                '5')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                            print("Success");
                                                          } else {
                                                            print("Failure");
                                                          }
                                                        }).catchError((error) {
                                                          print("error");
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      padding: EdgeInsets.all(
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.2),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: color5
                                                                ? const Color(
                                                                    0xFFE69662)
                                                                : Colors
                                                                    .transparent,
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        //   color: Colors.blue,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/Ellipse blue_wb.webp"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: AppDimensions.height10(context) * 2.5,
                        ),
                        Container(
                            width: AppDimensions.height10(context) * 38.2,
                            // height: AppDimensions.height10(context) * 91.3,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFBFBFB),
                                border: Border.all(
                                    color: const Color(0xFFFBFBFB),
                                    width:
                                        AppDimensions.height10(context) * 0.2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // height:
                                  //     AppDimensions.height10(context) * 90.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.7,
                                            width: AppDimensions.height10(
                                                    context) *
                                                28.0,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    2.5),

                                            // color: Colors.blue,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/reviewsearch.webp"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(width: ),
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.0,
                                            width: AppDimensions.height10(
                                                    context) *
                                                3.0,

                                            // color: Colors.blue,
                                            margin: EdgeInsets.only(
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.5,
                                            ),
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/btnedit.webp"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.5,
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        width: AppDimensions.height10(context) *
                                            23.9,
                                        child: Center(
                                          child: Text(
                                            "Your routine commitment",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF5B74A6)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.9,
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.5,
                                        width: AppDimensions.height10(context) *
                                            6.1,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF437296),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    AppDimensions.height10(
                                                            context) *
                                                        0.5))),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.5,
                                      ),
                                      SingleChildScrollView(
                                        // height:
                                        //     AppDimensions.height10(context) *
                                        //         89.5,
                                        child: routinecommitment(),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.6,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: AppDimensions.height10(context) * 3.1,
                        ),
                        Container(
                            width: AppDimensions.height10(context) * 38.2,
                            height: AppDimensions.height10(context) * 29.9,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFBFBFB),
                                border: Border.all(
                                    color: const Color(0xFFFBFBFB),
                                    width:
                                        AppDimensions.height10(context) * 0.2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  //height: AppDimensions.height10(context) * 29,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.7,
                                            width: AppDimensions.height10(
                                                    context) *
                                                28.0,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    2.5),

                                            // color: Colors.blue,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/reviewsearch.webp"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(width: ),

                                          AnimatedScaleButton(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                FadePageRoute3(
                                                  exitPage: PracticeReview(),
                                                  enterPage: PracticeReminder(
                                                    comingFromEditScreen: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.0,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  3.0,

                                              // color: Colors.blue,
                                              margin: EdgeInsets.only(
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    1.5,
                                              ),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/btnedit.webp"),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.5,
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        width: AppDimensions.height10(context) *
                                            38.4,
                                        child: Center(
                                          child: Text(
                                            "Your Reminders",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF5B74A6)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.3,
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                17.0,
                                        width: AppDimensions.height10(context) *
                                            36.4,
                                        // padding:  EdgeInsets.only(top: AppDimensions.height10(context)*2, bottom: AppDimensions.height10(context)*4.8, left: AppDimensions.height10(context)*2.0,right: AppDimensions.height10(context)*3.5),
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
                                            border: Border.all(
                                                color: Colors.white, width: 0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  2.4,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  // color: Colors.blue,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      25.9,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          3.6,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              3.5,
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              3.5,
                                                          child: Image.asset(
                                                            reminder
                                                                ? "assets/images/notifications.webp"
                                                                : "assets/images/notificationsoff.webp",
                                                            fit: BoxFit.contain,
                                                          )),
                                                      SizedBox(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            20.4,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.4,
                                                        child: Text(
                                                          reminder
                                                              ? "Yes, remind me"
                                                              : "No, don’t remind me",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily: "Laila",
                                                            color: const Color(
                                                                0xFFFFFFFF),
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SizedBox(
                                                      // color: Colors.red,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.3,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.3,
                                                      child: Image.asset(
                                                          // reminder ?
                                                          "assets/images/uncheckradio.webp"

                                                          //  : "assets/images/circle.webp"

                                                          )),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          5.1,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      34.5,
                                                  padding: EdgeInsets.only(
                                                      right: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.0,
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.7),
                                                  child: Text(
                                                    "We will check in with you to remind you about your practices. You would be able to customise your notifications later in your Account Settings. ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily:
                                                          "Laila-Regular",
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.4,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        MediaQuery.of(context).viewInsets.bottom == 0
                            ? SizedBox(
                                height: AppDimensions.height10(context) * 7.2,
                              )
                            : SizedBox(
                                height: AppDimensions.height10(context) * 5.0,
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                // color: Colors.blue,
                                width: AppDimensions.height10(context) * 5.0,
                                height: AppDimensions.height10(context) * 5.0,
                                child: Image.asset(
                                  "assets/images/Moreactions.webp",
                                  fit: BoxFit.contain,
                                )),
                            AnimatedScaleButton(
                              onTap: () => showAnimatedDialog(
                                animationType: DialogTransitionType.fadeScale,
                                curve: Curves.easeInOut,
                                duration: const Duration(seconds: 1),
                                context: context,
                                builder: (BuildContext context) => SizedBox(
                                  width: AppDimensions.height10(context) * 27.0,
                                  height:
                                      AppDimensions.height10(context) * 24.6,
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                1.4)),
                                    actionsPadding: const EdgeInsets.all(0.0),
                                    contentPadding: const EdgeInsets.all(0.0),
                                    titlePadding: const EdgeInsets.all(0.0),
                                    title: Container(
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.9,
                                          right:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          left:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  0),
                                      width: AppDimensions.height10(context) *
                                          23.8,
                                      child: Text.rich(
                                        style: TextStyle(
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.14),
                                        textAlign: TextAlign.center,
                                        TextSpan(
                                          text: 'Are you sure you want\n to ',
                                          style: TextStyle(
                                            color: const Color(0xFF000000),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.9,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'delete ',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF000000),
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.9,
                                                  fontWeight: FontWeight.w700,
                                                )),

                                            TextSpan(
                                                text: 'this practice?',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF000000),
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.9,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                            // can add more TextSpans here...

                                            // can add more TextSpans here...

                                            // can add more TextSpans here...
                                          ],
                                        ),
                                      ),
                                    ),
                                    content: Container(
                                      // color:Colors.red,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  1.9,
                                          left:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          right:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          top: AppDimensions.height10(context) *
                                              0.5),

                                      width: AppDimensions.height10(context) *
                                          23.8,
                                      child: Text(
                                        "By clicking 'Yes' you confirm that this\ngoal will be deleted and all your data\nthat relates to this practice won't be\nrecoverable. ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                          fontFamily: "Laila",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                4.4,
                                            width: double.infinity,
                                            color: const Color.fromRGBO(
                                                0, 122, 255, 1),
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.7,
                                                    fontFamily: "Laila",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                4.4,
                                            width: AppDimensions.height10(
                                                    context) *
                                                27.0,
                                            child: TextButton(
                                              onPressed: () {
                                                PracticeGoalApi()
                                                    .deleteUserPractice()
                                                    .then((response) {
                                                  if (response == true) {
                                                    print(
                                                        "==================>Successfully deleted");
                                                  }
                                                });
                                                Navigator.pushReplacement(
                                                    context,
                                                    FadePageRoute(
                                                        page:
                                                            const CreatePractice()));
                                              },
                                              child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontFamily: "Laila",
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromRGBO(
                                                      0, 122, 255, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Container(
                                height: AppDimensions.height10(context) * 5,
                                width: AppDimensions.height10(context) * 31.3,
                                decoration: BoxDecoration(
                                  // color: Color(0xFFFF7D50),
                                  border: Border.all(color: Colors.transparent),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF464646),
                                        Color(0xFF464646)
                                      ]),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/bin.webp",
                                      height:
                                          AppDimensions.height10(context) * 1.8,
                                      width:
                                          AppDimensions.height10(context) * 1.4,
                                    ),
                                    SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 1.3,
                                    ),
                                    Container(
                                      child: Text(
                                        "Delete Practice",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 2.5,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom))
                      ],
                    ),
                  )
                : const Center(
                    child: SpinKitFadingCircle(
                      color: Color(0xFFB1B8FF),
                      size: 80,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class inner_text1 extends StatefulWidget {
  final String circle_text;

  inner_text1(this.circle_text, {super.key});

  @override
  State<inner_text1> createState() => _inner_text1State();
}

class _inner_text1State extends State<inner_text1> {
  final TextEditingController body_text = TextEditingController();

  final TextEditingController heading_text = TextEditingController();

  late FocusNode _focusNode;

  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocus);
  }

  void _onFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10(context) * 8.9,
      width: AppDimensions.height10(context) * 36.0,
      padding: EdgeInsets.only(
          top: AppDimensions.height10(context) * 2,
          bottom: 1,
          left: AppDimensions.height10(context),
          right: AppDimensions.height10(context) * 6.0),
      decoration: BoxDecoration(
          gradient: _focusNode.hasFocus
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEFBEB2), Color(0xFFFEAA897)])
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEECDC5), Color(0xFFF6E0DB)]),
          // color: Colors.white,

          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.height10(context) * 1.8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: AppDimensions.height10(context) * 3.6,
              width: AppDimensions.height10(context) * 26.9,
              child: Text(
                  overflow: TextOverflow.ellipsis,
                  "${widget.circle_text}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: _focusNode.hasFocus
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFFFFFFFF),
                    fontSize: AppDimensions.height10(context) * 2.2,
                  ))),
        ],
      ),
    );
  }
}
