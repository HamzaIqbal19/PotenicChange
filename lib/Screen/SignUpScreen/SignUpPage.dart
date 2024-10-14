import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpWithEmail.dart';
import 'package:potenic_app/Widgets/TermsAndConditionBottomSheet.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/utils/app_assets.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
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
  bool isPasswordNotVisible = true;
  bool boolean = true;

  setEmail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('email', email);
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
          actions: [
            Buttons().closeButton(context, () {
              Navigator.pop(context);
            })
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
                SizedBox(
                  height: AppDimensions.height10(context) * 3.6,
                  child: Text(
                    AppText().welcomeText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 3),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) + 1),
                SizedBox(
                    height: AppDimensions.height10(context) * 4.6,
                    width: AppDimensions.width10(context) * 35.3,
                    child: Text(
                      AppText().signUpSubHead,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 1.8,
                      ),
                    )),
                SizedBox(height: AppDimensions.height10(context) * 4.8),
                SizedBox(
                  height: AppDimensions.height10(context) * 21.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadePageRoute2(true,
                                enterPage: const SignUpWithEmail(),
                                exitPage: const SignUpPage()),
                          );
                        },
                        child: buildOutlinedButtonWithImage(
                            context,
                            AppAssets.mailLogo,
                            AppText().signUpEmail,
                            true,
                            const Color(0xFF5A4D73),
                            Colors.white),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2,
                      ),
                      buildOutlinedButtonWithImage(
                          context,
                          AppAssets.googleLogo,
                          AppText().signUpGoogle,
                          false,
                          Colors.white,
                          Colors.black45),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2,
                      ),
                      buildOutlinedButtonWithImage(
                          context,
                          AppAssets.fbLogo,
                          AppText().signUpFacebook,
                          false,
                          const Color(0xFF1877F2),
                          Colors.white),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 26.2),
                AnimatedScaleButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      FadePageRoute2(
                        true,
                        exitPage: const SignUpPage(),
                        enterPage: const LoginPage(),
                      ),
                    );
                  },
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
                        AppText().alreadySignedUpButton,
                        style: TextStyle(
                          color: const Color(0xFF8C648A),
                          fontSize: AppDimensions.font10(context) * 1.8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
