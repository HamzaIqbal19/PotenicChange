import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/loaders/dashboard_shimmer.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
// import 'package:simple_tooltip/simple_tooltip.dart';
//import 'package:super_tooltip/super_tooltip.dart';
// import 'package:flutter_showcaseview/flutter_showcaseview.dart';

// import 'package:flutter_offline/flutter_offline.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:potenic_app/Screen/Alerts/message_center.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Widgets/bottom_navigation.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Practice.dart';
import '../../Widgets/custom_tool_tip.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class dashBoard extends StatefulWidget {
  final bool helpful_tips;
  final bool dashboard_ctrl;
  final bool membership;
  final bool saved;
  final bool trial;
  final bool cancel;

  const dashBoard(
      {super.key,
      required this.helpful_tips,
      required this.dashboard_ctrl,
      required this.membership,
      required this.trial,
      required this.cancel,
      required this.saved});
  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> with TickerProviderStateMixin {
  String goalName = "";
  String identity = "";
  var pracName = "";
  var pracDetails;
  bool no_activegoals = false;
  var pracColor = '0';
  var color = '0';
  bool Loader = true;
  var goalDetails;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void _fetchGoalNames() async {
    final SharedPreferences prefs = await _prefs;
    AdminGoal.getUserActiveGoal().then((response) {
      print("Response: ==================== $response");
      if (response.length != 0) {
        setState(() {
          goalDetails = response[0];
          goalName = response[0]["name"];
          // pracColor = response['userPractices'] [0]['color'];
          identity = response[0]["identityStatement"][0]["text"];
          color = response[0]["color"] ?? 0;
          no_activegoals = false;
        });
        print(response);

        var goalId = prefs.setInt('goal_num', response[0]["id"]);
        loadData();
      } else if (response == 404) {
        setState(() {
          no_activegoals = true;
        });
        loadData();
      }
    }).catchError((error) {
      // loadData();
      print("error");
    }).whenComplete(() {
      loadData();
    });

    // setState(() {
    //   goalName = AdminGoal().getUserGoal();
    // });
    // print('GoalName: $goalName');
  }

  void _fetchPracticeNames() async {
    final SharedPreferences prefs = await _prefs;
    PracticeGoalApi.getUserPractice().then((response) {
      print(response["id"]);
      print("---------------------------------");
      var pracId = prefs.setInt('prac_score_id', response["id"]);
      print("---------------------------------");
      if (response.length != 0) {
        setState(() {
          pracName = response["name"];
          pracColor = response["color"];
          pracDetails = response;
        });
        var time = prefs.setString(
            'recording_Time1', pracDetails["schedule"][0]['time1'].toString());
        print("---------------------------------");

        print(response["id"]);
        print(pracName);
        print(pracColor);
      } else {
        print("response:$response");
      }
    }).catchError((error) {
      print("hell");
    }).whenComplete(() {});

    // setState(() {
    //   goalName = AdminGoal().getUserGoal();
    // });
    // print('GoalName: $goalName');
  }

  late AnimationController controller;
  //late Animation<double> opacityAnimation;

  @override
  initState() {
    super.initState();
    _fetchPracticeNames();
    _fetchGoalNames();
    // Initialize AnimationController
    initController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int removeDay = 0;

  String getFormattedDate(int removeDay) {
    return DateFormat('dd-MM')
        .format(DateTime.now().subtract(Duration(days: removeDay)));
  }

//dateClass current = dateClass(removeDay)

  String nextDayName =
      DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 1)));
  String currentDay = DateFormat('EEEE').format(DateTime.now());
  String previousDayName = DateFormat('EEEE')
      .format(DateTime.now().subtract(const Duration(days: 1)));

  String formattedDate = DateFormat('dd-MM').format(DateTime.now());
  String previousDate = DateFormat('dd-MM')
      .format(DateTime.now().subtract(const Duration(days: 1)));
  String nextDate =
      DateFormat('dd-MM').format(DateTime.now().add(const Duration(days: 1)));

  void initController() {
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(seconds: 2);
    controller.reverseDuration = const Duration(seconds: 1);
    // opacityAnimation = CurvedAnimation(
    //     parent: Tween<double>(begin: 1, end: 1).animate(controller),
    //     curve: Curves.easeInOut);
  }

  int goal_level = 1;
  void _incrementValue() {
    setState(() {
      goal_level++;
    });
  }

  bool _showOverlay = true;
  late bool _isVisible = true;
  late bool connected;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Row(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/Add goal.webp',
                      height: AppDimensions.height10(context) * 2.4,
                      width: AppDimensions.height10(context) * 2.4,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 1.7,
                        right: AppDimensions.height10(context) * 0.9,
                        bottom: AppDimensions.height10(context) * 0.3),
                    child: Image.asset(
                      'assets/images/calendar_month_black_24dp 1.webp',
                      height: AppDimensions.height10(context) * 2.4,
                      width: AppDimensions.height10(context) * 2.4,
                    ),
                  ),
                ],
              ),
            ],
            automaticallyImplyLeading: false,
          ),
          extendBodyBehindAppBar: true,
          extendBody: true,
          bottomNavigationBar: widget.saved
              ? Container(
                  color: Colors.transparent,
                  padding:
                      EdgeInsets.all(AppDimensions.height10(context) * 1.6),
                  child: Container(
                    width: AppDimensions.height10(context) * 38.259,
                    height: AppDimensions.height10(context) * 9.707,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 12.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 1.261),
                          width: AppDimensions.height10(context) * 4.437,
                          height: AppDimensions.height10(context) * 4.437,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/circle_tick.webp'))),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 16.3,
                          height: AppDimensions.height10(context) * 3.6,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 1.232),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                //  / width: AppDimensions.height10(context) * 4.6,
                                height: AppDimensions.height10(context) * 1.4,
                                //   color: Colors.amber,
                                child: Text(
                                  'SAVED',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.3,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                              SizedBox(
                                //width: AppDimensions.height10(context) * 6.9,
                                height: AppDimensions.height10(context) * 2.2,
                                child: Text(
                                  pracName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                FadePageRoute3(
                                    enterPage: const practice_summary(),
                                    exitPage: const dashBoard(
                                      helpful_tips: false,
                                      dashboard_ctrl: false,
                                      membership: true,
                                      trial: false,
                                      cancel: false,
                                      saved: true,
                                    )));
                          },
                          child: Container(
                            height: AppDimensions.height10(context) * 3.0,
                            width: AppDimensions.height10(context) * 3.0,
                            padding: EdgeInsets.all(
                                AppDimensions.height10(context) * 0.6),
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 10.6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.2,
                                    color: Colors.white)),
                            child: const ImageIcon(
                              AssetImage('assets/images/edit_icon.webp'),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Navigation_Bar(
                  bg_colored: false,
                  membership: widget.membership ? true : false,
                  cancel: widget.cancel ? true : false,
                  trial: widget.trial ? true : false,
                ),
          body: GestureDetector(
            onTap: () {
              if (widget.saved == true) {
                __share_experience(
                    context, goalName, identity, color, pracColor, pracName);
              }
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Mask Group.webp'),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: double.infinity,
              child: SizedBox(
                width: double.infinity,
                height: AppDimensions.height10(context) * 19.2,
                child: Loader == false
                    ? Stack(children: [
                        Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                height: AppDimensions.height10(context) * 19.2,
                                width: AppDimensions.height10(context) * 45.7,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const Alignment(-1, 1),
                                      child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                7.9,
                                        width: AppDimensions.height10(context) *
                                            7.9,
                                        //margin: const EdgeInsets.only(top: 84),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3, color: Colors.white),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromRGBO(
                                                    187, 185, 174, 1),
                                                Color.fromRGBO(206, 194, 149, 1)
                                              ]),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  previousDayName.substring(
                                                      0, 3),
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.2,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  previousDate,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.7),
                                                ),
                                                Container(
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.5,
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.5,
                                                    //  margin: const EdgeInsets.only(top: 3.32),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: DottedBorder(
                                                      borderType:
                                                          BorderType.Circle,
                                                      color: Colors.white,
                                                      child: Center(
                                                        child: Text(
                                                          '0/0',
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            )),
                                      ),
                                    ),
                                    Align(
                                      alignment: const Alignment(0, 0),
                                      child: SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                19.2,
                                        width: AppDimensions.height10(context) *
                                            18.8,
                                        // margin: EdgeInsets.only(left: 55.5, right: 55.5),
                                        child: Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  13.81,
                                          width:
                                              AppDimensions.height10(context) *
                                                  13.265,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/Asset 10 2.webp'),
                                                  fit: BoxFit.cover)),
                                          child: Stack(children: [
                                            Align(
                                              alignment:
                                                  const Alignment(0.185, 0.215),
                                              child: Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    1.3,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    1.3,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xfff1e39a),
                                                          Color(0xffEEDD96)
                                                        ])),
                                              ),
                                            ),
                                            Align(
                                              alignment: const Alignment(0, 0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    currentDay.substring(0, 3),
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.4,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xff5B74A6)),
                                                  ),
                                                  Text(
                                                    formattedDate,
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xff5B74A6),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.3,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.5,
                                                      width:
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.5,
                                                      // margin: const EdgeInsets.only(top: 2),
                                                      decoration:
                                                          const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  Colors.white),
                                                      child: Center(
                                                        child: Text(
                                                          '0/2',
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff5B74A6)),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ),
                                        //color: Colors.blue,
                                      ),
                                    ),
                                    Align(
                                      alignment: const Alignment(1, 1),
                                      child: Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  7.9,
                                          width:
                                              AppDimensions.height10(context) *
                                                  7.9,
                                          // margin: const EdgeInsets.only(
                                          //   top: 84,
                                          // ),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 3,
                                                  color: Colors.white),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xffFBF9EF),
                                                    Color(0xffF8F3DA)
                                                  ])),
                                          child: Container(
                                              //margin: const EdgeInsets.only(top: 11.52),
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                nextDayName.substring(0, 3),
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.2,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xff5B74A6)),
                                              ),
                                              Text(
                                                nextDate,
                                                style: const TextStyle(
                                                    color: Color(0xff5B74A6)),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.7,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.7,
                                                //margin: const EdgeInsets.only(top: 3.32),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.1,
                                                      color: Colors.white),
                                                ),
                                                child: SizedBox(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.7,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.5,
                                                    // margin:
                                                    //     const EdgeInsets.only(top: 3.32),
                                                    // margin: const EdgeInsets.only(left: 1),
                                                    child: Center(
                                                      child: Text(
                                                        '0/2',
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xff5B74A6)),
                                                      ),
                                                    )),
                                              )
                                            ],
                                          ))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 35.6,
                              height: AppDimensions.height10(context) * 4.2,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 2.0),
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
                                          0.3),
                                  height: AppDimensions.height10(context) * 2.2,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '8.00',
                                    style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: AppDimensions.height10(context) * 0.1,
                                  thickness:
                                      AppDimensions.height10(context) * 0.1,
                                  color: Colors.white,
                                ),
                                Container(
                                  height: AppDimensions.height10(context) * 1.2,
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'AM',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              width: widget.dashboard_ctrl
                                  ? AppDimensions.height10(context) * 40.1
                                  : AppDimensions.height10(context) * 31.3,
                              height: AppDimensions.height10(context) * 31.3,
                              // color: Colors.blue,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 2.9,
                                  bottom: AppDimensions.height10(context) * 1.2,
                                  right: widget.dashboard_ctrl
                                      ? AppDimensions.height10(context) * 0.9
                                      : AppDimensions.height10(context) * 7.3,
                                  left: widget.dashboard_ctrl
                                      ? AppDimensions.height10(context) * 0.4
                                      : AppDimensions.height10(context) * 2.3),
                              child: widget.dashboard_ctrl
                                  ? Stack(children: [
                                      Align(
                                        alignment: const Alignment(-1, 0),
                                        child: AnimatedScaleButton(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: practiceMenu(
                                                  goal_eval: false,
                                                )));
                                          },
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                13.8,
                                            width: AppDimensions.height10(
                                                    context) *
                                                13.8,
                                            decoration: const BoxDecoration(
                                                //color: Colors.amber,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Ellipse 158.webp'),
                                                    fit: BoxFit.cover)),
                                            child: Center(
                                                child: Text(
                                              'Meditation',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const Alignment(1, 0.4),
                                        child: AnimatedScaleButton(
                                          onTap: () {},
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                13.8,
                                            width: AppDimensions.height10(
                                                    context) *
                                                13.8,
                                            decoration: const BoxDecoration(
                                                //color: Colors.amber,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Ellipse 157.webp'),
                                                    fit: BoxFit.cover)),
                                            child: Center(
                                                child: Text(
                                              'Count\ndown',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            )),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: AnimatedScaleButton(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page:
                                                        const goal_menu_inactive(
                                                  isActive: true,
                                                  goal_evaluation: true,
                                                )));
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                26.8,
                                            height: AppDimensions.height10(
                                                    context) *
                                                26.8,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/orange_moon.webp'),
                                                    fit: BoxFit.cover)),
                                            child: Stack(
                                              children: [
                                                Align(
                                                    alignment: const Alignment(
                                                        0, -0.5),
                                                    child: Text(
                                                      'Control my anger',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xff5B74A6)),
                                                    )),
                                                Align(
                                                  alignment:
                                                      const Alignment(0, -0.2),
                                                  child: Text(
                                                      '“I am someone who is in\n control of my anger”',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff5B74A6))),
                                                ),
                                                Align(
                                                  alignment:
                                                      const Alignment(0, 1.5),
                                                  child: AnimatedScaleButton(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          FadePageRoute(
                                                              page:
                                                                  const congratulations()));
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          13.8,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          13.8,
                                                      decoration:
                                                          const BoxDecoration(
                                                              //color: Colors.amber,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/images/Ellipse orange.webp'),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                      child: Center(
                                                          child: Text(
                                                        'Count\ntemper\nepisodes',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.8,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ])
                                  : no_activegoals == true
                                      ? Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  26.8,
                                          height:
                                              AppDimensions.height10(context) *
                                                  26.8,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  5.0),
                                          child: Center(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    34.3,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.9,
                                                child: Center(
                                                  child: Text(
                                                    'No Active Goals',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            3.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'Laila'),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    26.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    5.8,
                                                child: Center(
                                                  child: Text(
                                                    'There are no recorded\nactive goals.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Laila',
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.15,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.8,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    1.8,
                                              ),
                                              AnimatedScaleButton(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      FadePageRoute(
                                                          page: Categories()));
                                                },
                                                child: Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      10.1,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          10.1,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.transparent,
                                                      border: Border.all(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.3,
                                                          color: Colors.white)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          height:
                                                              AppDimensions.height10(context) *
                                                                  3.5,
                                                          width: AppDimensions.height10(
                                                                  context) *
                                                              3.5,
                                                          padding: EdgeInsets.all(
                                                              AppDimensions.height10(
                                                                      context) *
                                                                  0.6),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .white),
                                                              color: Colors
                                                                  .transparent),
                                                          child: Image.asset(
                                                            'assets/images/Add goal.webp',
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.9,
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.9,
                                                          )),
                                                      Container(
                                                        child: Center(
                                                          child: Text(
                                                            'Add\ngoal',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.4,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                        )
                                      : Stack(children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  26.8,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  26.8,
                                              padding: EdgeInsets.all(
                                                  AppDimensions.height10(
                                                          context) *
                                                      3),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: AssetImage(color ==
                                                              '1'
                                                          ? "assets/images/red_gradient.webp"
                                                          : color == '2'
                                                              ? 'assets/images/orange_moon.webp'
                                                              : color == '3'
                                                                  ? "assets/images/lightGrey_gradient.webp"
                                                                  : color == '4'
                                                                      ? "assets/images/lightBlue_gradient.webp"
                                                                      : color ==
                                                                              '5'
                                                                          ? "assets/images/medBlue_gradient.webp"
                                                                          : color == '6'
                                                                              ? "assets/images/Blue_gradient.webp"
                                                                              : 'assets/images/orange_moon.webp'),
                                                      fit: BoxFit.cover)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // color: Colors.red,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            9.0,
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            24.0,
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "$goalName",
                                                          // "Control my anger",

                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  2.0,
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  0.14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: const Color(
                                                                  0xff5B74A6)),
                                                        ),
                                                        SizedBox(
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.7,
                                                        ),
                                                        SizedBox(
                                                          // color: Colors.green,
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              4.0,
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              22.0,
                                                          child: Text(
                                                              '"$identity"',
                                                              maxLines: 2,
                                                              textAlign: TextAlign
                                                                  .center,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  fontSize: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.6,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: const Color(
                                                                      0xff5B74A6))),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.3,
                                                  )
                                                ],
                                              ),

                                              /*Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    24.0,
                                                // padding: EdgeInsets.symmetric(
                                                //     horizontal:
                                                //         AppDimensions.height10(
                                                //                 context) *
                                                //             2.0),
                                                child: Text(
                                                  goalName,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.height10(
                                                                  context) *
                                                              2.0,
                                                      height:
                                                          AppDimensions.height10(
                                                                  context) *
                                                              0.14,
                                                      fontWeight: FontWeight.w600,
                                                      color: const Color(
                                                          0xff5B74A6)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                    context),
                                              ),
                                              Text('"$identity"',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontStyle: FontStyle.italic,
                                                      fontSize:
                                                          AppDimensions.height10(
                                                                  context) *
                                                              1.6,
                                                      fontWeight: FontWeight.w400,
                                                      color: const Color(
                                                          0xff5B74A6))),
                                            ],
                                          ),
                                          */
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const Alignment(0.9, 0.9),
                                            child: AnimatedScaleButton(
                                              onTap: () async {
                                                final SharedPreferences prefs =
                                                    await _prefs;
                                                var dash_boardRoute =
                                                    prefs.setBool(
                                                        'behaviour_route',
                                                        false);
                                                var prac_id = prefs.setInt(
                                                    'prac_num',
                                                    goalDetails['userPractices']
                                                        [0]['id']);
                                                widget.saved
                                                    ? Navigator.push(
                                                        context,
                                                        FadePageRoute(
                                                            page:
                                                                const view_goals(
                                                          missed: false,
                                                          name: '',
                                                          update: false,
                                                          helpfulTips: false,
                                                        )))
                                                    : Navigator.push(
                                                        context,
                                                        FadePageRoute2(true,
                                                            exitPage:
                                                                const dashBoard(
                                                              saved: false,
                                                              helpful_tips:
                                                                  false,
                                                              membership: true,
                                                              dashboard_ctrl:
                                                                  false,
                                                              cancel: false,
                                                              trial: false,
                                                            ),
                                                            enterPage:
                                                                practiceMenu(
                                                              goal_eval: false,
                                                            )));
                                              },
                                              child: Container(
                                                height: widget.saved
                                                    ? AppDimensions.height10(
                                                            context) *
                                                        14.8
                                                    : AppDimensions.height10(
                                                            context) *
                                                        13.8,
                                                width: widget.saved
                                                    ? AppDimensions.height10(
                                                            context) *
                                                        14.8
                                                    : AppDimensions.height10(
                                                            context) *
                                                        13.8,
                                                padding: widget.saved
                                                    ? EdgeInsets.all(
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.4)
                                                    : EdgeInsets.all(
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.2),
                                                decoration: BoxDecoration(
                                                    //color: Colors.amber,
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: widget.saved
                                                            ? AssetImage(pracColor ==
                                                                    '1'
                                                                ? "assets/images/Practice_Completed_1.webp"
                                                                : pracColor ==
                                                                        '2'
                                                                    ? 'assets/images/Practice_Completed_2.webp'
                                                                    : pracColor ==
                                                                            '3'
                                                                        ? "assets/images/Practice_Completed_3.webp"
                                                                        : pracColor ==
                                                                                '4'
                                                                            ? "assets/images/Practice_Completed_4.webp"
                                                                            : pracColor ==
                                                                                    '5'
                                                                                ? "assets/images/Practice_Completed_4.webp"
                                                                                : 'assets/images/Practice_Completed_1.webp')
                                                            : AssetImage(pracColor ==
                                                                    '1'
                                                                ? "assets/images/Ellipse orange.webp"
                                                                : pracColor ==
                                                                        '2'
                                                                    ? 'assets/images/Ellipse 158.webp'
                                                                    : pracColor ==
                                                                            '3'
                                                                        ? "assets/images/Ellipse 157.webp"
                                                                        : pracColor ==
                                                                                '4'
                                                                            ? "assets/images/Ellipse light-blue.webp"
                                                                            : pracColor ==
                                                                                    '5'
                                                                                ? "assets/images/Ellipse blue.webp"
                                                                                : 'assets/images/Ellipse 158.webp'),
                                                        fit: widget.saved
                                                            ? BoxFit.contain
                                                            : BoxFit.cover)),
                                                child: Center(
                                                  child: Text(
                                                    goalDetails['userPractices']
                                                        [0]['name'],
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: widget.saved
                                                            ? pracColor == '1'
                                                                ? const Color(
                                                                    0XFFFC7133)
                                                                : pracColor ==
                                                                        '2'
                                                                    ? const Color(
                                                                        0xFF1A481C)
                                                                    : pracColor ==
                                                                            '3'
                                                                        ? const Color(
                                                                            0xFF6D4B77)
                                                                        : pracColor ==
                                                                                '4'
                                                                            ? const Color(
                                                                                0xFF5C75A6)
                                                                            : pracColor ==
                                                                                    '5'
                                                                                ? const Color(
                                                                                    0xFF315291)
                                                                                : const Color(
                                                                                    0XFFFC7133)
                                                            : const Color(
                                                                0xFFFBFBFB),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.8,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          /*
                                      Align(
                                        alignment: const Alignment(-1, 0.4),
                                        child: AnimatedScaleButton(
                                          onTap: () {},
                                          child: Container(
                                            height:
                                                AppDimensions.height10(context) *
                                                    13.8,
                                            width:
                                                AppDimensions.height10(context) *
                                                    13.8,
                                            decoration: const BoxDecoration(
                                                //color: Colors.amber,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Ellipse 157.webp'),
                                                    fit: BoxFit.cover)),
                                            child: Center(
                                                child: Text(
                                              'Count\ndown',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            )),
                                          ),
                                        ),
                                      ),
                                  
                                  */
                                        ]),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                // showModalBottomSheet(
                                //     context: context,
                                //     transitionAnimationController: controller,
                                //     isScrollControlled: true,
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.vertical(
                                //       top: Radius.circular(
                                //           AppDimensions.height10(context) * 2.0),
                                //     )),
                                //     builder: ((context) => Container(
                                //           width: AppDimensions.height10(context) * 41.4,
                                //           height:
                                //               AppDimensions.height10(context) * 57.6,
                                //           decoration: BoxDecoration(
                                //               borderRadius: BorderRadius.vertical(
                                //                   top: Radius.circular(
                                //                       AppDimensions.height10(context) *
                                //                           2.0)),
                                //               color: const Color(0xFFF5F5F5)),
                                //           child: Column(
                                //             children: [
                                //               Container(
                                //                 //color: Colors.amber,
                                //                 // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                                //                 alignment: const Alignment(1, 0),
                                //                 child: GestureDetector(
                                //                   onTap: () {
                                //                     Navigator.pop(context);
                                //                   },
                                //                   child: Container(
                                //                     width: AppDimensions.height10(
                                //                             context) *
                                //                         2.6,
                                //                     height: AppDimensions.height10(
                                //                             context) *
                                //                         2.6,
                                //                     margin: EdgeInsets.only(
                                //                         top: AppDimensions.height10(
                                //                                 context) *
                                //                             1.5,
                                //                         right: AppDimensions.height10(
                                //                                 context) *
                                //                             1.5),
                                //                     decoration: const BoxDecoration(
                                //                         shape: BoxShape.circle,
                                //                         image: DecorationImage(
                                //                             image: AssetImage(
                                //                                 'assets/images/Close_blue.webp'))),
                                //                   ),
                                //                 ),
                                //               ),
                                //               Container(
                                //                 margin: EdgeInsets.only(
                                //                     top: AppDimensions.height10(
                                //                             context) *
                                //                         1.9,
                                //                     bottom: AppDimensions.height10(
                                //                             context) *
                                //                         2.9),
                                //                 child: Image.asset(
                                //                   'assets/images/potenic__icon.webp',
                                //                   width:
                                //                       AppDimensions.height10(context) *
                                //                           8.202,
                                //                   height:
                                //                       AppDimensions.height10(context) *
                                //                           11.2,
                                //                 ),
                                //               ),
                                //               Container(
                                //                 width: AppDimensions.height10(context) *
                                //                     22.7,
                                //                 height:
                                //                     AppDimensions.height10(context) *
                                //                         3.6,
                                //                 // color: Colors.amber,
                                //                 alignment: Alignment.center,
                                //                 //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                                //                 child: Text(
                                //                   'Get Reminders',
                                //                   style: TextStyle(
                                //                       fontSize: AppDimensions.height10(
                                //                               context) *
                                //                           3.0,
                                //                       letterSpacing:
                                //                           AppDimensions.height10(
                                //                                   context) *
                                //                               0.2,
                                //                       fontWeight: FontWeight.w700,
                                //                       color: const Color(0xFF437296)),
                                //                 ),
                                //               ),
                                //               Container(
                                //                 width: AppDimensions.height10(context) *
                                //                     38.2,
                                //                 height:
                                //                     AppDimensions.height10(context) *
                                //                         5.7,
                                //                 margin: EdgeInsets.only(
                                //                     top: AppDimensions.height10(
                                //                             context) *
                                //                         1.1),
                                //                 child: Center(
                                //                   child: Text(
                                //                     'In order to build consistent behaviour,\nallow us to gently nudge you to remind you to do\nyour practices and offer helpful tips.',
                                //                     textAlign: TextAlign.center,
                                //                     style: TextStyle(
                                //                         fontSize:
                                //                             AppDimensions.height10(
                                //                                     context) *
                                //                                 1.6,
                                //                         height: AppDimensions.height10(
                                //                                 context) *
                                //                             0.15,
                                //                         //letterSpacing: AppDimensions.height10(context) * 0.2,
                                //                         fontWeight: FontWeight.w500,
                                //                         color: const Color(0xFF437296)),
                                //                   ),
                                //                 ),
                                //               ),
                                //               Container(
                                //                 width: AppDimensions.height10(context) *
                                //                     38.2,
                                //                 height:
                                //                     AppDimensions.height10(context) *
                                //                         21.0,
                                //                 margin: EdgeInsets.only(
                                //                     top: AppDimensions.height10(
                                //                             context) *
                                //                         1.6),
                                //                 decoration: BoxDecoration(
                                //                     border: Border.all(
                                //                         width: AppDimensions.height10(
                                //                                 context) *
                                //                             0.1,
                                //                         color: const Color(0xFFFBFBFB)),
                                //                     borderRadius: BorderRadius.circular(
                                //                         AppDimensions.height10(
                                //                                 context) *
                                //                             2.0),
                                //                     gradient: const LinearGradient(
                                //                         colors: [
                                //                           Color(0xFFE8776D),
                                //                           Color(0xFFEF939D),
                                //                           Color(0xFFEF939D)
                                //                         ])),
                                //                 child: Column(
                                //                   children: [
                                //                     Container(
                                //                       margin: EdgeInsets.only(
                                //                           top: AppDimensions.height10(
                                //                                   context) *
                                //                               1.0),
                                //                       child: Image.asset(
                                //                         'assets/images/notifications.webp',
                                //                         width: AppDimensions.height10(
                                //                                 context) *
                                //                             4.8,
                                //                         height: AppDimensions.height10(
                                //                                 context) *
                                //                             4.8,
                                //                       ),
                                //                     ),
                                //                     Container(
                                //                       width: AppDimensions.height10(
                                //                               context) *
                                //                           34.5,
                                //                       height: AppDimensions.height10(
                                //                               context) *
                                //                           5.1,
                                //                       margin: EdgeInsets.only(
                                //                           top: AppDimensions.height10(
                                //                                   context) *
                                //                               1.4),
                                //                       child: Center(
                                //                           child: Text(
                                //                         'We will check in with you to remind you about your\npractices. You would be able to customise your\nnotifications later in your Account Settings. ',
                                //                         textAlign: TextAlign.center,
                                //                         style: TextStyle(
                                //                             fontSize:
                                //                                 AppDimensions.height10(
                                //                                         context) *
                                //                                     1.4,
                                //                             height:
                                //                                 AppDimensions.height10(
                                //                                         context) *
                                //                                     0.15,
                                //                             //letterSpacing: AppDimensions.height10(context) * 0.2,
                                //                             fontWeight: FontWeight.w400,
                                //                             color: const Color(
                                //                                 0xFFFFFFFF)),
                                //                       )),
                                //                     ),
                                //                     Container(
                                //                       width: AppDimensions.height10(
                                //                               context) *
                                //                           34.3,
                                //                       height: AppDimensions.height10(
                                //                               context) *
                                //                           5.0,
                                //                       margin: EdgeInsets.only(
                                //                           top: AppDimensions.height10(
                                //                                   context) *
                                //                               1.7),
                                //                       decoration: BoxDecoration(
                                //                           border: Border.all(
                                //                               width:
                                //                                   AppDimensions.height10(
                                //                                           context) *
                                //                                       0.1,
                                //                               color: const Color(
                                //                                   0xFFFBFBFB)),
                                //                           borderRadius:
                                //                               BorderRadius.circular(
                                //                                   AppDimensions.height10(
                                //                                           context) *
                                //                                       5.0),
                                //                           gradient: const LinearGradient(
                                //                               begin: Alignment.topCenter,
                                //                               end: Alignment.bottomCenter,
                                //                               colors: [
                                //                                 Color(0xFFFCC10D),
                                //                                 Color(0xFFFDA210)
                                //                               ])),
                                //                       child: Center(
                                //                         child: Text(
                                //                           'Yes, remind Me',
                                //                           style: TextStyle(
                                //                               fontSize: AppDimensions
                                //                                       .height10(
                                //                                           context) *
                                //                                   1.6,
                                //                               //  height: AppDimensions.height10(context) * 0.12,
                                //                               //letterSpacing: AppDimensions.height10(context) * 0.2,
                                //                               fontWeight:
                                //                                   FontWeight.w600,
                                //                               color: const Color(
                                //                                   0xFFFFFFFF)),
                                //                         ),
                                //                       ),
                                //                     )
                                //                   ],
                                //                 ),
                                //               )
                                //             ],
                                //           ),
                                //         ))).whenComplete(() => initController());
                              },
                              child: Container(
                                height:
                                    AppDimensions.height10(context) * 14.432,
                                width: AppDimensions.height10(context) * 35.335,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/Component 1.webp',
                                  ),
                                  fit: BoxFit.cover,
                                )),

                                //color: Colors.blue,
                                child: Stack(children: [
                                  Align(
                                    alignment: const Alignment(-0.930, -1.42),
                                    child: AnimatedScaleButton(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     FadePageRoute(
                                        //         page: const message_center()));
                                      },
                                      child: Image.asset(
                                        "assets/images/Group.webp",
                                        height:
                                            AppDimensions.height10(context) *
                                                5.0,
                                        width: AppDimensions.height10(context) *
                                            5.0,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0.93, 0),
                                    child: Image.asset(
                                      "assets/images/Vector Smart Object.webp",
                                      height: AppDimensions.height10(context) *
                                          9.296,
                                      width: AppDimensions.height10(context) *
                                          4.16,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 2.1,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  28.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.3,
                                          alignment: const Alignment(-0.65, 0),
                                          child: Text(
                                            "Hi, it's Reda here",
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  91, 116, 166, 1),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  5.245,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.3,
                                          margin: EdgeInsets.only(
                                              right: AppDimensions.height10(
                                                      context) *
                                                  17.5),
                                          child: const Divider(
                                            thickness: 1,
                                            color:
                                                Color.fromRGBO(91, 116, 166, 1),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  26.7,
                                          // height: AppDimensions.height10(context) * 5.3,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  3.4,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.2),
                                          child: Text(
                                            "You have an extra 20% chance of\nsuccess if you have a support buddy.\nHave you got one?",
                                            // textAlign: TextAlign.left,

                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.4,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    91, 116, 166, 1)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            )
                          ],
                        ),
                        // widget.saved
                        //     ? Container()
                        //     : OfflineBuilder(
                        //         debounceDuration: const Duration(milliseconds: 3),
                        //         connectivityBuilder: (
                        //           BuildContext context,
                        //           ConnectivityResult connectivity,
                        //           Widget child,
                        //         ) {
                        //           connected = connectivity != ConnectivityResult.none;

                        //           onlineCon() {
                        //             // if (connected == true) {
                        //             //   print("check whether condition is true or false");

                        //             //   Timer(Duration(seconds: 10), () {
                        //             //     setState(() {
                        //             //       _isVisible = false;
                        //             //       print(_isVisible);
                        //             //     });
                        //             //   });
                        //             // }

                        //             return Container(
                        //               child: Positioned(
                        //                   child: Align(
                        //                 alignment: Alignment.bottomCenter,
                        //                 child: Container(
                        //                   width: double.infinity,
                        //                   height: AppDimensions.height10(context) * 3.0,
                        //                   color: Colors.green,
                        //                   child: Center(
                        //                     child: Text(
                        //                       'Back Online',
                        //                       style: TextStyle(
                        //                           fontSize:
                        //                               AppDimensions.height10(context) *
                        //                                   1.4,
                        //                           fontWeight: FontWeight.w400,
                        //                           color: const Color(0xFFFBFBFB)),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               )),
                        //             );
                        //           }

                        //           return ScaffoldMessenger(
                        //             child: Stack(
                        //               fit: StackFit.expand,
                        //               children: [
                        //                 connected
                        //                     ? connected
                        //                         ? onlineCon()
                        //                         : Container()
                        //                     : Positioned(
                        //                         child: Align(
                        //                         alignment: Alignment.bottomCenter,
                        //                         child: Container(
                        //                           width: double.infinity,
                        //                           height:
                        //                               AppDimensions.height10(context) *
                        //                                   3.0,
                        //                           color: const Color(0xFFFE6624),
                        //                           child: Center(
                        //                             child: Text(
                        //                               'You’re Offline',
                        //                               style: TextStyle(
                        //                                   fontSize:
                        //                                       AppDimensions.height10(
                        //                                               context) *
                        //                                           1.4,
                        //                                   fontWeight: FontWeight.w400,
                        //                                   color:
                        //                                       const Color(0xFFFBFBFB)),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ))
                        //               ],
                        //             ),
                        //           );
                        //         },
                        //         child: Container()),

                        if (_showOverlay && widget.helpful_tips == true)
                          FutureBuilder(
                              future: Future.delayed(
                                  const Duration(milliseconds: 200)),
                              builder: (c, s) =>
                                  s.connectionState == ConnectionState.done
                                      ? Align(
                                          alignment: goal_level == 2
                                              ? const Alignment(-0.8, -0.28)
                                              : goal_level == 3
                                                  ? const Alignment(-0.6, -0.28)
                                                  : goal_level == 4
                                                      ? const Alignment(
                                                          0.25, -0.55)
                                                      : goal_level == 5
                                                          ? const Alignment(
                                                              0.39, -0.71)
                                                          : goal_level == 6
                                                              ? const Alignment(
                                                                  0.99, -0.74)
                                                              : goal_level == 1
                                                                  ? const Alignment(
                                                                      0.1,
                                                                      -0.77)
                                                                  : const Alignment(
                                                                      0.4,
                                                                      0.13),
                                          child: SizedBox(
                                            width: AppDimensions.height10(
                                                    context) *
                                                30.6,
                                            height: goal_level == 1
                                                ? AppDimensions.height10(
                                                        context) *
                                                    22.3
                                                : goal_level == 2
                                                    ? AppDimensions
                                                            .height10(context) *
                                                        22.1
                                                    : goal_level == 3
                                                        ? AppDimensions
                                                                .height10(
                                                                    context) *
                                                            18.3
                                                        : goal_level == 4
                                                            ? AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                20.6
                                                            : goal_level == 5
                                                                ? AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    22.6
                                                                : goal_level ==
                                                                        6
                                                                    ? AppDimensions.height10(
                                                                            context) *
                                                                        18.4
                                                                    : AppDimensions.height10(
                                                                            context) *
                                                                        20.6,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: goal_level == 2
                                                      ? const Alignment(
                                                          0.87, 1.1)
                                                      : goal_level == 3
                                                          ? const Alignment(
                                                              -0.9, -1.1)
                                                          : goal_level == 4
                                                              ? const Alignment(
                                                                  0, -1.1)
                                                              : goal_level == 5
                                                                  ? const Alignment(
                                                                      0.9, -1.1)
                                                                  : goal_level ==
                                                                          6
                                                                      ? const Alignment(
                                                                          0.9,
                                                                          -1.1)
                                                                      : goal_level ==
                                                                              1
                                                                          ? const Alignment(
                                                                              0,
                                                                              1.1)
                                                                          : const Alignment(
                                                                              0,
                                                                              1.1),
                                                  child: Container(
                                                    child: Image.asset(
                                                      (goal_level == 3 ||
                                                              goal_level == 4 ||
                                                              goal_level == 5 ||
                                                              goal_level == 6)
                                                          ? 'assets/images/arrow-192-up.webp'
                                                          : 'assets/images/arrow-192.webp',
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.0,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.0,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      30.6,
                                                  height: goal_level == 1
                                                      ? AppDimensions.height10(
                                                              context) *
                                                          22.3
                                                      : goal_level == 2
                                                          ? AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              22.1
                                                          : goal_level == 3
                                                              ? AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  18.3
                                                              : goal_level == 4
                                                                  ? AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      20.6
                                                                  : goal_level ==
                                                                          5
                                                                      ? AppDimensions.height10(
                                                                              context) *
                                                                          22.6
                                                                      : goal_level ==
                                                                              6
                                                                          ? AppDimensions.height10(context) *
                                                                              18.4
                                                                          : AppDimensions.height10(context) *
                                                                              20.6,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius
                                                          .circular(AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.0)),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            21.6,
                                                        //height: AppDimensions.height10(context) * 2.2,
                                                        margin: EdgeInsets.only(
                                                            top: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.7,
                                                            left: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.6,
                                                            right: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                7.4),
                                                        child: Text(
                                                          goal_level == 2
                                                              ? 'Your Practice'
                                                              : goal_level == 3
                                                                  ? 'Time'
                                                                  : goal_level ==
                                                                          4
                                                                      ? 'Your Schedule'
                                                                      : goal_level ==
                                                                              5
                                                                          ? 'Record Practice'
                                                                          : goal_level == 6
                                                                              ? 'Your Calendar'
                                                                              : goal_level == 1
                                                                                  ? 'Your Goal'
                                                                                  : 'Reda',
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontFamily: 'Laila',
                                                            color: const Color(
                                                                0xFF000000),
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.6,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            27.4,
                                                        height: goal_level == 1
                                                            ? AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                11.8
                                                            : goal_level == 2
                                                                ? AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    11.6
                                                                : goal_level ==
                                                                        3
                                                                    ? AppDimensions.height10(
                                                                            context) *
                                                                        7.8
                                                                    : goal_level ==
                                                                            4
                                                                        ? AppDimensions.height10(context) *
                                                                            10.1
                                                                        : goal_level ==
                                                                                5
                                                                            ? AppDimensions.height10(context) *
                                                                                12.1
                                                                            : goal_level == 6
                                                                                ? AppDimensions.height10(context) * 7.9
                                                                                : AppDimensions.height10(context) * 10.1,
                                                        margin: EdgeInsets.only(
                                                            top: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.3),
                                                        child: RichText(
                                                            text: TextSpan(
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xFF464646),
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontFamily:
                                                                        'Laila',
                                                                    fontSize:
                                                                        AppDimensions.height10(context) *
                                                                            1.4,
                                                                    height: AppDimensions.height10(
                                                                            context) *
                                                                        0.15),
                                                                children: [
                                                              TextSpan(
                                                                text: goal_level ==
                                                                        1
                                                                    ? 'This is your own star that you’ve created.\nRemember, '
                                                                    : goal_level ==
                                                                            2
                                                                        ? 'Smaller circles that spin around your\nstars are the planets. The '
                                                                        : goal_level ==
                                                                                3
                                                                            ? 'This shows the '
                                                                            : goal_level == 4 || goal_level == 6
                                                                                ? 'This is your '
                                                                                : goal_level == 5
                                                                                    ? 'If you want to '
                                                                                    : 'This is your friend who sends out',
                                                              ),
                                                              TextSpan(
                                                                  text: goal_level ==
                                                                          1
                                                                      ? '‘stars’ '
                                                                      : goal_level ==
                                                                              2
                                                                          ? '‘planets’ '
                                                                          : goal_level == 3
                                                                              ? 'actual time '
                                                                              : goal_level == 4
                                                                                  ? 'daily view '
                                                                                  : goal_level == 5
                                                                                      ? 'record a practice session\n'
                                                                                      : goal_level == 6
                                                                                          ? 'calender '
                                                                                          : ' helpful\nreminders ',
                                                                  style: const TextStyle(fontWeight: FontWeight.w700)),
                                                              TextSpan(
                                                                  text: goal_level ==
                                                                          1
                                                                      ? 'are your '
                                                                      : goal_level ==
                                                                              2
                                                                          ? 'are\nyour own '
                                                                          : goal_level == 3
                                                                              ? 'the practice\nis '
                                                                              : goal_level == 4
                                                                                  ? 'schedule.\nNavigate here if you want quick access to\nsee all your '
                                                                                  : goal_level == 5
                                                                                      ? 'that it’s not currently scheduled, navigate\nhere. You will see all your '
                                                                                      : goal_level == 6
                                                                                          ? 'It’s very similar to your schedule. Navigate here if you want to see your '
                                                                                          : 'and '),
                                                              TextSpan(
                                                                  text: goal_level ==
                                                                          1
                                                                      ? 'personal\ngrowth goals. '
                                                                      : goal_level ==
                                                                              2
                                                                          ? 'practices '
                                                                          : goal_level == 3
                                                                              ? 'scheduled '
                                                                              : goal_level == 4
                                                                                  ? 'scheduled practices '
                                                                                  : goal_level == 5
                                                                                      ? 'active goals '
                                                                                      : goal_level == 6
                                                                                          ? 'past '
                                                                                          : 'messages. ',
                                                                  style: const TextStyle(fontWeight: FontWeight.w700)),
                                                              TextSpan(
                                                                  text: goal_level ==
                                                                          1
                                                                      ? 'They wil always look bigger and will have '
                                                                      : goal_level ==
                                                                              2
                                                                          ? 'that you’ve created to help you progress with your goal. The\n'
                                                                          : goal_level == 3
                                                                              ? 'for on that day (centred daily calendar view at the top shows you the actual date).'
                                                                              : goal_level == 4
                                                                                  ? 'for that day. Scroll left or right to see your\n'
                                                                                  : goal_level == 5
                                                                                      ? 'with its'
                                                                                      : goal_level == 6
                                                                                          ? 'or'
                                                                                          : ' You will see\nReda appearing every time you have a new\nnotification with gentle prompts to help\nyou '),
                                                              TextSpan(
                                                                  text: goal_level ==
                                                                          1
                                                                      ? 'goal name '
                                                                      : goal_level ==
                                                                              2
                                                                          ? 'practice '
                                                                          : goal_level == 3
                                                                              ? ''
                                                                              : goal_level == 4
                                                                                  ? 'schedule '
                                                                                  : goal_level == 5
                                                                                      ? ' assigned practices.'
                                                                                      : goal_level == 6
                                                                                          ? ' future schedule '
                                                                                          : 'stay focused.',
                                                                  style: const TextStyle(fontWeight: FontWeight.w700)),
                                                              TextSpan(
                                                                  text: goal_level ==
                                                                          1
                                                                      ? 'with\n'
                                                                      : goal_level ==
                                                                              2
                                                                          ? 'will have a '
                                                                          : goal_level == 3
                                                                              ? ''
                                                                              : goal_level == 4
                                                                                  ? 'for previous or next day.'
                                                                                  : goal_level == 5
                                                                                      ? ' Click on the\npractice you want to record the session\nfor and you’ll be taken to capture it.'
                                                                                      : goal_level == 6
                                                                                          ? 'for a\ncertain date.'
                                                                                          : ''),
                                                              TextSpan(
                                                                  text: goal_level ==
                                                                          1
                                                                      ? 'identity statement  '
                                                                      : goal_level ==
                                                                              2
                                                                          ? 'name '
                                                                          : goal_level == 3
                                                                              ? ''
                                                                              : goal_level == 4
                                                                                  ? ''
                                                                                  : goal_level == 5
                                                                                      ? ''
                                                                                      : goal_level == 6
                                                                                          ? ''
                                                                                          : '',
                                                                  style: const TextStyle(fontWeight: FontWeight.w700)),
                                                              TextSpan(
                                                                  text: goal_level ==
                                                                          1
                                                                      ? 'written on it, so you\ncan easily identify it.'
                                                                      : goal_level ==
                                                                              2
                                                                          ? 'written on it to help you identify it.'
                                                                          : goal_level == 3
                                                                              ? ''
                                                                              : goal_level == 4
                                                                                  ? ''
                                                                                  : goal_level == 5
                                                                                      ? ''
                                                                                      : goal_level == 6
                                                                                          ? ''
                                                                                          : '')
                                                            ])),
                                                      ),
                                                      Container(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            24.3,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.0,
                                                        margin: EdgeInsets.only(
                                                            top: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.8),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: (() {
                                                                setState(() {
                                                                  _showOverlay =
                                                                      false;
                                                                });
                                                              }),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(AppDimensions.height10(context) *
                                                                            5.0),
                                                                    border: Border.all(
                                                                        width: AppDimensions.height10(context) *
                                                                            0.1,
                                                                        color: const Color(
                                                                            0xFFFBFBFB))),
                                                                width: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    9.60,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    3.2,
                                                                child: Center(
                                                                  child: Text(
                                                                    'Skip tour',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Laila',
                                                                        decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                        fontSize:
                                                                            AppDimensions.height10(context) *
                                                                                1.6,
                                                                        color: const Color(
                                                                            0xFF8C648A),
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                _incrementValue();
                                                                if (goal_level >
                                                                    7) {
                                                                  setState(() {
                                                                    _showOverlay =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child: Container(
                                                                width: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    11.7,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    4.0,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(AppDimensions.height10(context) *
                                                                            5.0),
                                                                    color: const Color(
                                                                        0xFF5A4D73)),
                                                                child: Center(
                                                                  child: Text(
                                                                    goal_level ==
                                                                            2
                                                                        ? '(2/7) Next'
                                                                        : goal_level ==
                                                                                3
                                                                            ? '(3/7) Next'
                                                                            : goal_level == 4
                                                                                ? '(4/7) Next'
                                                                                : goal_level == 5
                                                                                    ? '(5/7) Next'
                                                                                    : goal_level == 6
                                                                                        ? '(6/7) Next'
                                                                                        : goal_level == 7
                                                                                            ? '(7/7) Next'
                                                                                            : goal_level == 1
                                                                                                ? '(1/7) Next'
                                                                                                : '(7/7) Next',
                                                                    style: TextStyle(
                                                                        decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                        fontFamily:
                                                                            'Laila',
                                                                        fontSize:
                                                                            AppDimensions.height10(context) *
                                                                                1.6,
                                                                        color: const Color(
                                                                            0xFFFFFFFF),
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container()),
                      ])
                    : const DashBoard_shimmer(),
              ),
            ),
          )),
    );
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
      top: Radius.circular(AppDimensions.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10(context) * 39.4,
          height: AppDimensions.height10(context) * 62.3,
          margin: EdgeInsets.only(
              left: AppDimensions.height10(context) * 1.0,
              right: AppDimensions.height10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              color: const Color(0xFFD9B4B4)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: AnimatedScaleButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.9,
                        right: AppDimensions.height10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                  width: AppDimensions.height10(context) * 28.6,
                  height: AppDimensions.height10(context) * 5.8,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 0.7,
                      bottom: AppDimensions.height10(context) * 1.2),
                  child: Text(
                    'Share your first\nexperience...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: AppDimensions.height10(context) * 0.12,
                        fontSize: AppDimensions.height10(context) * 2.4,
                        // letterSpacing: AppDimensions.height10(context) * 0.2,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF437296)),
                  )),
              Container(
                width: AppDimensions.height10(context) * 32.7,
                height: AppDimensions.height10(context) * 6.4,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'True happiness comes from sharing and\nhelping others who are on the same\njourney as you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.12,
                      fontSize: AppDimensions.height10(context) * 1.6,
                      // letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 24.8,
                height: AppDimensions.height10(context) * 24.8,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.8),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: AppDimensions.height10(context) * 24.8,
                      height: AppDimensions.height10(context) * 24.8,
                      decoration: BoxDecoration(
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
                              fit: BoxFit.cover)),
                      child: Stack(
                        children: [
                          Align(
                              alignment: const Alignment(0, -0.5),
                              child: Container(
                                width: AppDimensions.height10(context) * 24.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensions.height10(context) * 2.0),
                                child: Text(
                                  goalName,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
                                      height: AppDimensions.height10(context) *
                                          0.14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff5B74A6)),
                                ),
                              )),
                          Align(
                            alignment: const Alignment(0, -0.3),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppDimensions.height10(context) * 2.0),
                              child: Text(identity,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff5B74A6))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.9, 1),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: AppDimensions.height10(context) * 14.8,
                        width: AppDimensions.height10(context) * 14.8,
                        decoration: BoxDecoration(
                            //color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage(pracColor == '1'
                                    ? "assets/images/Practice_Completed_1.webp"
                                    : pracColor == '2'
                                        ? 'assets/images/Practice_Completed_2.webp'
                                        : pracColor == '3'
                                            ? "assets/images/Practice_Completed_3.webp"
                                            : pracColor == '4'
                                                ? "assets/images/Practice_Completed_4.webp"
                                                : pracColor == '5'
                                                    ? "assets/images/Practice_Completed_4.webp"
                                                    : 'assets/images/Practice_Completed_1.webp'),
                                fit: BoxFit.contain)),
                        child: Center(
                          child: Text(
                            pracName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: pracColor == "1"
                                    ? const Color(0XFFFC7133)
                                    : pracColor == "2"
                                        ? const Color(0xFF1A481C)
                                        : pracColor == "3"
                                            ? const Color(0xFF6D4B77)
                                            : pracColor == "4"
                                                ? const Color(0xFF5C75A6)
                                                : pracColor == "5"
                                                    ? const Color(0xFF315291)
                                                    : const Color(0XFFFC7133),
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                  height: AppDimensions.height10(context) * 12.5,
                  width: AppDimensions.height10(context) * 12.5,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9),
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

// OfflineBuilder(
//                 debounceDuration: Duration(milliseconds: 3),
//                 connectivityBuilder: (
//                   BuildContext context,
//                   ConnectivityResult connectivity,
//                   Widget child,
//                 ) {
//                   final bool connected =
//                       connectivity != ConnectivityResult.none;
//                   return Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       Positioned(
//                           child: Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           width: double.infinity,
//                           height: AppDimensions.height10(context) * 3.0,
//                           color:
//                               connected ? Color(0xFF27AE60) : Color(0xFFFE6624),
//                           child: Center(
//                             child: Text(
//                               connected ? 'Back Online' : 'You’re Offline',
//                               style: TextStyle(
//                                   fontSize: AppDimensions.height10(context) * 1.4,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xFFFBFBFB)),
//                             ),
//                           ),
//                         ),
//                       ))
//                     ],
//                   );
//                 },
//                 child: Container())

// class TargetWidget extends StatefulWidget {
//   const TargetWidget({Key? key}) : super(key: key);

//   @override
//   _TargetWidgetState createState() => new _TargetWidgetState();
// }

// class _TargetWidgetState extends State<TargetWidget> {
//   SuperTooltip? tooltip;
//   int goal_level = 1;
//   Future<bool> _willPopCallback() async {
//     // If the tooltip is open we don't pop the page on a backbutton press
//     // but close the ToolTip
//     if (tooltip!.isOpen) {
//       tooltip!.close();
//       return false;
//     }
//     return true;
//   }

//   bool _loading = false;

//   void initState() {
//     //super.initState();
//     onTap();
//   }

//   // void _delayed() {
//   //   Timer(Duration(seconds: 1), () {
//   //     if (tooltip != null && tooltip!.isOpen) {
//   //       //tooltip!.close();
//   //     }
//   //   });
//   // }

//   void _incrementValue() {
//     setState(() {
//       goal_level++;
//     });
//   }

//   void onTap() {
//     if (tooltip != null && tooltip!.isOpen) {
//       tooltip!.close();
//       return;
//     }

//     var renderBox = context.findRenderObject() as RenderBox;
//     final overlay =
//         Overlay.of(context)!.context.findRenderObject() as RenderBox?;

//     var targetGlobalCenter = renderBox
//         .localToGlobal(renderBox.size.center(Offset.zero), ancestor: overlay);

//     // We create the tooltip on the first use
//     tooltip = SuperTooltip(
//       popupDirection: TooltipDirection.down,
//       arrowTipDistance: 10.0,
//       arrowBaseWidth: 20.0,
//       arrowLength: 15.0,
//       borderColor: Colors.transparent,
//       borderWidth: 5.0,
//       minimumOutSidePadding: 0,

//       //snapsFarAwayVertically: true,
//       //showCloseButton: ShowCloseButton.inside,
//       hasShadow: false,
//       // touchThrougArea: new Rect.fromLTWH(targetGlobalCenter.dx - 100,
//       //     targetGlobalCenter.dy - 100, 200.0, 160.0),
//       // touchThroughAreaShape: ClipAreaShape.rectangle,
//       content: Material(
//         child: Container(
//           width: AppDimensions.height10(context) * 29.6,
//           height: goal_level == 1
//               ? AppDimensions.height10(context) * 21.3
//               : goal_level == 2
//                   ? AppDimensions.height10(context) * 21.1
//                   : goal_level == 3
//                       ? AppDimensions.height10(context) * 18.02
//                       : goal_level == 4
//                           ? AppDimensions.height10(context) * 20.32
//                           : goal_level == 5
//                               ? AppDimensions.height10(context) * 22.32
//                               : goal_level == 6
//                                   ? AppDimensions.height10(context) * 18.12
//                                   : AppDimensions.height10(context) * 19.6,
//           decoration: BoxDecoration(
//               color: const Color(0xFFFFFFFF),
//               borderRadius:
//                   BorderRadius.circular(AppDimensions.height10(context) * 1.0)),
//           child: Column(
//             children: [
//               Container(
//                 width: AppDimensions.height10(context) * 21.6,
//                 height: AppDimensions.height10(context) * 2.2,
//                 margin: EdgeInsets.only(
//                     top: AppDimensions.height10(context) * 1.7,
//                     left: goal_level == 6
//                         ? AppDimensions.height10(context) * 1.2
//                         : AppDimensions.height10(context) * 1.2,
//                     right: AppDimensions.height10(context) * 7.4),
//                 child: Text(
//                   goal_level == 2
//                       ? 'Your Practice'
//                       : goal_level == 3
//                           ? 'Time'
//                           : goal_level == 4
//                               ? 'Your Schedule'
//                               : goal_level == 5
//                                   ? 'Record Practice'
//                                   : goal_level == 6
//                                       ? 'Your Calendar'
//                                       : goal_level == 1
//                                           ? 'Your Goal'
//                                           : 'Reda',
//                   style: TextStyle(
//                     decoration: TextDecoration.none,
//                     fontFamily: 'Laila',
//                     color: const Color(0xFF000000),
//                     fontSize: AppDimensions.height10(context) * 1.4,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: AppDimensions.height10(context) * 27.4,
//                 height: goal_level == 1
//                     ? AppDimensions.height10(context) * 11.8
//                     : goal_level == 2
//                         ? AppDimensions.height10(context) * 11.6
//                         : goal_level == 3
//                             ? AppDimensions.height10(context) * 7.8
//                             : goal_level == 4
//                                 ? AppDimensions.height10(context) * 10.1
//                                 : goal_level == 5
//                                     ? AppDimensions.height10(context) * 12.1
//                                     : goal_level == 6
//                                         ? AppDimensions.height10(context) * 7.9
//                                         : AppDimensions.height10(context) * 10.1,
//                 margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.3),
//                 child: RichText(
//                     text: TextSpan(
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF464646),
//                             decoration: TextDecoration.none,
//                             fontFamily: 'Laila',
//                             fontSize: AppDimensions.height10(context) * 1.4,
//                             height: AppDimensions.height10(context) * 0.15),
//                         children: [
//                       TextSpan(
//                         text: goal_level == 1
//                             ? 'This is your own star that you’ve created.\nRemember, '
//                             : goal_level == 2
//                                 ? 'Smaller circles that spin around your\nstars are the planets. The '
//                                 : goal_level == 3
//                                     ? 'This shows the '
//                                     : goal_level == 4 || goal_level == 6
//                                         ? 'This is your '
//                                         : goal_level == 5
//                                             ? 'If you want to '
//                                             : 'This is your friend who sends out',
//                       ),
//                       TextSpan(
//                           text: goal_level == 1
//                               ? '‘stars’ '
//                               : goal_level == 2
//                                   ? '‘planets’ '
//                                   : goal_level == 3
//                                       ? 'actual time '
//                                       : goal_level == 4
//                                           ? 'daily view '
//                                           : goal_level == 5
//                                               ? 'record a practice session\n'
//                                               : goal_level == 6
//                                                   ? 'calender '
//                                                   : ' helpful\nreminders ',
//                           style: const TextStyle(fontWeight: FontWeight.w700)),
//                       TextSpan(
//                           text: goal_level == 1
//                               ? 'are your '
//                               : goal_level == 2
//                                   ? 'are\nyour own '
//                                   : goal_level == 3
//                                       ? 'the practice is '
//                                       : goal_level == 4
//                                           ? 'schedule.\nNavigate here if you want quick access to\nsee all your '
//                                           : goal_level == 5
//                                               ? 'that it’s not currently scheduled, navigate\nhere. You will see all your '
//                                               : goal_level == 6
//                                                   ? 'It’s very similar to your schedule. Navigate here if you want to see your '
//                                                   : 'and '),
//                       TextSpan(
//                           text: goal_level == 1
//                               ? 'personal\ngrowth goals. '
//                               : goal_level == 2
//                                   ? 'practices '
//                                   : goal_level == 3
//                                       ? 'scheduled '
//                                       : goal_level == 4
//                                           ? 'scheduled practices '
//                                           : goal_level == 5
//                                               ? 'active goals '
//                                               : goal_level == 6
//                                                   ? 'past '
//                                                   : 'messages. ',
//                           style: const TextStyle(fontWeight: FontWeight.w700)),
//                       TextSpan(
//                           text: goal_level == 1
//                               ? 'They wil always look bigger and will have '
//                               : goal_level == 2
//                                   ? 'that you’ve created to help you progress with your goal. The\n'
//                                   : goal_level == 3
//                                       ? 'for on that day (centred daily calendar view at the top shows you the actual date).'
//                                       : goal_level == 4
//                                           ? 'for that day. Scroll left or right to see your\n'
//                                           : goal_level == 5
//                                               ? 'with its'
//                                               : goal_level == 6
//                                                   ? 'or'
//                                                   : ' You will see\nReda appearing every time you have a new\nnotification with gentle prompts to help\nyou '),
//                       TextSpan(
//                           text: goal_level == 1
//                               ? 'goal name '
//                               : goal_level == 2
//                                   ? 'practice '
//                                   : goal_level == 3
//                                       ? ''
//                                       : goal_level == 4
//                                           ? 'schedule '
//                                           : goal_level == 5
//                                               ? ' assigned practices.'
//                                               : goal_level == 6
//                                                   ? ' future '
//                                                   : 'stay focused.',
//                           style: const TextStyle(fontWeight: FontWeight.w700)),
//                       TextSpan(
//                           text: goal_level == 1
//                               ? 'with\n'
//                               : goal_level == 2
//                                   ? 'will have a '
//                                   : goal_level == 3
//                                       ? ''
//                                       : goal_level == 4
//                                           ? 'for previous or next day.'
//                                           : goal_level == 5
//                                               ? ' Click on the\npractice you want to record the session\nfor and you’ll be taken to capture it'
//                                               : goal_level == 6
//                                                   ? 'for a\ncertain date.'
//                                                   : ''),
//                       TextSpan(
//                           text: goal_level == 1
//                               ? 'identity statement  '
//                               : goal_level == 2
//                                   ? 'name '
//                                   : goal_level == 3
//                                       ? ''
//                                       : goal_level == 4
//                                           ? ''
//                                           : goal_level == 5
//                                               ? ''
//                                               : goal_level == 6
//                                                   ? ''
//                                                   : '',
//                           style: const TextStyle(fontWeight: FontWeight.w700)),
//                       TextSpan(
//                           text: goal_level == 1
//                               ? 'written on it, so you\ncan easily identify it.'
//                               : goal_level == 2
//                                   ? 'written on it to help you identify it.'
//                                   : goal_level == 3
//                                       ? ''
//                                       : goal_level == 4
//                                           ? ''
//                                           : goal_level == 5
//                                               ? ''
//                                               : goal_level == 6
//                                                   ? ''
//                                                   : '')
//                     ])),
//               ),
//               Container(
//                 width: AppDimensions.height10(context) * 24.3,
//                 height: AppDimensions.height10(context) * 4.0,
//                 margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                                 AppDimensions.height10(context) * 5.0),
//                             border: Border.all(
//                                 width: AppDimensions.height10(context) * 0.1,
//                                 color: const Color(0xFFFBFBFB))),
//                         width: AppDimensions.height10(context) * 9.60,
//                         height: AppDimensions.height10(context) * 3.2,
//                         child: Center(
//                           child: Text(
//                             'Skip tour',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontFamily: 'Laila',
//                                 decoration: TextDecoration.none,
//                                 fontSize: AppDimensions.height10(context) * 1.6,
//                                 color: const Color(0xFF8C648A),
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         _incrementValue();
//                         if (goal_level > 7) {
//                           setState(() {
//                             // hide == true;
//                           });
//                         }
//                       },
//                       child: Container(
//                         width: AppDimensions.height10(context) * 11.7,
//                         height: AppDimensions.height10(context) * 4.0,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                                 AppDimensions.height10(context) * 5.0),
//                             color: const Color(0xFF5A4D73)),
//                         child: Center(
//                           child: Text(
//                             goal_level == 2
//                                 ? '(2/7) Next'
//                                 : goal_level == 3
//                                     ? '(3/7) Next'
//                                     : goal_level == 4
//                                         ? '(4/7) Next'
//                                         : goal_level == 5
//                                             ? '(5/7) Next'
//                                             : goal_level == 6
//                                                 ? '(6/7) Next'
//                                                 : goal_level == 7
//                                                     ? '(7/7) Next'
//                                                     : goal_level == 1
//                                                         ? '(1/7) Next'
//                                                         : '(7/7) Next',
//                             style: TextStyle(
//                                 decoration: TextDecoration.none,
//                                 fontFamily: 'Laila',
//                                 fontSize: AppDimensions.height10(context) * 1.6,
//                                 color: const Color(0xFFFFFFFF),
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );

//     tooltip!.show(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _willPopCallback,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: 20.0,
//           height: 20.0,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }





// 
    // child: JustTheTooltip(
//                           margin: EdgeInsets.only(
//                               left: AppDimensions.height10(context) * 5.0),
//                           onDismiss: () {
//                             print(goal_level);
//                           },
//                           elevation: 0,

//                           controller: tooltipController,
//                           isModal: true,
//                           //triggerMode: TooltipTriggerMode.tap,
//                           offset: 0.9,
//                           // preferredDirection: goal_level == 1 ||
//                           //         goal_level == 2 ||
//                           //         goal_level == 7
//                           //     ? AxisDirection.up
//                           //     : AxisDirection.down,
//                           enableFeedback: true,
//                           // tailBuilder: (point1, point2, point3) {
//                           //   Path defaultTailBuilder(
//                           //       Offset tip, Offset point2, Offset point3) {
//                           //     return Path()
//                           //       ..moveTo(0.8, 0)
//                           //       ..lineTo(point2.dx, point2.dy)
//                           //       ..lineTo(point3.dx, point3.dy)
//                           //       ..close();
//                           //   }
//                           // },
//                           child: SizedBox(
//                             width: AppDimensions.height10(context) * 5.0,
//                             height: AppDimensions.height10(context) * 5.00,
//                             child: Container(
//                               color: Colors.amber,
//                             ),
//                           ),

//                           content: Container(
//                             width: AppDimensions.height10(context) * 29.6,
//                             height: goal_level == 1
//                                 ? AppDimensions.height10(context) * 21.3
//                                 : goal_level == 2
//                                     ? AppDimensions.height10(context) * 21.1
//                                     : goal_level == 3
//                                         ? AppDimensions.height10(context) * 18.02
//                                         : goal_level == 4
//                                             ? AppDimensions.height10(context) * 20.32
//                                             : goal_level == 5
//                                                 ? AppDimensions.height10(context) *
//                                                     22.32
//                                                 : goal_level == 6
//                                                     ? AppDimensions.height10(context) *
//                                                         18.12
//                                                     : AppDimensions.height10(context) *
//                                                         19.6,
//                             decoration: BoxDecoration(
//                                 color: Color(0xFFFFFFFF),
//                                 borderRadius: BorderRadius.circular(
//                                     AppDimensions.height10(context) * 1.0)),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   width: AppDimensions.height10(context) * 21.6,
//                                   height: AppDimensions.height10(context) * 2.2,
//                                   margin: EdgeInsets.only(
//                                       top: AppDimensions.height10(context) * 1.7,
//                                       left: goal_level == 6
//                                           ? AppDimensions.height10(context) * 1.2
//                                           : AppDimensions.height10(context) * 1.2,
//                                       right: AppDimensions.height10(context) * 7.4),
//                                   child: Text(
//                                     goal_level == 2
//                                         ? 'Your Practice'
//                                         : goal_level == 3
//                                             ? 'Time'
//                                             : goal_level == 4
//                                                 ? 'Your Schedule'
//                                                 : goal_level == 5
//                                                     ? 'Record Practice'
//                                                     : goal_level == 6
//                                                         ? 'Your Calendar'
//                                                         : goal_level == 1
//                                                             ? 'Your Goal'
//                                                             : 'Reda',
//                                     style: TextStyle(
//                                       decoration: TextDecoration.none,
//                                       fontFamily: 'Laila',
//                                       color: Color(0xFF000000),
//                                       fontSize: AppDimensions.height10(context) * 1.4,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: AppDimensions.height10(context) * 27.4,
//                                   height: goal_level == 1
//                                       ? AppDimensions.height10(context) * 11.8
//                                       : goal_level == 2
//                                           ? AppDimensions.height10(context) * 11.6
//                                           : goal_level == 3
//                                               ? AppDimensions.height10(context) * 7.8
//                                               : goal_level == 4
//                                                   ? AppDimensions.height10(context) *
//                                                       10.1
//                                                   : goal_level == 5
//                                                       ? AppDimensions
//                                                               .height10 *
//                                                           12.1
//                                                       : goal_level == 6
//                                                           ? AppDimensions
//                                                                   .height10 *
//                                                               7.9
//                                                           : AppDimensions
//                                                                   .height10 *
//                                                               10.1,
//                                   margin: EdgeInsets.only(
//                                       top: AppDimensions.height10(context) * 0.3),
//                                   child: RichText(
//                                       text: TextSpan(
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               color: Color(0xFF464646),
//                                               decoration: TextDecoration.none,
//                                               fontFamily: 'Laila',
//                                               fontSize:
//                                                   AppDimensions.height10(context) *
//                                                       1.4,
//                                               height: AppDimensions.height10(context) *
//                                                   0.15),
//                                           children: [
//                                         TextSpan(
//                                           text: goal_level == 1
//                                               ? 'This is your own star that you’ve created.\nRemember, '
//                                               : goal_level == 2
//                                                   ? 'Smaller circles that spin around your\nstars are the planets. The '
//                                                   : goal_level == 3
//                                                       ? 'This shows the '
//                                                       : goal_level == 4 ||
//                                                               goal_level == 6
//                                                           ? 'This is your '
//                                                           : goal_level == 5
//                                                               ? 'If you want to '
//                                                               : 'This is your friend who sends out',
//                                         ),
//                                         TextSpan(
//                                             text: goal_level == 1
//                                                 ? '‘stars’ '
//                                                 : goal_level == 2
//                                                     ? '‘planets’ '
//                                                     : goal_level == 3
//                                                         ? 'actual time '
//                                                         : goal_level == 4
//                                                             ? 'daily view '
//                                                             : goal_level == 5
//                                                                 ? 'record a practice session\n'
//                                                                 : goal_level ==
//                                                                         6
//                                                                     ? 'calender '
//                                                                     : ' helpful\nreminders ',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w700)),
//                                         TextSpan(
//                                             text: goal_level == 1
//                                                 ? 'are your '
//                                                 : goal_level == 2
//                                                     ? 'are\nyour own '
//                                                     : goal_level == 3
//                                                         ? 'the practice is '
//                                                         : goal_level == 4
//                                                             ? 'schedule.\nNavigate here if you want quick access to\nsee all your '
//                                                             : goal_level == 5
//                                                                 ? 'that it’s not currently scheduled, navigate\nhere. You will see all your '
//                                                                 : goal_level ==
//                                                                         6
//                                                                     ? 'It’s very similar to your schedule. Navigate here if you want to see your '
//                                                                     : 'and '),
//                                         TextSpan(
//                                             text: goal_level == 1
//                                                 ? 'personal\ngrowth goals. '
//                                                 : goal_level == 2
//                                                     ? 'practices '
//                                                     : goal_level == 3
//                                                         ? 'scheduled '
//                                                         : goal_level == 4
//                                                             ? 'scheduled practices '
//                                                             : goal_level == 5
//                                                                 ? 'active goals '
//                                                                 : goal_level ==
//                                                                         6
//                                                                     ? 'past '
//                                                                     : 'messages. ',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w700)),
//                                         TextSpan(
//                                             text: goal_level == 1
//                                                 ? 'They wil always look bigger and will have '
//                                                 : goal_level == 2
//                                                     ? 'that you’ve created to help you progress with your goal. The\n'
//                                                     : goal_level == 3
//                                                         ? 'for on that day (centred daily calendar view at the top shows you the actual date).'
//                                                         : goal_level == 4
//                                                             ? 'for that day. Scroll left or right to see your\n'
//                                                             : goal_level == 5
//                                                                 ? 'with its'
//                                                                 : goal_level ==
//                                                                         6
//                                                                     ? 'or'
//                                                                     : ' You will see\nReda appearing every time you have a new\nnotification with gentle prompts to help\nyou '),
//                                         TextSpan(
//                                             text: goal_level == 1
//                                                 ? 'goal name '
//                                                 : goal_level == 2
//                                                     ? 'practice '
//                                                     : goal_level == 3
//                                                         ? ''
//                                                         : goal_level == 4
//                                                             ? 'schedule '
//                                                             : goal_level == 5
//                                                                 ? ' assigned practices.'
//                                                                 : goal_level ==
//                                                                         6
//                                                                     ? ' future '
//                                                                     : 'stay focused.',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w700)),
//                                         TextSpan(
//                                             text: goal_level == 1
//                                                 ? 'with\n'
//                                                 : goal_level == 2
//                                                     ? 'will have a '
//                                                     : goal_level == 3
//                                                         ? ''
//                                                         : goal_level == 4
//                                                             ? 'for previous or next day.'
//                                                             : goal_level == 5
//                                                                 ? ' Click on the\npractice you want to record the session\nfor and you’ll be taken to capture it'
//                                                                 : goal_level ==
//                                                                         6
//                                                                     ? 'for a\ncertain date.'
//                                                                     : ''),
//                                         TextSpan(
//                                             text: goal_level == 1
//                                                 ? 'identity statement  '
//                                                 : goal_level == 2
//                                                     ? 'name '
//                                                     : goal_level == 3
//                                                         ? ''
//                                                         : goal_level == 4
//                                                             ? ''
//                                                             : goal_level == 5
//                                                                 ? ''
//                                                                 : goal_level ==
//                                                                         6
//                                                                     ? ''
//                                                                     : '',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w700)),
//                                         TextSpan(
//                                             text: goal_level == 1
//                                                 ? 'written on it, so you\ncan easily identify it.'
//                                                 : goal_level == 2
//                                                     ? 'written on it to help you identify it.'
//                                                     : goal_level == 3
//                                                         ? ''
//                                                         : goal_level == 4
//                                                             ? ''
//                                                             : goal_level == 5
//                                                                 ? ''
//                                                                 : goal_level ==
//                                                                         6
//                                                                     ? ''
//                                                                     : '')
//                                       ])),
//                                 ),
//                                 Container(
//                                   width: AppDimensions.height10(context) * 24.3,
//                                   height: AppDimensions.height10(context) * 4.0,
//                                   margin: EdgeInsets.only(
//                                       top: AppDimensions.height10(context) * 0.8),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       GestureDetector(
//                                         onTap: (() {
//                                           setState(() {
//                                             _showOverlay = false;
//                                           });
//                                         }),
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       AppDimensions.height10(context) *
//                                                           5.0),
//                                               border: Border.all(
//                                                   width:
//                                                       AppDimensions.height10(context) *
//                                                           0.1,
//                                                   color: Color(0xFFFBFBFB))),
//                                           width:
//                                               AppDimensions.height10(context) * 9.60,
//                                           height:
//                                               AppDimensions.height10(context) * 3.2,
//                                           child: Center(
//                                             child: Text(
//                                               'Skip tour',
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   fontFamily: 'Laila',
//                                                   decoration:
//                                                       TextDecoration.none,
//                                                   fontSize:
//                                                       AppDimensions.height10(context) *
//                                                           1.6,
//                                                   color: Color(0xFF8C648A),
//                                                   fontWeight:
//                                                       FontWeight.w700),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           _incrementValue();
//                                           if (goal_level > 7) {
//                                             setState(() {
//                                               _showOverlay = false;
//                                             });
//                                           }
//                                         },
//                                         child: Container(
//                                           width:
//                                               AppDimensions.height10(context) * 11.7,
//                                           height:
//                                               AppDimensions.height10(context) * 4.0,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       AppDimensions.height10(context) *
//                                                           5.0),
//                                               color: Color(0xFF5A4D73)),
//                                           child: Center(
//                                             child: Text(
//                                               goal_level == 2
//                                                   ? '(2/7) Next'
//                                                   : goal_level == 3
//                                                       ? '(3/7) Next'
//                                                       : goal_level == 4
//                                                           ? '(4/7) Next'
//                                                           : goal_level == 5
//                                                               ? '(5/7) Next'
//                                                               : goal_level ==
//                                                                       6
//                                                                   ? '(6/7) Next'
//                                                                   : goal_level ==
//                                                                           7
//                                                                       ? '(7/7) Next'
//                                                                       : goal_level ==
//                                                                               1
//                                                                           ? '(1/7) Next'
//                                                                           : '(7/7) Next',
//                                               style: TextStyle(
//                                                   decoration:
//                                                       TextDecoration.none,
//                                                   fontFamily: 'Laila',
//                                                   fontSize:
//                                                       AppDimensions.height10(context) *
//                                                           1.6,
//                                                   color: Color(0xFFFFFFFF),
//                                                   fontWeight:
//                                                       FontWeight.w600),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )),

  // Container(
  //                   color: Colors.transparent,
  //                   alignment: Alignment.center,
  //                   child: Stack(
  //                     children: [
  //                       Align(
  //                           alignment: goal_level == 2
  //                               ? const Alignment(-0.2, 0.1)
  //                               : goal_level == 3
  //                                   ? const Alignment(-0.2, -0.47)
  //                                   : goal_level == 4
  //                                       ? const Alignment(0.07, -0.68)
  //                                       : goal_level == 5
  //                                           ? const Alignment(0.1, -0.85)
  //                                           : goal_level == 6
  //                                               ? const Alignment(0.25, -0.85)
  //                                               : goal_level == 1
  //                                                   ? const Alignment(
  //                                                       0.1, -0.27)
  //                                                   : const Alignment(
  //                                                       0.12, 0.37),
  //                           child: SimpleTooltip(
  //                             //customShadows: [],
  //                             //  maxHeight: AppDimensions.height10(context) * 23.9,
  //                             maxWidth: AppDimensions.height10(context) * 30.6,
  //                             //  minHeight: AppDimensions.height10(context) * 21.9,
  //                             //minWidth: AppDimensions.height10(context) * 29.6,
  //                             tooltipDirection: goal_level == 1 ||
  //                                     goal_level == 2 ||
  //                                     goal_level == 7
  //                                 ? TooltipDirection.up
  //                                 : TooltipDirection.down,
  //                             arrowTipDistance: 5,
  //                             minimumOutSidePadding: 0,
  //                             // targetCenter: goal_level == 2 ? null : null,
  //                             ballonPadding: const EdgeInsets.all(0),
  //                             arrowLength: AppDimensions.height10(context) * 0.6,
  //                             borderColor: Colors.transparent,
  //                             // content: null,
  //                             //have to initialize from different widgets
  //                             child: SizedBox(
  //                               width: AppDimensions.height10(context) * 1,
  //                               height: AppDimensions.height10(context) * 1,
  //                               child: Container(),
  //                             ),
  //                             show: goal_level > 7 ? false : true,
  //                             // tooltipTap: () {
  //                             //   if (goal_level > 7) {}
  //                             // },

  //                             animationDuration:
  //                                 const Duration(milliseconds: 3),
  //                             content: Container(
  //                               width: AppDimensions.height10(context) * 30.6,
  //                               height: goal_level == 1
  //                                   ? AppDimensions.height10(context) * 20.3
  //                                   : goal_level == 2
  //                                       ? AppDimensions.height10(context) * 20.1
  //                                       : goal_level == 3
  //                                           ? AppDimensions.height10(context) * 16.3
  //                                           : goal_level == 4
  //                                               ? AppDimensions.height10(context) * 18.6
  //                                               : goal_level == 5
  //                                                   ? AppDimensions.height10(context) *
  //                                                       20.6
  //                                                   : goal_level == 6
  //                                                       ? AppDimensions
  //                                                               .height10 *
  //                                                           16.4
  //                                                       : AppDimensions
  //                                                               .height10 *
  //                                                           18.6,
  //                               decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(
  //                                       AppDimensions.height10(context) * 1.0)),
  //                               child: Column(
  //                                 children: [
  //                                   Container(
  //                                     width: AppDimensions.height10(context) * 21.6,
  //                                     //height: AppDimensions.height10(context) * 2.2,
  //                                     margin: EdgeInsets.only(
  //                                         top: AppDimensions.height10(context) * 0.5,
  //                                         left: AppDimensions.height10(context) * 0.5,
  //                                         right: AppDimensions.height10(context) * 7.4),
  //                                     child: Text(
  //                                       goal_level == 2
  //                                           ? 'Your Practice'
  //                                           : goal_level == 3
  //                                               ? 'Time'
  //                                               : goal_level == 4
  //                                                   ? 'Your Schedule'
  //                                                   : goal_level == 5
  //                                                       ? 'Record Practice'
  //                                                       : goal_level == 6
  //                                                           ? 'Your Calendar'
  //                                                           : goal_level == 1
  //                                                               ? 'Your Goal'
  //                                                               : 'Reda',
  //                                       style: TextStyle(
  //                                         decoration: TextDecoration.none,
  //                                         fontFamily: 'Laila',
  //                                         color: const Color(0xFF000000),
  //                                         fontSize:
  //                                             AppDimensions.height10(context) * 1.6,
  //                                         fontWeight: FontWeight.w700,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   Container(
  //                                     width: AppDimensions.height10(context) * 27.4,
  //                                     height: goal_level == 1
  //                                         ? AppDimensions.height10(context) * 11.8
  //                                         : goal_level == 2
  //                                             ? AppDimensions.height10(context) * 11.6
  //                                             : goal_level == 3
  //                                                 ? AppDimensions.height10(context) * 7.8
  //                                                 : goal_level == 4
  //                                                     ? AppDimensions.height10(context) *
  //                                                         10.1
  //                                                     : goal_level == 5
  //                                                         ? AppDimensions
  //                                                                 .height10 *
  //                                                             12.1
  //                                                         : goal_level == 6
  //                                                             ? AppDimensions
  //                                                                     .height10 *
  //                                                                 7.9
  //                                                             : AppDimensions
  //                                                                     .height10 *
  //                                                                 10.1,
  //                                     margin: EdgeInsets.only(
  //                                         top: AppDimensions.height10(context) * 0.3),
  //                                     child: RichText(
  //                                         text: TextSpan(
  //                                             style: TextStyle(
  //                                                 fontWeight: FontWeight.w400,
  //                                                 color:
  //                                                     const Color(0xFF464646),
  //                                                 decoration:
  //                                                     TextDecoration.none,
  //                                                 fontFamily: 'Laila',
  //                                                 fontSize:
  //                                                     AppDimensions.height10(context) *
  //                                                         1.4,
  //                                                 height:
  //                                                     AppDimensions.height10(context) *
  //                                                         0.15),
  //                                             children: [
  //                                           TextSpan(
  //                                             text: goal_level == 1
  //                                                 ? 'This is your own star that you’ve created.\nRemember, '
  //                                                 : goal_level == 2
  //                                                     ? 'Smaller circles that spin around your\nstars are the planets. The '
  //                                                     : goal_level == 3
  //                                                         ? 'This shows the '
  //                                                         : goal_level == 4 ||
  //                                                                 goal_level ==
  //                                                                     6
  //                                                             ? 'This is your '
  //                                                             : goal_level == 5
  //                                                                 ? 'If you want to '
  //                                                                 : 'This is your friend who sends out',
  //                                           ),
  //                                           TextSpan(
  //                                               text: goal_level == 1
  //                                                   ? '‘stars’ '
  //                                                   : goal_level == 2
  //                                                       ? '‘planets’ '
  //                                                       : goal_level == 3
  //                                                           ? 'actual time '
  //                                                           : goal_level == 4
  //                                                               ? 'daily view '
  //                                                               : goal_level ==
  //                                                                       5
  //                                                                   ? 'record a practice session\n'
  //                                                                   : goal_level ==
  //                                                                           6
  //                                                                       ? 'calender '
  //                                                                       : ' helpful\nreminders ',
  //                                               style: const TextStyle(
  //                                                   fontWeight:
  //                                                       FontWeight.w700)),
  //                                           TextSpan(
  //                                               text: goal_level == 1
  //                                                   ? 'are your '
  //                                                   : goal_level == 2
  //                                                       ? 'are\nyour own '
  //                                                       : goal_level == 3
  //                                                           ? 'the practice\nis '
  //                                                           : goal_level == 4
  //                                                               ? 'schedule.\nNavigate here if you want quick access to\nsee all your '
  //                                                               : goal_level ==
  //                                                                       5
  //                                                                   ? 'that it’s not currently scheduled, navigate\nhere. You will see all your '
  //                                                                   : goal_level ==
  //                                                                           6
  //                                                                       ? 'It’s very similar to your schedule. Navigate here if you want to see your '
  //                                                                       : 'and '),
  //                                           TextSpan(
  //                                               text: goal_level == 1
  //                                                   ? 'personal\ngrowth goals. '
  //                                                   : goal_level == 2
  //                                                       ? 'practices '
  //                                                       : goal_level == 3
  //                                                           ? 'scheduled '
  //                                                           : goal_level == 4
  //                                                               ? 'scheduled practices '
  //                                                               : goal_level ==
  //                                                                       5
  //                                                                   ? 'active goals '
  //                                                                   : goal_level ==
  //                                                                           6
  //                                                                       ? 'past '
  //                                                                       : 'messages. ',
  //                                               style: const TextStyle(
  //                                                   fontWeight:
  //                                                       FontWeight.w700)),
  //                                           TextSpan(
  //                                               text: goal_level == 1
  //                                                   ? 'They wil always look bigger and will have '
  //                                                   : goal_level == 2
  //                                                       ? 'that you’ve created to help you progress with your goal. The\n'
  //                                                       : goal_level == 3
  //                                                           ? 'for on that day (centred daily calendar view at the top shows you the actual date).'
  //                                                           : goal_level == 4
  //                                                               ? 'for that day. Scroll left or right to see your\n'
  //                                                               : goal_level ==
  //                                                                       5
  //                                                                   ? 'with its'
  //                                                                   : goal_level ==
  //                                                                           6
  //                                                                       ? 'or'
  //                                                                       : ' You will see\nReda appearing every time you have a new\nnotification with gentle prompts to help\nyou '),
  //                                           TextSpan(
  //                                               text: goal_level == 1
  //                                                   ? 'goal name '
  //                                                   : goal_level == 2
  //                                                       ? 'practice '
  //                                                       : goal_level == 3
  //                                                           ? ''
  //                                                           : goal_level == 4
  //                                                               ? 'schedule '
  //                                                               : goal_level ==
  //                                                                       5
  //                                                                   ? ' assigned practices.'
  //                                                                   : goal_level ==
  //                                                                           6
  //                                                                       ? ' future schedule '
  //                                                                       : 'stay focused.',
  //                                               style: const TextStyle(
  //                                                   fontWeight:
  //                                                       FontWeight.w700)),
  //                                           TextSpan(
  //                                               text: goal_level == 1
  //                                                   ? 'with\n'
  //                                                   : goal_level == 2
  //                                                       ? 'will have a '
  //                                                       : goal_level == 3
  //                                                           ? ''
  //                                                           : goal_level == 4
  //                                                               ? 'for previous or next day.'
  //                                                               : goal_level ==
  //                                                                       5
  //                                                                   ? ' Click on the\npractice you want to record the session\nfor and you’ll be taken to capture it.'
  //                                                                   : goal_level ==
  //                                                                           6
  //                                                                       ? 'for a\ncertain date.'
  //                                                                       : ''),
  //                                           TextSpan(
  //                                               text: goal_level == 1
  //                                                   ? 'identity statement  '
  //                                                   : goal_level == 2
  //                                                       ? 'name '
  //                                                       : goal_level == 3
  //                                                           ? ''
  //                                                           : goal_level == 4
  //                                                               ? ''
  //                                                               : goal_level ==
  //                                                                       5
  //                                                                   ? ''
  //                                                                   : goal_level ==
  //                                                                           6
  //                                                                       ? ''
  //                                                                       : '',
  //                                               style: const TextStyle(
  //                                                   fontWeight:
  //                                                       FontWeight.w700)),
  //                                           TextSpan(
  //                                               text: goal_level == 1
  //                                                   ? 'written on it, so you\ncan easily identify it.'
  //                                                   : goal_level == 2
  //                                                       ? 'written on it to help you identify it.'
  //                                                       : goal_level == 3
  //                                                           ? ''
  //                                                           : goal_level == 4
  //                                                               ? ''
  //                                                               : goal_level ==
  //                                                                       5
  //                                                                   ? ''
  //                                                                   : goal_level ==
  //                                                                           6
  //                                                                       ? ''
  //                                                                       : '')
  //                                         ])),
  //                                   ),
  //                                   Container(
  //                                     width: AppDimensions.height10(context) * 24.3,
  //                                     height: AppDimensions.height10(context) * 4.0,
  //                                     margin: EdgeInsets.only(
  //                                         top: AppDimensions.height10(context) * 0.8),
  //                                     child: Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         GestureDetector(
  //                                           onTap: (() {
  //                                             setState(() {
  //                                               _showOverlay = false;
  //                                             });
  //                                           }),
  //                                           child: Container(
  //                                             decoration: BoxDecoration(
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(
  //                                                         AppDimensions
  //                                                                 .height10 *
  //                                                             5.0),
  //                                                 border: Border.all(
  //                                                     width: AppDimensions
  //                                                             .height10 *
  //                                                         0.1,
  //                                                     color: const Color(
  //                                                         0xFFFBFBFB))),
  //                                             width:
  //                                                 AppDimensions.height10(context) * 9.60,
  //                                             height:
  //                                                 AppDimensions.height10(context) * 3.2,
  //                                             child: Center(
  //                                               child: Text(
  //                                                 'Skip tour',
  //                                                 textAlign: TextAlign.center,
  //                                                 style: TextStyle(
  //                                                     fontFamily: 'Laila',
  //                                                     decoration:
  //                                                         TextDecoration.none,
  //                                                     fontSize: AppDimensions
  //                                                             .height10 *
  //                                                         1.6,
  //                                                     color: const Color(
  //                                                         0xFF8C648A),
  //                                                     fontWeight:
  //                                                         FontWeight.w700),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         GestureDetector(
  //                                           onTap: () {
  //                                             _incrementValue();
  //                                             if (goal_level > 7) {
  //                                               setState(() {
  //                                                 _showOverlay = false;
  //                                               });
  //                                             }
  //                                           },
  //                                           child: Container(
  //                                             width:
  //                                                 AppDimensions.height10(context) * 11.7,
  //                                             height:
  //                                                 AppDimensions.height10(context) * 4.0,
  //                                             decoration: BoxDecoration(
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(
  //                                                         AppDimensions
  //                                                                 .height10 *
  //                                                             5.0),
  //                                                 color:
  //                                                     const Color(0xFF5A4D73)),
  //                                             child: Center(
  //                                               child: Text(
  //                                                 goal_level == 2
  //                                                     ? '(2/7) Next'
  //                                                     : goal_level == 3
  //                                                         ? '(3/7) Next'
  //                                                         : goal_level == 4
  //                                                             ? '(4/7) Next'
  //                                                             : goal_level == 5
  //                                                                 ? '(5/7) Next'
  //                                                                 : goal_level ==
  //                                                                         6
  //                                                                     ? '(6/7) Next'
  //                                                                     : goal_level ==
  //                                                                             7
  //                                                                         ? '(7/7) Next'
  //                                                                         : goal_level == 1
  //                                                                             ? '(1/7) Next'
  //                                                                             : '(7/7) Next',
  //                                                 style: TextStyle(
  //                                                     decoration:
  //                                                         TextDecoration.none,
  //                                                     fontFamily: 'Laila',
  //                                                     fontSize: AppDimensions
  //                                                             .height10 *
  //                                                         1.6,
  //                                                     color: const Color(
  //                                                         0xFFFFFFFF),
  //                                                     fontWeight:
  //                                                         FontWeight.w600),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         )
  //                                       ],
  //                                     ),
  //                                   )
  //                                 ],
  //                               ),
  //                             ),
                            
  //                           )),
  //                     ],
  //                   ),
  //                 ),
             