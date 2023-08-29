import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/review_habits_dashboard/dashboard.dart';
import 'package:potenic_app/Screen/ReviewPractice/loader/activateStar_shimmer.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../HomeScreen/HomeScreen.dart';

class ActivateStar extends StatefulWidget {
  const ActivateStar({Key? key}) : super(key: key);

  @override
  State<ActivateStar> createState() => _ActivateStarState();
}

class _ActivateStarState extends State<ActivateStar> {
  var goalName;
  var identity;
  var color;
  String pracName = "";
  var pracColor;
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
        _fetchPracticeNames();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
      print("error");
    });
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
    return Scaffold(
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
                    builder: (context) => const HomeScreen(
                      login: true,
                    ),
                  ),
                );
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
                image: AssetImage("assets/images/Activatestarbg.webp"),
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
                    SizedBox(
                      width: AppDimensions.height10(context) * 28.3,
                      height: AppDimensions.height10(context) * 7.2,
                      // padding: EdgeInsets.only(top: AppDimensions.height10(context) * 10),
                      child: Center(
                        child: GradientText(
                          "Activate your star ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            // color: Colors.white,
                            fontSize: AppDimensions.height10(context) * 3,
                          ),
                          colors: [
                            const Color(0xFFFFFFFF),
                            const Color(0xFFFFFFFF).withOpacity(0.90),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 2.5,
                    ),
                    SizedBox(
                        // color: Colors.black,
                        height: AppDimensions.height10(context) * 13.2,
                        width: AppDimensions.height10(context) * 35.7,
                        child: Column(
                          children: [
                            Container(
                              child: Center(
                                child: Text(
                                  "I desire to grow and improve my identity. By activating my star, I will be able to evaluate my chosen practice every 20 active days and evaluate my active goal progress monthly. ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: AppDimensions.height10(context) * 3.6,
                    ),
                    Stack(
                      children: [
                        Container(
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
                                bottom: AppDimensions.height10(context) * 4.0),
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
                                Container(
                                  width: AppDimensions.height10(context) * 24.0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppDimensions.height10(context) *
                                              2.0),
                                  child: Text(
                                    "$goalName",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 0.3,
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 22.0,
                                  //height: AppDimensions.height10(context)*4.0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppDimensions.height10(context) *
                                              2.0),
                                  child: Text('"$identity"',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff5B74A6))),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 1.0,
                                ),
                                /*
                                Text('Review',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff5B74A6))),
                             */
                              ],
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
                            alignment: Alignment(0.01,
                                AppDimensions.height10(context) * 0.016 + 0.9),
                            //heightFactor: 0.5,
                            child: Container(
                              // height: AppDimensions.height10(context)*17.5,
                              // width:  AppDimensions.height10(context)*17.5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: AnimatedScaleButton(
                                onTap: () {
                                  PracticeGoalApi()
                                      .updateUserPractice_GoalStatus('active')
                                      .then((response) {
                                    if (response == true) {
                                      print("Success");

                                      Navigator.push(
                                        context,
                                        FadePageRoute2(
                                          true,
                                          exitPage: const ActivateStar(),
                                          enterPage:
                                              const view_goals(missed: false),
                                        ),
                                      );
                                    } else if (response == 400) {
                                      print('max goals');
                                      Navigator.push(
                                        context,
                                        FadePageRoute2(
                                          true,
                                          exitPage: const ActivateStar(),
                                          enterPage:
                                              const view_goals(missed: false),
                                        ),
                                      );
                                      showAnimatedDialog(
                                          animationType:
                                              DialogTransitionType.fadeScale,
                                          curve: Curves.easeInOut,
                                          duration: const Duration(seconds: 1),
                                          context: context,
                                          builder: (BuildContext context) =>
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    27.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    23.6,
                                                child: AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4)),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  actionsPadding:
                                                      EdgeInsets.zero,
                                                  titlePadding: EdgeInsets.zero,
                                                  title: Container(
                                                      margin: EdgeInsets.only(
                                                          top: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.9,
                                                          bottom: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.2),
                                                      height:
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              4.4,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          23.8,
                                                      child: Center(
                                                        child: Text(
                                                          'Maximum active goal limit\nreached',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.7,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      )),
                                                  content: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.5,
                                                        left: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.6,
                                                        right: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.6),
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            23.8,
                                                    child: Text(
                                                      "You can't start this goal because you\nalready have the maximum  active\ngoals. You must stop one of your active\ngoals to start a new one.",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.3,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.1,
                                                          child: Divider(
                                                            color: const Color(
                                                                    0XFF3C3C43)
                                                                .withOpacity(
                                                                    0.29),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              4.2,
                                                          width:
                                                              double.infinity,
                                                          child: TextButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  FadePageRoute(
                                                                      page:
                                                                          const veiw_all_goals_menu()));
                                                            },
                                                            child: Text(
                                                              'View goal',
                                                              style: TextStyle(
                                                                color: const Color(
                                                                    0xFF007AFF),
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.7,
                                                                fontFamily:
                                                                    "Laila",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.1,
                                                          child: Divider(
                                                            color: const Color(
                                                                    0XFF3C3C43)
                                                                .withOpacity(
                                                                    0.29),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              4.4,
                                                          width:
                                                              double.infinity,
                                                          child: TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'Exit',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      AppDimensions.height10(
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
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.1,
                                                          child: Divider(
                                                            color: const Color(
                                                                    0XFF3C3C43)
                                                                .withOpacity(
                                                                    0.29),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ));
                                    } else {
                                      print("Failure");

                                      // const ScaffoldMessenger(
                                      //     child: Text('Goal status not changed'));
                                    }
                                  });

                                  //  dashboard_sheet(context);
                                },
                                child: Container(
                                  width: AppDimensions.height10(context) * 16,
                                  height: AppDimensions.height10(context) * 16,
                                  padding: EdgeInsets.all(
                                      AppDimensions.height10(context) * 0.5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width:
                                              AppDimensions.height10(context) *
                                                  0.3,
                                          color: Colors.white)),
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 14.7,
                                    width:
                                        AppDimensions.height10(context) * 14.7,
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
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.1,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  AppDimensions.height10(
                                                          context) *
                                                      2.0),
                                          // width:
                                          //     AppDimensions.height10(context) * 12.8,

                                          child: Text(
                                            pracName,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: const Color(0xFFFBFBFB),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.3,
                                        ),
                                        Image(
                                          image: const AssetImage(
                                              'assets/images/ic_fingerprint.webp'),
                                          width:
                                              AppDimensions.height10(context) *
                                                  6.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  6.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 1.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            // color: Colors.black,

                            height: AppDimensions.height10(context) * 5.4,
                            width: AppDimensions.height10(context) * 27.4,
                            child: Column(
                              children: [
                                Container(
                                  child: Center(
                                    child: Text(
                                      "To begin your journey\npress and hold here.  ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
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
    );
  }
}

void dashboard_sheet(context) {
  bool hide = true;
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    enableDrag: false,
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
              color: const Color(0xFFF5F5F5)),
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      FadePageRoute(
                        page: const dashBoard(
                          helpful_tips: true,
                          membership: true,
                          dashboard_ctrl: false,
                          cancel: false,
                          trial: false,
                          saved: false,
                        ),
                      ),
                    );
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
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.5,
                    bottom: AppDimensions.height10(context) * 2.0),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.height10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 30.7,
                height: AppDimensions.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'Welcome to\nyour Dashboard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.12,
                      fontSize: AppDimensions.height10(context) * 2.8,
                      //letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  //  width: AppDimensions.height10(context) * 33.2,
                  //  height: AppDimensions.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.1),
                  child: Center(
                    child: Text(
                      'This is a one-stop place to manage your\npersonal development journey. From\nDashboard, you can quickly navigate to\nyour goals, view your practices, record\nhurdles and inspirations.\n\nHave a tour of what’s available to you\nand how you can access the tools that\nare important to your personal growth.\n\nWe look forward to supporting you.\nEnjoy your journey :)',
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          // letterSpacing: AppDimensions.height10(context) * 0.2,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF437296)),
                    ),
                  )),
            ],
          )),
    ),
  );
}

void login_sheet(context) {
  bool hide = true;
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
          height: AppDimensions.height10(context) * 54.4,
          // margin: EdgeInsets.only(
          //     left: AppDimensions.height10(context) * 1.0,
          //     right: AppDimensions.height10(context) * 1.0,
          //     bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.height10(context) * 2.0)),
              color: const Color(0xFFF5F5F5)),
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
                child: GestureDetector(
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
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.5,
                    bottom: AppDimensions.height10(context) * 2.0),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.height10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 30.7,
                height: AppDimensions.height10(context) * 3.4,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'Login to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.12,
                      fontSize: AppDimensions.height10(context) * 2.8,
                      //letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  //  width: AppDimensions.height10(context) * 33.2,
                  height: AppDimensions.height10(context) * 20.1,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.2),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.4,
                            height: AppDimensions.height10(context) * 0.13,
                            fontFamily: 'laila',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF437296),
                          ),
                          children: const [
                            TextSpan(text: 'In order to '),
                            TextSpan(
                                text: 'activate your star ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(text: 'and view your\n'),
                            TextSpan(
                                text: 'Dashboard ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    ", you need to create an account or login in.\nYou’ve already completed a big step in setting and\ndefining your vision for better-self.\n\nYou have goal and practice set up. One more step and\nyou can access other tools that are available to you to\nhelp you in your personal growth journey :)\n\nVisit your "),
                            TextSpan(
                                text: 'Dashboard ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'now without losing any\nprogress you’ve made so far.  ')
                          ]))),
              Container(
                width: AppDimensions.height10(context) * 28.0,
                margin: EdgeInsets.only(
                    left: AppDimensions.height10(context) * 1.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 13.0,
                      height: AppDimensions.height10(context) * 5.0,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0),
                          color: const Color(0xFFFBFBFB)),
                      child: Center(
                        child: Text(
                          'I’m new here',
                          style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF8C648A),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 13.0,
                      height: AppDimensions.height10(context) * 5.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0),
                          color: const Color(0xFF5A4D73)),
                      child: Center(
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFBFBFB),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    ),
  );
}

class maxActivation extends StatelessWidget {
  const maxActivation({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAnimatedDialog(
          animationType: DialogTransitionType.fadeScale,
          curve: Curves.easeInOut,
          duration: const Duration(seconds: 1),
          context: context,
          builder: (BuildContext context) => SizedBox(
                width: AppDimensions.height10(context) * 27.0,
                height: AppDimensions.height10(context) * 23.6,
                child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  actionsPadding: EdgeInsets.zero,
                  titlePadding: EdgeInsets.zero,
                  title: Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.9,
                          right: AppDimensions.height10(context) * 1.6,
                          left: AppDimensions.height10(context) * 1.6,
                          bottom: AppDimensions.height10(context) * 0.2),
                      height: AppDimensions.height10(context) * 2.2,
                      width: AppDimensions.height10(context) * 23.8,
                      child: RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                  fontSize: 1.7,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF000000)),
                              children: [
                            TextSpan(text: 'Are you sure you want to'),
                            TextSpan(
                              text: ' delete ',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(text: 'this inspiration?')
                          ]))),
                  content: Container(
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 1.5,
                        left: AppDimensions.height10(context) * 1.6,
                        right: AppDimensions.height10(context) * 1.6),
                    height: AppDimensions.height10(context) * 3.4,
                    width: AppDimensions.height10(context) * 23.8,
                    child: Text(
                      "By clicking 'Yes' you confirm that this\ninspiration will be deleted permanently. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height: AppDimensions.height10(context) * 0.1,
                          child: Divider(
                            color: const Color(0XFF3C3C43).withOpacity(0.29),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 4.2,
                          width: double.infinity,
                          color: const Color(0xFF007AFF),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'No',
                              style: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize:
                                      AppDimensions.height10(context) * 1.7,
                                  fontFamily: "Laila",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 0.1,
                          child: Divider(
                            color: const Color(0XFF3C3C43).withOpacity(0.29),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 4.4,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.7,
                                  fontFamily: "Laila",
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF007AFF)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 0.1,
                          child: Divider(
                            color: const Color(0XFF3C3C43).withOpacity(0.29),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
