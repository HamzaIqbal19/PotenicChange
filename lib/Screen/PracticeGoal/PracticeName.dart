// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:potenic_app/Screen/PracticeGoal/PracticeRoutine.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive_5goals.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/goalAndPracticeName.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Practice.dart';
import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading.dart';
import '../../Widgets/fading2.dart';
import '../HomeScreen/HomeScreen.dart';
import '../ReviewPractice/practiceReview.dart';

class PracticeName extends StatefulWidget {
  // final String message;

  final bool comingFromEditScreen;

  const PracticeName({super.key, required this.comingFromEditScreen});

  @override
  State<PracticeName> createState() => _PracticeNameState();
}

String capitalizeFirstLetter(String text) {
  if (text == null || text.isEmpty) {
    return '';
  }
  return text[0].toUpperCase() + text.substring(1);
}

class _PracticeNameState extends State<PracticeName> {
  var mygoal;
  var practiceName = TextEditingController();
  var practice = TextEditingController();
  var color;
  bool updated = false;
  String route = '';

  @override
  void initState() {
    getGoalName();
    super.initState();
    getRoute();
  }

  void _fetchPracticeDetails() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        practiceName.text = response["name"];

        // mapItems(schedule, updates);
      } else {}
    }).catchError((error) {
      print("hell");
    });
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goal_route = prefs.getString('goal_route');
    setState(() {
      route = goal_route!;
    });
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getGoalName() async {
    final SharedPreferences prefs = await _prefs;
    var my_goal = prefs.getString("goalName");
    var practice_Name = prefs.getString('pracName');
    var goalColor = prefs.getString('goalColor');
    setState(() {
      color = goalColor;
      mygoal = my_goal!;
      practice.text = practice_Name!;
      practiceName.text = capitalizeFirstLetter(practice_Name);
    });
  }

  bool showContainer = false;
  double swipeOffset = 0.0;

  Timer? _timer;

  void startTimer() {
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        showContainer = false;
      });
      Timer(const Duration(seconds: 1), () {
        Navigator.push(
            context, FadePageRouteReverse(page: const PracticeReview()));
      });
    });
  }

  void stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel(); // Cancel the timer if it's active
    }
  }

  @override
  void dispose() {
    stopTimer(); // Make sure to cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(AppDimensions.height10(context) * 5.0),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: Center(
                // alignment: Alignment.center,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Back.webp',
                    //width: AppDimensions.width10(context) * 3,
                    height: AppDimensions.height10(context) * 3,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    widget.comingFromEditScreen
                        ? updated == false
                            ? showAnimatedDialog(
                                animationType: DialogTransitionType.fadeScale,
                                curve: Curves.easeInOut,
                                duration: const Duration(seconds: 1),
                                context: context,
                                builder: (BuildContext context) =>
                                    const pop_up_practices())
                            : Navigator.push(
                                context,
                                FadePageRouteReverse(
                                    page: const PracticeReview()))
                        : Navigator.pop(context);
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
                  child: widget.comingFromEditScreen
                      ? Container()
                      : IconButton(
                          icon: Image.asset(
                            'assets/images/Close.webp',
                            //width: AppDimensions.width10(context) * 3.0,
                            height: AppDimensions.height10(context) * 3.0,
                            fit: BoxFit.contain,
                          ),
                          onPressed: () async {
                            if (widget.comingFromEditScreen == true) {
                              Navigator.pop(context);
                            } else {
                              showAnimatedDialog(
                                animationType: DialogTransitionType.fadeScale,
                                curve: Curves.easeInOut,
                                duration: const Duration(seconds: 1),
                                context: context,
                                builder: (BuildContext context) => Container(
                                  width: AppDimensions.width10(context) * 27.0,
                                  height:
                                      AppDimensions.height10(context) * 18.2,
                                  child: AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    actionsPadding: EdgeInsets.zero,
                                    titlePadding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                1.4)),
                                    title: Container(
                                      margin: const EdgeInsets.only(
                                          top: 19,
                                          right: 16,
                                          left: 16,
                                          bottom: 2),
                                      height:
                                          AppDimensions.height10(context) * 2.2,
                                      width:
                                          AppDimensions.width10(context) * 23.8,
                                      child: Text(
                                        "Are you sure?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: const Color(0xFF000000),
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    content: Container(
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  1.9,
                                          left: AppDimensions.width10(context) *
                                              1.6,
                                          right:
                                              AppDimensions.width10(context) *
                                                  1.6),
                                      height:
                                          AppDimensions.height10(context) * 3.2,
                                      width:
                                          AppDimensions.width10(context) * 23.8,
                                      child: Text(
                                        "If you close it now, you will lose all your progress.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height:
                                              AppDimensions.height10(context) *
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
                                              onPressed: () async {
                                                if (route == 'view_all_goals') {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      FadePageRouteReverse(
                                                          page:
                                                              const view_all_goals_menu()));
                                                } else if (route ==
                                                    'view_all_goals_2') {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      FadePageRouteReverse(
                                                          page:
                                                              const multiple_goal_inactive()));
                                                } else {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    FadePageRouteReverse(
                                                      page: const HomeScreen(
                                                        login: true,
                                                      ),
                                                    ),
                                                  );

                                                  final SharedPreferences
                                                      prefs = await _prefs;

                                                  await prefs.remove('route');
                                                }
                                              },
                                              child: const Text(
                                                'Close',
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
                            }

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
              ],
            )),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.comingFromEditScreen
                      ? const AssetImage("assets/images/GoalReviewBg.webp")
                      : const AssetImage("assets/images/Categories.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              reverse: true,
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 5.2),
                    child: Center(
                      child: Text(
                        widget.comingFromEditScreen
                            ? "View and edit mode"
                            : "Practice Creation 2/3",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: widget.comingFromEditScreen
                              ? const Color(0xff437296)
                              : Colors.white,
                          fontSize: AppDimensions.font10(context) * 1.8,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.5,
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 30,
                    child: Center(
                      child: Text(
                        mygoal.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: widget.comingFromEditScreen
                              ? const Color(0xff437296)
                              : Colors.white,
                          fontSize: AppDimensions.font10(context) * 2.2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context),
                  ),
                  goalAndPractice(context,
                      color,2,
                      practice),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       width: AppDimensions.width10(context) * 7.9,
                  //       height: AppDimensions.height10(context) * 7.9,
                  //       // color: Colors.amber,
                  //
                  //       // color: Colors.blue,
                  //       child: Stack(
                  //         children: [
                  //           Align(
                  //             alignment: const Alignment(-3, 0),
                  //             child: Container(
                  //               width: AppDimensions.width10(context) * 7.9,
                  //               height: AppDimensions.height10(context) * 7.9,
                  //               decoration: BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //                 // color: Colors.amber,
                  //                 image: DecorationImage(
                  //                     image: AssetImage(color == '1'
                  //                         ? "assets/images/red_gradient.webp"
                  //                         : color == '2'
                  //                             ? 'assets/images/orange_moon.webp'
                  //                             : color == '3'
                  //                                 ? "assets/images/lightGrey_gradient.webp"
                  //                                 : color == '4'
                  //                                     ? "assets/images/lightBlue_gradient.webp"
                  //                                     : color == '5'
                  //                                         ? "assets/images/medBlue_gradient.webp"
                  //                                         : color == '6'
                  //                                             ? "assets/images/Blue_gradient.webp"
                  //                                             : 'assets/images/orange_moon.webp'),
                  //                     fit: BoxFit.contain),
                  //               ),
                  //             ),
                  //           ),
                  //           Align(
                  //             alignment: const Alignment(1.5, 0),
                  //             child: Container(
                  //               height: AppDimensions.height10(context) * 4.9,
                  //               width: AppDimensions.width10(context) * 4.9,
                  //               decoration: const BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   image: DecorationImage(
                  //                       image: AssetImage(
                  //                           'assets/images/Ellipse 158_wb.webp'),
                  //                       fit: BoxFit.cover)),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Container(
                  //         //width: AppDimensions.width10(context) * 22,
                  //         margin: EdgeInsets.only(
                  //             left: AppDimensions.width10(context) * 1.5),
                  //         child: practice.text.toString().length > 20
                  //             ? Text(
                  //                 capitalizeFirstLetter(
                  //                   practice.text.substring(0, 19) + '...',
                  //                 ),
                  //                 textAlign: TextAlign.center,
                  //                 overflow: TextOverflow.ellipsis,
                  //                 style: TextStyle(
                  //                   fontWeight: FontWeight.w600,
                  //                   color: widget.comingFromEditScreen
                  //                       ? const Color(0xff437296)
                  //                       : const Color(0xFF156F6D),
                  //                   fontSize:
                  //                       AppDimensions.font10(context) * 2.0,
                  //                 ),
                  //               )
                  //             : Text(
                  //                 capitalizeFirstLetter(
                  //                   practice.text.toString(),
                  //                 ),
                  //                 style: TextStyle(
                  //                   fontWeight: FontWeight.w600,
                  //                   color: const Color(0xFF156F6D),
                  //                   fontSize:
                  //                       AppDimensions.font10(context) * 2.0,
                  //                 ),
                  //               )),
                  //   ],
                  // ),
                  //
                  SizedBox(
                    height: AppDimensions.height10(context) * 7.1,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Practice Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: widget.comingFromEditScreen
                              ? const Color(0xff437296)
                              : Colors.white,
                          fontSize: AppDimensions.font10(context) * 2.8,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.8,
                  ),
                  Container(
                    height: AppDimensions.height10(context) * 2.2,
                    width: AppDimensions.width10(context) * 28.4,
                    child: Center(
                      child: Text(
                        "Enter the name of your practice",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.8,
                            fontWeight: FontWeight.w600,
                            color: widget.comingFromEditScreen
                                ? const Color(0xff437296)
                                : const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 2.3,
                  ),
                  Container(
                    height: AppDimensions.height10(context) * 10.5,
                    width: AppDimensions.width10(context) * 36.0,
                    padding: EdgeInsets.only(
                      left: AppDimensions.width10(context) * 2.0,
                      top: AppDimensions.height10(context) * 1.0,
                      right: AppDimensions.width10(context) * 0.5,
                      bottom: AppDimensions.height10(context) * 0.5,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(
                            AppDimensions.height10(context) * 1.8))),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        maxLength: 80,
                        controller: practiceName,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2.4,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFA9934)),
                        decoration: InputDecoration(
                            counterStyle: const TextStyle(
                              height: double.minPositive,
                            ),
                            contentPadding: EdgeInsets.zero,
                            // hintText: "${practice.text.toString()}",
                            hintStyle: TextStyle(
                                fontSize: AppDimensions.font10(context) * 2.4,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFA9934)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)))),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.5,
                  ),
                  Container(
                    // width: AppDimensions.width10(context)*12.3,
                    width: AppDimensions.width10(context) * 34.7,

                    margin: EdgeInsets.only(
                        right: AppDimensions.width10(context) * 1.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Character count:",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: AppDimensions.font10(context) * 1.4,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "80",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: AppDimensions.font10(context) * 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.1,
                  ),
                  Container(
                    height: AppDimensions.height10(context) * 4.2,
                    width: AppDimensions.width10(context) * 34.7,
                    margin: EdgeInsets.only(
                        right: AppDimensions.width10(context) * 1.3),
                    child: Center(
                      child: Text(
                        "You can change the name of your practice later by going into your Dashboard.  ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 1.6,
                        ),
                      ),
                    ),
                  ),
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? SizedBox(
                          height: AppDimensions.height10(context) * 26.3,
                        )
                      : SizedBox(
                          height: AppDimensions.height10(context) * 11.2,
                        ),
                  updated
                      ? GestureDetector(
                          onPanUpdate: (details) {
                            setState(() {
                              swipeOffset += details.delta.dx;
                            });

                            if (swipeOffset.abs() >=
                                MediaQuery.of(context).size.width / 3.0) {
                              setState(() {
                                showContainer = false;
                              });
                            }
                          },
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 700),
                            opacity: showContainer ? 1.0 : 0.0,
                            child: Transform.translate(
                              offset: Offset(swipeOffset, 0.0),
                              child: Container(
                                width: AppDimensions.width10(context) * 38.259,
                                height: AppDimensions.height10(context) * 9.707,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 2.0),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFFD4B7B9),
                                          Color(0xFF91698C)
                                        ])),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: AppDimensions.width10(context) *
                                              1.261),
                                      width: AppDimensions.width10(context) *
                                          4.437,
                                      height: AppDimensions.height10(context) *
                                          4.437,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/circle_tick.webp'))),
                                    ),
                                    Container(
                                      //width: AppDimensions.width10(context) * 6.9,
                                      height:
                                          AppDimensions.height10(context) * 3.6,
                                      margin: EdgeInsets.only(
                                          left: AppDimensions.width10(context) *
                                              1.232),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:
                                                AppDimensions.width10(context) *
                                                    4.6,
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            //   color: Colors.amber,
                                            child: Text(
                                              'Updates saved',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.3,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                AppDimensions.width10(context) *
                                                    16.9,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.2,
                                            child: Text(
                                              'Practice Name',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    AnimatedScaleButton(
                                      onTap: () {
                                        setState(() {
                                          updated = false;
                                        });
                                        stopTimer();
                                      },
                                      child: Container(
                                        width: AppDimensions.height10(context) *
                                            8.1,
                                        height:
                                            AppDimensions.height10(context) *
                                                6.0,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                5,
                                            right: AppDimensions.height10(
                                                    context) *
                                                1.23),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFFFFFFF),
                                              width: 1),
                                          borderRadius: BorderRadius.circular(
                                              AppDimensions.height10(context) *
                                                  2.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Undo',
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.8,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // widget.comingFromEditScreen
                            //       ? Container(
                            //           width: AppDimensions.width10(context) * 10.0,
                            //           height: AppDimensions.height10(context) * 5.0,
                            //           decoration: myTextFields[0]['text'] != ""
                            //               ? BoxDecoration(
                            //                   color: Colors.white,
                            //                   border:
                            //                       Border.all(color: Color(0xffFA9934)),
                            //                   borderRadius: const BorderRadius.all(
                            //                       Radius.circular(50.0)),
                            //                 )
                            //               : BoxDecoration(
                            //                   // color: Color(0xFFFF7D50),
                            //                   border: Border.all(
                            //                       color: const Color(0xff282828)),
                            //                   color: Colors.transparent,
                            //                   borderRadius: const BorderRadius.all(
                            //                       Radius.circular(50.0)),
                            //                 ),
                            //           child: AnimatedScaleButton(
                            //             onTap: () {
                            //               //   signupSheet(context, "Sign up / login", "login");
                            //             },
                            //             child: Center(
                            //                 child: Text(
                            //               "Reset",
                            //               style: TextStyle(
                            //                   fontFamily: "Laila",
                            //                   fontWeight: FontWeight.w600,
                            //                   color: myTextFields[0]['text'] != ""
                            //                       ? Color(0xffFA9934)
                            //                       : Color(0xff282828),
                            //                   fontSize:
                            //                       AppDimensions.height10(context) * 1.8),
                            //             )),
                            //           ))
                            //       :

                            Container(
                                // color: Colors.blue,
                                width: AppDimensions.width10(context) * 5.0,
                                height: AppDimensions.height10(context) * 5.0,
                                child: Image.asset(
                                  "assets/images/Moreactions.webp",
                                  fit: BoxFit.contain,
                                )),
                            SizedBox(
                              width: AppDimensions.width10(context) * 2.0,
                            ),

                            ValueListenableBuilder<TextEditingValue>(
                                valueListenable: practiceName,
                                builder: (context, value, child) {
                                  return AnimatedScaleButton(
                                    onTap: () async {
                                      if (practiceName.text.isNotEmpty) {
                                        if (widget.comingFromEditScreen) {
                                          final SharedPreferences prefs =
                                              await _prefs;
                                          var goal_Name = prefs.setString(
                                              'pracName',
                                              practiceName.text.toString());
                                          PracticeGoalApi()
                                              .updateUserPractice(
                                                  'name', practiceName.text)
                                              .then((value) {
                                            if (value == true) {
                                              setState(() {
                                                updated = true;
                                                showContainer = true;
                                              });
                                              startTimer();
                                            }
                                          });
                                        } else {
                                          if (practiceName.text != '') {
                                            final SharedPreferences prefs =
                                                await _prefs;
                                            var goal_Name = prefs.setString(
                                                'pracName',
                                                practiceName.text.toString());
                                            Navigator.push(
                                              context,
                                              FadePageRoute2(
                                                true,
                                                exitPage: const PracticeName(
                                                  comingFromEditScreen: false,
                                                ),
                                                enterPage:
                                                    const PracticeRoutine(),
                                              ),
                                            );
                                          }
                                        }
                                      }
                                    },
                                    child: Container(
                                      height:
                                          AppDimensions.height10(context) * 5.2,
                                      width:
                                          AppDimensions.width10(context) * 31.3,
                                      decoration: BoxDecoration(
                                        // color: Color(0xFFFF7D50),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        gradient: practiceName.text.isNotEmpty
                                            ? const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                    Color(0xFFFCC10D),
                                                    Color(0xFFFDA210)
                                                  ])
                                            : LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                    const Color(0xFFFCC10D)
                                                        .withOpacity(0.5),
                                                    const Color(0xFFFDA210)
                                                        .withOpacity(0.5)
                                                  ]),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50.0)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget.comingFromEditScreen
                                              ? "Save"
                                              : "Next",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
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
      ),
    );
  }
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class pop_up_practices extends StatelessWidget {
  const pop_up_practices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 27.0,
      height: AppDimensions.height10(context) * 18.2,
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
        title: Container(
          margin: EdgeInsets.only(
              top: AppDimensions.height10(context) * 1.9,
              right: AppDimensions.width10(context) * 1.6,
              left: AppDimensions.width10(context) * 1.6,
              bottom: AppDimensions.height10(context) * 0.2),
          height: AppDimensions.height10(context) * 2.2,
          width: AppDimensions.width10(context) * 23.8,
          child: Text(
            "Exit?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF000000),
              fontSize: AppDimensions.font10(context) * 1.7,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        content: Container(
          margin: EdgeInsets.only(
              bottom: AppDimensions.height10(context) * 1.9,
              left: AppDimensions.width10(context) * 1.6,
              right: AppDimensions.width10(context) * 1.6),
          // height: AppDimensions.height10(context) * 3.2,
          width: AppDimensions.width10(context) * 23.8,
          child: Text(
            "Your new updates have not been saved.\nIf you exit now, your new updates will\nbe cancelled.",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: AppDimensions.height10(context) * 0.15,
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
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Go back',
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
                  onPressed: () async {
                    Navigator.push(context,
                        FadePageRouteReverse(page: const PracticeReview()));
                    final SharedPreferences prefs = await _prefs;
                    var review_route =
                        prefs.setString('practice_review', 'practice_edit');
                  },
                  child: const Text(
                    'Yes, cancel and exit',
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
    );
  }
}
