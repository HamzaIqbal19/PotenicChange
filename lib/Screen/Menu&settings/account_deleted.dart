import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class Acc_deleted extends StatelessWidget {
  const Acc_deleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            ),
          ],
          title: SizedBox(
            width: AppDimensions.height10 * 17.0,
            height: AppDimensions.height10 * 4.8,
            child: Center(
              child: Text(
                'Account deleted',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.height10 * 1.8,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Onboarding-background2.png'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: AppDimensions.height10 * 11.1),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: AppDimensions.height10 * 7.755,
                  height: AppDimensions.height10 * 7.755,
                ),
              ),
              Container(
                width: AppDimensions.height10 * 35.4,
                height: AppDimensions.height10 * 25.1,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 17.645),
                child: Column(
                  children: [
                    SizedBox(
                      width: AppDimensions.height10 * 25.4,
                      height: AppDimensions.height10 * 7.2,
                      child: Text(
                        'Your account\nhas been deleted',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: AppDimensions.height10 * 0.12,
                            fontSize: AppDimensions.height10 * 3.0,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFBFBFB)),
                      ),
                    ),
                    Container(
                        width: AppDimensions.height10 * 35.4,
                        height: AppDimensions.height10 * 12.4,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 2.5),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontFamily: 'laila',
                                    height: AppDimensions.height10 * 0.15,
                                    fontSize: AppDimensions.height10 * 2.0,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFFBFBFB)),
                                children: [
                                  const TextSpan(
                                      text:
                                          'It’s sad to see you go. Is there\nsomething we did wrong?\nLet us know by emailing us at\n'),
                                  const TextSpan(
                                      text: 'info@potenic.com.',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline))
                                ])))
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 25.4,
                height: AppDimensions.height10 * 5.0,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 16.2),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 5.0),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF5A4D73), Color(0xFFA57486)])),
                child: Center(
                  child: SizedBox(
                    width: AppDimensions.height10 * 15.3,
                    height: AppDimensions.height10 * 2.5,
                    child: Center(
                      child: Text(
                        'Create new account',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
