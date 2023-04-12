import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../Widgets/bottom_navigation.dart';
import '../../utils/app_dimensions.dart';

class no_past_session extends StatelessWidget {
  const no_past_session({super.key});

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
                    'assets/images/Asset 10 2.png',
                    // height: 40,
                    // width: 40,
                    fit: BoxFit.contain,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Add goal.png',
                    height: AppDimensions.height10 * 2.0,
                    width: AppDimensions.height10 * 2.1,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/calendar_month_black_24dp 1.png',
                    height: AppDimensions.height10 * 2.4,
                    width: AppDimensions.height10 * 2.4,
                  )),
            ],
          )
        ]),
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: Navigation_Bar(
          bg_colored: false,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Mask Group.png'),
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.2), BlendMode.darken),
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
                    child: Column(children: [
                      SizedBox(
                        height: AppDimensions.height10 * 19.2,
                        width: AppDimensions.height10 * 45.7,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                height: AppDimensions.height10 * 7.9,
                                width: AppDimensions.height10 * 7.9,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 8.4),
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
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10 * 1.152),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'MON',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.2,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        const Text(
                                          '02.06',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Container(
                                            height:
                                                AppDimensions.height10 * 2.7,
                                            width: AppDimensions.height10 * 2.7,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10 *
                                                    0.332),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: DottedBorder(
                                              borderType: BorderType.Circle,
                                              color: Colors.white,
                                              child: Center(
                                                child: Text(
                                                  '0/0',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10 *
                                                          1.0,
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
                                width: AppDimensions.height10 * 8.3,
                                height: AppDimensions.height10 * 8.3,
                                margin: EdgeInsets.only(right: 121, left: 121),
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    color: Colors.transparent),
                                child: Container(
                                  height: 79,
                                  width: 79,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: Colors.white),
                                      gradient: LinearGradient(colors: [
                                        Color(0xffCCCCCA),
                                        Color(0xff5E5D5C)
                                      ])),
                                  child: Stack(children: [
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
                                              height:
                                                  AppDimensions.height10 * 2.5,
                                              width:
                                                  AppDimensions.height10 * 2.5,
                                              margin: EdgeInsets.only(
                                                  top: AppDimensions.height10 *
                                                      0.2),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Center(
                                                child: Text(
                                                  '0/2',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10 *
                                                          1.0,
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
                              ),
                              Container(
                                  height: AppDimensions.height10 * 7.9,
                                  width: AppDimensions.height10 * 7.9,
                                  margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 8.4,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: AppDimensions.height10 * 0.3,
                                        color: Colors.white),
                                    color: Colors.white,
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10 * 1.152),
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
                                            height: 27,
                                            width: 27,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10 *
                                                    0.332),
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
                                                margin: EdgeInsets.only(
                                                    top:
                                                        AppDimensions.height10 *
                                                            0.332),
                                                // margin: const EdgeInsets.only(left: 1),
                                                child: Center(
                                                  child: Text(
                                                    '0/2',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10 *
                                                            1.0,
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
                        width: AppDimensions.height10 * 34.3,
                        height: AppDimensions.height10 * 4.9,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 18.9),
                        child: Center(
                          child: Text(
                            'No sessions',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 3.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Laila'),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 26.9,
                        height: AppDimensions.height10 * 5.8,
                        child: Center(
                          child: Text(
                            'There are no recorded\npractices for this date.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Laila',
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 10.1,
                        height: AppDimensions.height10 * 10.1,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: Colors.white)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: AppDimensions.height10 * 3.5,
                              width: AppDimensions.height10 * 3.5,
                              // padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  color: Colors.transparent),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/images/Add goal.png',
                                    height: AppDimensions.height10 * 2.9,
                                    width: AppDimensions.height10 * 2.9,
                                  )),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'Add\npractice',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'laila',
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ])))));
  }
}
