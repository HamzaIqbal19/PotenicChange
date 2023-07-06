import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpSuccessful.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading.dart';

class SignUpWithEmail extends StatefulWidget {
  @override
  _SignUpWithEmailState createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail>
    with SingleTickerProviderStateMixin {
  // controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  late AnimationController _controller;
  final passwordController = TextEditingController();

  // final formKey = GlobalKey<FormState>();
  bool isPasswordNotVisible = true;
  bool rememberMe = false;
  bool boolean = true;
  bool Loading = false;
  bool errorEmail = false;
  bool errorName = false;
  bool errorPassword = false;
  bool pass_obscure = true;
  String userExist = "";

  late SharedPreferences _prefs;
  setEmail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
    print("SetEmail: $email");
  }

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

  // final contractAddress = "0xaBE2ec3a68A15a382BcDC93499Ab751D3d954BB2";

  bool isLoadWallet = true;
  bool isLoadLogin = true;
  late bool checkBool;
  booleanValue(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('bool', value);
  }

  String fcm = 'adsfsf3423424';

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //     onWillPop: () async => false,
    // =>
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
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
                          exitPage: SignUpWithEmail(),
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
              key: _formkey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: AppDimensions.height10(context) * 8.02,
                  ),
                  Center(
                    child: Image(
                      // color: Colors.orange,
                      image: const AssetImage("assets/images/logo.webp"),
                      height: AppDimensions.height10(context) * 7.75,
                      width: AppDimensions.width10(context) * 7.75,
                    ),
                  ),

                  SizedBox(height: AppDimensions.height10(context)),
                  SizedBox(
                    height: AppDimensions.height10(context) * 4.0,
                    child: Text(
                      "Sign up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 3.0,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimensions.height10(context) * 2.0),
                  SizedBox(
                      height: AppDimensions.height10(context) * 7 + 4,
                      width: AppDimensions.screenWidth(context) - 100,
                      child: Text(
                        'Your Personalised Journey To Better Self Starts Here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: AppDimensions.height10(context) * 2.0,
                        ),
                      )),
                  // SizedBox(height: AppDimensions.height0),

                  SizedBox(
                    // height: AppDimensions.height10(context) * 34,
                    width: AppDimensions.height10(context) * 36,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 6,
                          width: AppDimensions.height10(context) * 36,
                          padding: EdgeInsetsDirectional.only(
                            top: AppDimensions.height10(context) * 1.2,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context) * 1.8))),
                          child: TextFormField(
                            style: TextStyle(
                                color: const Color(0xFF8C648A),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize:
                                    AppDimensions.height10(context) * 1.8),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    top: 5.0,
                                    //bottom: 15.0,
                                    left: 10.0,
                                    right: 10.0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "John",
                                hintStyle: TextStyle(
                                  color: const Color(0xFF8C648A),
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                ),
                                labelText: "Name",
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              if (val == null || val == "") {
                                setState(() {
                                  errorName = true;
                                });
                              } else {
                                setState(() {
                                  errorName = false;
                                });
                              }
                            },
                          ),
                        ),
                        errorName
                            ? Container(
                                child: Text(
                                  "Full name is required",
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
                          width: AppDimensions.height10(context) * 36,
                          padding: EdgeInsetsDirectional.only(
                            top: AppDimensions.height10(context) * 1.2,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context) * 1.8))),
                          child: TextFormField(
                            style: TextStyle(
                                color: const Color(0xFF8C648A),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                                fontSize:
                                    AppDimensions.height10(context) * 1.8),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    top: 5.0,
                                    //bottom: 15.0,
                                    left: 10.0,
                                    right: 10.0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "abc@gmail.com",
                                hintStyle: TextStyle(
                                  color: const Color(0xFF8C648A),
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                ),
                                labelText: "Email",
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                            controller: emailController,
                            validator: (val) {
                              if (val == null ||
                                  val == "" ||
                                  !EmailValidator.validate(val)) {
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
                        ),
                        errorEmail
                            ? Container(
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
                          width: AppDimensions.height10(context) * 36,
                          padding: EdgeInsetsDirectional.only(
                            top: AppDimensions.height10(context) * 1.2,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context) * 1.8))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: AppDimensions.height10(context) * 32,
                                child: TextFormField(
                                  obscureText: pass_obscure,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none,
                                      fontSize:
                                          AppDimensions.height10(context) *
                                              1.8),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 15.0,
                                          left: 10.0,
                                          right: 10.0),
                                      alignLabelWithHint: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: "********",
                                      hintStyle: TextStyle(
                                        color: const Color(0xFF8C648A),
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                      ),
                                      labelText: "Password",
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
                                  controller: passwordController,
                                  validator: (val) {
                                    if (val == null ||
                                        val == "" ||
                                        val.length < 8 ||
                                        val == "") {
                                      setState(() {
                                        errorPassword = true;
                                      });
                                    } else {
                                      errorPassword = false;
                                    }
                                  },
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
                                child: Container(
                                  height: AppDimensions.height10(context) * 2.4,
                                  width: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
                                          1.0),
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
                            ? Text(
                                "Minimum 8 characters",
                                style: TextStyle(
                                  color: const Color(0xFFFE6624),
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : Container(),
                        SizedBox(
                            height: errorEmail
                                ? AppDimensions.height10(context)
                                : AppDimensions.height10(context) * 3),
                        SizedBox(
                            height: AppDimensions.height10(context) * 6.2,
                            width: AppDimensions.screenWidth(context) - 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  checkColor: Colors.black,
                                  activeColor: Colors.white,
                                  side: const BorderSide(
                                      color: Color(0xffffffff)),
                                  value: rememberMe,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberMe = value ?? false;
                                    });
                                  },
                                ),
                                Container(
                                    child: Text.rich(
                                  TextSpan(
                                    text:
                                        'By signing up, you agree to Potenic’s \n ',
                                    style: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'User Agreement',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      // can add more TextSpans here...

                                      TextSpan(
                                          text: ' and ',
                                          style: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      // can add more TextSpans here...

                                      TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                )),
                              ],
                            )),
                        userExist != ""
                            ? AnimatedScaleButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: Loginemailandpassword()));
                                },
                                child: Container(
                                  // height: AppDimensions.height10(context) * 2.7,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          2.0),
                                  child: Center(
                                      child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              style: TextStyle(
                                                color: const Color(0xFFFE6624),
                                                fontFamily: 'laila',
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.16,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              children: const [
                                                TextSpan(
                                                    text:
                                                        "This email is already registered."),
                                                TextSpan(
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                    text:
                                                        "\nPlease Log in to continue")
                                              ]))),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: AppDimensions.height10(context) * 3.0,
                  ),
                  GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        Loading = true;
                      });
                      _controller.forward();
                    },
                    onTap: () async {
                      setState(() {
                        Loading = true;
                      });
                      _controller.forward();

                      await Future.delayed(Duration(milliseconds: 200));

                      _controller.reverse();

                      await Future.delayed(Duration(milliseconds: 200));

                      if (_formkey1.currentState!.validate() &&
                          rememberMe == true) {
                        setState(() {
                          Loading = true;
                          errorEmail = false;
                          errorPassword = false;
                          errorName = false;
                          userExist = "";
                        });
                        print("Hello WOrld 12345");
                        Authentication()
                            .registerApi(
                          '${nameController.text.toString()}',
                          '${emailController.text.toString()}',
                          '${passwordController.text.toString()}',
                        )
                            .then((response) {
                          print(response["staussCode"]);
                          setState(() {
                            Loading = false;
                          });
                          if (response["statusCode"] == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              response["message"],
                              style:
                                  TextStyle(color: Colors.red.withOpacity(0.8)),
                            )));
                            Navigator.push(
                              context,
                              FadePageRoute(
                                page: SignUpSuccessful(
                                    name: nameController.text.toString()),
                              ),
                            );
                          } else if (response["statusCode"] == 409) {
                            print(userExist.length);

                            print('===========>>>>>>>>>');
                            setState(() {
                              Loading = false;
                              userExist = response["message"];
                            });
                            print(userExist.length);

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              response["message"],
                              style:
                                  TextStyle(color: Colors.red.withOpacity(0.8)),
                            )));
                          } else {
                            print('===========');
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              response["message"],
                              style:
                                  TextStyle(color: Colors.red.withOpacity(0.8)),
                            )));
                          }
                        }).catchError((error) {
                          setState(() {
                            Loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'error',
                              style:
                                  TextStyle(color: Colors.red.withOpacity(0.8)),
                            ),
                          ));

                          print("error");
                        }).whenComplete(() {
                          setState(() {
                            Loading = false;
                            errorEmail = false;
                            errorPassword = false;
                            errorName = false;
                          });
                        });
                      } else if (rememberMe == false) {
                        setState(() {
                          Loading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          'User Agreement is not checked',
                          style: TextStyle(color: Colors.red.withOpacity(0.8)),
                        )));
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
                        child: Center(
                          child: Loading
                              ? SpinKitThreeBounce(
                                  color: const Color(0xFF8C648A),
                                  //  delay: Duration(milliseconds: 0),
                                  size: AppDimensions.height10(context) * 3.5,
                                )
                              : Text(
                                  "Sign up",
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
                ],
                // child:  Text("Hello background"),
              ),
            ),
          ],
        ));
  }
}
