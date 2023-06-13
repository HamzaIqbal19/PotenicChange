import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Screen/CreateGoal/StartProcess.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Widgets/SignupBottomSheet.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';

class HomeScreenProgressSaved extends StatefulWidget {
  final bool log_status;

  const HomeScreenProgressSaved({super.key, required this.log_status});
  @override
  _HomeScreenProgressSavedState createState() =>
      _HomeScreenProgressSavedState();
}

class _HomeScreenProgressSavedState extends State<HomeScreenProgressSaved> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isPasswordNotVisible = true;
  var errorMsg, jsonResponse;
  bool boolean = true;
  var token;
  var accountFlag;
  var sessionRoute;

  late SharedPreferences _prefs;
  setEmail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
    print("SetEmail: $email");
  }

  @override
  void initState() {
    super.initState();
  }

  // final contractAddress = "0xaBE2ec3a68A15a382BcDC93499Ab751D3d954BB2";

  bool isLoadWallet = true;
  bool isLoadLogin = true;
  late bool checkBool;
  booleanValue(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('bool', value);
  }

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
                  image: AssetImage("assets/images/HomeScreenBackground.png"),
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
                    image: const AssetImage("assets/images/homelogo.png"),
                    height: AppDimensions.height10(context) * 10.0,
                    width: AppDimensions.height10(context) * 10.0,
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 2.32),
                SizedBox(
                  height: AppDimensions.height10(context) * 8.5,
                  child: Text(
                    widget.log_status
                        ? "[Name], your destiny\nis at Your Fingertips"
                        : "Your Destiny is at \n Your Fingertips",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 3.0,
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
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    )),
                SizedBox(height: AppDimensions.height10(context) * 4.4),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => StartProcess(),
                    //   ),
                    // );
                  },
                  child: Image(
                    // color: Colors.orange,
                    image: const AssetImage("assets/images/starprogress.png"),
                    height: AppDimensions.height10(context) * 23,
                    width: AppDimensions.height10(context) * 26,
                  ),
                )),
                SizedBox(height: AppDimensions.height10(context) * 12.1),
                widget.log_status
                    ? SizedBox(
                        width: AppDimensions.height10(context) * 19.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showAnimatedDialog(
                                    animationType:
                                        DialogTransitionType.fadeScale,
                                    curve: Curves.easeInOut,
                                    duration: Duration(seconds: 1),
                                    context: context,
                                    builder: (BuildContext context) => SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
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
                                                  top: 19, bottom: 2),
                                              height: AppDimensions.height10(
                                                      context) *
                                                  2.2,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  23.8,
                                              child: Text(
                                                "Log out?",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            content: Container(
                                              margin: const EdgeInsets.only(
                                                bottom: 19,
                                              ),
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.8,
                                              width: 238,
                                              child: Text(
                                                "Are you sure you want to log out? If you\ndo, you will be prompted to login again\nby entering your email and password.",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'laila',
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.5,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      height: 44,
                                                      width: double.infinity,
                                                      color: const Color(
                                                          0xFF007AFF),
                                                      child: const Center(
                                                        child: Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFFFBFBFB),
                                                              fontSize: 17,
                                                              fontFamily:
                                                                  "Laila",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
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
                                                            color: Color(
                                                                0xFF007AFF),
                                                            fontSize: 17,
                                                            fontFamily: "Laila",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ));
                              },
                              child: Container(
                                height: AppDimensions.height10(context) * 5,
                                width: AppDimensions.height10(context) * 13,
                                margin: EdgeInsets.only(
                                    right:
                                        AppDimensions.height10(context) * 1.4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          AppDimensions.height10(context) *
                                              5.0)),
                                ),
                                child: Center(
                                  child: Text(
                                    "Log out",
                                    style: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                signupSheet(
                                    context, "Introduction", "OnBoarding");
                              },
                              child: Container(
                                height: AppDimensions.height10(context) * 5,
                                width: AppDimensions.height10(context) * 5,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(40.0)),
                                ),
                                child: Center(
                                  child: Image(
                                    // color: Colors.orange,
                                    image: const AssetImage(
                                        "assets/images/Moreactions.png"),
                                    height: AppDimensions.height10(context) * 5,
                                    width: AppDimensions.height10(context) * 5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                  page: SignUpPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: AppDimensions.height10(context) * 5,
                              width: AppDimensions.height10(context) * 13,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 5.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "I’m new here",
                                  style: TextStyle(
                                    color: const Color(0xFF8C648A),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              height: AppDimensions.height10(context) * 5,
                              width: AppDimensions.height10(context) * 13,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 1.4),
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
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              signupSheet(
                                  context, "Introduction", "OnBoarding");
                            },
                            child: Container(
                              height: AppDimensions.height10(context) * 5,
                              width: AppDimensions.height10(context) * 5,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 5.0)),
                              ),
                              child: Center(
                                child: Image(
                                  // color: Colors.orange,
                                  image: const AssetImage(
                                      "assets/images/Moreactions.png"),
                                  height: AppDimensions.height10(context) * 50,
                                  width: AppDimensions.height10(context) * 50,
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
