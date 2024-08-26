import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal%20Finished.dart';
import 'package:potenic_app/Screen/CreateGoal/StartProcess.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Widgets/SignupBottomSheet.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading2.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final bool login;
  const HomeScreen({
    Key? key,
    required this.login,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool admin = false;
  var pracRoute;

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

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final formKey = GlobalKey<FormState>();
  bool isPasswordNotVisible = true;
  var errorMsg, jsonResponse;
  bool boolean = true;
  var token;
  var accountFlag;
  var sessionRoute;

  @override
  void initState() {
    getUserRole();
    getRoute();
    super.initState();
  }

  getRoute() async {
    final SharedPreferences prefs = await _prefs;
    pracRoute = prefs.getBool('pracRoute') == true? true: false;
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
        child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              padding: EdgeInsets.only(bottom: AppDimensions.height10(context)*2),
              notchMargin: 0,
              color:  Colors.transparent,
              child: widget.login == true
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedScaleButton(
                    onTap: () {
                      showAnimatedDialog(
                          animationType:
                          DialogTransitionType.fadeScale,
                          curve: Curves.easeInOut,
                          duration: const Duration(seconds: 1),
                          context: context,
                          builder: (BuildContext context) =>
                              SizedBox(
                                width:
                                AppDimensions.width10(context) *
                                    27.0,
                                height: AppDimensions.height10(
                                    context) *
                                    19.8,
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          AppDimensions
                                              .height10(
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
                                    width: AppDimensions.height10(
                                        context) *
                                        23.8,
                                    child: Text(
                                      "Log out?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                        AppDimensions.font10(
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
                                    // height: AppDimensions.height10(
                                    //         context) *
                                    //     4.8,
                                    width: 238,
                                    child: Text(
                                      "Are you sure you want to log out? If you\ndo, you will be prompted to login again\nby entering your email and password.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        height:
                                        AppDimensions.height10(
                                            context) *
                                            0.14,
                                        fontSize:
                                        AppDimensions.font10(
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
                                            prefs =
                                            await _prefs;
                                            var email = prefs.getString('loginEmail');
                                            var pass = prefs.getString('loginPass');
                                            await prefs.clear();
                                            if(email !=null && pass !=null){
                                              prefs.setString('loginEmail', email);
                                              prefs.setString('loginPass', pass);
                                            }



                                            Navigator.push(
                                              context,
                                              FadePageRoute2(
                                                false,
                                                enterPage:
                                                const HomeScreen(
                                                  login: false,
                                                ),
                                                exitPage:
                                                const HomeScreen(
                                                  login: true,
                                                ),
                                              ),
                                            );
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
                                        SizedBox(
                                          height: AppDimensions
                                              .height10(
                                              context) *
                                              0.1,
                                          child: Divider(
                                            color: const Color(
                                                0XFF3C3C43)
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
                                              Navigator.pop(
                                                  context);
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Color(
                                                      0xFF007AFF),
                                                  fontSize: 17,
                                                  fontFamily:
                                                  "Laila",
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
                      height: AppDimensions.height10(context) * 5.2,
                      width: AppDimensions.width10(context) * 13,
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
                  AnimatedScaleButton(
                    onTap: () {
                      signupSheet(context, "Introduction",
                          "OnBoarding", admin);
                    },
                    child: Container(
                      height: AppDimensions.height10(context) * 5.2,
                      width: AppDimensions.width10(context) * 5,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border:
                        Border.all(color: Colors.transparent),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(40.0)),
                      ),
                      child: Center(
                        child: Image(
                          // color: Colors.orange,
                          image: const AssetImage(
                              "assets/images/Moreactions.webp"),
                          height:
                          AppDimensions.height10(context) * 5,
                          width: AppDimensions.width10(context) * 5,
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedScaleButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        FadePageRoute2(
                          true,
                          enterPage: const SignUpPage(),
                          exitPage: const HomeScreen(
                            login: false,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: AppDimensions.height10(context) * 5.2,
                      width: AppDimensions.width10(context) * 13,
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
                          "I’m new here",
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
                  InkWell(
                    focusColor: Colors.black,
                    splashColor: Colors.red,
                    onTap: () {},
                    child: AnimatedScaleButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          FadePageRoute2(
                            true,
                            enterPage: const LoginPage(),
                            exitPage:
                            const HomeScreen(login: false),
                          ),
                        );
                      },
                      child: Container(
                        height:
                        AppDimensions.height10(context) * 5.2,
                        width: AppDimensions.width10(context) * 13,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5A4D73),
                          border: Border.all(
                              color: const Color(0xFF5A4D73)),
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  AppDimensions.height10(context) *
                                      5.0)),
                        ),
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                              AppDimensions.font10(context) *
                                  1.8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () {
                      if (widget.login == false) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            content: Text(
                              "You are not logged in.",
                              style: TextStyle(color: Colors.red),
                            )));
                      } else {
                        signupSheet(context, "Introduction",
                            "OnBoarding", admin);
                      }
                    },
                    child: Container(
                      height: AppDimensions.height10(context) * 5,
                      width: AppDimensions.width10(context) * 5,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border:
                        Border.all(color: Colors.transparent),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(40.0)),
                      ),
                      child: Center(
                        child: Image(
                          // color: Colors.orange,
                          image: const AssetImage(
                              "assets/images/Moreactions.webp"),
                          height:
                          AppDimensions.height10(context) * 5,
                          width: AppDimensions.width10(context) * 5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: <Widget>[
                backgroundContainer(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    verticalSpacing(context, 7.0),
                    centeredImage(
                        context, "assets/images/homelogo.webp", 10.0, 10.0),
                    verticalSpacing(context, 2.32),
                    SizedBox(
                      height: AppDimensions.height10(context) * 8.5,
                      child: buildText(
                        context,
                        AppText().homeScreenTitle,
                        3.0,
                        FontWeight.w700,
                      ),
                    ),
                    verticalSpacing(context, 0.5),
                    SizedBox(
                      height: AppDimensions.height10(context) * 11.5,
                      child: buildText(
                        context,
                        AppText().homeScreenSubText,
                        1.8,
                        FontWeight.w600,
                      ),
                    ),
                    verticalSpacing(context, 4.4),
                    AnimatedScaleButton(
                      onTap: () async {
                        if (widget.login == true) {
                          if (pracRoute == true) {
                            Navigator.push(
                                context,
                                FadePageRoute2(true,
                                    enterPage: const GoalFinished(),
                                    exitPage: const HomeScreen(login: false)));
                          } else {
                            Navigator.push(
                              context,
                              FadePageRoute2(
                                enterPage: const StartProcess(),
                                exitPage: const HomeScreen(login: false),
                                true,
                              ),
                            );
                          }
                        } else {
                          Navigator.push(
                            context,
                            FadePageRoute2(
                              true,
                              enterPage: const SignUpPage(),
                              exitPage: const HomeScreen(
                                login: false,
                              ),
                            ),
                          );
                        }
                        final SharedPreferences prefs = await _prefs;
                        await prefs.remove('goal_route');
                        await prefs.remove('practice_review');
                      },
                      child: centeredImage(
                          context, "assets/images/createstar.webp", 23, 26),
                    ),
                    //verticalSpacing(context, 12.1),

                  ],
                  // child:  Text("Hello background"),
                )
              ],
            )));
  }
}

Widget buildText(
    BuildContext context, String text, double heightFactor, FontWeight weight) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: weight,
      color: Colors.white,
      fontSize: AppDimensions.font10(context) * heightFactor,
    ),
  );
}

Widget centeredImage(BuildContext context, String assetName,
    double heightFactor, double widthFactor) {
  return Center(
    child: Image(
      image: AssetImage(assetName),
      height: AppDimensions.height10(context) * heightFactor,
      width: AppDimensions.width10(context) * widthFactor,
    ),
  );
}

Widget verticalSpacing(BuildContext context, double factor) {
  return SizedBox(
    height: AppDimensions.height10(context) * factor,
  );
}

Widget backgroundContainer(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/HomeScreenBackground.webp"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
