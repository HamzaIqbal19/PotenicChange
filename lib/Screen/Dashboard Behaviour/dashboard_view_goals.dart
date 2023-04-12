import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../Widgets/bottom_navigation.dart';
import '../../Widgets/mult_circles.dart';
import '../../utils/app_dimensions.dart';
import 'menu_dashboard_behaviour.dart';

class view_goals extends StatelessWidget {
  const view_goals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Add goal.png',
                    height: AppDimensions.height10 * 2.1,
                    width: AppDimensions.height10 * 2.1,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/calendar_month_black_24dp 1.png',
                    height: AppDimensions.height10 * 2.1,
                    width: AppDimensions.height10 * 2.1,
                  )),
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
            height: AppDimensions.height10 * 78.2,
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
                          child: Row(
                            children: [
                              Container(
                                height: AppDimensions.height10 * 7.9,
                                width: AppDimensions.height10 * 7.9,
                                margin: const EdgeInsets.only(top: 84),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 3, color: Colors.white),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(187, 185, 174, 1),
                                        Color.fromRGBO(206, 194, 149, 1)
                                      ]),
                                ),
                                child: Container(
                                    margin: const EdgeInsets.only(top: 11.52),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'MON',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        const Text(
                                          '02.06',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Container(
                                            height: 27,
                                            width: 27,
                                            margin: const EdgeInsets.only(
                                                top: 3.32),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: DottedBorder(
                                              borderType: BorderType.Circle,
                                              color: Colors.white,
                                              child: const Center(
                                                child: Text(
                                                  '0/0',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ))
                                      ],
                                    )),
                              ),
                              Container(
                                height: 192,
                                width: 188,
                                margin:
                                    EdgeInsets.only(left: 55.5, right: 55.5),
                                child: Container(
                                  height: 138.1,
                                  width: 132.65,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Asset 10 2.png'),
                                          fit: BoxFit.cover)),
                                  child: Stack(children: [
                                    Align(
                                      alignment: Alignment(0.185, 0.215),
                                      child: Container(
                                        height: 13,
                                        width: 13,
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
                                          const Text(
                                            'TUE',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff5B74A6)),
                                          ),
                                          const Text(
                                            '02.07',
                                            style: TextStyle(
                                                color: Color(0xff5B74A6),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Container(
                                              height: 25,
                                              width: 25,
                                              margin:
                                                  const EdgeInsets.only(top: 2),
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
                                                      color: Color(0xff5B74A6)),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                                //color: Colors.blue,
                              ),
                              Container(
                                  height: 79,
                                  width: 79,
                                  margin: const EdgeInsets.only(
                                    top: 84,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 3, color: Colors.white),
                                    color: Colors.white,
                                  ),
                                  child: Container(
                                      margin: const EdgeInsets.only(top: 11.52),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'MON',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff5B74A6)),
                                          ),
                                          const Text(
                                            '03.07',
                                            style: TextStyle(
                                                color: Color(0xff5B74A6)),
                                          ),
                                          Container(
                                            height: 27,
                                            width: 27,
                                            margin: const EdgeInsets.only(
                                                top: 3.32),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white),
                                            ),
                                            child: Container(
                                                width: 17,
                                                height: 15,
                                                margin: const EdgeInsets.only(
                                                    top: 3.32),
                                                // margin: const EdgeInsets.only(left: 1),
                                                child: const Center(
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
                          asset_1: 'assets/images/oraange_sun.png',
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
                        asset_1: 'assets/images/oraange_sun.png',
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
                        asset_1: 'assets/images/oraange_sun.png',
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
                      Center(
                          child: align_circles(
                        asset_1: 'assets/images/oraange_sun.png',
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
                        height: AppDimensions.height10 * 8.1,
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
