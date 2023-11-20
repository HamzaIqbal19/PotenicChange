import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/ResetPassword/EmailSent.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../API/Authentication.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  bool Loading = false;
  bool errorEmail = false;
  bool noEmail = false;
  final email = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    email.dispose();
  }

  final _formkey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              // leading: Center(
              //   // alignment: Alignment.center,
              //   child: IconButton(
              //     icon: Image.asset(
              //       'assets/images/Back.webp',
              //       width: AppDimensions.width10(context) * 3,
              //       height: AppDimensions.height10(context) * 3,
              //       fit: BoxFit.contain,
              //     ),
              //     onPressed: () {
              //       Navigator.pop(context);
              //       // Add code for performing close action
              //     },
              //   ),
              // ),
              actions: [
                Center(
                  // alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/Close.webp',
                      width: AppDimensions.width10(context) * 3.0,
                      height: AppDimensions.height10(context) * 3.0,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
                  SizedBox(
                    height: AppDimensions.height10(context) * 3.9,
                    child: Text(
                      "Reset your password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 2.9,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimensions.height10(context) * 0.9),

                  // SizedBox(height: AppDimensions.height0),
                  SizedBox(
                    height: AppDimensions.height10(context) * 26 + 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: AppDimensions.height10(context) * 1.7,
                          // padding:  EdgeInsets.only(left:AppDimensions.height10(context) *1.2),
                          child: Text(
                            "Please enter your registered email to get a new password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontSize: AppDimensions.font10(context) * 1.4,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimensions.height10(context) * 1.6),
                        Container(
                            height: AppDimensions.height10(context) * 6,
                            width: AppDimensions.width10(context) * 36.0,
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
                                  width: AppDimensions.width10(context) * 3.7,
                                  height: AppDimensions.height10(context) * 1.7,
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF282828),
                                        fontSize:
                                            AppDimensions.font10(context) *
                                                1.4),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 2.0,
                                  ),
                                  width: AppDimensions.width10(context) * 32,
                                  height: AppDimensions.height10(context) * 2.2,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                        color: const Color(0xFF8C648A),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                        fontSize:
                                            AppDimensions.font10(context) *
                                                1.8),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: "JohnSmith@yahoo.com",
                                        hintStyle: TextStyle(
                                          color: const Color(0xFF8C648A),
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent))),
                                    controller: email,
                                    onChanged: (value) {
                                      setState(() {
                                        errorEmail = false;
                                        noEmail = false;
                                      });
                                    },
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
                        SizedBox(height: AppDimensions.height10(context) * 0.3),
                        noEmail
                            ? Container(
                                // color: Colors.blue,

                                margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 4.4,
                                    right:
                                        AppDimensions.height10(context) * 10.6),
                                child: Text(
                                  "This email is not associated with any account.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: const Color(0xFFFE6624),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Container(),
                        errorEmail
                            ? Container(
                                // color: Colors.blue,
                                height: AppDimensions.height10(context) * 1.7,
                                width: AppDimensions.width10(context) * 23.3,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 4.4,
                                    right:
                                        AppDimensions.height10(context) * 15.6),
                                child: Text(
                                  "Ooops! Needs to be an email format",
                                  style: TextStyle(
                                    color: const Color(0xFFFE6624),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Container(),
                        SizedBox(height: AppDimensions.height10(context) * 1.1),
                        Container(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.width10(context) * 26.1,
                            margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 3.6,
                                right: AppDimensions.width10(context) * 15.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      FadePageRoute(
                                        page: Loginemailandpassword(),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width:
                                        AppDimensions.width10(context) * 12.6,
                                    height:
                                        AppDimensions.height10(context) * 2.2,
                                    child: Text(
                                      "Login",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: const Color(0xFFFFFFFF),
                                        fontSize:
                                            AppDimensions.font10(context) * 1.4,
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

                  SizedBox(height: AppDimensions.height10(context) * 2.0),

                  AnimatedScaleButton(
                    onTap: () {
                      if (_formkey1.currentState!.validate() &&
                          errorEmail == false) {
                        setState(() {
                          Loading = true;
                        });

                        Authentication()
                            .passReset(
                          '${email.text.toString()}',
                        )
                            .then((response) {
                          if (response == true) {
                            setState(() {
                              Loading = false;
                              noEmail = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              FadePageRoute(
                                page: EmailSent(
                                  email: email.text.toString(),
                                ),
                              ),
                            );
                          } else if (response == 404) {
                            setState(() {
                              Loading = false;
                              noEmail = true;
                            });
                          } else {
                            setState(() {
                              Loading = false;
                              noEmail = false;
                            });
                          }
                        }).catchError((error) {
                          setState(() {
                            Loading = false;
                          });
                          print("error");
                        });
                      }
                    },
                    child: Container(
                      height: AppDimensions.height10(context) * 4.4,
                      width: AppDimensions.width10(context) * 26.7,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 5.0),
                      ),
                      // padding: EdgeInsets.only(left:AppDimensions.height10(context) *0.8,top:AppDimensions.height10(context) *1.6,right: AppDimensions.width10(context) *0.8),

                      child: Center(
                          child: Loading == false
                              ? Text(
                                  'Reset password',
                                  style: TextStyle(
                                    color: const Color(0xFF8C648A),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.6,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : const SpinKitThreeBounce(
                                  color: Color(0xFF8C648A),
                                  size: 30,
                                )),
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
