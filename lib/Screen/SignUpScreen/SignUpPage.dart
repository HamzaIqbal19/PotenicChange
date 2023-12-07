import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpWithEmail.dart';
import 'package:potenic_app/Widgets/TermsAndConditionBottomSheet.dart';
import 'package:potenic_app/Widgets/fading2.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/animatedButton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late AnimationController _controller_log;
  bool isPasswordNotVisible = true;
  bool boolean = true;

  setEmail(email) async {
    setEmail(email) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('email', email);
    }
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
                 // width: AppDimensions.width10(context) * 2.8,
                  height: AppDimensions.height10(context) * 2.8,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pushReplacement(
                  //   context,
                  //   FadePageRoute2(
                  //     enterPage:HomeScreen(
                  //       login: false,
                  //     ),
                  //     exitPage:SignUpPage(),
                  //
                  //   ),
                  // );
                  // Add code for performing close action
                },
              ),
            ),
          ],
        ),
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
                  child: Image(
                    // color: Colors.orange,
                    image: const AssetImage("assets/images/logo.webp"),
                    height: AppDimensions.height10(context) * 7.75,
                    width: AppDimensions.width10(context) * 7.75,
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 2.32),
                Container(
                  height: AppDimensions.height10(context) * 3.6,
                  child: Text(
                    "Welcome to Potenic",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 3),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) + 1),
                Container(
                    height: AppDimensions.height10(context) * 4.6,
                    width: AppDimensions.width10(context) * 35.3,
                    child: Text(
                      'Your Personalised Journey To Better \n  Self Starts Here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 1.8,
                      ),
                    )),
                SizedBox(height: AppDimensions.height10(context) * 4.8),
                Container(
                  height: AppDimensions.height10(context) * 21.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadePageRoute2(true,
                                enterPage: SignUpWithEmail(),
                                exitPage: const SignUpPage()),
                          );
                        },
                        child: Container(
                          height: AppDimensions.height10(context) * 5.6,
                          width: AppDimensions.width10(context) * 34.1,
                          decoration: BoxDecoration(
                              color: const Color(0xFF5A4D73),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 4.0),
                              border: Border.all(
                                  width: AppDimensions.width10(context) * 0.1,
                                  color: const Color(0xFFFFFFFF))),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        AppDimensions.height10(context) * 1.6),
                                child: Icon(
                                  Icons.mail_outline,
                                  color: Colors.white,
                                  size: AppDimensions.height10(context) * 2.4,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 0.8,
                                    top: AppDimensions.height10(context) * 0.1),
                                child: Text(
                                  '  Sign up with email',
                                  style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2,
                      ),
                      Container(
                        height: AppDimensions.height10(context) * 5.6,
                        width: AppDimensions.width10(context) * 34.1,
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
                            termsSheet(context);
                          },
                          icon: Image.asset(
                            "assets/images/Google.webp",
                            width: AppDimensions.width10(context) * 2.4,
                            height: AppDimensions.height10(context) * 2.4,
                          ),
                          label: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                '  Sign up with Google',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2,
                      ),
                      Container(
                        height: AppDimensions.height10(context) * 5.6,
                        width: AppDimensions.width10(context) * 34.1,
                        child: OutlinedButton.icon(
                          // <-- OutlinedButton
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF1877F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 4.0),
                            ),
                            //<-- SEE HERE
                          ),
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/fb.webp",
                            width: AppDimensions.width10(context) * 2.4,
                            height: AppDimensions.height10(context) * 2.4,
                          ),
                          label: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                '  Sign up with Facebook',
                                style: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 26.2),
                GestureDetector(
                  onTapDown: (TapDownDetails details) {
                    _controller.forward();
                  },
                  onTap: () async {
                    _controller.forward();

                    await Future.delayed(const Duration(milliseconds: 200));

                    _controller.reverse();

                    await Future.delayed(const Duration(milliseconds: 200));
                    Navigator.push(
                      context,
                      FadePageRoute2(
                        true,
                        exitPage: const SignUpPage(),
                        enterPage: LoginPage(),
                      ),
                    );
                  },
                  child: Transform.scale(
                    scale: 1 - _controller.value,
                    child: Container(
                      height: AppDimensions.height10(context) * 5.2,
                      width: AppDimensions.width10(context) * 29.3,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(
                            AppDimensions.height10(context) * 5.0)),
                      ),
                      child: Center(
                        child: Text(
                          "I already have an account",
                          style: TextStyle(
                            color: const Color(0xFF8C648A),
                            fontSize: AppDimensions.font10(context) * 1.6,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
              // child:  Text("Hello background"),
            ),
          ],
        )
        //   child:Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //
        //     // children: [
        //     //
        //     //
        //     //
        //     //
        //     // ],
        //   )

        );
  }
}
