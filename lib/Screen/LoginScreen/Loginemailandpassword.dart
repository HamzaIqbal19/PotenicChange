import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/MyServices/API.dart';
import 'package:potenic_app/Screen/CreateGoal/StartProcess.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/ResetPassword/PasswordReset.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Widgets/fading.dart';

class Loginemailandpassword extends StatefulWidget {
  @override
  _LoginemailandpasswordState createState() => _LoginemailandpasswordState();
}

class _LoginemailandpasswordState extends State<Loginemailandpassword>
    with SingleTickerProviderStateMixin {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late AnimationController _controller;

  String fcm = 'adsfsf3423424';
  bool Loading = false;
  bool pass_obscure = true;
  final formKey = GlobalKey<FormState>();
  bool isPasswordNotVisible = true;
  bool rememberMe = true;
  bool boolean = true;
  bool errorEmail = false;
  bool errorPassword = false;

  bool credentials = false;

  late SharedPreferences _prefs;
  setEmail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
    print("SetEmail: $email");
  }

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200), // increased duration
        lowerBound: 0.0,
        upperBound: 0.1)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  late bool checkBool;
  booleanValue(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('bool', value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //     onWillPop: () async => false,
    // =>
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(AppDimensions.height10(context) * 5.0),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
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
                        FadePageRoute3(
                          enterPage: const HomeScreen(
                            login: false,
                          ),
                          exitPage: Loginemailandpassword(),
                        ),
                      );
                      // Add code for performing close action
                    },
                  ),
                ),
              ],
            )),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/loginscreenBackground.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: AppDimensions.height10(context) * 8.2,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Image(
                        image: const AssetImage("assets/images/logo.webp"),
                        height: AppDimensions.height10(context) * 7.75,
                        width: AppDimensions.width10(context) * 7.75,
                      ),
                    ),
                  ),

                  SizedBox(height: AppDimensions.height10(context) * 2.35),
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
                  SizedBox(height: AppDimensions.height10(context) * 4.2),

                  // SizedBox(height: AppDimensions.height0),
                  Container(
                    height: AppDimensions.height10(context) * 26 + 6,
                    width: AppDimensions.height10(context) * 36,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        credentials
                            ? Container(
                                height: AppDimensions.height10(context) * 1.7,
                                padding: EdgeInsets.only(
                                    left:
                                        AppDimensions.height10(context) * 1.2),
                                child: Text(
                                  "Your sign in details are incorrect, please try again",
                                  style: TextStyle(
                                    color: const Color(0xFFFE6624),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Container(),
                        credentials
                            ? SizedBox(height: AppDimensions.height10(context))
                            : Container(),
                        Container(
                            height: AppDimensions.height10(context) * 6,
                            width: AppDimensions.height10(context) * 36.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.height10(context) * 2.0,
                                      bottom: AppDimensions.height10(context) *
                                          0.5),
                                  width: AppDimensions.height10(context) * 3.7,
                                  height: AppDimensions.height10(context) * 1.7,
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF282828),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                  ),
                                  width: AppDimensions.height10(context) * 36.0,
                                  height: AppDimensions.height10(context) * 2.2,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                        color: const Color(0xFF8C648A),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8),
                                    decoration: InputDecoration(
                                        errorBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        hintText: "JohnSmith@yahoo.com",
                                        hintStyle: TextStyle(
                                          color: const Color(0xFF8C648A),
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.8,
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent))),
                                    controller: emailController,
                                    validator: (val) {
                                      if (val == null ||
                                          !EmailValidator.validate(val) ||
                                          val == "") {
                                        setState(() {
                                          errorEmail = true;
                                        });
                                      } else {
                                        setState(() {
                                          errorEmail = false;
                                        });
                                      }
                                    },
                                  ),
                                )
                              ],
                            )),
                        errorEmail
                            ? Container(
                                height: AppDimensions.height10(context) * 1.7,
                                width: AppDimensions.height10(context) * 23.3,
                                padding: EdgeInsets.only(
                                    left:
                                        AppDimensions.height10(context) * 1.2),
                                child: Text(
                                  "Ooops! Needs to be an email format",
                                  style: TextStyle(
                                    color: const Color(0xFFFE6624),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Container(),
                        SizedBox(
                            height: errorEmail
                                ? AppDimensions.height10(context)
                                : AppDimensions.height10(context) * 3),
                        Container(
                          height: AppDimensions.height10(context) * 6,
                          width: AppDimensions.height10(context) * 36.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context) * 1.8))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: AppDimensions.height10(context) * 32.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  2.0,
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  0.5),
                                      width:
                                          AppDimensions.height10(context) * 6.3,
                                      height:
                                          AppDimensions.height10(context) * 1.7,
                                      child: Text(
                                        "Password",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF282828),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.0,
                                      ),
                                      width: AppDimensions.height10(context) *
                                          36.0,
                                      height:
                                          AppDimensions.height10(context) * 2.2,
                                      child: TextFormField(
                                        obscureText: pass_obscure,
                                        style: TextStyle(
                                            color: const Color(0xFF8C648A),
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.none,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.8),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            hintText: "*******",
                                            hintStyle: TextStyle(
                                              color: const Color(0xFF8C648A),
                                              fontWeight: FontWeight.w600,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.8,
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent))),
                                        controller: passwordController,
                                        validator: (val) {
                                          if (val == null ||
                                              val == "" ||
                                              val.length < 8) {
                                            setState(() {
                                              errorPassword = true;
                                            });
                                          } else {
                                            setState(() {
                                              errorPassword = false;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (pass_obscure == true) {
                                      pass_obscure = false;
                                    } else {
                                      pass_obscure = true;
                                    }
                                  });
                                },
                                child: SizedBox(
                                  height: AppDimensions.height10(context) * 2.4,
                                  width: AppDimensions.height10(context) * 2.4,
                                  child: Image.asset(
                                    pass_obscure
                                        ? 'assets/images/ic_remove_red_eye.webp'
                                        : 'assets/images/visible-icon-9.webp',
                                    color: const Color(0xFF8C648A),
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        errorPassword
                            ? Container(
                                padding: EdgeInsets.only(
                                    left:
                                        AppDimensions.height10(context) * 1.2),
                                child: Text(
                                  "Minimum 8 characters",
                                  style: TextStyle(
                                    color: const Color(0xFFFE6624),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Container(),
                        SizedBox(
                            height: errorPassword
                                ? AppDimensions.height10(context)
                                : AppDimensions.height10(context) * 3),
                        Container(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.height10(context) * 26.1,
                            padding: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      FadePageRoute2(true,
                                          enterPage: PasswordReset(),
                                          exitPage: Loginemailandpassword()),
                                    );
                                  },
                                  child: Container(
                                    child: Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: const Color(0xFFFFFFFF),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))

                        //)
                      ],
                    ),
                  ),

                  SizedBox(height: AppDimensions.height10(context) * 5.0),

                  GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        Loading = true;
                      });
                      _controller.forward();
                    },
                    onTap: () async {
                      _controller.forward();

                      await Future.delayed(Duration(milliseconds: 200));

                      _controller.reverse();

                      await Future.delayed(Duration(milliseconds: 200));
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          Loading = true;
                          credentials = false;
                        });
                        Authentication()
                            .SignIn(
                          fcm,
                          '${emailController.text.toString()}',
                          '${passwordController.text.toString()}',
                        )
                            .then((response) {
                          if (response == 200) {
                            setState(() {
                              credentials = false;
                            });
                            print("SignrResponse: $response");
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("User Login Successfully!!")));
                            Navigator.push(
                              context,
                              FadePageRoute2(
                                true,
                                enterPage: StartProcess(),
                                exitPage: Loginemailandpassword(),
                              ),
                            );
                          } else if (response == 404 || response == 401) {
                            setState(() {
                              credentials = true;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Your sign in details are incorrect, please try again!!")));
                          }
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('An error occurred: $error')));
                        }).whenComplete(() {
                          setState(() {
                            Loading = false;
                            credentials = false;
                          });
                        });
                      }
                    },
                    child: Transform.scale(
                      scale: 1 - _controller.value,
                      child: Container(
                        height: AppDimensions.height10(context) * 4.4,
                        width: AppDimensions.height10(context) * 26.7,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(
                              AppDimensions.height10(context) * 5.0)),
                        ),
                        child: Loading
                            ? SpinKitThreeBounce(
                                color: const Color(0xFF8C648A),
                                // delay: Duration(milliseconds: 0),
                                size: AppDimensions.height10(context) * 3.5,
                              )
                            : Center(
                                child: Text(
                                  "Log in",
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
                  ),

                  // SizedBox(height: AppDimensions.height120+90),
                ],
                // child:  Text("Hello background"),
              ),
            ),
          ],
        ));
    // );
  }
}
