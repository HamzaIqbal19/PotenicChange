import 'package:flutter/material.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpSuccessful.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_colors.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';

class SignUpWithEmail extends StatefulWidget {
  @override
  _SignUpWithEmailState createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  // controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // final formKey = GlobalKey<FormState>();
  bool isPasswordNotVisible = true;
  bool rememberMe = true;
  bool boolean = true;
  bool Loading = false;
  bool errorEmail = false;
  bool errorName = false;
  bool errorPassword = false;

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
  bool pass_obscure = true;
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
                              exitPage:SignUpWithEmail(),

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
                      image: const AssetImage("assets/images/logo.png"),
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
                    height: AppDimensions.height10(context) * 35 + 6,
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
                              if (val == null || val == ""
                                  // || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                                  )
                              //  .hasMatch(val))
                              {
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
                          child: TextFormField(
                            obscureText: true,
                            textAlign: TextAlign.justify,
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
                                      AppDimensions.height10(context) * 1.8,
                                ),
                                labelText: "Password",
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                            controller: passwordController,
                            validator: (val) {
                              if (val == null ||
                                  val == "" ||
                                  val.length < 8 ||
                                  val == "") {
                                setState(() {
                                  errorPassword = true;
                                });
                              }
                            },
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
                                )

                                    // Text(
                                    //   "By signing up, you agree to Potenic’s \n User Agreement and Privacy Policy.",
                                    //   style: TextStyle(
                                    //     color: const Color(0xFFFFFFFF),
                                    //     fontSize: AppDimensions.font16 - 4,
                                    //     fontWeight: FontWeight.w600,
                                    //   ),
                                    // ),
                                    ),
                              ],
                            ))

                        //)
                      ],
                    ),
                  ),

                  SizedBox(height: AppDimensions.height10(context) * 4.5),

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
                        if (_formkey1.currentState!.validate()) {
                          setState(() {
                            Loading = true;
                          });
                          print("Hello WOrld 12345");
                          Authentication()
                              .registerApi(
                            '${nameController.text.toString()}',
                            '${emailController.text.toString()}',
                            '${passwordController.text.toString()}',
                          )
                              .then((response) {
                            setState(() {
                              Loading = false;
                            });
                            if (response ==
                                "User was registered successfully!") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(response)));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpSuccessful(
                                      name: nameController.text.toString()),
                                ),
                              );
                            } else {
                              setState(() {
                                Loading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(response["message"])));
                            }
                          }).catchError((error) {
                            setState(() {
                              Loading = false;
                            });

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
                                'Sign up',
                                style: TextStyle(
                                  color: const Color(0xFF8C648A),
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w700,
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
  }
}
