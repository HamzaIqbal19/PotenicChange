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

class Loginemailandpassword extends StatefulWidget {
  @override
  _LoginemailandpasswordState createState() => _LoginemailandpasswordState();
}

class _LoginemailandpasswordState extends State<Loginemailandpassword> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String fcm = 'adsfsf3423424';
  bool Loading = false;
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
                    'assets/images/Back.png',
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
                      'assets/images/Close.png',
                      width: AppDimensions.height10(context) * 3.0,
                      height: AppDimensions.height10(context) * 3.0,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        FadePageRoute3(
                          enterPage:const HomeScreen(
                            login: false,
                          ),
                          exitPage:Loginemailandpassword(),

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
                  image: AssetImage("assets/images/loginscreenBackground.png"),
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
                        image: const AssetImage("assets/images/logo.png"),
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
                                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(val)) {
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    bottom:
                                        AppDimensions.height10(context) * 0.5),
                                width: AppDimensions.height10(context) * 6.3,
                                height: AppDimensions.height10(context) * 1.7,
                                child: Text(
                                  "Password",
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
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      hintText: "*******",
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
                                  controller: passwordController,
                                  obscureText: true,
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
                                      FadePageRoute2(
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

                  Container(
                    height: AppDimensions.height10(context) * 4.4,
                    width: AppDimensions.height10(context) * 26.7,
                    // padding: EdgeInsets.only(left:AppDimensions.height10(context) *0.8,top:AppDimensions.height10(context) *1.6,right: AppDimensions.height10(context) *0.8),

                    child: OutlinedButton.icon(
                      // <-- OutlinedButton
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0),
                        ),
                        //<-- SEE HERE
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            Loading = true;
                          });
                          Authentication()
                              .SignIn(
                            fcm,
                            '${emailController.text.toString()}',
                            '${passwordController.text.toString()}',
                          )
                              .then((response) {
                            setState(() {
                              Loading = false;
                            });
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
                                    enterPage: StartProcess(),
                                    exitPage: HomeScreen(
                                      login: true,
                                    )),
                              );
                            } else if (response == 404) {
                              setState(() {
                                Loading = false;
                                credentials = true;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Your sign in details are incorrect, please try again!!")));
                            }
                          }).catchError((error) {
                            setState(() {
                              Loading = false;
                            });
                            print("error");
                          });
                        } else {
                          setState(() {
                            Loading = false;
                          });
                        }
                      },
                      icon: Image.asset(
                        "assets/images/fb.png",
                        width: 0.0,
                        height: 0.0,
                      ),
                      label: Center(
                        child: Loading == false
                            ? Text(
                                'Log In',
                                style: TextStyle(
                                  color: const Color(0xFF8C648A),
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : const SpinKitThreeBounce(
                                color: Color(0xFF8C648A),
                                size: 30,
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
