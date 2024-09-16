import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal-Visualising.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal-Why.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal_Identity.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Widgets/SignupBottomSheet.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading2.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenProgressSaved extends StatefulWidget {
  final bool login;
  final String route;
  const HomeScreenProgressSaved(
      {Key? key, required this.login, required this.route})
      : super(key: key);

  @override
  _HomeScreenProgressSavedState createState() =>
      _HomeScreenProgressSavedState();
}

class _HomeScreenProgressSavedState extends State<HomeScreenProgressSaved> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool admin = false;

  Future<void> getUserRole() async {
    final SharedPreferences prefs = await _prefs;
    var role = prefs.getString('userRole');
    //var subscription = prefs.getString('subscriptionStatus');

    if (role == 'admin') {
      setState(() {
        admin = true;
      });
    }
  }

  final formKey = GlobalKey<FormState>();
  bool isPasswordNotVisible = true;
  var errorMsg, jsonResponse;
  bool boolean = true;
  var token;
  var accountFlag;
  var sessionRoute;
  int catId = 0;

  @override
  void initState() {
    getUserRole();
    super.initState();
  }

  // fetchCategoryId() async {
  //   final SharedPreferences prefs = await _prefs;
  //   int category = prefs.getInt('goalCategoryId');
  //   setState(() {
  //     catId = category;
  //   });
  // }

  // final contractAddress = "0xaBE2ec3a68A15a382BcDC93499Ab751D3d954BB2";

  bool isLoadWallet = true;
  bool isLoadLogin = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        // =>
        // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/HomeScreenBackground.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: AppDimensions.height10(context) * 7.0,
                ),
                Center(
                  child: Image(
                    // color: Colors.orange,
                    image: const AssetImage("assets/images/homelogo.webp"),
                    height: AppDimensions.height10(context) * 10.0,
                    width: AppDimensions.width10(context) * 10.0,
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 2.32),
                SizedBox(
                  height: AppDimensions.height10(context) * 8.5,
                  child: Text(
                    "Your Destiny is at \n Your Fingertips",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.font10(context) * 3.0,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 0.5),
                SizedBox(
                    height: AppDimensions.height10(context) * 11.5,
                    child: Text(
                      'Time waits for no one. The best time to \n start is TODAY. Begin creating your \n star followed by a plan to help you \n achieve your goal.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 1.8,
                      ),
                    )),
                SizedBox(height: AppDimensions.height10(context) * 4.4),
                Center(
                    child: AnimatedScaleButton(
                  onTap: () async {
                    Navigator.pop(context);
                    if (widget.route == "GoalName" && widget.login == true) {
                      Navigator.push(
                        context,
                        FadePageRoute2(
                          true,
                          exitPage: HomeScreenProgressSaved(
                              login: false, route: widget.route),
                          enterPage: GoalName(
                            saved: true,
                            route: '',
                            catId,
                            comingFromEditScreen: false,
                          ),
                        ),
                      );
                    } else if (widget.route == "goalVisualising" &&
                        widget.login == true) {
                      Navigator.push(
                        context,
                        FadePageRoute2(
                          true,
                          exitPage: HomeScreenProgressSaved(
                              login: false, route: widget.route),
                          enterPage: const Visualising(
                            route: '',
                            comingFromEditScreen: false,
                            saved: true,
                          ),
                        ),
                      );
                    } else if (widget.route == "GoalIdentity" &&
                        widget.login == true) {
                      Navigator.push(
                        context,
                        FadePageRoute2(
                          true,
                          exitPage: HomeScreenProgressSaved(
                              login: false, route: widget.route),
                          enterPage: const Goal_Identity(
                            route: '',
                            saved: true,
                            comingFromEditScreen: false,
                          ),
                        ),
                      );
                    } else if (widget.route == "goalWhy" &&
                        widget.login == true) {
                      Navigator.push(
                        context,
                        FadePageRoute2(
                          true,
                          exitPage: HomeScreenProgressSaved(
                              login: false, route: widget.route),
                          enterPage: const GoalWhy(
                            comingFromEditScreen: false,
                            route: '',
                            saved: true,
                          ),
                        ),
                      );
                    } else if (widget.route == "" && widget.login == true) {
                      Navigator.push(
                        context,
                        FadePageRoute2(
                          true,
                          exitPage: HomeScreenProgressSaved(
                              login: false, route: widget.route),
                          enterPage: const GoalWhy(
                            comingFromEditScreen: false,
                            route: '',
                            saved: false,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("You are not logged in.")));
                    }
                    final SharedPreferences prefs = await _prefs;
                    await prefs.remove('goal_route');
                    await prefs.remove('practice_review');
                  },
                  child: Image(
                    // color: Colors.orange,
                    image: const AssetImage("assets/images/starprogress.webp"),
                    height: AppDimensions.height10(context) * 23,
                    width: AppDimensions.width10(context) * 26,
                  ),
                )),
                SizedBox(height: AppDimensions.height10(context) * 12.1),
                widget.login == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedScaleButton(
                            onTap: () {
                              showAnimatedDialog(
                                  animationType: DialogTransitionType.fadeScale,
                                  curve: Curves.easeInOut,
                                  duration: const Duration(seconds: 1),
                                  context: context,
                                  builder: (BuildContext context) => SizedBox(
                                        width: AppDimensions.width10(context) *
                                            27.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                19.8,
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppDimensions.height10(
                                                              context) *
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
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.2,
                                            width:
                                                AppDimensions.width10(context) *
                                                    23.8,
                                            child: Text(
                                              "Log out?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.7,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          content: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 19,
                                                left: 16,
                                                right: 16),
                                            height: AppDimensions.height10(
                                                    context) *
                                                4.8,
                                            width: 238,
                                            child: Text(
                                              "Are you sure you want to log out? If you\ndo, you will be prompted to login again\nby entering your email and password.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.15,
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.5,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    final SharedPreferences
                                                        prefs = await _prefs;
                                                    var email = prefs.getString('loginEmail');
                                                    var pass = prefs.getString('loginPass');
                                                    await prefs.clear();

                                                    if(email !=null && pass !=null){
                                                      prefs.setString('loginEmail', email);
                                                      prefs.setString('loginPass', pass);
                                                    }
                                                    Navigator.pushReplacement(
                                                      context,
                                                      FadePageRoute(
                                                          page:
                                                              const HomeScreen(
                                                                  login:
                                                                      false)),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 44,
                                                    width: double.infinity,
                                                    color:
                                                        const Color(0xFF007AFF),
                                                    child: const Center(
                                                      child: Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFBFBFB),
                                                            fontSize: 17,
                                                            fontFamily: "Laila",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.1,
                                                  child: Divider(
                                                    color:
                                                        const Color(0XFF3C3C43)
                                                            .withOpacity(0.29),
                                                  ),
                                                ),
                                                Container(
                                                  height: 42,
                                                  width: double.infinity,
                                                  margin: EdgeInsets.only(
                                                      bottom: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  color: Colors.white,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF007AFF),
                                                          fontSize: 17,
                                                          fontFamily: "Laila",
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ));
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => SignUpPage(),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: AppDimensions.height10(context) * 5,
                              width: AppDimensions.width10(context) * 13,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 5.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "Log out",
                                  style: TextStyle(
                                    color: const Color(0xFF8C648A),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.width10(context) * 1.4,
                          ),

                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                  page: LoginPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: AppDimensions.height10(context) * 5,
                              width: AppDimensions.width10(context) * 13,
                              decoration: BoxDecoration(
                                color: const Color(0xFF5A4D73),
                                border:
                                    Border.all(color: const Color(0xFF5A4D73)),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 5.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "Log in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.font10(context) * 1.8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
              ],
              // child:  Text("Hello background"),
            )
          ],
        )
            //   child:Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //
            //     // children: [
            //     //
            //     //
            //     //
            //     //
            //     // ],
            //   )

            ));
  }
}
