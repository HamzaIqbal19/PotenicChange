import 'package:flutter/material.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/ResetPassword/EmailSent.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Widgets/fading.dart';

class reset extends StatefulWidget {
  const reset({Key? key}) : super(key: key);

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
  final password = TextEditingController();
  final confirm = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool Loading = false;
  bool pass_obscure = true;
  bool pass_obscure2 = true;
  bool errorPassword = false;
  bool errorMatch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              key: formKey,
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 32.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                2.0,
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.5),
                                        width: AppDimensions.height10(context) *
                                            6.3,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.7,
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
                                          left:
                                              AppDimensions.height10(context) *
                                                  2.0,
                                        ),
                                        // width: AppDimensions.height10(context) * 36.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        child: TextFormField(
                                            obscureText: pass_obscure,
                                            controller: password,
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
                                            onChanged: (value) {
                                              setState(() {
                                                errorMatch = false;
                                                errorPassword = false;
                                              });
                                            },
                                            style: TextStyle(
                                                color: const Color(0xFF8C648A),
                                                fontWeight: FontWeight.w600,
                                                decoration: TextDecoration.none,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8),
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.zero,
                                                hintText: "*******",
                                                hintStyle: TextStyle(
                                                  color:
                                                      const Color(0xFF8C648A),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      AppDimensions.height10(
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
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    child: Center(
                                      child: Image.asset(
                                        pass_obscure
                                            ? 'assets/images/visible-icon-9.webp'
                                            : 'assets/images/ic_remove_red_eye.webp',
                                        color: const Color(0xFF8C648A),
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        width: AppDimensions.height10(context) *
                                            2.4,
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(height: AppDimensions.height10(context) * 0.3),
                        errorPassword
                            ? Container(
                                // color: Colors.blue,
                                height: AppDimensions.height10(context) * 1.7,
                                width: AppDimensions.height10(context) * 23.3,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 4.4,
                                    right:
                                        AppDimensions.height10(context) * 15.6),
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
                        SizedBox(height: AppDimensions.height10(context) * 2),
                        Container(
                          height: AppDimensions.height10(context) * 6,
                          width: AppDimensions.height10(context) * 36.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context) * 1.8))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 32.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                2.0,
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.5),
                                        //width: AppDimensions.height10(context) * 6.3,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        child: Text(
                                          "Confirm Password",
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
                                          left:
                                              AppDimensions.height10(context) *
                                                  2.0,
                                        ),
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        child: TextFormField(
                                            controller: confirm,
                                            obscureText: pass_obscure2,
                                            validator: (value) {
                                              if (confirm.text.toString() !=
                                                  password.text.toString()) {
                                                setState(() {
                                                  errorMatch = true;
                                                });
                                              } else {
                                                setState(() {
                                                  errorMatch = false;
                                                });
                                              }
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                errorMatch = false;
                                                errorPassword = false;
                                              });
                                            },
                                            style: TextStyle(
                                                color: const Color(0xFF8C648A),
                                                fontWeight: FontWeight.w600,
                                                decoration: TextDecoration.none,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8),
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.zero,
                                                hintText: "*******",
                                                hintStyle: TextStyle(
                                                  color:
                                                      const Color(0xFF8C648A),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      AppDimensions.height10(
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
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (pass_obscure2 == true) {
                                        pass_obscure2 = false;
                                      } else {
                                        pass_obscure2 = true;
                                      }
                                    });
                                  },
                                  child: SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    child: Image.asset(
                                      pass_obscure2
                                          ? 'assets/images/visible-icon-9.webp'
                                          : 'assets/images/ic_remove_red_eye.webp',
                                      color: const Color(0xFF8C648A),
                                      height:
                                          AppDimensions.height10(context) * 2.4,
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(height: AppDimensions.height10(context) * 0.3),
                        errorMatch
                            ? Container(
                                // color: Colors.blue,
                                height: AppDimensions.height10(context) * 1.7,
                                width: AppDimensions.height10(context) * 23.3,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 4.4,
                                    right:
                                        AppDimensions.height10(context) * 15.6),
                                child: Text(
                                  "Password do not match",
                                  style: TextStyle(
                                    color: const Color(0xFFFE6624),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),

                  SizedBox(height: AppDimensions.height10(context) * 3.0),

                  AnimatedScaleButton(
                    onTap: () {
                      if (formKey.currentState!.validate() &&
                          errorMatch == false &&
                          errorPassword == false) {
                        setState(() {
                          Loading = true;
                        });
                        Authentication()
                            .passwordReset(confirm.text.toString())
                            .then((value) {
                          if (value == true) {
                            setState(() {
                              Loading = false;
                            });
                            Navigator.push(
                              context,
                              FadePageRoute(
                                page: const Confirmation(),
                              ),
                            );
                            print('======DATA PASSED');
                          } else if (value == 400) {
                            setState(() {
                              Loading = false;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              "It seems you entered your old password. For password reset, please enter a new password to proceed.",
                              style: TextStyle(color: Colors.red),
                            )));
                          } else {
                            setState(() {
                              Loading = false;
                            });
                            print('======DATA FAILED');
                          }
                        }).catchError((error) {
                          setState(() {
                            Loading = false;
                          });
                          print('object');
                          print("error");
                        });
                      } else {
                        setState(() {
                          Loading = false;
                        });
                      }
                    },
                    child: Container(
                      height: AppDimensions.height10(context) * 4.4,
                      width: AppDimensions.height10(context) * 26.7,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 5.0),
                      ),
                      // padding: EdgeInsets.only(left:AppDimensions.height10(context) *0.8,top:AppDimensions.height10(context) *1.6,right: AppDimensions.height10(context) *0.8),

                      child: Center(
                        child: Loading == false
                            ? Text(
                                'Confirm new pasword',
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
                        FadePageRoute(
                            page: const HomeScreen(
                          login: false,
                        )),
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
                      image: const AssetImage("assets/images/logo.webp"),
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

                AnimatedScaleButton(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      FadePageRoute(page: Loginemailandpassword()),
                    );
                  },
                  child: Container(
                    height: AppDimensions.height10(context) * 4.4,
                    width: AppDimensions.height10(context) * 26.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 5.0),
                      color: const Color(0xFFFFFFFF),
                    ),
                    // padding: EdgeInsets.only(left:AppDimensions.height10(context) *0.8,top:AppDimensions.height10(context) *1.6,right: AppDimensions.height10(context) *0.8),

                    child: Center(
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
