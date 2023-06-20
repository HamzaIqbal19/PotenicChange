import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpWithEmail.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    // return WillPopScope(
    // onWillPop: () async => false,
    // =>
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            Center(
              // alignment: Alignment.center,

              child: IconButton(
                icon: Image.asset(
                  'assets/images/Close.png',
                  width: AppDimensions.height10(context) * 2.8,
                  height: AppDimensions.height10(context) * 2.8,
                  fit: BoxFit.cover,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Add code for performing close action
                },
              ),
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/loginscreenBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: AppDimensions.height10(context) * 8.02,
                ),
                Center(
                  child: Image(
                    // color: Colors.orange,
                    image: const AssetImage("assets/images/logo.png"),
                    height: AppDimensions.height10(context) * 7.75,
                    width: AppDimensions.width10(context) * 7.75,
                  ),
                ),

                SizedBox(height: AppDimensions.height10(context) * 2.32),
                Container(
                  height: AppDimensions.height10(context) * 3.9,
                  child: Text(
                    "Log in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 3.0,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) - 2),
                Container(
                    height: AppDimensions.height10(context) * 5.0,
                    width: AppDimensions.height10(context) * 36.7,
                    child: Text(
                      'How did you access your Potenic account\n last time?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    )),
                // SizedBox(height: AppDimensions.height0),

                SizedBox(height: AppDimensions.height10(context) * 5.1),
                Container(
                  height: AppDimensions.height10(context) * 20 + 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: AppDimensions.height10(context) * 5.5,
                        width: AppDimensions.height10(context) * 34.1,
                        child: OutlinedButton.icon(
                          // <-- OutlinedButton
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.0, color: Colors.white),

                            backgroundColor: const Color(0xFF5A4D73),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            //<-- SEE HERE
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginemailandpassword(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.mail_outline,
                            color: Colors.white,
                            size: AppDimensions.height10(context) * 2.4,
                          ),
                          label: Row(
                            children: [
                              Expanded(
                                  // alignment: Alignment.centerLeft,
                                  child: Text(
                                '  Email and Password',
                                style: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: AppDimensions.height10(context) * 5.5,
                        width: AppDimensions.height10(context) * 34.1,
                        child: OutlinedButton.icon(
                          // <-- OutlinedButton
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFFFFF),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            //<-- SEE HERE
                          ),
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/Google.png",
                            width: AppDimensions.height10(context) * 2.4,
                            height: AppDimensions.height10(context) * 2.4,
                          ),
                          label: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                '  Sign in with Google',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: AppDimensions.height10(context) * 5.5,
                        width: AppDimensions.height10(context) * 34.1,
                        child: OutlinedButton.icon(
                          // <-- OutlinedButton
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF1877F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 4.0),
                            ),
                            //<-- SEE HERE
                          ),
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/fb.png",
                            width: AppDimensions.height10(context) * 2.4,
                            height: AppDimensions.height10(context) * 2.4,
                          ),
                          label: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                '  Sign up with Facebook',
                                style: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 28.4),
                SizedBox(
                  height: AppDimensions.height10(context) * 5,
                  width: AppDimensions.screenWidth(context) - 100,
                  child: OutlinedButton.icon(
                    // <-- OutlinedButton
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      //<-- SEE HERE
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      "assets/images/fb.png",
                      width: 0.0,
                      height: 0.0,
                    ),
                    label: Center(
                        child: Text(
                      'New account',
                      style: TextStyle(
                        color: const Color(0xFF8C648A),
                        fontSize: AppDimensions.height10(context) * 1.6,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
              ],
              // child:  Text("Hello background"),
            ),
          ],
        ));
    // );
  }
}
