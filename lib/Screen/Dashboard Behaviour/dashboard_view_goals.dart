import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_noPast_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_no_planned_session.dart';

import '../../Widgets/bottom_navigation.dart';
import '../../Widgets/mult_circles.dart';
import '../../utils/app_dimensions.dart';
import 'menu_dashboard_behaviour.dart';

class view_goals extends StatelessWidget {
  const view_goals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Row(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(right: AppDimensions.height10 * 1.7),
                    child: Image.asset(
                      'assets/images/Add goal.png',
                      height: AppDimensions.height10 * 2.0,
                      width: AppDimensions.height10 * 2.1,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(right: AppDimensions.height10 * 1.32),
                    child: Image.asset(
                      'assets/images/calendar_month_black_24dp 1.png',
                      height: AppDimensions.height10 * 2.4,
                      width: AppDimensions.height10 * 2.4,
                    ),
                  ),
                ],
              )
            ]),
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: Navigation_Bar(
          bg_colored: true,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Mask Group.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: AppDimensions.height10 * 79.8,
            child: SizedBox(
                width: double.infinity,
                height: AppDimensions.height10 * 19.2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: AppDimensions.height10 * 19.2,
                          width: AppDimensions.height10 * 45.7,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(-1, 1),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                no_past_session()));
                                  },
                                  child: Container(
                                    height: AppDimensions.height10 * 7.9,
                                    width: AppDimensions.height10 * 7.9,
                                    //margin: const EdgeInsets.only(top: 84),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: Colors.white),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xffF5F1E0),
                                            Color(0xffEDDC97)
                                          ]),
                                    ),
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            top: AppDimensions.height10 * 1),
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height:
                                                  AppDimensions.height10 * 1.7,

                                              // color: Colors.blue,
                                              child: Text(
                                                'MON',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.2,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff5B74A6)),
                                              ),
                                            ),
                                            Container(
                                              //width: AppDimensions.height10 * 4.0,
                                              height:
                                                  AppDimensions.height10 * 1.7,
                                              // color: Colors.amber,
                                              child: Text(
                                                '02.06',
                                                style: TextStyle(
                                                    color: Color(0xff5B74A6),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.7),
                                              ),
                                            ),
                                            Container(
                                                height: AppDimensions.height10 *
                                                    2.7,
                                                width: AppDimensions.height10 *
                                                    2.7,
                                                //  margin: const EdgeInsets.only(top: 3.32),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff156F6D)),
                                                child: Center(
                                                  child: Text(
                                                    '0/0',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0),
                                child: Container(
                                  height: AppDimensions.height10 * 19.2,
                                  width: AppDimensions.height10 * 18.8,
                                  // margin: EdgeInsets.only(left: 55.5, right: 55.5),
                                  child: Container(
                                    height: AppDimensions.height10 * 13.81,
                                    width: AppDimensions.height10 * 13.265,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Asset 10 2.png'),
                                            fit: BoxFit.cover)),
                                    child: Stack(children: [
                                      Align(
                                        alignment: Alignment(0.185, 0.215),
                                        child: Container(
                                          height: AppDimensions.height10 * 1.3,
                                          width: AppDimensions.height10 * 1.3,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(colors: [
                                                Color(0xfff1e39a),
                                                Color(0xffEEDD96)
                                              ])),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'TUE',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10 *
                                                          1.4,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff5B74A6)),
                                            ),
                                            Text(
                                              '02.07',
                                              style: TextStyle(
                                                  color: Color(0xff5B74A6),
                                                  fontSize:
                                                      AppDimensions.height10 *
                                                          1.3,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Container(
                                                height: AppDimensions.height10 *
                                                    2.5,
                                                width: AppDimensions.height10 *
                                                    2.5,
                                                // margin: const EdgeInsets.only(top: 2),
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white),
                                                child: Center(
                                                  child: Text(
                                                    '0/2',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff5B74A6)),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                  //color: Colors.blue,
                                ),
                              ),
                              Align(
                                alignment: Alignment(1, 1),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                no_planned_session()));
                                  },
                                  child: Container(
                                      height: AppDimensions.height10 * 7.9,
                                      width: AppDimensions.height10 * 7.9,
                                      // margin: const EdgeInsets.only(
                                      //   top: 84,
                                      // ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3, color: Colors.white),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xffFBF9EF),
                                                Color(0xffF8F3DA)
                                              ])),
                                      child: Container(
                                          //margin: const EdgeInsets.only(top: 11.52),
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'MON',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.2,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff5B74A6)),
                                          ),
                                          Text(
                                            '03.07',
                                            style: TextStyle(
                                                color: Color(0xff5B74A6)),
                                          ),
                                          Container(
                                            height:
                                                AppDimensions.height10 * 2.7,
                                            width: AppDimensions.height10 * 2.7,
                                            //margin: const EdgeInsets.only(top: 3.32),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white),
                                            ),
                                            child: Container(
                                                width: AppDimensions.height10 *
                                                    1.7,
                                                height: AppDimensions.height10 *
                                                    1.5,
                                                // margin:
                                                //     const EdgeInsets.only(top: 3.32),
                                                // margin: const EdgeInsets.only(left: 1),
                                                child: Center(
                                                  child: Text(
                                                    '0/2',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff5B74A6)),
                                                  ),
                                                )),
                                          )
                                        ],
                                      ))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 35.6,
                        height: AppDimensions.height10 * 4.2,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10 * 2.4,
                            right: AppDimensions.height10 * 3.4,
                            top: AppDimensions.height10 * 1.1),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '8:00',
                              style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Divider(
                            height: AppDimensions.height10 * 0.2,
                            color: Colors.white,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'AM',
                              style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => menu_behaviour()));
                        },
                        child: Center(
                            child: align_circles(
                          asset_1: 'assets/images/image3.png',
                          s_circle_text: 'Count\ntemper\nepisodes',
                          asset_2: 'assets/images/Ellipse pearl.png',
                          head_text: 'Control my anger',
                          body_text:
                              '“I am someone who is in\n control of my anger”',
                          body_text_color: 0xff5B74A6,
                          head_text_color: 0xff5B74A6,
                          body_text_size: AppDimensions.height10 * 1.6,
                          head_text_size: AppDimensions.height10 * 2.0,
                          enable_icon: true,
                          is_right: false,
                          s_circle_text_col: 0xffFD6727,
                        )),
                      ),
                      Container(
                        width: AppDimensions.height10 * 35.6,
                        height: AppDimensions.height10 * 4.2,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10 * 2.4,
                            right: AppDimensions.height10 * 3.4,
                            top: AppDimensions.height10 * 1.1),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '11:00',
                              style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Divider(
                            height: AppDimensions.height10 * 0.2,
                            color: Colors.white,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'AM',
                              style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ]),
                      ),
                      Center(
                          child: align_circles(
                        asset_1: 'assets/images/image3.png',
                        s_circle_text: 'Count\ndown',
                        asset_2: 'assets/images/Ellipse purple.png',
                        head_text: 'Control my anger',
                        body_text:
                            '“I am someone who is in\n control of my anger”',
                        body_text_color: 0xff5B74A6,
                        head_text_color: 0xff5B74A6,
                        body_text_size: AppDimensions.height10 * 1.6,
                        head_text_size: AppDimensions.height10 * 2.0,
                        enable_icon: false,
                        is_right: true,
                        s_circle_text_col: 0xffffffff,
                      )),
                      Center(
                          child: align_circles(
                        asset_1: 'assets/images/blue_sun.png',
                        s_circle_text: 'Meditation',
                        asset_2: 'assets/images/Ellipse 158.png',
                        head_text: 'Control my anger',
                        body_text:
                            '“I am someone who is in\n control of my anger”',
                        body_text_color: 0xff5B74A6,
                        head_text_color: 0xff5B74A6,
                        body_text_size: AppDimensions.height10 * 1.6,
                        head_text_size: AppDimensions.height10 * 2.0,
                        enable_icon: false,
                        is_right: false,
                        s_circle_text_col: 0xffFFFFFF,
                      )),
                      Container(
                        width: AppDimensions.height10 * 35.6,
                        height: AppDimensions.height10 * 4.2,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10 * 2.4,
                            right: AppDimensions.height10 * 3.4,
                            top: AppDimensions.height10 * 1.1),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '1:00',
                              style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Divider(
                            height: AppDimensions.height10 * 0.2,
                            color: Colors.white,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'PM',
                              style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ]),
                      ),
                      Center(
                          child: align_circles(
                        asset_1: 'assets/images/image3.png',
                        s_circle_text: 'Meditation',
                        asset_2: 'assets/images/Ellipse 158.png',
                        head_text: 'Control my anger',
                        body_text:
                            '“I am someone who is in\n control of my anger”',
                        body_text_color: 0xff5B74A6,
                        head_text_color: 0xff5B74A6,
                        body_text_size: AppDimensions.height10 * 1.6,
                        head_text_size: AppDimensions.height10 * 2.0,
                        enable_icon: false,
                        is_right: false,
                        s_circle_text_col: 0xffFFFFFF,
                      )),
                      Container(
                        width: AppDimensions.height10 * 35.6,
                        height: AppDimensions.height10 * 4.2,
                        margin:
                            const EdgeInsets.only(left: 24, right: 34, top: 11),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '6:00',
                              style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Divider(
                            height: AppDimensions.height10 * 0.2,
                            color: Colors.white,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'PM',
                              style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ]),
                      ),
                      Center(
                          child: align_circles(
                        asset_1: 'assets/images/blue_sun.png',
                        s_circle_text:
                            'Long Practice\nname needs to\ntruncate...',
                        asset_2: 'assets/images/Ellipse blue.png',
                        head_text:
                            'Long Goal name needs to\ntruncate after 2 lines...',
                        body_text:
                            'Long statement needs to\ntruncate after 2 lines...',
                        body_text_color: 0xff5B74A6,
                        head_text_color: 0xff5B74A6,
                        body_text_size: AppDimensions.height10 * 1.6,
                        head_text_size: AppDimensions.height10 * 1.6,
                        enable_icon: false,
                        is_right: true,
                        s_circle_text_col: 0xffFFFFFF,
                      )),
                      Center(
                          child: align_circles(
                        asset_1: 'assets/images/blue_sun.png',
                        s_circle_text: 'Meditation',
                        asset_2: 'assets/images/Ellipse light-blue.png',
                        head_text: 'Be more confident:',
                        body_text:
                            'I am someone who is\nconfident in my abilities.',
                        body_text_color: 0xff5B74A6,
                        head_text_color: 0xff5B74A6,
                        body_text_size: AppDimensions.height10 * 1.6,
                        head_text_size: AppDimensions.height10 * 2.0,
                        enable_icon: false,
                        is_right: true,
                        s_circle_text_col: 0xffFFFFFF,
                      )),
                      Container(
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 10.8,
                            bottom: AppDimensions.height10 * 14.7),
                        height: AppDimensions.height10 * 14.1,
                        width: AppDimensions.height10 * 25.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'No more scheduled sessions\nScroll to the next day',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.7),
                              width: AppDimensions.height10 * 4.3,
                              height: AppDimensions.height10 * 2.1,
                              child: ImageIcon(
                                AssetImage('assets/images/Arrow.png'),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
