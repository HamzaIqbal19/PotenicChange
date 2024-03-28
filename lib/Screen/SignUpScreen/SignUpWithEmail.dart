import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpSuccessful.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/Widgets/webVisit.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_link.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading.dart';
import 'package:flutter/gestures.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

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
  String passwordMsg = "Minimum 8 characters";
  String emailMsg = "Ooops! Needs to be an email format";
  String nameMsg = "Name is required";
  bool isPasswordNotVisible = true;
  bool rememberMe = false;
  bool boolean = true;
  bool loading = false;
  bool errorEmail = false;
  bool errorName = false;
  bool errorPassword = false;
  bool passObscure = true;
  String userExist = "";

  setEmail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200), // increased duration
        lowerBound: 0.0,
        upperBound: 0.1)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  signUp() {
    setState(() {
      loading = true;
    });
    if (_formkey1.currentState!.validate() &&
        rememberMe == true &&
        errorPassword == false) {
      setState(() {
        loading = true;
        // errorEmail = false;
        // errorPassword = false;
        // errorName = false;
        // userExist = "";
      });

      Authentication()
          .registerApi(
        nameController.text.toString(),
        emailController.text.toString().trim(),
        passwordController.text.toString(),
      )
          .then((response) {
        setState(() {
          loading = false;
        });
        if (response["statusCode"] == 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            response["message"],
            style: TextStyle(color: Colors.red.withOpacity(0.8)),
          )));
          Navigator.push(
            context,
            FadePageRoute(
              page: SignUpSuccessful(name: nameController.text.toString()),
            ),
          );
        } else if (response["statusCode"] == 409) {
          setState(() {
            loading = false;
            userExist = response["message"];
          });

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            response["message"],
            style: TextStyle(color: Colors.red.withOpacity(0.8)),
          )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            response["message"],
            style: TextStyle(color: Colors.red.withOpacity(0.8)),
          )));
        }
      }).catchError((error) {
        setState(() {
          loading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'ERROR',
            style: TextStyle(color: Colors.red.withOpacity(0.8)),
          ),
        ));
      }).whenComplete(() {
        setState(() {
          loading = false;
          // errorEmail = false;
          // errorPassword = false;
          // errorName = false;
        });
      });
    } else if (rememberMe == false) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        'User Agreement is not checked',
        style: TextStyle(color: Colors.red.withOpacity(0.8)),
      )));
    } else {
      setState(() {
        loading = false;
      });
    }
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formkey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //     onWillPop: () async => false,
    // =>
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                      // width: AppDimensions.width10(context) * 3,
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
                        // width: AppDimensions.width10(context) * 3.0,
                        height: AppDimensions.height10(context) * 3.0,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          FadePageRouteReverse(
                            page: const HomeScreen(
                              login: false,
                            ),
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
                    image:
                        AssetImage("assets/images/loginscreenBackground.webp"),
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
                        AppText().signUp,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 3.0,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height10(context) * 2.0),
                    SizedBox(
                        height: AppDimensions.height10(context) * 7 + 4,
                        width: AppDimensions.screenWidth(context) - 100,
                        child: Text(
                          AppText().signUpSubHead,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: AppDimensions.font10(context) * 2.0,
                          ),
                        )),
                    // SizedBox(height: AppDimensions.height0),

                    SizedBox(
                      // height: AppDimensions.height10(context) * 34,
                      width: AppDimensions.width10(context) * 36,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: AppDimensions.height10(context) * 6.2,
                            width: AppDimensions.width10(context) * 36,
                            padding: EdgeInsetsDirectional.only(
                              top: AppDimensions.height10(context) * 1.2,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 2),
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
                                      left: 20.0,
                                      right: 10.0),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: "John",
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF8C648A),
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        AppDimensions.font10(context) * 1.8,
                                  ),
                                  labelText: "Name",
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent))),
                              onChanged: (value) {
                                setState(() {
                                  passwordMsg = "";
                                  errorPassword = false;
                                  emailMsg = '';
                                  errorEmail = false;
                                  errorName = false;
                                  nameMsg = '';
                                });
                              },
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val == null || val == "") {
                                  setState(() {
                                    errorName = true;
                                    nameMsg = 'Name is required';
                                  });
                                } else {
                                  setState(() {
                                    nameMsg = '';
                                    errorName = false;
                                  });
                                }
                                return null;
                              },
                            ),
                          ),
                          errorName
                              ? Text(
                                  "Name is required",
                                  style: TextStyle(
                                    color: const Color(0xFFFE6624),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Container(),
                          SizedBox(
                              height: errorEmail
                                  ? AppDimensions.height10(context)
                                  : AppDimensions.height10(context) * 3),
                          Container(
                            height: AppDimensions.height10(context) * 6.2,
                            width: AppDimensions.width10(context) * 36,
                            padding: EdgeInsetsDirectional.only(
                              top: AppDimensions.height10(context) * 1.2,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: TextFormField(
                                style: TextStyle(
                                    color: const Color(0xFF8C648A),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    fontSize:
                                        AppDimensions.font10(context) * 1.8),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        top: 5.0,
                                        //bottom: 15.0,
                                        left: 20.0,
                                        right: 10.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: "abc@gmail.com",
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                    ),
                                    labelText: "Email",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent))),
                                onChanged: (value) {
                                  setState(() {
                                    passwordMsg = "";
                                    errorPassword = false;
                                    emailMsg = '';
                                    errorEmail = false;
                                    errorName = false;
                                    nameMsg = '';
                                  });
                                },
                                controller: emailController,
                                validator: (val) {
                                  if (val != null && val.isNotEmpty) {
                                    val = val.trim();
                                  }

                                  if (val == null || val.isEmpty) {
                                    setState(() {
                                      errorEmail = true;
                                      emailMsg = 'Email is required';
                                    });
                                  } else if (!EmailValidator.validate(val)) {
                                    setState(() {
                                      errorEmail = true;
                                      emailMsg =
                                          ' Ooops! Needs to be an email format';
                                    });
                                  } else {
                                    setState(() {
                                      errorEmail = false;
                                      emailMsg = '';
                                    });
                                  }
                                  return null;
                                }),
                          ),
                          errorEmail
                              ? Text(
                                  emailMsg,
                                  style: TextStyle(
                                    color: const Color(0xFFFE6624),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Container(),
                          SizedBox(
                              height: errorEmail
                                  ? AppDimensions.height10(context)
                                  : AppDimensions.height10(context) * 3),
                          Container(
                            height: AppDimensions.height10(context) * 6.2,
                            width: AppDimensions.width10(context) * 36,
                            padding: EdgeInsetsDirectional.only(
                              top: AppDimensions.height10(context) * 1.2,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 0),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: AppDimensions.width10(context) * 32,
                                  child: TextFormField(
                                    obscureText: passObscure,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: const Color(0xFF8C648A),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize:
                                            AppDimensions.font10(context) *
                                                1.8),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 5.0,
                                            bottom: 15.0,
                                            left: 20.0,
                                            right: 10.0),
                                        alignLabelWithHint: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: "********",
                                        hintStyle: TextStyle(
                                          color: const Color(0xFF8C648A),
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                        ),
                                        labelText: "Password",
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent))),
                                    onChanged: (value) {
                                      setState(() {
                                        passwordMsg = "";
                                        errorPassword = false;
                                        emailMsg = '';
                                        errorEmail = false;
                                        errorName = false;
                                        nameMsg = '';
                                      });
                                    },
                                    controller: passwordController,
                                    onFieldSubmitted: (value) {
                                      signUp();
                                    },
                                    validator: (val) {
                                      if ((val == null && val == '')) {
                                        setState(() {
                                          passwordMsg = "Password is required";
                                          errorPassword = true;
                                        });
                                      } else if (val!.length < 8) {
                                        setState(() {
                                          passwordMsg = "Minimum 8 characters";
                                          errorPassword = true;
                                        });
                                      } else {
                                        setState(() {
                                          passwordMsg = "";
                                          errorPassword = false;
                                        });
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      passObscure = !passObscure;
                                    });
                                  },
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    width: AppDimensions.width10(context) * 2.4,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.0),
                                    child: Image.asset(
                                      passObscure
                                          ? 'assets/images/visible-icon-9.webp'
                                          : 'assets/images/ic_remove_red_eye.webp',
                                      color: const Color(0xFF8C648A),
                                      height:
                                          AppDimensions.height10(context) * 2.4,
                                      width:
                                          AppDimensions.width10(context) * 2.4,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          errorPassword
                              ? Text(
                                  passwordMsg,
                                  style: TextStyle(
                                    color: const Color(0xFFFE6624),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.4,
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
                                  Text.rich(
                                    TextSpan(
                                      text:
                                          'By signing up, you agree to Potenic’s \n ',
                                      style: TextStyle(
                                        fontFamily: 'Laila',
                                        color: const Color(0xFFFFFFFF),
                                        fontSize:
                                            AppDimensions.font10(context) * 1.4,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'User Agreement',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                webVisit(
                                                    AppLinks().termsOfService);
                                              },
                                            style: TextStyle(
                                              fontFamily: 'Laila',
                                              decoration:
                                                  TextDecoration.underline,
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        TextSpan(
                                            text: ' and ',
                                            style: TextStyle(
                                              fontFamily: 'Laila',
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        TextSpan(
                                            text: 'Privacy Policy',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                webVisit(
                                                    AppLinks().privacyPolicy);
                                              },
                                            style: TextStyle(
                                              fontFamily: 'Laila',
                                              decoration:
                                                  TextDecoration.underline,
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          userExist != ""
                              ? AnimatedScaleButton(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page:
                                                const Loginemailandpassword()));
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
                                                  color:
                                                      const Color(0xFFFE6624),
                                                  fontFamily: 'laila',
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.16,
                                                  fontSize:
                                                      AppDimensions.font10(
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
                                                        decoration:
                                                            TextDecoration
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
                          loading = true;
                        });
                        _controller.forward();
                      },
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        _controller.forward();

                        await Future.delayed(const Duration(milliseconds: 200));

                        _controller.reverse();

                        await Future.delayed(const Duration(milliseconds: 200));

                        if (_formkey1.currentState!.validate() &&
                            rememberMe == true &&
                            errorPassword == false) {
                          setState(() {
                            loading = true;
                            // errorEmail = false;
                            // errorPassword = false;
                            // errorName = false;
                            // userExist = "";
                          });

                          Authentication()
                              .registerApi(
                            nameController.text.toString(),
                            emailController.text.toString().trim(),
                            passwordController.text.toString(),
                          )
                              .then((response) {
                            setState(() {
                              loading = false;
                            });
                            if (response["statusCode"] == 200) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                response["message"],
                                style: TextStyle(
                                    color: Colors.red.withOpacity(0.8)),
                              )));
                              Navigator.push(
                                context,
                                FadePageRoute(
                                  page: SignUpSuccessful(
                                      name: nameController.text.toString()),
                                ),
                              );
                            } else if (response["statusCode"] == 409) {
                              setState(() {
                                loading = false;
                                userExist = response["message"];
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                response["message"],
                                style: TextStyle(
                                    color: Colors.red.withOpacity(0.8)),
                              )));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                response["message"],
                                style: TextStyle(
                                    color: Colors.red.withOpacity(0.8)),
                              )));
                            }
                          }).catchError((error) {
                            setState(() {
                              loading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'ERROR',
                                style: TextStyle(
                                    color: Colors.red.withOpacity(0.8)),
                              ),
                            ));
                          }).whenComplete(() {
                            setState(() {
                              loading = false;
                              // errorEmail = false;
                              // errorPassword = false;
                              // errorName = false;
                            });
                          });
                        } else if (rememberMe == false) {
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            'User Agreement is not checked',
                            style:
                                TextStyle(color: Colors.red.withOpacity(0.8)),
                          )));
                        } else {
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      child: Transform.scale(
                        scale: 1 - _controller.value,
                        child: Container(
                          height: AppDimensions.height10(context) * 5.0,
                          width: AppDimensions.width10(context) * 26.7,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(
                                AppDimensions.height10(context) * 5.0)),
                          ),
                          child: Center(
                            child: loading
                                ? SpinKitThreeBounce(
                                    color: const Color(0xFF8C648A),
                                    //  delay: Duration(milliseconds: 0),
                                    size: AppDimensions.height10(context) * 3.5,
                                  )
                                : Text(
                                    AppText().signUp,
                                    style: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
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
          )),
    );
  }
}
