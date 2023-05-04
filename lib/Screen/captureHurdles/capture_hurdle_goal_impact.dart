import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_select_hurdle.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';

class hurdles_goal_impact extends StatefulWidget {
  const hurdles_goal_impact({super.key});

  @override
  State<hurdles_goal_impact> createState() => _hurdles_goal_impactState();
}

class _hurdles_goal_impactState extends State<hurdles_goal_impact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Container(
            width: AppDimensions.height10 * 18.9,
            height: AppDimensions.height10 * 2.4,
            child: Row(
              children: [
                //increasing font size through out title in hurdles by 2 px
                //change was requested by clients
                GradientText(
                  'Capture Hurdle ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  ' 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  '/5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.2,
                    fontWeight: FontWeight.w400,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Container(
                            width: AppDimensions.height10 * 27.0,
                            height: AppDimensions.height10 * 21.0,
                            child: AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              actionsPadding: EdgeInsets.zero,
                              titlePadding: EdgeInsets.zero,
                              title: Container(
                                margin: EdgeInsets.only(
                                    top: 19, right: 16, left: 16, bottom: 2),
                                height: AppDimensions.height10 * 2.2,
                                width: AppDimensions.height10 * 23.8,
                                child: const Text(
                                  "Exit hurdle?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              content: Container(
                                margin: EdgeInsets.only(
                                    bottom: 19, left: 16, right: 16),
                                height: 32,
                                width: 238,
                                child: const Text(
                                  "Please select from the options below",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                Column(
                                  children: [
                                    SizedBox(
                                      height: AppDimensions.height10 * 0.1,
                                      child: Divider(
                                        color:
                                            Color(0XFF3C3C43).withOpacity(0.29),
                                      ),
                                    ),
                                    Container(
                                      height: 42,
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Exit & save progress',
                                          style: TextStyle(
                                              color: Color(0xFF007AFF),
                                              fontSize: 17,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimensions.height10 * 0.1,
                                      child: Divider(
                                        color:
                                            Color(0XFF3C3C43).withOpacity(0.29),
                                      ),
                                    ),
                                    Container(
                                      height: 44,
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Exit & delete progress',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF007AFF)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimensions.height10 * 0.1,
                                      child: Divider(
                                        color:
                                            Color(0XFF3C3C43).withOpacity(0.29),
                                      ),
                                    ),
                                    Container(
                                      height: 42,
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Cancel exit',
                                          style: TextStyle(
                                              color: Color(0xFF007AFF),
                                              fontSize: 17,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            )
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          // margin: EdgeInsets.only(top: AppDimensions.height10 * 6.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/practicebackground.png'),
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                  fit: BoxFit.cover)),
          child: Column(children: [
            Container(
              width: AppDimensions.height10 * 36.0,
              height: AppDimensions.height10 * 67.9,
              margin: EdgeInsets.only(
                  top: AppDimensions.height10 * 9.3,
                  left: AppDimensions.height10 * 3.0,
                  right: AppDimensions.height10 * 2.4),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 34.3,
                        height: AppDimensions.height10 * 7.3,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 8.7),
                        child: Center(
                          //Text alingment changes
                          child: GradientText(
                            'Which goals\nare impacted?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.8,
                              fontWeight: FontWeight.w700,
                            ),
                            colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 14.1,
                        height: AppDimensions.height10 * 14.1,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10 * 2.1,
                            right: AppDimensions.height10 * 19.8,
                            top: AppDimensions.height10 * 2.9),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.white)),
                        padding: EdgeInsets.all(AppDimensions.height10 * 0.5),
                        child: Container(
                          height: AppDimensions.height10 * 13.1,
                          width: AppDimensions.height10 * 13.1,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.height10 * 0.1,
                                  color: Colors.white),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffBE3FC6),
                                    Color(0xff642445)
                                  ])),
                          child: Center(
                            child: Text(
                              'All goals',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.4,
                        height: AppDimensions.height10 * 2.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 21.2,
                            left: AppDimensions.height10 * 2.8,
                            top: AppDimensions.height10 * 2.0),
                        child: Center(
                          child: Text(
                            'Active Goals',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 2.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 2.7,
                            left: AppDimensions.height10 * 2.6,
                            top: AppDimensions.height10 * 1.0,
                            bottom: AppDimensions.height10 * 2.0),
                        child: Row(children: [
                          Container(
                            height: AppDimensions.height10 * 13.1,
                            width: AppDimensions.height10 * 13.1,
                            margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 4.5,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.1,
                                    color: Colors.white),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffBE3FC6),
                                      Color(0xff642445)
                                    ])),
                            child: Center(
                              child: Text(
                                'Anger\nmanagement',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10 * 13.1,
                            width: AppDimensions.height10 * 13.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.1,
                                    color: Colors.white),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffBE3FC6),
                                      Color(0xff642445)
                                    ])),
                            child: Center(
                              child: Text(
                                'Become more\nconfident',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        width: AppDimensions.height10 * 13.7,
                        height: AppDimensions.height10 * 2.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 19.5,
                            left: AppDimensions.height10 * 2.8),
                        child: Center(
                          child: Text(
                            'Inactive Goals',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 2.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 2.7,
                            left: AppDimensions.height10 * 2.6,
                            top: AppDimensions.height10 * 2.0,
                            bottom: AppDimensions.height10 * 0.7),
                        child: Row(children: [
                          Container(
                            height: AppDimensions.height10 * 13.1,
                            width: AppDimensions.height10 * 13.1,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 4.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.1,
                                    color: Colors.white),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffBE3FC6),
                                      Color(0xff642445)
                                    ])),
                            child: Center(
                              child: Text(
                                '[Goal 3]',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10 * 13.1,
                            width: AppDimensions.height10 * 13.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.1,
                                    color: Colors.white),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffBE3FC6),
                                      Color(0xff642445)
                                    ])),
                            child: Center(
                              child: Text(
                                '[Goal 4]',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: AppDimensions.height10 * 2.7,
                          left: AppDimensions.height10 * 2.6,
                        ),
                        child: Row(children: [
                          Container(
                            height: AppDimensions.height10 * 13.1,
                            width: AppDimensions.height10 * 13.1,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 4.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.1,
                                    color: Colors.white),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffBE3FC6),
                                      Color(0xff642445)
                                    ])),
                            child: Center(
                              child: Text(
                                '[Goal 3]',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10 * 13.1,
                            width: AppDimensions.height10 * 13.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.1,
                                    color: Colors.white),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffBE3FC6),
                                      Color(0xff642445)
                                    ])),
                            child: Center(
                              child: Text(
                                '[Goal 4]',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 25.4,
              height: AppDimensions.height10 * 5.0,
              margin: EdgeInsets.only(
                  top: AppDimensions.height10 * 3.3,
                  bottom: AppDimensions.height10 * 2.6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffFCC10D),
                    Color(0xffFDA210),
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(AppDimensions.height10 * 5.0),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => select_hurdle()),
                    );
                  },
                  child: Text(
                    '(5/5 goals selected) Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ),
            Container(
              width: AppDimensions.height10 * 17.0,
              height: AppDimensions.height10 * 0.5,
              margin: EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 2.0),
                  color: Color(0xFFFFFFFF).withOpacity(0.3)),
            )
          ])),
    );
  }
}
