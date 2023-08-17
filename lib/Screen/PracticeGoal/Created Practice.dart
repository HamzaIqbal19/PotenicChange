import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/PracticeGoal/Create%20Practice.dart';
import 'package:potenic_app/Screen/PracticeGoal/Loaders/created_practice_shimmer.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReview.dart';
import 'package:potenic_app/Screen/ReviewPractice/Activateyourstar.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading2.dart';
import '../Recording Practice Session/dashboardViewgoals.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class PracticeFinished extends StatefulWidget {
  const PracticeFinished({Key? key}) : super(key: key);

  @override
  State<PracticeFinished> createState() => _PracticeFinishedState();
}

class _PracticeFinishedState extends State<PracticeFinished> {
  var goalName;
  var identity;
  var color;
  String pracName = "";
  var pracColor;
  String route = '';
  bool Loading = true;

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
        _fetchPracticeNames();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
      print("error");
    });
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goal_route = prefs.getString('goal_route');
    print("================Route=${prefs.getString('goal_route')}");
    setState(() {
      route = goal_route!;
    });
    print("================Route=$route");
  }

  void _fetchPracticeNames() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        print("---------------------------------");
        setState(() {
          pracName = response["name"];
          pracColor = response["color"];
        });
        loadData();
        print("---------------------------------");
        print("response123:$pracName");
        print("response123:$pracColor");
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
              onPressed: () async {
                if (route == 'view_all_goals') {
                  Navigator.pushReplacement(context,
                      FadePageRoute(page: const veiw_all_goals_menu()));
                } else {
                  Navigator.push(
                    context,
                    FadePageRoute3(
                      exitPage: const PracticeFinished(),
                      enterPage: const CreatePractice(),
                    ),
                  );
                }
                final SharedPreferences prefs = await _prefs;

                await prefs.remove('route');
                // Navigator.pop(context);
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
                  if (route == 'view_all_goals') {
                    Navigator.pushReplacement(context,
                        FadePageRoute(page: const veiw_all_goals_menu()));
                  } else {
                    Navigator.pushReplacement(
                      context,
                      FadePageRoute(
                        page: const HomeScreen(
                          login: true,
                        ),
                      ),
                    );
                  }
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
                  image: AssetImage("assets/images/practicebackground.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Loading == false
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppDimensions.height10(context) * 8.9,
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 20.7,
                        height: AppDimensions.height10(context) * 7.2,
                        // padding: EdgeInsets.only(top: AppDimensions.height10(context) * 10),
                        child: Center(
                          child: GradientText(
                            "Star & planet created! ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              // color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 3,
                            ),
                            colors: [
                              const Color(0xFFFA9934),
                              const Color(0xFFEDD15E).withOpacity(0.90),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.2,
                      ),
                      Container(
                          // color: Colors.black,
                          height: AppDimensions.height10(context) * 5.1,
                          width: AppDimensions.height10(context) * 34.0,
                          child: Column(
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    "Please review and continue ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize:
                                          AppDimensions.height10(context) * 2.2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: AppDimensions.height10(context) * 5.7,
                      ),
                      Stack(
                        children: [
                          AnimatedScaleButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                  page: const StarReview(
                                    route: 'practice',
                                  ),
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
                                    bottom:
                                        AppDimensions.height10(context) * 4.0),
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
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          3.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // color: Colors.red,
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
                                              //  "Control my anger",
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
                                                  // "“I am someone who is in control of my anger”",
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
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
                                                1.0,
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
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Align(
                              // alignment: Alignment.bottomCenter,

                              alignment: const Alignment(0.49, 0.9),
                              //heightFactor: 0.5,
                              child: Container(
                                // height: AppDimensions.height10(context) *17.5,
                                // width:  AppDimensions.height10(context) *17.5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: AnimatedScaleButton(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      FadePageRoute(
                                        page: const PracticeReview(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      height: AppDimensions.height10(context) *
                                          14.7,
                                      width: AppDimensions.height10(context) *
                                          14.7,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage('$pracColor' == '1'
                                            ? "assets/images/Ellipse orange.webp"
                                            : '$pracColor' == '2'
                                                ? 'assets/images/Ellipse 158.webp'
                                                : '$pracColor' == '3'
                                                    ? "assets/images/Ellipse 157.webp"
                                                    : '$pracColor' == '4'
                                                        ? "assets/images/Ellipse light-blue.webp"
                                                        : '$pracColor' == '5'
                                                            ? "assets/images/Ellipse blue.webp"
                                                            : 'assets/images/Ellipse 158.webp'),
                                      )),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            //color: Colors.red,
                                            width: AppDimensions.height10(
                                                    context) *
                                                11.8,
                                            child: Column(
                                              children: [
                                                Text(
                                                  pracName,
                                                  //  "Meditation",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xFFFBFBFB),
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.8,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.0,
                                                ),
                                                Text('Review',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFFFBFBFB))),
                                                SizedBox(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.5,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.0,
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 13.7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              // color: Colors.blue,
                              width: AppDimensions.height10(context) * 5.0,
                              height: AppDimensions.height10(context) * 5.0,
                              child: Image.asset(
                                "assets/images/Moreactions.webp",
                                fit: BoxFit.contain,
                              )),
                          AnimatedScaleButton(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                    page: const ActivateStar(),
                                  ));
                            },
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
                                      Color(0xFFFCC10D),
                                      Color(0xFFFDA210)
                                    ]),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const Center(
                    child: SpinKitFadingCircle(
                      color: Color(0xFFB1B8FF),
                      size: 80,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
