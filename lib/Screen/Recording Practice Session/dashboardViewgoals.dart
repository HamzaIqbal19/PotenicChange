// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:potenic_app/Screen/Alerts/message_center.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Widgets/bottom_navigation.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class dashBoard extends StatefulWidget {
  final bool helpful_tips;
  final bool dashboard_ctrl;
  final bool membership;
  final bool trial;
  final bool cancel;

  const dashBoard(
      {super.key,
      required this.helpful_tips,
      required this.dashboard_ctrl,
      required this.membership,
      required this.trial,
      required this.cancel});
  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  bool hide = true;
  int goal_level = 1;
  void _incrementValue() {
    setState(() {
      goal_level++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: Navigation_Bar(
          bg_colored: false,
          membership: widget.membership ? true : false,
          cancel: widget.cancel ? true : false,
          trial: widget.trial ? true : false,
        ),
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
            child: Stack(children: [
              Column(
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
                            child: SizedBox(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            height:
                                                AppDimensions.height10 * 2.5,
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
                                                    color: const Color(
                                                        0xff5B74A6)),
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
                                    border: Border.all(
                                        width: 3, color: Colors.white),
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
                                          fontSize:
                                              AppDimensions.height10 * 1.2,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff5B74A6)),
                                    ),
                                    const Text(
                                      '03.07',
                                      style:
                                          TextStyle(color: Color(0xff5B74A6)),
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
                                      child: SizedBox(
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
                                                  color:
                                                      const Color(0xff5B74A6)),
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
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10 * 0.3),
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
                    width: widget.dashboard_ctrl
                        ? AppDimensions.height10 * 40.1
                        : AppDimensions.height10 * 31.3,
                    height: AppDimensions.height10 * 31.3,
                    // color: Colors.blue,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 2.9,
                        bottom: AppDimensions.height10 * 1.2,
                        right: widget.dashboard_ctrl
                            ? AppDimensions.height10 * 0.9
                            : AppDimensions.height10 * 7.3,
                        left: widget.dashboard_ctrl
                            ? AppDimensions.height10 * 0.4
                            : AppDimensions.height10 * 2.3),
                    child: widget.dashboard_ctrl
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
                                                    AppDimensions.height10 *
                                                        2.0,
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
                                                    AppDimensions.height10 *
                                                        1.6,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xff5B74A6))),
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
                                            height:
                                                AppDimensions.height10 * 13.8,
                                            width:
                                                AppDimensions.height10 * 13.8,
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
                                    color:
                                        const Color.fromRGBO(91, 116, 166, 1),
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
                                      color: const Color.fromRGBO(
                                          91, 116, 166, 1)),
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
              widget.helpful_tips
                  ? Align(
                      alignment: goal_level == 2
                          ? Alignment(-0.2, 0.15)
                          : goal_level == 3
                              ? Alignment(-0.2, -0.47)
                              : goal_level == 4
                                  ? Alignment(0, -0.68)
                                  : goal_level == 5
                                      ? Alignment(0.1, -0.85)
                                      : goal_level == 6
                                          ? Alignment(0.2, -0.85)
                                          : goal_level == 1
                                              ? Alignment(0, -0.25)
                                              : Alignment(0.1, 0.37),
                      child: SimpleTooltip(
                        //  maxHeight: AppDimensions.height10 * 23.9,
                        // maxWidth: AppDimensions.height10 * 30.6,
                        tooltipDirection: goal_level == 1 ||
                                goal_level == 2 ||
                                goal_level == 7
                            ? TooltipDirection.up
                            : TooltipDirection.down,
                        arrowTipDistance: 5,
                        //minimumOutSidePadding: 0,
                        // targetCenter: goal_level == 2 ? null : null,
                        ballonPadding: EdgeInsets.all(0),
                        arrowLength: AppDimensions.height10 * 0.6,
                        borderColor: Colors.transparent,
                        // content: null,
                        //have to initialize from different widgets
                        child: SizedBox(
                          width: AppDimensions.height10 * 1,
                          height: AppDimensions.height10 * 1,
                          child: Container(),
                        ),
                        show: goal_level > 7 ? false : true,
                        // tooltipTap: () {
                        //   if (goal_level > 7) {}
                        // },

                        animationDuration: Duration(milliseconds: 3),
                        content: Container(
                          width: AppDimensions.height10 * 29.6,
                          height: goal_level == 1
                              ? AppDimensions.height10 * 21.3
                              : goal_level == 2
                                  ? AppDimensions.height10 * 21.1
                                  : goal_level == 3
                                      ? AppDimensions.height10 * 18.02
                                      : goal_level == 4
                                          ? AppDimensions.height10 * 20.32
                                          : goal_level == 5
                                              ? AppDimensions.height10 * 22.32
                                              : goal_level == 6
                                                  ? AppDimensions.height10 *
                                                      18.12
                                                  : AppDimensions.height10 *
                                                      19.6,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.0)),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 21.6,
                                height: AppDimensions.height10 * 2.2,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.7,
                                    left: goal_level == 6
                                        ? AppDimensions.height10 * 1.2
                                        : AppDimensions.height10 * 1.2,
                                    right: AppDimensions.height10 * 7.4),
                                child: Text(
                                  goal_level == 2
                                      ? 'Your Practice'
                                      : goal_level == 3
                                          ? 'Time'
                                          : goal_level == 4
                                              ? 'Your Schedule'
                                              : goal_level == 5
                                                  ? 'Record Practice'
                                                  : goal_level == 6
                                                      ? 'Your Calendar'
                                                      : goal_level == 1
                                                          ? 'Your Goal'
                                                          : 'Reda',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Laila',
                                    color: Color(0xFF000000),
                                    fontSize: AppDimensions.height10 * 1.4,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 27.4,
                                height: goal_level == 1
                                    ? AppDimensions.height10 * 11.8
                                    : goal_level == 2
                                        ? AppDimensions.height10 * 11.6
                                        : goal_level == 3
                                            ? AppDimensions.height10 * 7.8
                                            : goal_level == 4
                                                ? AppDimensions.height10 * 10.1
                                                : goal_level == 5
                                                    ? AppDimensions.height10 *
                                                        12.1
                                                    : goal_level == 6
                                                        ? AppDimensions
                                                                .height10 *
                                                            7.9
                                                        : AppDimensions
                                                                .height10 *
                                                            10.1,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.3),
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF464646),
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Laila',
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            height:
                                                AppDimensions.height10 * 0.15),
                                        children: [
                                      TextSpan(
                                        text: goal_level == 1
                                            ? 'This is your own star that you’ve created.\nRemember, '
                                            : goal_level == 2
                                                ? 'Smaller circles that spin around your\nstars are the planets. The '
                                                : goal_level == 3
                                                    ? 'This shows the '
                                                    : goal_level == 4 ||
                                                            goal_level == 6
                                                        ? 'This is your '
                                                        : goal_level == 5
                                                            ? 'If you want to '
                                                            : 'This is your friend who sends out',
                                      ),
                                      TextSpan(
                                          text: goal_level == 1
                                              ? '‘stars’ '
                                              : goal_level == 2
                                                  ? '‘planets’ '
                                                  : goal_level == 3
                                                      ? 'actual time '
                                                      : goal_level == 4
                                                          ? 'daily view '
                                                          : goal_level == 5
                                                              ? 'record a practice session\n'
                                                              : goal_level == 6
                                                                  ? 'calender '
                                                                  : ' helpful\nreminders ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                      TextSpan(
                                          text: goal_level == 1
                                              ? 'are your '
                                              : goal_level == 2
                                                  ? 'are\nyour own '
                                                  : goal_level == 3
                                                      ? 'the practice is '
                                                      : goal_level == 4
                                                          ? 'schedule.\nNavigate here if you want quick access to\nsee all your '
                                                          : goal_level == 5
                                                              ? 'that it’s not currently scheduled, navigate\nhere. You will see all your '
                                                              : goal_level == 6
                                                                  ? 'It’s very similar to your schedule. Navigate here if you want to see your '
                                                                  : 'and '),
                                      TextSpan(
                                          text: goal_level == 1
                                              ? 'personal\ngrowth goals. '
                                              : goal_level == 2
                                                  ? 'practices '
                                                  : goal_level == 3
                                                      ? 'scheduled '
                                                      : goal_level == 4
                                                          ? 'scheduled practices '
                                                          : goal_level == 5
                                                              ? 'active goals '
                                                              : goal_level == 6
                                                                  ? 'past '
                                                                  : 'messages. ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                      TextSpan(
                                          text: goal_level == 1
                                              ? 'They wil always look bigger and will have '
                                              : goal_level == 2
                                                  ? 'that you’ve created to help you progress with your goal. The\n'
                                                  : goal_level == 3
                                                      ? 'for on that day (centred daily calendar view at the top shows you the actual date).'
                                                      : goal_level == 4
                                                          ? 'for that day. Scroll left or right to see your\n'
                                                          : goal_level == 5
                                                              ? 'with its'
                                                              : goal_level == 6
                                                                  ? 'or'
                                                                  : ' You will see\nReda appearing every time you have a new\nnotification with gentle prompts to help\nyou '),
                                      TextSpan(
                                          text: goal_level == 1
                                              ? 'goal name '
                                              : goal_level == 2
                                                  ? 'practice '
                                                  : goal_level == 3
                                                      ? ''
                                                      : goal_level == 4
                                                          ? 'schedule '
                                                          : goal_level == 5
                                                              ? ' assigned practices.'
                                                              : goal_level == 6
                                                                  ? ' future '
                                                                  : 'stay focused.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                      TextSpan(
                                          text: goal_level == 1
                                              ? 'with\n'
                                              : goal_level == 2
                                                  ? 'will have a '
                                                  : goal_level == 3
                                                      ? ''
                                                      : goal_level == 4
                                                          ? 'for previous or next day.'
                                                          : goal_level == 5
                                                              ? ' Click on the\npractice you want to record the session\nfor and you’ll be taken to capture it'
                                                              : goal_level == 6
                                                                  ? 'for a\ncertain date.'
                                                                  : ''),
                                      TextSpan(
                                          text: goal_level == 1
                                              ? 'identity statement  '
                                              : goal_level == 2
                                                  ? 'name '
                                                  : goal_level == 3
                                                      ? ''
                                                      : goal_level == 4
                                                          ? ''
                                                          : goal_level == 5
                                                              ? ''
                                                              : goal_level == 6
                                                                  ? ''
                                                                  : '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                      TextSpan(
                                          text: goal_level == 1
                                              ? 'written on it, so you\ncan easily identify it.'
                                              : goal_level == 2
                                                  ? 'written on it to help you identify it.'
                                                  : goal_level == 3
                                                      ? ''
                                                      : goal_level == 4
                                                          ? ''
                                                          : goal_level == 5
                                                              ? ''
                                                              : goal_level == 6
                                                                  ? ''
                                                                  : '')
                                    ])),
                              ),
                              Container(
                                width: AppDimensions.height10 * 24.3,
                                height: AppDimensions.height10 * 4.0,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10 * 5.0),
                                            border: Border.all(
                                                width: AppDimensions.height10 *
                                                    0.1,
                                                color: Color(0xFFFBFBFB))),
                                        width: AppDimensions.height10 * 9.60,
                                        height: AppDimensions.height10 * 3.2,
                                        child: Center(
                                          child: Text(
                                            'Skip tour',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Laila',
                                                decoration: TextDecoration.none,
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.6,
                                                color: Color(0xFF8C648A),
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _incrementValue();
                                        if (goal_level > 7) {
                                          setState(() {
                                            hide == true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: AppDimensions.height10 * 11.7,
                                        height: AppDimensions.height10 * 4.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10 * 5.0),
                                            color: Color(0xFF5A4D73)),
                                        child: Center(
                                          child: Text(
                                            goal_level == 2
                                                ? '(2/7) Next'
                                                : goal_level == 3
                                                    ? '(3/7) Next'
                                                    : goal_level == 4
                                                        ? '(4/7) Next'
                                                        : goal_level == 5
                                                            ? '(5/7) Next'
                                                            : goal_level == 6
                                                                ? '(6/7) Next'
                                                                : goal_level ==
                                                                        7
                                                                    ? '(7/7) Next'
                                                                    : goal_level ==
                                                                            1
                                                                        ? '(1/7) Next'
                                                                        : '(7/7) Next',
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontFamily: 'Laila',
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.6,
                                                color: Color(0xFFFFFFFF),
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              OfflineBuilder(
                  debounceDuration: Duration(milliseconds: 3),
                  connectivityBuilder: (
                    BuildContext context,
                    ConnectivityResult connectivity,
                    Widget child,
                  ) {
                    final bool connected =
                        connectivity != ConnectivityResult.none;
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                            child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: AppDimensions.height10 * 3.0,
                            color: connected
                                ? Color(0xFF27AE60)
                                : Color(0xFFFE6624),
                            child: Center(
                              child: Text(
                                connected ? 'Back Online' : 'You’re Offline',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFBFBFB)),
                              ),
                            ),
                          ),
                        ))
                      ],
                    );
                  },
                  child: Container())
            ]),
          ),
        ));
  }
}

class tooltip extends StatelessWidget {
  const tooltip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
