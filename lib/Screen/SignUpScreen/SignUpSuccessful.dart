import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:potenic_app/utils/app_colors.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpSuccessful extends StatefulWidget {
  final String name;
  const SignUpSuccessful({super.key, required this.name});

  @override
  _SignUpSuccessfulState createState() => _SignUpSuccessfulState();
}

class _SignUpSuccessfulState extends State<SignUpSuccessful> {
  // controllers
  bool isPasswordNotVisible = true;
  var errorMsg, jsonResponse;
  bool rememberMe = true;
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
    //     onWillPop: () async => false,
    // =>
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                  height: AppDimensions.height10(context) * 21.3,
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
                  height: AppDimensions.height10(context) * 3.6,
                  child: Text(
                    "Sign up successful",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 3.0,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 2.4),
                // SizedBox(height: AppDimensions.height2),
                Container(
                    height: AppDimensions.height10(context) * 2.4,
                    width: AppDimensions.screenWidth(context) - 100,
                    child: Text(
                      'Welcome aboard ${widget.name}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2,
                      ),
                    )),
                SizedBox(height: AppDimensions.height10(context) * 0.92),
                Container(
                    height: AppDimensions.height10(context) * 7 + 4,
                    width: AppDimensions.height10(context) * 37.8,
                    child: Text(
                      'You’re almost ready to get started. Please check \n your registration email now to continue your \n journey. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.6,
                      ),
                    )),
                // SizedBox(height: AppDimensions.height0),

                // SizedBox(height: AppDimensions.height120+90),
              ],
              // child:  Text("Hello background"),
            ),
          ],
        ));
    // );
  }
}
