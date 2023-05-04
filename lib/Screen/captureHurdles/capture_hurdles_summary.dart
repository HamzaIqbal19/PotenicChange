import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_new_hurdle.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../utils/app_dimensions.dart';

class summary_hurdles extends StatefulWidget {
  const summary_hurdles({super.key});

  @override
  State<summary_hurdles> createState() => _summary_hurdlesState();
}

class _summary_hurdlesState extends State<summary_hurdles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/practicebackground.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppDimensions.height10 * 35.4,
                  height: AppDimensions.height10 * 9.3,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 5.0,
                      bottom: AppDimensions.height10 * 3.349),
                  child: GradientText(
                    'Well done for capturing your hurdle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.8,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 21.252,
                  height: AppDimensions.height10 * 21.322,
                  margin:
                      EdgeInsets.only(bottom: AppDimensions.height10 * 3.828),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/black_hole.png'))),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: AppDimensions.height10 * 7.1,
                              height: AppDimensions.height10 * 1.9,
                              child: Text(
                                'Husband',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.6,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              // width: AppDimensions.height10 * 1571,
                              // height: AppDimensions.height10 * 1.7,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 0.6),
                              child: Text(
                                'Makes a mistake',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.4,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.8),
                        child: Container(
                            height: AppDimensions.height10 * 2.0,
                            width: AppDimensions.height10 * 2.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 2.1),
                            padding:
                                EdgeInsets.all(AppDimensions.height10 * 0.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: ImageIcon(
                              AssetImage('assets/images/edit_icon.png'),
                              color: Colors.white,
                              //size: 10,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 32.6,
                  height: AppDimensions.height10 * 5.2,
                  child: Center(
                    child: Text(
                      'Your current\nthoughts and feelings',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  // width: AppDimensions.height10 * 41.4,
                  height: AppDimensions.height10 * 14.7,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.9),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: AppDimensions.height10 * 14.5,
                          width: AppDimensions.height10 * 14.5,
                          decoration: BoxDecoration(
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
                              'I just expect him to\nmake mistakes all\nthe time',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10 * 14.5,
                          width: AppDimensions.height10 * 14.5,
                          decoration: BoxDecoration(
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
                              'I get so frustrated\nwhen he makes\nsimple mistake',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10 * 14.5,
                          width: AppDimensions.height10 * 14.5,
                          decoration: BoxDecoration(
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
                              'I see the mistake\nand think ‘not again’\n‘it’s so obvious’.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10 * 14.5,
                          width: AppDimensions.height10 * 14.5,
                          decoration: BoxDecoration(
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
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: AppDimensions.height10 * 2.0,
                    width: AppDimensions.height10 * 2.0,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 2.1),
                    padding: EdgeInsets.all(AppDimensions.height10 * 0.5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    child: ImageIcon(
                      AssetImage('assets/images/edit_icon.png'),
                      color: Colors.white,
                      //size: 10,
                    )),
                Container(
                  width: AppDimensions.height10 * 32.6,
                  height: AppDimensions.height10 * 5.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                  child: Center(
                    child: Text(
                      'Which goals\nare impacted?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 41.4,
                  height: AppDimensions.height10 * 14.1,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.9),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Container(
                        height: AppDimensions.height10 * 13.1,
                        width: AppDimensions.height10 * 13.1,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 2.1,
                            left: AppDimensions.height10 * 10.3),
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
                      Container(
                        height: AppDimensions.height10 * 13.1,
                        width: AppDimensions.height10 * 13.1,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 2.1),
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
                            'Count down',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                    height: AppDimensions.height10 * 2.0,
                    width: AppDimensions.height10 * 2.0,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                    padding: EdgeInsets.all(AppDimensions.height10 * 0.5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    child: ImageIcon(
                      AssetImage('assets/images/edit_icon.png'),
                      color: Colors.white,
                      //size: 10,
                    )),
                Container(
                  width: AppDimensions.height10 * 32.6,
                  height: AppDimensions.height10 * 5.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                  child: Center(
                    child: Text(
                      'What or who has triggered\nyour hurdle?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 41.4,
                  height: AppDimensions.height10 * 14.1,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.9),
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
                            colors: [Color(0xffBE3FC6), Color(0xff642445)])),
                    child: Center(
                      child: Text(
                        'People',
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
                    height: AppDimensions.height10 * 2.0,
                    width: AppDimensions.height10 * 2.0,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                    padding: EdgeInsets.all(AppDimensions.height10 * 0.5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    child: ImageIcon(
                      AssetImage('assets/images/edit_icon.png'),
                      color: Colors.white,
                      //size: 10,
                    )),
                Container(
                    width: AppDimensions.height10 * 37.8,
                    height: AppDimensions.height10 * 5.0,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 4.2),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: AppDimensions.height10 * 5.0,
                              width: AppDimensions.height10 * 15.7,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 2.4),
                              decoration: BoxDecoration(
                                color: const Color(0xff464646),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 5.0),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 0.8),
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                AppDimensions.height10 * 1.6,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))),
                          Container(
                              height: AppDimensions.height10 * 5.0,
                              width: AppDimensions.height10 * 19.7,
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
                                    AppDimensions.height10 * 5.0),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                landing_hurdles(
                                                  multiple_hurdle: false,
                                                )));
                                  },
                                  child: Text(
                                    'Finish & exit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ))),
                        ])),
                Container(
                  // width: AppDimensions.height10 * 34.0,
                  height: AppDimensions.height10 * 2.2,
                  // color: Colors.amber,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.1,
                    bottom: AppDimensions.height10 * 2.2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Coming soon ',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        '‘Add positive alternatives’',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 17.0,
                  height: AppDimensions.height10 * 0.5,
                  margin:
                      EdgeInsets.only(bottom: AppDimensions.height10 * 11.8),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                      color: Color(0xFFFFFFFF).withOpacity(0.3)),
                )
              ],
            )),
      ),
    );
  }
}
