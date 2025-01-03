import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../utils/app_dimensions.dart';

class Acc_deleted extends StatelessWidget {
  const Acc_deleted({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context,
            FadePageRouteReverse(
                page: const HomeScreen(
              login: false,
            )));
        return Future.value(false);
      },
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              Buttons().closeButton(context, () {
                Navigator.push(
                    context,
                    FadePageRouteReverse(
                        page: const HomeScreen(
                      login: false,
                    )));
              })
            ],
            title: SizedBox(
              width: AppDimensions.width10(context) * 17.0,
              height: AppDimensions.height10(context) * 4.8,
              child: Center(
                child: Text(
                  'Account deleted',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.8,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/Onboarding-background2.webp'),
              fit: BoxFit.cover,
            )),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 11.1),
                  child: Image.asset(
                    'assets/images/logo.webp',
                    width: AppDimensions.width10(context) * 7.755,
                    height: AppDimensions.height10(context) * 7.755,
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 35.4,

                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 17.645),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: AppDimensions.width10(context) * 25.4,

                        child: Text(
                          'Your account\nhas been deleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: AppDimensions.height10(context) * 0.17,
                              fontSize: AppDimensions.font10(context) * 3.0,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFFBFBFB)),
                        ),
                      ),
                      Container(
                          width: AppDimensions.width10(context) * 35.4,
                          // height: AppDimensions.height10(context) * 12.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 2.5),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      // height: AppDimensions.height10(context) * 0.15,
                                      fontSize:
                                          AppDimensions.font10(context) * 2.0,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFBFBFB)),
                                  children: const [
                                    TextSpan(
                                        text:
                                            'It’s sad to see you go.\n\nIf you have feedback, please let us know by emailing us at\n'),
                                    TextSpan(
                                        text: 'support@potenic.com.',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline))
                                  ])))
                    ],
                  ),
                ),
                AnimatedScaleButton(
                  onTap: () {
                    Navigator.push(
                        context, FadePageRoute(page: const SignUpPage()));
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 25.4,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 16.2),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: AppDimensions.width10(context) * 0.1,
                            color: const Color(0xFFFBFBFB)),
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 5.0),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF5A4D73), Color(0xFFA57486)])),
                    child: Center(
                      child: Text(
                        'Create new account',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
