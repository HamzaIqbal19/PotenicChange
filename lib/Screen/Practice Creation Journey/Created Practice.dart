import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Goal%20Review%20Journey/StarReview.dart';
import 'package:potenic_app/Screen/Practice%20Review%20Journey/Activateyourstar.dart';
import 'package:potenic_app/Screen/Practice%20Review%20Journey/practiceReview.dart';
import 'package:potenic_app/Screen/Timeline%20Journey/component/imageComponent.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_text_styles.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../Widgets/animatedButton.dart';

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
  bool loading = true;

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
      loading = false;
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
    });
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goalRoute = prefs.getString('goal_route');
    setState(() {
      route = goalRoute!;
    });
  }

  void _fetchPracticeNames() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        setState(() {
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
            Buttons().closeButton(context, () {
              if (route == 'view_all_goals') {
                Navigator.pushReplacement(context,
                    FadePageRouteReverse(page: const view_all_goals_menu()));
              } else {
                Navigator.push(
                    context,
                    FadePageRoute(
                        page: const ViewDashboard(
                      missed: false,
                      name: '',
                      update: false,
                      helpfulTips: false,
                      record: 0,
                    )));
              }
            }),
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
            loading == false
                ? Stack(
                    children: [
                      //  getGlares(context, color),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: AppDimensions.height10(context) * 8.9,
                          ),
                          SizedBox(
                            width: AppDimensions.width10(context) * 20.7,
                            height: AppDimensions.height10(context) * 7.8,
                            // padding: EdgeInsets.only(top: AppDimensions.height10(context) * 10),
                            child: Center(
                              child: GradientText(
                                AppText().starPlanet,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  // color: Colors.white,
                                  fontSize: AppDimensions.font10(context) * 3,
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
                          SizedBox(
                              // color: Colors.black,
                              height: AppDimensions.height10(context) * 5.1,
                              width: AppDimensions.width10(context) * 34.0,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      AppText().reviewCont,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.font10(context) * 2.2,
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
                                  height:
                                      AppDimensions.height10(context) * 40.1,
                                  width: AppDimensions.width10(context) * 40.1,
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
                                                                    : 'assets/images/orange_moon.webp'))),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              3.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            // color: Colors.red,
                                            width:
                                                AppDimensions.width10(context) *
                                                    24.0,
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "$goalName",
                                                  //  "Control my anger",
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
                                                SizedBox(
                                                  // color: Colors.green,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.0,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      22.0,
                                                  child: Text('"$identity"',
                                                      // "“I am someone who is in control of my anger”",
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
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
                                                1.0,
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
                                          height:
                                              AppDimensions.width10(context) *
                                                  14.7,
                                          width:
                                              AppDimensions.width10(context) *
                                                  14.7,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    practiceImages(
                                                        pracColor ?? "2")),
                                                fit: BoxFit.contain,
                                              )),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                //color: Colors.red,
                                                width: AppDimensions.width10(
                                                        context) *
                                                    11.8,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      pracName,
                                                      //  "Meditation",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFFFBFBFB),
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.8,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0,
                                                    ),
                                                    Text('Review',
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontSize:
                                                                AppDimensions
                                                                        .font10(
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
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: AppDimensions.height10(
                                              //           context) *
                                              //       3.0,
                                              // )
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 10.7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Container(
                              //     // color: Colors.blue,
                              //     width: AppDimensions.width10(context) * 5.0,
                              //     height: AppDimensions.height10(context) * 5.0,
                              //     child: Image.asset(
                              //       "assets/images/Moreactions.webp",
                              //       fit: BoxFit.contain,
                              //     )),
                              AnimatedScaleButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                        page: const ActivateStar(),
                                      ));
                                },
                                child: Container(
                                  height: AppDimensions.height10(context) * 5.2,
                                  width: AppDimensions.width10(context) * 31.3,
                                  decoration: BoxDecoration(
                                    // color: Color(0xFFFF7D50),
                                    border:
                                        Border.all(color: Colors.transparent),
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
                                      style: AppTextStyles()
                                          .onBoardingButtonStyle(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
