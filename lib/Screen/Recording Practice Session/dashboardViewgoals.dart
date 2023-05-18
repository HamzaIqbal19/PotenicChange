// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:potenic_app/Screen/Alerts/message_center.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Widgets/bottom_navigation.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class dashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool dashboard_ctrl = true;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Row(
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/Add goal.png',
                    height: AppDimensions.height10 * 2.1,
                    width: AppDimensions.height10 * 2.2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: AppDimensions.height10 * 1.7,
                      right: AppDimensions.height10 * 0.9,
                      bottom: AppDimensions.height10 * 0.3),
                  child: Image.asset(
                    'assets/images/calendar_month_black_24dp 1.png',
                    height: AppDimensions.height10 * 2.4,
                    width: AppDimensions.height10 * 2.4,
                  ),
                ),
              ],
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: const Navigation_Bar(bg_colored: false),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Mask Group.png'),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: SizedBox(
            width: double.infinity,
            height: AppDimensions.height10 * 19.2,
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
                          alignment: const Alignment(-1, 1),
                          child: Container(
                            height: AppDimensions.height10 * 7.9,
                            width: AppDimensions.height10 * 7.9,
                            //margin: const EdgeInsets.only(top: 84),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 3, color: Colors.white),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(187, 185, 174, 1),
                                    Color.fromRGBO(206, 194, 149, 1)
                                  ]),
                            ),
                            child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'MON',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.2,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '02.06',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              AppDimensions.height10 * 1.7),
                                    ),
                                    Container(
                                        height: AppDimensions.height10 * 2.5,
                                        width: AppDimensions.height10 * 2.5,
                                        //  margin: const EdgeInsets.only(top: 3.32),
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
                                                  fontSize:
                                                      AppDimensions.height10 *
                                                          1.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ))
                                  ],
                                )),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0),
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
                                  alignment: const Alignment(0.185, 0.215),
                                  child: Container(
                                    height: AppDimensions.height10 * 1.3,
                                    width: AppDimensions.height10 * 1.3,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xfff1e39a),
                                          Color(0xffEEDD96)
                                        ])),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'TUE',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff5B74A6)),
                                      ),
                                      Text(
                                        '02.07',
                                        style: TextStyle(
                                            color: const Color(0xff5B74A6),
                                            fontSize:
                                                AppDimensions.height10 * 1.3,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                          height: AppDimensions.height10 * 2.5,
                                          width: AppDimensions.height10 * 2.5,
                                          // margin: const EdgeInsets.only(top: 2),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Center(
                                            child: Text(
                                              '0/2',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10 *
                                                          1.0,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff5B74A6)),
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
                          alignment: const Alignment(1, 1),
                          child: Container(
                              height: AppDimensions.height10 * 7.9,
                              width: AppDimensions.height10 * 7.9,
                              // margin: const EdgeInsets.only(
                              //   top: 84,
                              // ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 3, color: Colors.white),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffFBF9EF),
                                        Color(0xffF8F3DA)
                                      ])),
                              child: Container(
                                  //margin: const EdgeInsets.only(top: 11.52),
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'MON',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.2,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                  const Text(
                                    '03.07',
                                    style: TextStyle(color: Color(0xff5B74A6)),
                                  ),
                                  Container(
                                    height: AppDimensions.height10 * 2.7,
                                    width: AppDimensions.height10 * 2.7,
                                    //margin: const EdgeInsets.only(top: 3.32),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: AppDimensions.height10 * 0.1,
                                          color: Colors.white),
                                    ),
                                    child: Container(
                                        width: AppDimensions.height10 * 1.7,
                                        height: AppDimensions.height10 * 1.5,
                                        // margin:
                                        //     const EdgeInsets.only(top: 3.32),
                                        // margin: const EdgeInsets.only(left: 1),
                                        child: Center(
                                          child: Text(
                                            '0/2',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.0,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff5B74A6)),
                                          ),
                                        )),
                                  )
                                ],
                              ))),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 35.6,
                  height: AppDimensions.height10 * 4.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                  child: Column(children: [
                    Container(
                      margin:
                          EdgeInsets.only(bottom: AppDimensions.height10 * 0.3),
                      height: AppDimensions.height10 * 2.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '8.00',
                        style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.8,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(
                      height: AppDimensions.height10 * 0.1,
                      thickness: AppDimensions.height10 * 0.1,
                      color: Colors.white,
                    ),
                    Container(
                      height: AppDimensions.height10 * 1.2,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'AM',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
                ),
                Container(
                  width: dashboard_ctrl
                      ? AppDimensions.height10 * 40.1
                      : AppDimensions.height10 * 31.3,
                  height: AppDimensions.height10 * 31.3,
                  // color: Colors.blue,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 2.9,
                      bottom: AppDimensions.height10 * 1.2,
                      right: dashboard_ctrl
                          ? AppDimensions.height10 * 0.9
                          : AppDimensions.height10 * 7.3,
                      left: dashboard_ctrl
                          ? AppDimensions.height10 * 0.4
                          : AppDimensions.height10 * 2.3),
                  child: dashboard_ctrl
                      ? Stack(children: [
                          Align(
                            alignment: const Alignment(-1, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const practiceMenu(
                                              goal_eval: true,
                                            )));
                              },
                              child: Container(
                                height: AppDimensions.height10 * 13.8,
                                width: AppDimensions.height10 * 13.8,
                                decoration: const BoxDecoration(
                                    //color: Colors.amber,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Ellipse 158.png'),
                                        fit: BoxFit.cover)),
                                child: Center(
                                    child: Text(
                                  'Meditation',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(1, 0.4),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: AppDimensions.height10 * 13.8,
                                width: AppDimensions.height10 * 13.8,
                                decoration: const BoxDecoration(
                                    //color: Colors.amber,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Ellipse 157.png'),
                                        fit: BoxFit.cover)),
                                child: Center(
                                    child: Text(
                                  'Count\ndown',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const goal_menu_inactive(
                                              premium: true,
                                              isActive: true,
                                              goal_evaluation: true,
                                            )));
                              },
                              child: Container(
                                width: AppDimensions.height10 * 26.8,
                                height: AppDimensions.height10 * 26.8,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/orange_moon.png'),
                                        fit: BoxFit.cover)),
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: const Alignment(0, -0.5),
                                        child: Text(
                                          'Control my anger',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 2.0,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff5B74A6)),
                                        )),
                                    Align(
                                      alignment: const Alignment(0, -0.2),
                                      child: Text(
                                          '“I am someone who is in\n control of my anger”',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff5B74A6))),
                                    ),
                                    Align(
                                      alignment: const Alignment(0, 1.5),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const congratulations()));
                                        },
                                        child: Container(
                                          height: AppDimensions.height10 * 13.8,
                                          width: AppDimensions.height10 * 13.8,
                                          decoration: const BoxDecoration(
                                              //color: Colors.amber,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/Ellipse orange.png'),
                                                  fit: BoxFit.contain)),
                                          child: Center(
                                              child: Text(
                                            'Count\ntemper\nepisodes',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.8,
                                                fontWeight: FontWeight.w500),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ])
                      : Stack(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: AppDimensions.height10 * 26.8,
                              height: AppDimensions.height10 * 26.8,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/image3.png'),
                                      fit: BoxFit.cover)),
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: const Alignment(0, -0.5),
                                      child: Text(
                                        'Control my anger',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 2.0,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff5B74A6)),
                                      )),
                                  Align(
                                    alignment: const Alignment(0, -0.2),
                                    child: Text(
                                        '“I am someone who is in\n control of my anger”',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.6,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff5B74A6))),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.9, 0.9),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const practiceMenu(
                                              goal_eval: false,
                                            )));
                              },
                              child: Container(
                                height: AppDimensions.height10 * 13.8,
                                width: AppDimensions.height10 * 13.8,
                                decoration: const BoxDecoration(
                                    //color: Colors.amber,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Ellipse 158.png'),
                                        fit: BoxFit.cover)),
                                child: Center(
                                    child: Text(
                                  'Meditation',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(-1, 0.4),
                            child: Container(
                              height: AppDimensions.height10 * 13.8,
                              width: AppDimensions.height10 * 13.8,
                              decoration: const BoxDecoration(
                                  //color: Colors.amber,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse 157.png'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                  child: Text(
                                'Count\ndown',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.8,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ),
                        ]),
                ),
                GestureDetector(
                  onTap: () {
                    notifications_sheet(context);
                  },
                  child: Container(
                    height: AppDimensions.height10 * 14.432,
                    width: AppDimensions.height10 * 35.335,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Component 1.png',
                      ),
                      fit: BoxFit.cover,
                    )),

                    //color: Colors.blue,
                    child: Stack(children: [
                      Align(
                        alignment: const Alignment(-0.925, -1.35),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => message_center()));
                          },
                          child: Image.asset(
                            "assets/images/Group.png",
                            height: AppDimensions.height10 * 4.366,
                            width: AppDimensions.height10 * 4.366,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.93, 0),
                        child: Image.asset(
                          "assets/images/Vector Smart Object.png",
                          height: AppDimensions.height10 * 9.296,
                          width: AppDimensions.height10 * 4.16,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 2.1,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 28.0,
                              height: AppDimensions.height10 * 2.3,
                              alignment: const Alignment(-0.65, 0),
                              child: Text(
                                "Hi, it's Reda here",
                                style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(91, 116, 166, 1),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 5.245,
                              height: AppDimensions.height10 * 1.3,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 17.5),
                              child: const Divider(
                                thickness: 1,
                                color: Color.fromRGBO(91, 116, 166, 1),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 26.7,
                              // height: AppDimensions.height10 * 5.3,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 3.4,
                                  bottom: AppDimensions.height10 * 1.2),
                              child: Text(
                                "You have an extra 20% chance of\nsuccess if you have a support buddy.\nHave you got one?",
                                // textAlign: TextAlign.left,

                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(91, 116, 166, 1)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
