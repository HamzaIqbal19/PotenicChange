import 'package:flutter/material.dart';
import 'package:potenic_app/MyServices/API.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/ResetPassword/EmailSent.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../API/Authentication.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final email = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formkey2 = GlobalKey<FormState>();

    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppDimensions.height10 * 5.0),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              // leading: Center(
              //   // alignment: Alignment.center,
              //   child: IconButton(
              //     icon: Image.asset(
              //       'assets/images/Back.png',
              //       width: AppDimensions.height10 * 3,
              //       height: AppDimensions.height10 * 3,
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
                      'assets/images/Close.png',
                      width: AppDimensions.height10 * 3.0,
                      height: AppDimensions.height10 * 3.0,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>const  HomeScreen(login:false),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: AppDimensions.height10 * 8.02,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Image(
                      image: const AssetImage("assets/images/logo.png"),
                      height: AppDimensions.height10 * 7.75,
                      width: AppDimensions.width10 * 7.75,
                    ),
                  ),
                ),

                SizedBox(height: AppDimensions.height10 * 2.35),
                Container(
                  height: AppDimensions.height10 * 3.9,
                  child: Text(
                    "Reset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.font26 + 2.9384698,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10 * 0.9),

                // SizedBox(height: AppDimensions.height0),
                Container(
                  height: AppDimensions.height10 * 26 + 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: AppDimensions.height10 * 1.7,
                        // padding:  EdgeInsets.only(left:AppDimensions.height10*1.2),
                        child: Text(
                          "Please enter your registered email to get a new password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.height10 * 1.6),
                      Container(
                          height: AppDimensions.height10 * 6,
                          width: AppDimensions.height10 * 36.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10 * 1.8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 2.0,
                                    bottom: AppDimensions.height10 * 0.5),
                                width: AppDimensions.height10 * 3.7,
                                height: AppDimensions.height10 * 1.7,
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF282828),
                                      fontSize: AppDimensions.height10 * 1.4),
                                ),
                              ),
                              Form(
                                key: _formkey2,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 2.0,
                                  ),
                                  width: AppDimensions.height10 * 20.9,
                                  height: AppDimensions.height10 * 2.2,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: "JohnSmith@yahoo.com",
                                        hintStyle:
                                            TextStyle(color: Color(0xFF8C648A)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent))),
                                    controller: email,
                                    validator: (val) {
                                      if (val == null || val == "") {
                                        return "Oops Needs to be an Email Format";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: AppDimensions.height10 * 0.3),
                      // Container(
                      //   // color: Colors.blue,
                      //   height: AppDimensions.height10 * 1.7,
                      //   width: AppDimensions.height10 * 23.3,
                      //   margin: EdgeInsets.only(
                      //       left: AppDimensions.height10 * 4.4,
                      //       right: AppDimensions.height10 * 15.6),
                      //   child: Text(
                      //     "Ooops! Needs to be an email format",
                      //     style: TextStyle(
                      //       color: const Color(0xFFFE6624),
                      //       fontSize: AppDimensions.height10 * 1.4,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: AppDimensions.height10 * 1.1),
                      Container(
                          height: AppDimensions.height10 * 2.2,
                          width: AppDimensions.height10 * 26.1,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 3.6,
                              right: AppDimensions.height10 * 15.6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Loginemailandpassword(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: AppDimensions.height10 * 12.6,
                                  height: AppDimensions.height10 * 2.2,
                                  child: Text(
                                    "Login",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: AppDimensions.height10 * 1.4,
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

                SizedBox(height: AppDimensions.height10 * 5.0),

                Container(
                  height: AppDimensions.height10 * 4.4,
                  width: AppDimensions.height10 * 26.7,
                  // padding: EdgeInsets.only(left:AppDimensions.height10*0.8,top:AppDimensions.height10*1.6,right: AppDimensions.height10*0.8),

                  child: OutlinedButton.icon(
                    // <-- OutlinedButton
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 5.0),
                      ),
                      //<-- SEE HERE
                    ),
                    onPressed: () {
                      if (_formkey2.currentState!.validate()) {
                        Authentication().passReset(
                          '${email.text.toString()}',
                        );
                      }
                    },
                    icon: Image.asset(
                      "assets/images/fb.png",
                      width: 0.0,
                      height: 0.0,
                    ),
                    label: Center(
                        child: Text(
                      'Reset password',
                      style: TextStyle(
                        color: const Color(0xFF8C648A),
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
                // SizedBox(height: AppDimensions.height120+90),
              ],
              // child:  Text("Hello background"),
            ),
          ],
        ));
  }
}
