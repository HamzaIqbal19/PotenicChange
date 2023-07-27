import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/CreateGoal/Loaders/goal_finished_shimmer.dart';
import 'package:potenic_app/Screen/CreateGoal/StartProcess.dart';
import 'package:potenic_app/Screen/PracticeGoal/Create%20Practice.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReview.dart';
import 'package:potenic_app/Widgets/SignupBottomSheet.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading2.dart';

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

  @override
  void initState() {
    super.initState();
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
        print(goalName);
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
                      FadePageRoute3(
                          enterPage: StartProcess(), exitPage: GoalFinished()));
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
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/finalGoal.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Loading == false
                  ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 10),
                          child: Center(
                            child: GradientText(
                              "Star Created!",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                // color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 3,
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
                            // color: Colors.black,
                            // height: AppDimensions.height10(context) * 21.8,
                            width: AppDimensions.height10(context) * 34.0,
                            child: Column(
                              children: [
                                Container(
                                  child: Center(
                                    child: Text(
                                      "You’ve created your first personal \n development goal and have taken the initial \n key steps towards self-fulfilment. \n \n Now, let’s create a practice to help you \n achieve this goal. You’ll be able to assess \n  how effective it’s been for you and if it’s not  working, you can change it to another \n practice. ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontFamily: "LaiLa",
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                      ),
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
                                  FadePageRoute2(
                                    true,
                                    exitPage: GoalFinished(),
                                    enterPage: const StarReview(),
                                  ),
                                );
                              },
                              child: Container(
                                height: AppDimensions.height10(context) * 38.1,
                                width: AppDimensions.height10(context) * 38.1,
                                padding: EdgeInsets.all(
                                    AppDimensions.height10(context) * 3.5),
                                // decoration: const BoxDecoration(
                                //     image: DecorationImage(
                                //         image: AssetImage(
                                //             'assets/images/anger_5.webp'))),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
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
                                                              : '$color' == '6'
                                                                  ? "assets/images/Blue_gradient.webp"
                                                                  : 'assets/images/orange_moon.webp'))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.5,
                                      ),
                                      Container(
                                        //color: Colors.red,
                                        // height:
                                        //     AppDimensions.height10(context) *
                                        //         9.0,
                                        width: AppDimensions.height10(context) *
                                            24.0,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppDimensions.height10(
                                                    context) *
                                                2.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "$goalName",
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
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
                                                  color:
                                                      const Color(0xff5B74A6)),
                                            ),
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.3,
                                            ),
                                            Container(
                                              // color: Colors.green,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.0,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  22.0,
                                              child: Text('"$identity"',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.1,
                                      ),
                                      Text('Review',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.14,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff5B74A6))),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
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
                                    AppDimensions.height10(context) * 0.015 +
                                        1),
                                //heightFactor: 0.5,
                                child: Container(
                                  height:
                                      AppDimensions.height10(context) * 17.5,
                                  width: AppDimensions.height10(context) * 17.5,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: AnimatedScaleButton(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        FadePageRoute2(
                                          true,
                                          exitPage: GoalFinished(),
                                          enterPage: const CreatePractice(),
                                        ),
                                      );
                                    },
                                    child: Image(
                                      image: const AssetImage(
                                          'assets/images/practice.webp'),
                                      height: AppDimensions.height10(context) *
                                          17.5,
                                      width: AppDimensions.height10(context) *
                                          17.5,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 6.16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppDimensions.height10(context) * 1.6,
                            ),
                            Container(
                                // color: Colors.blue,
                                width: AppDimensions.height10(context) * 5.0,
                                height: AppDimensions.height10(context) * 5.0,
                                child: AnimatedScaleButton(
                                  onTap: () {
                                    //  signupSheet(context, "Sign up / login", "login");
                                  },
                                  child: Image.asset(
                                    "assets/images/Moreactions.webp",
                                    fit: BoxFit.contain,
                                  ),
                                )),
                          ],
                        )
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
