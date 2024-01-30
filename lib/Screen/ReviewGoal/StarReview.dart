import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal%20Finished.dart';
import 'package:potenic_app/Screen/PracticeGoal/Created%20Practice.dart';
import 'package:potenic_app/Screen/Your_goals/add_your_practice.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../Widgets/animatedButton.dart';
import '../CreateGoal/Goal-Visualising.dart';
import '../CreateGoal/Goal-Why.dart';
import '../CreateGoal/GoalName.dart';
import '../CreateGoal/Goal_Identity.dart';
import '../HomeScreen/HomeScreen.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class StarReview extends StatefulWidget {
  final String route;
  const StarReview({Key? key, required this.route}) : super(key: key);

  @override
  State<StarReview> createState() => _StarReviewState();
}

bool color1 = false;
bool color2 = false;
bool color3 = false;
bool color4 = false;
bool color5 = false;
bool color6 = false;

class _StarReviewState extends State<StarReview> {
  var goalName;
  var reason;

  var identity;
  var visualize;
  var color;
  bool Loading = true;
  late FocusNode _focusNode;
  String route = '';
  @override
  void initState() {
    _focusNode = FocusNode()..addListener(_onFocus);
    super.initState();
    _fetchGoalNames();
  }

  void _onFocus() {
    setState(() {});
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goal_route = prefs.getString('goal_route');
    setState(() {
      route = goal_route!;
    });
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          Loading = false;
          goalName = response["name"];
          reason = response["reason"];
          color = response["color"];
          identity = response["identityStatement"];
          visualize = response["visualizingYourSelf"];
        });
      } else {
        setState(() {
          Loading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        Loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (route == 'view_all_goals') {
          Navigator.pushReplacement(
              context, FadePageRouteReverse(page: const view_all_goals_menu()));
        } else if (widget.route == 'goal') {
          Navigator.push(
              context, FadePageRouteReverse(page: const GoalFinished()));
        } else if (widget.route == 'menu') {
          Navigator.push(
              context,
              FadePageRouteReverse(
                  page: const goal_menu_inactive(
                goal_evaluation: true,
                isActive: true,
              )));
        } else if (widget.route == 'goal_menu') {
          Navigator.push(
              context,
              FadePageRouteReverse(
                  page: const goal_menu_inactive(
                goal_evaluation: false,
                isActive: false,
              )));
        } else if (widget.route == '') {
          Navigator.push(
              context, FadePageRouteReverse(page: const GoalFinished()));
        } else if (widget.route == 'add_your_practice') {
          Navigator.push(
              context,
              FadePageRouteReverse(
                  page: add_your_practice(
                goalName: goalName,
              )));
        } else {
          Navigator.push(
              context, FadePageRouteReverse(page: const PracticeFinished()));
        }
        final SharedPreferences prefs = await _prefs;

        await prefs.remove('route');
        return Future.value(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          leading: Center(
            // alignment: Alignment.center,
            child: Loading == false
                ? IconButton(
                    icon: Image.asset(
                      'assets/images/Back.webp',
                      // width: AppDimensions.width10(context) * 3,
                      height: AppDimensions.height10(context) * 3,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      if (widget.route == 'goal') {
                        Navigator.push(context,
                            FadePageRouteReverse(page: const GoalFinished()));
                      } else if (widget.route == 'menu') {
                        Navigator.push(
                            context,
                            FadePageRouteReverse(
                                page: const goal_menu_inactive(
                              goal_evaluation: true,
                              isActive: true,
                            )));
                      } else if (widget.route == 'goal_menu') {
                        Navigator.push(
                            context,
                            FadePageRouteReverse(
                                page: const goal_menu_inactive(
                              goal_evaluation: false,
                              isActive: false,
                            )));
                      } else if (widget.route == 'add_your_practice') {
                        Navigator.push(
                            context,
                            FadePageRouteReverse(
                                page: add_your_practice(
                              goalName: goalName,
                            )));
                      } else if (widget.route == '') {
                        Navigator.push(context,
                            FadePageRouteReverse(page: const GoalFinished()));
                      } else {
                        Navigator.push(
                            context,
                            FadePageRouteReverse(
                                page: const PracticeFinished()));
                      }

                      //Navigator.pop(context);

                      // Add code for performing close action
                    },
                  )
                : Container(),
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
                    //reverse: true,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppDimensions.height10(context) * 5.5,
                        ),
                        Text(
                          "Review",
                          style: TextStyle(
                              color: const Color(0xFF5B74A6),
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimensions.font10(context) * 2.0),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 2.0,
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 10.2,
                          height: AppDimensions.height10(context) * 11.2,
                          padding: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.0),
                          // decoration: const BoxDecoration(
                          //     image: DecorationImage(
                          //         image: AssetImage(
                          //             "assets/images/anger_5.webp"))),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 2.0,
                                right: AppDimensions.width10(context) * 2.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('$color' == '1' ||
                                            color1 == true
                                        ? "assets/images/red_gradient.webp"
                                        : '$color' == '2' || color2 == true
                                            ? 'assets/images/orange_moon.webp'
                                            : '$color' == '3' || color3 == true
                                                ? "assets/images/lightGrey_gradient.webp"
                                                : '$color' == '4' ||
                                                        color4 == true
                                                    ? "assets/images/lightBlue_gradient.webp"
                                                    : '$color' == '5' ||
                                                            color5 == true
                                                        ? "assets/images/medBlue_gradient.webp"
                                                        : '$color' == '6' ||
                                                                color6 == true
                                                            ? "assets/images/Blue_gradient.webp"
                                                            : 'assets/images/orange_moon.webp'))),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 0.6,
                        ),
                        Center(
                          child: Text(
                            "Star Details",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF437296),
                              fontSize: AppDimensions.font10(context) * 3.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 0.7,
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 2.2,
                          width: AppDimensions.width10(context) * 23.9,
                          child: Center(
                            child: Text(
                              "Review your summary here.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF5B74A6)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 3.4,
                        ),
                        Container(
                            width: AppDimensions.width10(context) * 38.2,
                            //height: AppDimensions.height10(context) * 40.6,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.white,
                                    width:
                                        AppDimensions.width10(context) * 0.2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // height:
                                  //     AppDimensions.height10(context) * 39.5,
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
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.7,
                                            width:
                                                AppDimensions.width10(context) *
                                                    30.5,

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
                                            onTap: () async {
                                              Navigator.push(
                                                context,
                                                FadePageRoute(
                                                  page: GoalName(
                                                    saved: false,
                                                    route: widget.route,
                                                    catId,
                                                    comingFromEditScreen: true,
                                                  ),
                                                ),
                                              );
                                              final SharedPreferences prefs =
                                                  await _prefs;
                                              await prefs.setString(
                                                  'goalName', goalName);
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
                                                2.3,
                                        // width: AppDimensions.width10(context) *
                                        //     23.9,
                                        child: Center(
                                          child: Text(
                                            "Your Goal Name",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    2.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.15,
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
                                        width: AppDimensions.width10(context) *
                                            36.0,
                                        padding: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                1.3,
                                            bottom: 1,
                                            left: AppDimensions.height10(
                                                    context) *
                                                2,
                                            right: AppDimensions.height10(
                                                context)),
                                        decoration: BoxDecoration(
                                            gradient: _focusNode.hasFocus
                                                ? const LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                        Color(0xFFEFBEB2),
                                                        Color(0xFFEAA897)
                                                      ])
                                                : const LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                        Color(0xFFEECDC5),
                                                        Color(0xFFF6E0DB)
                                                      ]),
                                            // color: Colors.white,

                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                goalName != null
                                                    ? "$goalName"
                                                    : "Control my anger",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: _focusNode.hasFocus
                                                      ? const Color(0xFFFFFFFF)
                                                      : const Color(0xFFFFFFFF),
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          2.2,
                                                )),
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  2,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        width: AppDimensions.width10(context) *
                                            23.9,
                                        child: Center(
                                          child: Text(
                                            "Select colour",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
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
                                        width: AppDimensions.width10(context) *
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
                                                        AdminGoal()
                                                            .updateUserGoalColor(
                                                                '1')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                          } else {}
                                                        }).catchError(
                                                                (error) {});
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width:
                                                          AppDimensions.width10(
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
                                                                    .width10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .width10(
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
                                                                "assets/images/red_gradient.webp"),
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        AppDimensions.width10(
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
                                                        // #FFFEE8, #F9B410
                                                        AdminGoal()
                                                            .updateUserGoalColor(
                                                                '2')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                          } else {}
                                                        }).catchError(
                                                                (error) {});
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width:
                                                          AppDimensions.width10(
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
                                                                    .width10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .width10(
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
                                                                "assets/images/orange_moon.webp"),
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        AppDimensions.width10(
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
                                                        AdminGoal()
                                                            .updateUserGoalColor(
                                                                '3')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                          } else {}
                                                        }).catchError(
                                                                (error) {});
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width:
                                                          AppDimensions.width10(
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
                                                                    .width10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .width10(
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
                                                                "assets/images/lightGrey_gradient.webp"),
                                                            fit: BoxFit
                                                                .fitHeight,
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
                                                        AdminGoal()
                                                            .updateUserGoalColor(
                                                                '4')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                          } else {}
                                                        }).catchError(
                                                                (error) {});
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width:
                                                          AppDimensions.width10(
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
                                                                    .width10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .width10(
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
                                                                "assets/images/lightBlue_gradient.webp"),
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        AppDimensions.width10(
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
                                                        // #FFFFFF, #9CAAF8
                                                        AdminGoal()
                                                            .updateUserGoalColor(
                                                                '5')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                          } else {}
                                                        }).catchError(
                                                                (error) {});
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width:
                                                          AppDimensions.width10(
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
                                                                    .width10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .width10(
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
                                                                "assets/images/medBlue_gradient.webp"),
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        AppDimensions.width10(
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
                                                        color5 = false;
                                                        color6 = true;
                                                      });
                                                      if (color6 == true) {
                                                        // #C6CFF0, #6181F2
                                                        AdminGoal()
                                                            .updateUserGoalColor(
                                                                '6')
                                                            .then((response) {
                                                          if (response ==
                                                              true) {
                                                          } else {}
                                                        }).catchError(
                                                                (error) {});
                                                      }
                                                    },
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.0,
                                                      width:
                                                          AppDimensions.width10(
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
                                                            color: color6
                                                                ? const Color(
                                                                    0xFFE69662)
                                                                : Colors
                                                                    .transparent,
                                                            width: AppDimensions
                                                                    .width10(
                                                                        context) *
                                                                0.3),
                                                      ),
                                                      child: Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            5.0,
                                                        width: AppDimensions
                                                                .width10(
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
                                                                "assets/images/Blue_gradient.webp"),
                                                            fit: BoxFit
                                                                .fitHeight,
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
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                3.0,
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
                            width: AppDimensions.width10(context) * 38.2,
                            // height: AppDimensions.height10(context) * 49.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.white,
                                    width:
                                        AppDimensions.width10(context) * 0.2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // height:
                                  //     AppDimensions.height10(context) * 50.5,
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
                                          AnimatedScaleButton(
                                            onTap: () {},
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.7,
                                              width: AppDimensions.width10(
                                                      context) *
                                                  30.5,

                                              // color: Colors.blue,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/reviewsearch.webp"),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(width: ),
                                          AnimatedScaleButton(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                FadePageRoute(
                                                  page: GoalWhy(
                                                    route: widget.route,
                                                    // catId,
                                                    comingFromEditScreen: true,
                                                    saved: false,
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
                                        width:
                                            AppDimensions.width10(context) * 24,
                                        child: Center(
                                          child: Text(
                                            "Your reasons ‘Why’",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.12,
                                                fontSize: AppDimensions.font10(
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
                                      ListView.builder(
                                          itemCount: reason.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return Column(children: [
                                              inner_text2('Reason ${index + 1}',
                                                  '${reason[index]['text']}'),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                    context),
                                              )
                                            ]);
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: AppDimensions.height10(context) * 3.1,
                        ),
                        Container(
                            width: AppDimensions.width10(context) * 38.2,
                            // height: AppDimensions.height10(context) * 24.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.white,
                                    width:
                                        AppDimensions.width10(context) * 0.2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // height: AppDimensions.height10(context) * 24,
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
                                            width:
                                                AppDimensions.width10(context) *
                                                    30.5,

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
                                                FadePageRoute(
                                                  page: Goal_Identity(
                                                    route: widget.route,
                                                    saved: false,
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
                                        width: AppDimensions.width10(context) *
                                            30.9,
                                        child: Center(
                                          child: Text(
                                            "Your New identity Statement",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.12,
                                                fontSize: AppDimensions.font10(
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
                                      ListView.builder(
                                          itemCount: identity.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return Column(children: [
                                              inner_text2(
                                                  'Statement ${index + 1}',
                                                  '${identity[index]['text']}'),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                    context),
                                              )
                                            ]);
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: AppDimensions.height10(context) * 3.1,
                        ),
                        Container(
                            width: AppDimensions.width10(context) * 38.2,
                            //height: AppDimensions.height10(context) * 24.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.white,
                                    width:
                                        AppDimensions.width10(context) * 0.2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // height: AppDimensions.height10(context) * 24,
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
                                            width:
                                                AppDimensions.width10(context) *
                                                    30.5,

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
                                                FadePageRoute(
                                                  page: Visualising(
                                                    route: widget.route,
                                                    saved: false,
                                                    // catId,
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
                                        width: AppDimensions.width10(context) *
                                            30.9,
                                        child: Center(
                                          child: Text(
                                            "Your ‘New self’",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.12,
                                                fontSize: AppDimensions.font10(
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
                                      ListView.builder(
                                          itemCount: visualize.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return Column(children: [
                                              inner_text2(
                                                  'Statement ${index + 1}',
                                                  '${visualize[index]['text']}'),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                    context),
                                              )
                                            ]);
                                          }),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                // color: Colors.blue,
                                width: AppDimensions.width10(context) * 5.0,
                                height: AppDimensions.height10(context) * 5.0,
                                child: AnimatedScaleButton(
                                  onTap: () {
                                    // signupSheet(
                                    //     context, "Sign up / login", "login");
                                  },
                                  child: Image.asset(
                                    "assets/images/Moreactions.webp",
                                    fit: BoxFit.contain,
                                  ),
                                )),
                            AnimatedScaleButton(
                              onTap: () => showAnimatedDialog(
                                animationType: DialogTransitionType.fadeScale,
                                curve: Curves.easeInOut,
                                duration: const Duration(seconds: 1),
                                context: context,
                                builder: (BuildContext context) => SizedBox(
                                  width: AppDimensions.width10(context) * 27.0,
                                  height:
                                      AppDimensions.height10(context) * 24.6,
                                  child: AlertDialog(
                                    actionsPadding: const EdgeInsets.all(0.0),
                                    contentPadding: const EdgeInsets.all(0.0),
                                    titlePadding: const EdgeInsets.all(0.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                1.4)),
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
                                      // height:
                                      //     AppDimensions.height10(context) * 4.4,
                                      width:
                                          AppDimensions.width10(context) * 23.8,
                                      child: Text.rich(
                                        style: TextStyle(
                                            fontFamily: 'Laila',
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.14),
                                        textAlign: TextAlign.center,
                                        TextSpan(
                                          text: 'Are you sure you want\n to ',
                                          style: TextStyle(
                                            color: const Color(0xFF000000),
                                            fontSize:
                                                AppDimensions.font10(context) *
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
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.9,
                                                  fontWeight: FontWeight.w700,
                                                )),

                                            TextSpan(
                                                text: 'this goal?',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF000000),
                                                  fontSize:
                                                      AppDimensions.font10(
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
                                      // height:
                                      //     AppDimensions.height10(context) * 6.8,
                                      width:
                                          AppDimensions.width10(context) * 23.8,
                                      child: Text(
                                        "By clicking 'Yes' you confirm that this\ngoal will be deleted and all your data\nthat relates to this goal won't be\nrecoverable. ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.5,
                                          fontFamily: "Laila",
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.14,
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
                                                        AppDimensions.font10(
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
                                            width:
                                                AppDimensions.width10(context) *
                                                    27.0,
                                            child: TextButton(
                                              onPressed: () {
                                                AdminGoal()
                                                    .deleteUserGoal()
                                                    .then((response) async {
                                                  if (response == true) {
                                                    if (route ==
                                                            'view_all_goals' ||
                                                        widget.route ==
                                                            'menu' ||
                                                        widget.route ==
                                                            'add_your_practice') {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          FadePageRoute(
                                                              page:
                                                                  const view_all_goals_menu()));
                                                    } else {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          FadePageRoute(
                                                              page:
                                                                  const HomeScreen(
                                                            login: true,
                                                          )));
                                                    }
                                                  } else if (response ==
                                                      false) {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        FadePageRoute(
                                                            page:
                                                                const HomeScreen(
                                                          login: true,
                                                        )));
                                                  }
                                                }).catchError((error) {});
                                              },
                                              child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
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
                                width: AppDimensions.width10(context) * 31.3,
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
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/bin.webp",
                                      height:
                                          AppDimensions.width10(context) * 1.2,
                                      width:
                                          AppDimensions.width10(context) * 1.4,
                                    ),
                                    SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 1.4,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.3,
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  1.3),
                                      child: Text(
                                        "Delete Goal",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.white,
                                          // height: AppDimensions.height10*0.1,
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w700,
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

  const inner_text1(this.circle_text, {super.key});

  @override
  State<inner_text1> createState() => _inner_text1State();
}

class _inner_text1State extends State<inner_text1> {
  final TextEditingController body_text = TextEditingController();

  final TextEditingController heading_text = TextEditingController();

  late FocusNode _focusNode;

  @override
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
      width: AppDimensions.width10(context) * 36.0,
      padding: EdgeInsets.only(
          top: AppDimensions.height10(context) * 2,
          bottom: 1,
          left: AppDimensions.width10(context),
          right: AppDimensions.width10(context) * 6.0),
      decoration: BoxDecoration(
          gradient: _focusNode.hasFocus
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEFBEB2), Color(0xFFEAA897)])
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
              width: AppDimensions.width10(context) * 26.9,
              child: Text("Control my anger",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: _focusNode.hasFocus
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFFFFFFFF),
                    fontSize: AppDimensions.font10(context) * 2.2,
                  ))),
        ],
      ),
    );
  }
}

class inner_text2 extends StatefulWidget {
  final String circle_text;
  final String panel_Text;

  const inner_text2(this.circle_text, this.panel_Text, {super.key});

  @override
  State<inner_text2> createState() => _inner_text2State();
}

class _inner_text2State extends State<inner_text2> {
  final TextEditingController body_text = TextEditingController();

  final TextEditingController heading_text = TextEditingController();

  late FocusNode _focusNode;

  @override
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
      width: AppDimensions.width10(context) * 36.0,
      decoration: BoxDecoration(
          gradient: _focusNode.hasFocus
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)])
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)]),
          // color: Colors.white,

          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.height10(context) * 1.8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: AppDimensions.width10(context) * 32.0,
              padding: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 1.3,
                  left: AppDimensions.width10(context) * 0.6),
              child: Text(widget.circle_text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Laila",
                    color: _focusNode.hasFocus
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFFFFFFFF),
                    fontSize: AppDimensions.font10(context) * 2.2,
                  ))),
          SizedBox(
            height: AppDimensions.height10(context) * 0.9,
          ),
          Container(
              padding: EdgeInsets.only(
                  bottom: AppDimensions.height10(context) * 2.4),
              width: AppDimensions.width10(context) * 32.0,
              child: CupertinoTextField(
                readOnly: true,
                placeholder: widget.panel_Text,
                placeholderStyle: TextStyle(
                    fontSize: AppDimensions.font10(context) * 1.6,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Laila",
                    height: AppDimensions.height10(context) * 0.12,
                    color: const Color(0xFFFFFFFF)),
                controller: body_text,
                focusNode: _focusNode,
                // maxLines: 4,
                minLines: null,
                maxLines: null,
                expands: true,

                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF)),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              )),
        ],
      ),
    );
  }
}
