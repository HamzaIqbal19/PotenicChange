import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/PracticeGoal/Create%20Practice.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReview.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading2.dart';
import '../HomeScreen/HomeScreen.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class GoalFinished extends StatefulWidget {
  const GoalFinished({Key? key}) : super(key: key);

  @override
  State<GoalFinished> createState() => _GoalFinishedState();
}

class _GoalFinishedState extends State<GoalFinished> {
  var goalName;
  var identity;
  var color;
  bool Loading = true;
  String route = '';

  @override
  void initState() {
    super.initState();
    getRoute();
    _fetchGoalNames();
  }

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
          identity = response["identityStatement"][0]["text"];
        });
        loadData();
      } else {
        setState(() {
          Loading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        Loading = false;
      });
      print("error");
    });
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goal_route = prefs.getString('goal_route');
    setState(() {
      route = goal_route!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            actions: [
              Center(
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    height: AppDimensions.height10(context) * 3.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    if (route == 'view_all_goals') {
                      Navigator.pushReplacement(
                          context,
                          FadePageRouteReverse(
                              page: const view_all_goals_menu()));
                    } else {
                      Navigator.pushReplacement(
                        context,
                        FadePageRouteReverse(
                          page: const HomeScreen(
                            login: true,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/CreateGoal.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Loading == false
                  ? Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 10),
                              child: Center(
                                child: GradientText(
                                  AppText().starCreated,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppDimensions.font10(context) * 3,
                                  ),
                                  colors: const [
                                    Color(0xFFFA9934),
                                    Color(0xFFEDD15E),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 2.0,
                            ),
                            Container(
                                child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    AppText().starCreatedBody,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: "LaiLa",
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            Stack(
                              children: [
                                AnimatedScaleButton(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      FadePageRoute(
                                        page: const StarReview(
                                          route: 'goal',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 40.1,
                                    width:
                                        AppDimensions.width10(context) * 40.1,
                                    padding: EdgeInsets.all(
                                        AppDimensions.height10(context) * 3.5),
                                    // decoration: const BoxDecoration(
                                    //     image: DecorationImage(
                                    //         image: AssetImage(
                                    //             'assets/images/anger_5.webp'))),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  4.0),
                                      // padding: EdgeInsets.only(
                                      //     bottom: AppDimensions.height10(context) *
                                      //         10.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
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
                                                                  : '$color' ==
                                                                          '6'
                                                                      ? "assets/images/Blue_gradient.webp"
                                                                      : 'assets/images/orange_moon.webp'),
                                              fit: BoxFit.cover)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.5,
                                          ),
                                          Container(
                                            //color: Colors.red,
                                            // height:
                                            //     AppDimensions.height10(context) *
                                            //         9.0,
                                            width:
                                                AppDimensions.width10(context) *
                                                    24.0,
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    AppDimensions.width10(
                                                            context) *
                                                        2.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "$goalName",
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              2.0,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xff5B74A6)),
                                                ),
                                                SizedBox(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.3,
                                                ),
                                                Container(
                                                  // color: Colors.green,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.0,
                                                  width: AppDimensions.width10(
                                                          context) *
                                                      22.0,
                                                  child: Text('"$identity"',
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.6,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff5B74A6))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.1,
                                          ),
                                          Text('Review',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          2.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.14,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff5B74A6))),
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                4.3,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                    // alignment: Alignment.bottomCenter,
                                    alignment: Alignment(
                                        0.01,
                                        AppDimensions.height10(context) *
                                                0.015 +
                                            1),
                                    //heightFactor: 0.5,
                                    child: Container(
                                      height: AppDimensions.height10(context) *
                                          17.5,
                                      width:
                                          AppDimensions.width10(context) * 17.5,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: AnimatedScaleButton(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            FadePageRoute2(
                                              true,
                                              exitPage: const GoalFinished(),
                                              enterPage: const CreatePractice(),
                                            ),
                                          );
                                        },
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/practice.webp'),
                                          height:
                                              AppDimensions.height10(context) *
                                                  17.5,
                                          width:
                                              AppDimensions.width10(context) *
                                                  17.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        // Positioned(
                        //     bottom: 15,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         SizedBox(
                        //           width: AppDimensions.width10(context) * 1.6,
                        //         ),
                        //         Container(
                        //             // color: Colors.blue,
                        //             width: AppDimensions.width10(context) * 5.0,
                        //             height:
                        //                 AppDimensions.height10(context) * 5.0,
                        //             child: AnimatedScaleButton(
                        //               onTap: () {
                        //                 //  signupSheet(context, "Sign up / login", "login");
                        //               },
                        //               child: Image.asset(
                        //                 "assets/images/Moreactions.webp",
                        //                 fit: BoxFit.contain,
                        //               ),
                        //             )),
                        //       ],
                        //     ))
                      ],
                    )
                  : const Center(
                      child: SpinKitFadingCircle(
                        color: Color(0xFFB1B8FF),
                        size: 80,
                      ),
                    )
            ],
          )),
    );
  }
}
