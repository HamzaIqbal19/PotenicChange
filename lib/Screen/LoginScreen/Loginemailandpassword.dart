import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/StartProcess.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/ResetPassword/PasswordReset.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/authTextField.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Widgets/fading.dart';

class Loginemailandpassword extends StatefulWidget {
  const Loginemailandpassword({super.key});

  @override
  _LoginemailandpasswordState createState() => _LoginemailandpasswordState();
}

class _LoginemailandpasswordState extends State<Loginemailandpassword> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String passwordMsg = "Minimum 8 characters";
  String emailMsg = "Ooops! Needs to be an email format";
  String fcm = 'adsfsf3423424';
  bool loading = false;
  bool passObscure = true;
  final formKey = GlobalKey<FormState>();
  bool isPasswordNotVisible = true;
  bool rememberMe = false;
  bool boolean = true;
  bool errorEmail = false;
  bool errorPassword = false;
  bool credentials = false;
  String passwordError = "";
  String emailError = "";
  setEmail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
  }

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    getEmailAndPass();
    super.initState();
  }

  onLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      prefs.setString('loginEmail', emailController.text.toString());
      prefs.setString('loginPass', passwordController.text.toString());
    } else {
      await prefs.remove('loginEmail');
      await prefs.remove('loginPass');
    }
    AdminGoal.checkUserGoalByUserId().then((response) {
      if (response == false) {
        Navigator.push(
          context,
          FadePageRoute2(
            true,
            enterPage: const StartProcess(),
            exitPage: const Loginemailandpassword(),
          ),
        );
      } else if (response >= 1) {
        Navigator.push(
            context,
            FadePageRoute(
              page: const ViewDashboard(
                missed: false,
                name: '',
                update: false,
                helpfulTips: false,
                record: 0,
              ),
              // exitPage:SplashPage(),
            ));
      }
    });
  }

  getEmailAndPass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('loginEmail') ?? "";
      passwordController.text = prefs.getString('loginPass') ?? "";
    });
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
    super.dispose();
  }

  loginFunction() {
    setState(() {
      loading = true;
      emailError = "";
      passwordError = "";
    });
    if (_formkey.currentState!.validate() && errorPassword == false) {
      Authentication()
          .signIn(
        emailController.text.toString().trim(),
        passwordController.text.toString(),
      )
          .then((response) {
        if (response["statusCode"] == 200) {
          onLoggedIn();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("User Login Successfully")));
        } else if (response["statusCode"] == 401) {
          setState(() {
            loading = false;
            emailError = "";
            passwordError = response["message"];
          });

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response["message"])));
        } else if (response["statusCode"] == 404) {
          setState(() {
            loading = false;
            credentials = false;
            emailError = response["message"];
          });

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response["message"])));
        }
      }).catchError((error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('An error occurred: $error')));
      }).whenComplete(() {
        setState(() {
          loading = false;
          credentials = false;
        });
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //     onWillPop: () async => false,
    // =>
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
          context,
          FadePageRouteReverse(
            page: const LoginPage(),
          ),
        );
        return Future.value(false);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
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
                        //width: AppDimensions.width10(context) * 3,
                        height: AppDimensions.height10(context) * 3,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          FadePageRouteReverse(
                            page: const LoginPage(),
                          ),
                        );
                        // Add code for performing close action
                      },
                    ),
                  ),
                  actions: [
                    Buttons().closeButton(context, () {
                      Navigator.pushReplacement(
                        context,
                        FadePageRouteReverse(
                          page: const HomeScreen(
                            login: false,
                          ),
                        ),
                      );
                    }),
                  ],
                )),
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
                        child: Image(
                          image: const AssetImage("assets/images/logo.webp"),
                          height: AppDimensions.height10(context) * 7.75,
                          width: AppDimensions.width10(context) * 7.75,
                        ),
                      ),

                      SizedBox(height: AppDimensions.height10(context) * 2.35),
                      SizedBox(
                        height: AppDimensions.height10(context) * 3.9,
                        child: Text(
                          AppText().login,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: AppDimensions.font10(context) * 3.0,
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.height10(context) * 4.2),

                      // SizedBox(height: AppDimensions.height0),
                      SizedBox(
                        height: AppDimensions.height10(context) * 26 + 24,
                        width: AppDimensions.width10(context) * 36,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // height: AppDimensions.height10(context) * 6.2,
                                width: AppDimensions.width10(context) * 36.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            AppDimensions.height10(context) *
                                                1.8))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Container(
                                    //   margin: EdgeInsets.only(
                                    //       left: AppDimensions.width10(context) *
                                    //           2.0,
                                    //       bottom:
                                    //           AppDimensions.height10(context) *
                                    //               0.5),
                                    //   width:
                                    //       AppDimensions.width10(context) * 3.7,
                                    //   height:
                                    //       AppDimensions.height10(context) * 1.7,
                                    //   child: Text(
                                    //     "Email",
                                    //     style: TextStyle(
                                    //         fontWeight: FontWeight.w400,
                                    //         color: const Color(0xFF282828),
                                    //         fontSize:
                                    //             AppDimensions.font10(context) *
                                    //                 1.4),
                                    //   ),
                                    // ),
                                    CustomTextfields().AuthTextField(
                                        passObscure: false,
                                        hintText: "JohnSmith@yahoo.com",
                                        labeText: "Email",
                                        context: context,
                                        controller: emailController,
                                        onChanged: (value) {
                                          setState(() {
                                            // passwordMsg = "";
                                            // errorPassword = false;
                                            emailMsg = '';
                                            errorEmail = false;
                                          });
                                        },
                                        validator: (val) {
                                          if (val != null && val.isNotEmpty) {
                                            val = val.trim();
                                          }

                                          if (val == null || val.isEmpty) {
                                            setState(() {
                                              errorEmail = true;
                                              emailMsg = 'Email is required';
                                            });
                                          } else if (!EmailValidator.validate(
                                              val)) {
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
                                        }
                                        // },
                                        )

                                    // TextFormField(
                                    //     keyboardType:
                                    //         TextInputType.emailAddress,
                                    //     style: TextStyle(
                                    //         color: const Color(0xFF8C648A),
                                    //         fontWeight: FontWeight.w600,
                                    //         decoration: TextDecoration.none,
                                    //         fontSize: AppDimensions.font10(
                                    //                 context) *
                                    //             2.4),
                                    //     decoration: InputDecoration(
                                    //         errorBorder: InputBorder.none,
                                    //         contentPadding: EdgeInsets.zero,
                                    //         hintText: "JohnSmith@yahoo.com",
                                    //         hintStyle: TextStyle(
                                    //           color: const Color(0xFF8C648A),
                                    //           fontWeight: FontWeight.w600,
                                    //           fontSize: AppDimensions.font10(
                                    //                   context) *
                                    //               2.4,
                                    //         ),
                                    //         focusedBorder:
                                    //             const OutlineInputBorder(
                                    //                 borderSide: BorderSide(
                                    //                     color: Colors
                                    //                         .transparent)),
                                    //         enabledBorder:
                                    //             const OutlineInputBorder(
                                    //                 borderSide: BorderSide(
                                    //                     color: Colors
                                    //                         .transparent))),
                                    //     onChanged: (value) {
                                    //       setState(() {
                                    //         passwordMsg = "";
                                    //         errorPassword = false;
                                    //         emailMsg = '';
                                    //         errorEmail = false;
                                    //       });
                                    //     },
                                    //     controller: emailController,
                                    //     validator: (val) {
                                    //       if (val != null && val.isNotEmpty) {
                                    //         val = val.trim();
                                    //       }

                                    //       if (val == null || val.isEmpty) {
                                    //         setState(() {
                                    //           errorEmail = true;
                                    //           emailMsg = 'Email is required';
                                    //         });
                                    //       } else if (!EmailValidator.validate(
                                    //           val)) {
                                    //         setState(() {
                                    //           errorEmail = true;
                                    //           emailMsg =
                                    //               ' Ooops! Needs to be an email format';
                                    //         });
                                    //       } else {
                                    //         setState(() {
                                    //           errorEmail = false;
                                    //           emailMsg = '';
                                    //         });
                                    //       }
                                    //       return null;
                                    //     }
                                    //     // },
                                    //     )
                                  ],
                                )),
                            errorEmail
                                ? CustomTextfields().errorText(
                                    context: context,
                                    texterror: emailMsg,
                                  )
                                : Container(),
                            // errorEmail
                            //     ? Container(
                            //         height:
                            //             AppDimensions.height10(context) * 1.7,
                            //         width:
                            //             AppDimensions.width10(context) * 23.3,
                            //         padding: EdgeInsets.only(
                            //             left: AppDimensions.width10(context) *
                            //                 1.2),
                            //         child: Text(
                            //           emailMsg,
                            //           style: TextStyle(
                            //             color: const Color(0xFFFE6624),
                            //             fontSize:
                            //                 AppDimensions.font10(context) * 1.4,
                            //             fontWeight: FontWeight.w600,
                            //           ),
                            //         ),
                            //       )
                            //     : Container(),
                            SizedBox(
                                height: errorEmail
                                    ? AppDimensions.height10(context)
                                    : AppDimensions.height10(context) * 3),
                            Container(
                              //height: AppDimensions.height10(context) * 6.2,
                              width: AppDimensions.width10(context) * 36.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          AppDimensions.height10(context) *
                                              1.8))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.width10(context) * 32.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Container(
                                        //   margin: EdgeInsets.only(
                                        //       left: AppDimensions.height10(
                                        //               context) *
                                        //           2.0,
                                        //       bottom: AppDimensions.height10(
                                        //               context) *
                                        //           0.5),
                                        //   width:
                                        //       AppDimensions.width10(context) *
                                        //           6.3,
                                        //   height:
                                        //       AppDimensions.height10(context) *
                                        //           1.7,
                                        //   child: Text(
                                        //     "Password",
                                        //     style: TextStyle(
                                        //         fontWeight: FontWeight.w400,
                                        //         color: const Color(0xFF282828),
                                        //         fontSize: AppDimensions.font10(
                                        //                 context) *
                                        //             1.4),
                                        //   ),
                                        // ),
                                        // Container(
                                        //   margin: EdgeInsets.only(
                                        //     left: AppDimensions.height10(
                                        //             context) *
                                        //         2.0,
                                        //   ),
                                        //   width:
                                        //       AppDimensions.width10(context) *
                                        //           36.0,
                                        //   height:
                                        //       AppDimensions.height10(context) *
                                        //           3.0,
                                        //   child: TextFormField(
                                        //     obscureText: passObscure,
                                        //     style: TextStyle(
                                        //         color: const Color(0xFF8C648A),
                                        //         fontWeight: FontWeight.w600,
                                        //         decoration: TextDecoration.none,
                                        //         fontSize: AppDimensions.font10(
                                        //                 context) *
                                        //             2.4),
                                        //     decoration: InputDecoration(
                                        //         contentPadding: EdgeInsets.zero,
                                        //         hintText: "*******",
                                        //         hintStyle: TextStyle(
                                        //           color:
                                        //               const Color(0xFF8C648A),
                                        //           fontWeight: FontWeight.w600,
                                        //           fontSize:
                                        //               AppDimensions.font10(
                                        //                       context) *
                                        //                   2.4,
                                        //         ),
                                        //         focusedBorder:
                                        //             const OutlineInputBorder(
                                        //                 borderSide: BorderSide(
                                        //                     color: Colors
                                        //                         .transparent)),
                                        //         enabledBorder:
                                        //             const OutlineInputBorder(
                                        //                 borderSide: BorderSide(
                                        //                     color: Colors
                                        //                         .transparent))),
                                        //     onChanged: (value) {
                                        //       setState(() {
                                        //         passwordMsg = "";
                                        //         errorPassword = false;
                                        //         emailMsg = '';
                                        //         errorEmail = false;
                                        //       });
                                        //     },
                                        //     controller: passwordController,
                                        //     validator: (val) {
                                        //       if ((val == null && val == '')) {
                                        //         setState(() {
                                        //           passwordMsg =
                                        //               "Password is required";
                                        //           errorPassword = true;
                                        //         });
                                        //       } else if (val!.length < 8) {
                                        //         setState(() {
                                        //           passwordMsg =
                                        //               "Minimum 8 characters";
                                        //           errorPassword = true;
                                        //         });
                                        //       } else {
                                        //         setState(() {
                                        //           passwordMsg = "";
                                        //           errorPassword = false;
                                        //         });
                                        //       }
                                        //       return null;
                                        //     },
                                        //     onFieldSubmitted: (value) {
                                        //       loginFunction();
                                        //     },
                                        //   ),
                                        // ),

                                        CustomTextfields().AuthTextField(
                                          passObscure: passObscure,
                                          context: context,
                                          controller: passwordController,
                                          labeText: "Password",
                                          hintText: "*******",
                                          onFieldSubmitted: (value) {
                                            loginFunction();
                                          },
                                          validator: (val) {
                                            if ((val == null && val == '')) {
                                              setState(() {
                                                passwordMsg =
                                                    "Password is required";
                                                errorPassword = true;
                                              });
                                            } else if (val!.length < 8) {
                                              setState(() {
                                                passwordMsg =
                                                    "Minimum 8 characters";
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
                                          onChanged: (value) {
                                            setState(() {
                                              passwordMsg = "";
                                              errorPassword = false;
                                              // emailMsg = '';
                                              // errorEmail = false;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomTextfields().visibleIcon(
                                    context: context,
                                    onpress: () {
                                      setState(() {
                                        passObscure = !passObscure;
                                      });
                                    },
                                  )
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       passObscure = !passObscure;
                                  //     });
                                  //   },
                                  //   child: SizedBox(
                                  //     height:
                                  //         AppDimensions.height10(context) * 2.4,
                                  //     width:
                                  //         AppDimensions.width10(context) * 2.4,
                                  //     child: Image.asset(
                                  //       passObscure
                                  //           ? 'assets/images/visible-icon-9.webp'
                                  //           : 'assets/images/ic_remove_red_eye.webp',
                                  //       color: const Color(0xFF8C648A),
                                  //       height:
                                  //           AppDimensions.height10(context) *
                                  //               2.4,
                                  //       width: AppDimensions.height10(context) *
                                  //           2.4,
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                            errorPassword
                                ? CustomTextfields().errorText(
                                    context: context,
                                    texterror: passwordMsg,
                                  )
                                : Container(),
                            // errorPassword
                            //     ? Container(
                            //         padding: EdgeInsets.only(
                            //             left: AppDimensions.width10(context) *
                            //                 1.2),
                            //         child: Text(
                            //           passwordMsg,
                            //           // PasswordError,

                            //           style: TextStyle(
                            //             color: const Color(0xFFFE6624),
                            //             fontSize:
                            //                 AppDimensions.font10(context) * 1.4,
                            //             fontWeight: FontWeight.w600,
                            //           ),
                            //         ),
                            //       )
                            //     : const SizedBox(),
                            SizedBox(
                                height: errorPassword
                                    ? AppDimensions.height10(context)
                                    : AppDimensions.height10(context) * 3),
                            Container(
                                // height: AppDimensions.height10(context) * 2.2,
                                padding: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 1.2,
                                    right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AnimatedScaleButton(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          FadePageRoute2(true,
                                              enterPage: const PasswordReset(),
                                              exitPage:
                                                  const Loginemailandpassword()),
                                        );
                                      },
                                      child: Text(
                                        AppText().forgotPass,
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: const Color(0xFFFFFFFF),
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          rememberMe = !rememberMe;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            rememberMe
                                                ? Icons.check_box
                                                : Icons.check_box_outline_blank,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            AppText().remember,
                                            style: TextStyle(
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.5,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            emailError != ""
                                ? AnimatedScaleButton(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const SignUpPage()));
                                    },
                                    child: Container(
                                      // height: AppDimensions.height10(context) * 2.7,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              2),
                                      child: Center(
                                          child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFFFE6624),
                                                    fontFamily: 'laila',
                                                    // height:
                                                    //     AppDimensions.height10(
                                                    //             context) *
                                                    //         0.16,
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  children: const [
                                                    TextSpan(
                                                        text:
                                                            "The user's account was not found."),
                                                    TextSpan(
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                        text:
                                                            "\nPlease create an account to continue")
                                                  ]))),
                                    ),
                                  )
                                : Container(),

                            //)
                          ],
                        ),
                      ),

                      SizedBox(height: AppDimensions.height10(context) * 5.0),

                      AnimatedScaleButton(
                        onTap: () async {
                          setState(() {
                            loading = true;
                            emailError = "";
                            passwordError = "";
                          });

                          if (_formkey.currentState!.validate() &&
                              errorPassword == false) {
                            Authentication()
                                .signIn(
                              emailController.text.toString().trim(),
                              passwordController.text.toString(),
                            )
                                .then((response) {
                              if (response["statusCode"] == 200) {
                                onLoggedIn();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("User Login Successfully")));
                              } else if (response["statusCode"] == 401) {
                                setState(() {
                                  loading = false;
                                  emailError = "";
                                  passwordError = response["message"];
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(response["message"])));
                              } else if (response["statusCode"] == 404) {
                                setState(() {
                                  loading = false;
                                  credentials = false;
                                  emailError = response["message"];
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(response["message"])));
                              }
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('An error occurred: $error')));
                            }).whenComplete(() {
                              setState(() {
                                loading = false;
                                credentials = false;
                              });
                            });
                          } else {
                            setState(() {
                              loading = false;
                            });
                          }
                        },
                        child: Container(
                          height: AppDimensions.height10(context) * 5.0,
                          width: AppDimensions.width10(context) * 26.7,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(
                                AppDimensions.height10(context) * 5.0)),
                          ),
                          child: loading
                              ? SpinKitThreeBounce(
                                  color: const Color(0xFF8C648A),
                                  // delay: Duration(milliseconds: 0),
                                  size: AppDimensions.height10(context) * 3.5,
                                )
                              : Center(
                                  child: Text(
                                    AppText().login,
                                    style: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontSize:
                                          AppDimensions.font10(context) * 2,
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
                ),
              ],
            )),
      ),
    );
    // );
  }
}
