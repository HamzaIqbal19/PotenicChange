import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_new_hurdle.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class new_hurdles_summary extends StatefulWidget {
  const new_hurdles_summary({super.key});

  @override
  State<new_hurdles_summary> createState() => _new_hurdles_summaryState();
}

class _new_hurdles_summaryState extends State<new_hurdles_summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/practicebackground.webp'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppDimensions.width10(context) * 31.8,
                  height: AppDimensions.height10(context) * 3.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.0,
                      bottom: AppDimensions.height10(context) * 0.5),
                  child: GradientText(
                    'Your Hurdle Summary',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 23.2,
                  height: AppDimensions.height10(context) * 3.8,
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 3.765),
                  child: GradientText(
                    'Below is an overview of your\nfaced hurdles',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 19.6,
                  height: AppDimensions.height10(context) * 19.6,
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 3.828),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/black_hole.webp'))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.width10(context) * 7.1,
                        height: AppDimensions.height10(context) * 1.9,
                        child: Text(
                          'Husband',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        // width: AppDimensions.width10(context) * 1571,
                        // height: AppDimensions.height10(context) * 1.7,
                        child: Text(
                          'Makes a mistake',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.font10(context) * 1.4,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 32.6,
                  height: AppDimensions.height10(context) * 2.4,
                  child: Center(
                    child: Text(
                      'Current feelings and thoughts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  // width: AppDimensions.width10(context) * 41.4,
                  height: AppDimensions.height10(context) * 14.7,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 2.6),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 14.5,
                          width: AppDimensions.width10(context) * 14.5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff546096),
                                    Color(0xff54A7BC)
                                  ])),
                          child: Center(
                            child: Text(
                              'I just expect him to make mistakes all the time',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 14.5,
                          width: AppDimensions.width10(context) * 14.5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff546096),
                                    Color(0xff54A7BC)
                                  ])),
                          child: Center(
                            child: Text(
                              'I get so frustrated when he makes simple mistake',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 14.5,
                          width: AppDimensions.width10(context) * 14.5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff546096),
                                    Color(0xff54A7BC)
                                  ])),
                          child: Center(
                            child: Text(
                              'I see the mistake and think ‘not again’ ‘it’s so obvious’.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 14.5,
                          width: AppDimensions.width10(context) * 14.5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff546096),
                                    Color(0xff54A7BC)
                                  ])),
                          child: Center(
                            child: Text(
                              'I have an extra big child to look after.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: AppDimensions.height10(context) * 2.0,
                    width: AppDimensions.width10(context) * 2.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.3),
                    padding:
                        EdgeInsets.all(AppDimensions.height10(context) * 0.5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    child: const ImageIcon(
                      AssetImage('assets/images/edit_icon.webp'),
                      color: Colors.white,
                      //size: 10,
                    )),
                Container(
                  width: AppDimensions.width10(context) * 32.6,
                  height: AppDimensions.height10(context) * 2.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.0),
                  child: Center(
                    child: Text(
                      'Positive actions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: AppDimensions.height10(context) * 14.5,
                  width: AppDimensions.width10(context) * 14.5,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.9),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: AppDimensions.width10(context) * 0.1,
                          color: Colors.white),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/Ellipse 161.webp'))),
                  child: Center(
                    child: Text(
                      'I will leave him to it\ninstead of trying to\nsolve it for him',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 1.4,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                    height: AppDimensions.height10(context) * 2.0,
                    width: AppDimensions.width10(context) * 2.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.0),
                    padding:
                        EdgeInsets.all(AppDimensions.height10(context) * 0.5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    child: const ImageIcon(
                      AssetImage('assets/images/edit_icon.webp'),
                      color: Colors.white,
                      //size: 10,
                    )),
                Container(
                  width: AppDimensions.width10(context) * 32.6,
                  height: AppDimensions.height10(context) * 2.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.0),
                  child: Center(
                    child: Text(
                      'Positive thoughts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: AppDimensions.height10(context) * 14.5,
                  width: AppDimensions.width10(context) * 14.5,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.9),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: AppDimensions.width10(context) * 0.1,
                          color: Colors.white),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/Ellipse 161.webp'))),
                  child: Center(
                    child: Text(
                      'Remember that he\nis good to me and\ntreats me with\nrespect.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 1.4,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                    height: AppDimensions.height10(context) * 2.0,
                    width: AppDimensions.width10(context) * 2.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.0),
                    padding:
                        EdgeInsets.all(AppDimensions.height10(context) * 0.5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    child: const ImageIcon(
                      AssetImage('assets/images/edit_icon.webp'),
                      color: Colors.white,
                      //size: 10,
                    )),
                Container(
                    width: AppDimensions.width10(context) * 37.8,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 4.2,
                        bottom: AppDimensions.height10(context) * 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: AppDimensions.height10(context) * 5.0,
                              width: AppDimensions.width10(context) * 15.7,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10(context) * 1.4),
                              decoration: BoxDecoration(
                                color: const Color(0xff464646),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 5.0),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                0.8),
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Arial'),
                                        ),
                                      ),
                                    ],
                                  ))),
                          Container(
                              height: AppDimensions.height10(context) * 5.0,
                              width: AppDimensions.width10(context) * 19.7,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffFCC10D),
                                    Color(0xffFDA210),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 5.0),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const new_hurdles()));
                                  },
                                  child: Text(
                                    'Save Practice',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins'),
                                  ))),
                        ])),
              ],
            )),
      ),
    );
  }
}
