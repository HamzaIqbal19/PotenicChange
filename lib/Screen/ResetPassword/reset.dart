import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/ResetPassword/EmailSent.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/fading.dart';

class reset extends StatefulWidget {
  const reset({Key? key}) : super(key: key);

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
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
              //       'assets/images/Back.png',
              //       width: AppDimensions.height10(context) * 3,
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
                      'assets/images/Close.png',
                      width: AppDimensions.height10(context) * 3.0,
                      height: AppDimensions.height10(context) * 3.0,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
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
                  height: AppDimensions.height10(context) * 8.02,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Image(
                      image: const AssetImage("assets/images/logo.png"),
                      height: AppDimensions.height10(context) * 7.75,
                      width: AppDimensions.height10(context) * 7.75,
                    ),
                  ),
                ),

                SizedBox(height: AppDimensions.height10(context) * 2.35),
                Container(
                  height: AppDimensions.height10(context) * 3.9,
                  child: Text(
                    "Reset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 3.0,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 0.9),

                // SizedBox(height: AppDimensions.height0),
                Container(
                  height: AppDimensions.height10(context) * 26 + 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: AppDimensions.height10(context) * 3.2),
                      Container(
                        height: AppDimensions.height10(context) * 6,
                        width: AppDimensions.height10(context) * 36.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(
                                AppDimensions.height10(context) * 1.8))),
                        child: Row(children: [
                          SizedBox(
                            width: AppDimensions.height10(context) * 34.0,
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
                                  // width: AppDimensions.height10(context) * 36.0,
                                  height: AppDimensions.height10(context) * 2.2,
                                  child: TextFormField(
                                      obscureText: true,
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
                                                          .transparent)))),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: AppDimensions.height10(context) * 0.3),
                      Container(
                        // color: Colors.blue,
                        height: AppDimensions.height10(context) * 1.7,
                        width: AppDimensions.height10(context) * 23.3,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 4.4,
                            right: AppDimensions.height10(context) * 15.6),
                        child: Text(
                          "Minimum 8 characters",
                          style: TextStyle(
                            color: const Color(0xFFFE6624),
                            fontSize: AppDimensions.height10(context) * 1.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.height10(context) * 2),
                      Container(
                        height: AppDimensions.height10(context) * 6,
                        width: AppDimensions.height10(context) * 36.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(
                                AppDimensions.height10(context) * 1.8))),
                        child: Row(children: [
                          SizedBox(
                            width: AppDimensions.height10(context) * 34.0,
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
                                  //width: AppDimensions.height10(context) * 6.3,
                                  height: AppDimensions.height10(context) * 1.7,
                                  child: Text(
                                    "Confirm Password",
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
                                  // width: AppDimensions.height10(context) * 36.0,
                                  height: AppDimensions.height10(context) * 2.2,
                                  child: TextFormField(
                                      obscureText: true,
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
                                                          .transparent)))),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: AppDimensions.height10(context) * 0.3),
                      Container(
                        // color: Colors.blue,
                        height: AppDimensions.height10(context) * 1.7,
                        width: AppDimensions.height10(context) * 23.3,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 4.4,
                            right: AppDimensions.height10(context) * 15.6),
                        child: Text(
                          "Password do not match",
                          style: TextStyle(
                            color: const Color(0xFFFE6624),
                            fontSize: AppDimensions.height10(context) * 1.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: AppDimensions.height10(context) * 3.0),

                Container(
                  height: AppDimensions.height10(context) * 4.4,
                  width: AppDimensions.height10(context) * 26.7,
                  // padding: EdgeInsets.only(left:AppDimensions.height10(context)*0.8,top:AppDimensions.height10(context)*1.6,right: AppDimensions.height10(context)*0.8),

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
                      Navigator.push(
                        context,
                        FadePageRoute(
                          page: Confirmation(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      "assets/images/fb.png",
                      width: 0.0,
                      height: 0.0,
                    ),
                    label: Center(
                        child: Text(
                      'Confirm new pasword',
                      style: TextStyle(
                        color: const Color(0xFF8C648A),
                        fontSize: AppDimensions.height10(context) * 1.6,
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

class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

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
              //       'assets/images/Back.png',
              //       width: AppDimensions.height10(context) * 3,
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
                      'assets/images/Close.png',
                      width: AppDimensions.height10(context) * 3.0,
                      height: AppDimensions.height10(context) * 3.0,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
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
                  height: AppDimensions.height10(context) * 8.02,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Image(
                      image: const AssetImage("assets/images/logo.png"),
                      height: AppDimensions.height10(context) * 7.75,
                      width: AppDimensions.height10(context) * 7.75,
                    ),
                  ),
                ),

                SizedBox(height: AppDimensions.height10(context) * 2.35),
                Container(
                  //height: AppDimensions.height10(context) * 7.2,
                  child: Text(
                    "You have updated\nyour password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      height: AppDimensions.height10(context) * 0.15,
                      color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 3.0,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 4.6),

                // SizedBox(height: AppDimensions.height0),

                Container(
                  height: AppDimensions.height10(context) * 4.4,
                  width: AppDimensions.height10(context) * 26.4,
                  // padding: EdgeInsets.only(left:AppDimensions.height10(context)*0.8,top:AppDimensions.height10(context)*1.6,right: AppDimensions.height10(context)*0.8),

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
                      Navigator.push(
                        context,
                        FadePageRoute(
                          page: HomeScreen(log_status: false),
                        ),
                      );
                    },
                    icon: Image.asset(
                      "assets/images/fb.png",
                      width: 0.0,
                      height: 0.0,
                    ),
                    label: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                        color: const Color(0xFF8C648A),
                        fontSize: AppDimensions.height10(context) * 1.6,
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
