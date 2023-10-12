import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Widgets/fading2.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading.dart';

class SignUpSuccessful extends StatefulWidget {
  final String name;
  const SignUpSuccessful({super.key, required this.name});

  @override
  _SignUpSuccessfulState createState() => _SignUpSuccessfulState();
}

class _SignUpSuccessfulState extends State<SignUpSuccessful> {
  // controllers
  bool isPasswordNotVisible = true;
  bool rememberMe = true;
  bool boolean = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.push(
            context,
            FadePageRouteReverse(
              page: Loginemailandpassword(),
            ),
          );

          return Future.value(false);
        },

        // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        child: Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              actions: [
                Center(
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/Close.webp',
                      width: AppDimensions.height10(context) * 2.8,
                      height: AppDimensions.height10(context) * 2.8,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        FadePageRouteReverse(
                          page: LoginPage(),
                        ),
                      );
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
                      image: AssetImage(
                          "assets/images/loginscreenBackground.webp"),
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
                        image: const AssetImage("assets/images/logo.webp"),
                        height: AppDimensions.height10(context) * 7.75,
                        width: AppDimensions.height10(context) * 7.75,
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
                        // width: AppDimensions.height10(context) * 24.1,
                        child: Text(
                          'Welcome aboard ' + widget.name,
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
                    SizedBox(height: AppDimensions.height10(context) * 12.4),
                    AnimatedScaleButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            FadePageRoute2(false,
                                enterPage: Loginemailandpassword(),
                                exitPage: const SignUpSuccessful(name: '')));
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 4.4,
                        width: AppDimensions.height10(context) * 26.7,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(
                              AppDimensions.height10(context) * 5.0)),
                        ),
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: const Color(0xFF8C648A),
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // SizedBox(height: AppDimensions.height120+90),
                  ],
                  // child:  Text("Hello background"),
                ),
              ],
            )));
  }
}
