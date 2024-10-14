import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading2.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';

import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading.dart';

class SignUpSuccessful extends StatefulWidget {
  final String name;
  const SignUpSuccessful({super.key, required this.name});

  @override
  _SignUpSuccessfulState createState() => _SignUpSuccessfulState();
}

class _SignUpSuccessfulState extends State<SignUpSuccessful> {
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
              page: const Loginemailandpassword(),
            ),
          );
          return Future.value(false);
        },
        child: Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              actions: [
                Buttons().closeButton(context, () {
                  Navigator.push(
                    context,
                    FadePageRouteReverse(
                      page: const LoginPage(),
                    ),
                  );
                })
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
                        image: const AssetImage("assets/images/logo.webp"),
                        height: AppDimensions.height10(context) * 7.75,
                        width: AppDimensions.width10(context) * 7.75,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height10(context) * 2.32),
                    SizedBox(
                      height: AppDimensions.height10(context) * 3.6,
                      child: Text(
                        AppText().signUpSuccess,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 3.0,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height10(context) * 2.4),
                    SizedBox(
                        height: AppDimensions.height10(context) * 2.4,
                        child: Text(
                          AppText().welcomeAboard + widget.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: AppDimensions.font10(context) * 2,
                          ),
                        )),
                    SizedBox(height: AppDimensions.height10(context) * 0.92),
                    SizedBox(
                        height: AppDimensions.height10(context) * 7 + 4,
                        width: AppDimensions.width10(context) * 37.8,
                        child: Text(
                          AppText().welcomeAboardBody,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: AppDimensions.font10(context) * 1.6,
                          ),
                        )),
                    SizedBox(height: AppDimensions.height10(context) * 12.4),
                    AnimatedScaleButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            FadePageRoute2(false,
                                enterPage: const Loginemailandpassword(),
                                exitPage: const SignUpSuccessful(name: '')));
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 4.4,
                        width: AppDimensions.width10(context) * 26.7,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(
                              AppDimensions.height10(context) * 5.0)),
                        ),
                        child: Center(
                          child: Text(
                            AppText().login,
                            style: TextStyle(
                              color: const Color(0xFF8C648A),
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
