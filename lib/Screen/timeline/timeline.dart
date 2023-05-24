import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';

class timeline extends StatefulWidget {
  const timeline({super.key});

  @override
  State<timeline> createState() => _timelineState();
}

class _timelineState extends State<timeline> {
  late ScrollController _scrollController;
  int goal_level = 2;
  bool _showBackToTopButton = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(820,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/images/Back.png',
                    width: AppDimensions.height10 * 3.0,
                    height: AppDimensions.height10 * 3.0,
                    fit: BoxFit.cover,
                  )),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  _scrollToTop();
                },
                child: Container(
                  margin: EdgeInsets.only(right: AppDimensions.height10 * 1.4),
                  child: Image.asset(
                    'assets/images/Asset 10 2.png',
                    width: AppDimensions.height10 * 4.1,
                    height: AppDimensions.height10 * 4.1,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ]),
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage('assets/images/GoalReviewBg.png'),
                  fit: BoxFit.cover)),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(top: AppDimensions.height10 * 8.9),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      height: AppDimensions.height10 * 6.2,
                      width: AppDimensions.height10 * 6.2,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 5.8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3, color: const Color(0xFFF5F5F5)),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFF5F2E6), Color(0xffECDA91)])),
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'THU',
                            style: TextStyle(
                                height: AppDimensions.height10 * 0.12,
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff5B74A6)),
                          ),
                          Text(
                            '04.07',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                height: AppDimensions.height10 * 0.12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff5B74A6)),
                          ),
                        ],
                      ))),
                  Container(
                      height: AppDimensions.height10 * 6.2,
                      width: AppDimensions.height10 * 6.2,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 5.4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3, color: const Color(0xFFF5F5F5)),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFF5F2E6), Color(0xffECDA91)])),
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WED',
                            style: TextStyle(
                                height: AppDimensions.height10 * 0.12,
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff5B74A6)),
                          ),
                          Text(
                            '03.07',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                height: AppDimensions.height10 * 0.12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff5B74A6)),
                          ),
                        ],
                      ))),
                  Container(
                    width: AppDimensions.height10 * 39.5,
                    height: AppDimensions.height10 * 25.4,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 1.9,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 30.7,
                          height: AppDimensions.height10 * 3.5,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 4.5,
                            top: AppDimensions.height10 * 1.5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 3.5,
                                height: AppDimensions.height10 * 3.5,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 0.8),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/session_stored.png'),
                                        fit: BoxFit.contain)),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 23.6,
                                height: AppDimensions.height10 * 2.2,
                                child: Text(
                                  'Practice session',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      color: const Color(0xff437296)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 35.5,
                          height: AppDimensions.height10 * 16.3,
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 2.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: AppDimensions.height10 * 0.5,
                                blurRadius: AppDimensions.height10 * 0.7,
                                offset: const Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFD9B4B4), Color(0xFFF5EDED)]),
                          ),
                          child: Stack(children: [
                            Align(
                              alignment: const Alignment(-1.45, 0),
                              child: Container(
                                width: AppDimensions.height10 * 17.6,
                                height: AppDimensions.height10 * 19.3,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/orange_moon.png'),
                                        fit: BoxFit.cover)),
                                child: Container(
                                  width: AppDimensions.height10 * 15.8,
                                  height: AppDimensions.height10 * 4.8,
                                  alignment: const Alignment(0.1, -0.1),
                                  //changed font family due to client's request
                                  child: Text(
                                    'Control\nmy anger',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height: AppDimensions.height10 * 0.15,
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(-0.175, 0),
                              child: Container(
                                width: AppDimensions.height10 * 11.6,
                                height: AppDimensions.height10 * 11.7,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Ellipse 158.png'),
                                        fit: BoxFit.contain)),
                                child: Center(
                                  child: Text(
                                    'Meditation',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.8,
                                        height: AppDimensions.height10 * 0.12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xffFBFBFB)),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0.9, 0),
                              child: SizedBox(
                                width: AppDimensions.height10 * 8.2,
                                height: AppDimensions.height10 * 4.1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10 * 8.2,
                                      height: AppDimensions.height10 * 2.0,
                                      child: Text(
                                        'Scheduled',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            height:
                                                AppDimensions.height10 * 0.12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffFA8552)),
                                      ),
                                    ),
                                    Container(
                                      width: AppDimensions.height10 * 6.3,
                                      height: AppDimensions.height10 * 1.9,
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        '7 - 8pm',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.6,
                                            height:
                                                AppDimensions.height10 * 0.12,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xffFBFBFB)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 39.5,
                    height: AppDimensions.height10 * 25.4,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 2.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 30.7,
                          height: AppDimensions.height10 * 3.5,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 4.5,
                            top: AppDimensions.height10 * 1.5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 3.5,
                                height: AppDimensions.height10 * 3.5,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 0.8),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/session_stored.png'),
                                        fit: BoxFit.contain)),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 23.6,
                                height: AppDimensions.height10 * 2.2,
                                child: Text(
                                  'Practice session',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      color: const Color(0xff437296)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 35.5,
                          height: AppDimensions.height10 * 16.3,
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 2.0),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFD9B4B4), Color(0xFFF5EDED)]),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: AppDimensions.height10 * 0.5,
                                blurRadius: AppDimensions.height10 * 0.7,
                                offset: const Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                          ),
                          child: Stack(children: [
                            Align(
                              alignment: const Alignment(-1.45, 0),
                              child: Container(
                                width: AppDimensions.height10 * 17.6,
                                height: AppDimensions.height10 * 19.3,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/orange_moon.png'),
                                        fit: BoxFit.cover)),
                                child: Container(
                                  width: AppDimensions.height10 * 15.8,
                                  height: AppDimensions.height10 * 4.8,
                                  alignment: const Alignment(0.1, -0.1),
                                  child: Text(
                                    'Control\nmy anger',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height: AppDimensions.height10 * 0.15,
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(-0.175, 0),
                              child: Container(
                                width: AppDimensions.height10 * 11.6,
                                height: AppDimensions.height10 * 11.7,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Ellipse 158.png'),
                                        fit: BoxFit.contain)),
                                child: Center(
                                  child: Text(
                                    'Meditation',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.8,
                                        height: AppDimensions.height10 * 0.12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xffFBFBFB)),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0.9, 0),
                              child: SizedBox(
                                width: AppDimensions.height10 * 8.2,
                                height: AppDimensions.height10 * 4.1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10 * 8.2,
                                      height: AppDimensions.height10 * 2.0,
                                      child: Text(
                                        'Scheduled',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            height:
                                                AppDimensions.height10 * 0.12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffFA8552)),
                                      ),
                                    ),
                                    Container(
                                      width: AppDimensions.height10 * 6.3,
                                      height: AppDimensions.height10 * 1.9,
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        '9 - 10am',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.6,
                                            height:
                                                AppDimensions.height10 * 0.12,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xffFBFBFB)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: AppDimensions.height10 * 6.2,
                      width: AppDimensions.height10 * 6.2,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.7),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3, color: const Color(0xFFF5F5F5)),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFF5F2E6), Color(0xffECDA91)])),
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WED',
                            style: TextStyle(
                                height: AppDimensions.height10 * 0.12,
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff5B74A6)),
                          ),
                          Text(
                            '03.07',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                height: AppDimensions.height10 * 0.12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff5B74A6)),
                          ),
                        ],
                      ))),
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 3.5),
                    child: Image.asset(
                      'assets/images/Arrow_up.png',
                      color: const Color(0xFF437296),
                      width: AppDimensions.height10 * 2.5,
                      height: AppDimensions.height10 * 2.5,
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 7.2,
                    height: AppDimensions.height10 * 1.9,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 0.4),
                    child: Center(
                      child: Text(
                        'Schedule',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w700,
                            height: AppDimensions.height10 * 0.12,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 3.5),

                      // child: Container(
                      //     height: AppDimensions.height10 * 2.612,
                      //     width: AppDimensions.height10 * 3.318,
                      //     decoration: const BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         gradient: LinearGradient(
                      //             begin: Alignment.topCenter,
                      //             end: Alignment.bottomCenter,
                      //             colors: [
                      //               Color(0xff93ABD0),
                      //               Color(0xff8C648A)
                      //             ])),
                      //     padding: EdgeInsets.all(AppDimensions.height10 * 1.2),
                      child: Image.asset(
                        'assets/images/Asset_timeline.png',
                        height: AppDimensions.height10 * 7.8,
                        width: AppDimensions.height10 * 7.8,
                      )),
                  //       ),
                  Container(
                    width: AppDimensions.height10 * 34.8,
                    height: AppDimensions.height10 * 3.6,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                    child: Center(
                      child: Text(
                        'Your Timeline Journey',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 3.0,
                            letterSpacing: AppDimensions.height10 * 0.2,
                            fontWeight: FontWeight.w700,
                            height: AppDimensions.height10 * 0.12,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 30.8,
                    height: AppDimensions.height10 * 4.4,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 1.0,
                        left: AppDimensions.height10 * 4.8,
                        right: AppDimensions.height10 * 4.7),
                    child: Text(
                      'All your recorded events & schedule\nin one place',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.8,
                          fontWeight: FontWeight.w500,
                          height: AppDimensions.height10 * 0.15,
                          color: const Color(0xFF437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 11.20,
                    height: AppDimensions.height10 * 1.9,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.1),
                    child: Center(
                      child: Text(
                        'Past activities',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w700,
                            height: AppDimensions.height10 * 0.12,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 0.8),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      color: const Color(0xFF437296),
                      width: AppDimensions.height10 * 2.5,
                      height: AppDimensions.height10 * 2.5,
                    ),
                  ),
                  Container(
                      height: AppDimensions.height10 * 6.2,
                      width: AppDimensions.height10 * 6.2,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3, color: const Color(0xFFF5F5F5)),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFF5F2E6), Color(0xffECDA91)])),
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'TUE',
                            style: TextStyle(
                                height: AppDimensions.height10 * 0.12,
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff5B74A6)),
                          ),
                          Text(
                            '02.07',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                height: AppDimensions.height10 * 0.12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff5B74A6)),
                          ),
                        ],
                      ))),
                  Container(
                    width: AppDimensions.height10 * 38.4,
                    height: AppDimensions.height10 * 49.1,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 2.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 29.6,
                          height: AppDimensions.height10 * 3.5,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 5.5,
                            top: AppDimensions.height10 * 1.5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 3.5,
                                height: AppDimensions.height10 * 3.5,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 0.8),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/menu_goals_b.png'),
                                        fit: BoxFit.contain)),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 22.5,
                                height: AppDimensions.height10 * 2.2,
                                child: Text(
                                  'Goal & Practice scheduled',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      color: const Color(0xff437296)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 35.3,
                          height: AppDimensions.height10 * 39.6,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 1.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 2.0),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/timeline_1.png'),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 30.2,
                                height: AppDimensions.height10 * 3.4,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 3.2),
                                child: Center(
                                  child: Text(
                                    'New schedule started',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.8,
                                        height: AppDimensions.height10 * 0.12,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xffFBFBFB)),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 26.8,
                                height: AppDimensions.height10 * 26.8,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.9),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: AppDimensions.height10 * 26.8,
                                      height: AppDimensions.height10 * 26.8,
                                      padding: EdgeInsets.only(
                                          bottom: AppDimensions.height10 * 6.0),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/orange_moon.png'),
                                              fit: BoxFit.cover)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width:
                                                AppDimensions.height10 * 17.1,
                                            height:
                                                AppDimensions.height10 * 2.4,
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Control my anger',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10 *
                                                          2.0,
                                                  height:
                                                      AppDimensions.height10 *
                                                          0.12,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff5B74A6)),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                AppDimensions.height10 * 20.9,
                                            height:
                                                AppDimensions.height10 * 3.63,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '“I am someone who is in\ncontrol of my anger”',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10 *
                                                          1.4,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.italic,
                                                  color:
                                                      const Color(0xff5B74A6)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: const Alignment(-0.2, 1.3),
                                      child: Container(
                                        width: AppDimensions.height10 * 13.8,
                                        height: AppDimensions.height10 * 13.8,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Ellipse 158.png'),
                                                fit: BoxFit.cover)),
                                        child: Center(
                                          child: Text(
                                            'Meditation',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.8,
                                                height: AppDimensions.height10 *
                                                    0.12,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xffFBFBFB)),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 38.4,
                    height: AppDimensions.height10 * 43.9,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 2.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 30.7,
                          height: AppDimensions.height10 * 3.5,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 4.9,
                            top: AppDimensions.height10 * 1.5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 3.5,
                                height: AppDimensions.height10 * 3.5,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 0.8),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/session_stored.png'),
                                        fit: BoxFit.contain)),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 23.6,
                                height: AppDimensions.height10 * 2.2,
                                child: Text(
                                  'Practice session ‘Recorded’',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      color: const Color(0xff437296)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 35.5,
                          height: AppDimensions.height10 * 18.3,
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 2.0),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: AppDimensions.height10 * 0.5,
                                  blurRadius: AppDimensions.height10 * 0.7,
                                  offset: const Offset(0, 3),
                                )
                              ],
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 2.0),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/timeline_1.png'),
                                  fit: BoxFit.cover)),
                          child: Stack(children: [
                            Align(
                              alignment: const Alignment(-3, 0),
                              child: Container(
                                width: AppDimensions.height10 * 26.8,
                                height: AppDimensions.height10 * 26.8,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/orange_moon.png'),
                                        fit: BoxFit.cover)),
                                child: Container(
                                  width: AppDimensions.height10 * 15.8,
                                  height: AppDimensions.height10 * 4.8,
                                  alignment: const Alignment(0.3, -0.1),
                                  child: Text(
                                    'Control\nmy anger',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.0,
                                        //  height: AppDimensions.height10 * 0.12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0.3, 0),
                              child: Container(
                                width: AppDimensions.height10 * 13.8,
                                height: AppDimensions.height10 * 13.8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Meditation Completed.png'),
                                        fit: BoxFit.contain)),
                              ),
                            )
                          ]),
                        ),
                        Container(
                          width: AppDimensions.height10 * 33.7,
                          height: AppDimensions.height10 * 4.1,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 16.7,
                                height: AppDimensions.height10 * 1.7,
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontFamily: 'laila',
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            height:
                                                AppDimensions.height10 * 0.12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff5B74A6)),
                                        children: [
                                      const TextSpan(text: 'How did you feel '),
                                      const TextSpan(
                                          text: 'before:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ))
                                    ])),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 33.7,
                                height: AppDimensions.height10 * 2.3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: AppDimensions.height10 * 16.7,
                                      height: AppDimensions.height10 * 1.7,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10 * 0.7),
                                      child: Text(
                                        '“I felt low and irritable”',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            height:
                                                AppDimensions.height10 * 0.12,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff5B74A6)),
                                      ),
                                    ),
                                    Container(
                                      width: AppDimensions.height10 * 2.0,
                                      height: AppDimensions.height10 * 2.0,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF718FB1)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 1.0,
                        ),
                        SizedBox(
                          width: AppDimensions.height10 * 34.4,
                          child: Divider(
                            height: AppDimensions.height10 * 0.1,
                            color: const Color(0xFFE0E0E0),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 1.0,
                        ),
                        SizedBox(
                          width: AppDimensions.height10 * 33.7,
                          height: AppDimensions.height10 * 4.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 16.7,
                                height: AppDimensions.height10 * 1.7,
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontFamily: 'laila',
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            height:
                                                AppDimensions.height10 * 0.12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff5B74A6)),
                                        children: [
                                      const TextSpan(text: 'How did you feel '),
                                      const TextSpan(
                                          text: 'after:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ))
                                    ])),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 33.7,
                                height: AppDimensions.height10 * 2.3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: AppDimensions.height10 * 16.7,
                                      height: AppDimensions.height10 * 1.7,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10 * 0.7),
                                      child: Text(
                                        '“I felt focused & good”',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            height:
                                                AppDimensions.height10 * 0.12,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFFD6F32)),
                                      ),
                                    ),
                                    Container(
                                      width: AppDimensions.height10 * 2.0,
                                      height: AppDimensions.height10 * 2.0,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFFD6F32)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: const Alignment(-0.8685, 0),
                          child: Container(
                            width: AppDimensions.height10 * 3.5,
                            height: AppDimensions.height10 * 3.5,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 1.6),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/session.png'),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 38.4,
                    height: AppDimensions.height10 * 39.4,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 2.0,
                        left: AppDimensions.height10 * 1.4,
                        right: AppDimensions.height10 * 1.4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 20.5,
                          height: AppDimensions.height10 * 3.5,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 15.0,
                            top: AppDimensions.height10 * 1.5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 3.5,
                                height: AppDimensions.height10 * 3.5,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 0.8),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/hurdle.png'),
                                        fit: BoxFit.contain)),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 13.4,
                                height: AppDimensions.height10 * 2.2,
                                child: Text(
                                  'Hurdle',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      color: const Color(0xff437296)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 35.5,
                          height: AppDimensions.height10 * 29.9,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 1.5),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/timeline_3.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 22.7,
                                height: AppDimensions.height10 * 3.4,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 3.0),
                                child: GradientText(
                                  'Hurdle recorded',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.8,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  colors: [
                                    const Color(0xffFA9934),
                                    const Color(0xffEDD15E)
                                  ],
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 16.1,
                                height: AppDimensions.height10 * 16.1,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 2.589),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/black_hole.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10 * 6.873,
                                      height: AppDimensions.height10 * 2.197,
                                      child: Center(
                                        child: Text(
                                          'Husband',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppDimensions.height10 * 9.641,
                                      height: AppDimensions.height10 * 4.81,
                                      child: Center(
                                        child: Text(
                                          'Makes a\nmistake',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  AppDimensions.height10 * 1.8,
                                              height: AppDimensions.height10 *
                                                  0.109,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 38.4,
                    height: AppDimensions.height10 * 42.4,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 2.0,
                        left: AppDimensions.height10 * 1.4,
                        right: AppDimensions.height10 * 1.4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 20.5,
                          height: AppDimensions.height10 * 3.5,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 14.0,
                            top: AppDimensions.height10 * 1.5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 3.5,
                                height: AppDimensions.height10 * 3.5,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 0.8),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/inspiration.png'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 13.4,
                                height: AppDimensions.height10 * 2.2,
                                child: Text(
                                  'Inspiration',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      color: const Color(0xff437296)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 34.6,
                          height: AppDimensions.height10 * 33.2,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 1.5),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/bg_inpiration_purple.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 28.5,
                                height: AppDimensions.height10 * 3.4,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 3.0),
                                child: Text(
                                  'Inspiration recorded',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppDimensions.height10 * 2.8,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 17.2,
                                height: AppDimensions.height10 * 16.9,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.9),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Rectangle 10.png'))),
                              ),
                              Container(
                                width: AppDimensions.height10 * 16.7,
                                height: AppDimensions.height10 * 1.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.6),
                                child: Text(
                                  'Feelings and thoughts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 1.4,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 16.7,
                                height: AppDimensions.height10 * 3.0,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.2),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit....',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimensions.height10 * 1.1,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 38.4,
                    height: AppDimensions.height10 * 51.5,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 2.0,
                        left: AppDimensions.height10 * 1.4,
                        right: AppDimensions.height10 * 1.4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 20.5,
                          height: AppDimensions.height10 * 3.5,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 14.9,
                            top: AppDimensions.height10 * 1.5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 3.5,
                                height: AppDimensions.height10 * 3.5,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 0.8),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/report.png'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 13.4,
                                height: AppDimensions.height10 * 2.2,
                                child: Text(
                                  'Report',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      color: const Color(0xff437296)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 35.4,
                          height: AppDimensions.height10 * 43.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 1.5),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFFE1B3B7), Color(0XffC9B9CB)]),
                            image: const DecorationImage(
                                opacity: 0.7,
                                image:
                                    AssetImage('assets/images/timeline_2.png')),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 23.8,
                                height: AppDimensions.height10 * 3.4,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 3.2),
                                child: Text(
                                  'Congratulations!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppDimensions.height10 * 2.8,
                                      color: const Color(0xff437296)),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 32.7,
                                height: AppDimensions.height10 * 5.0,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.5),
                                child: Text(
                                  'Your 20 active\nday report is ready',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: AppDimensions.height10 * 0.12,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      color: const Color(0xff437296)),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 23.7,
                                height: AppDimensions.height10 * 25.5,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 2.4),
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Report card.png')),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10 * 2.0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 38.4,
                    height: AppDimensions.height10 * 62.7,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 2.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 20.5,
                          height: AppDimensions.height10 * 3.5,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 14.8,
                            top: AppDimensions.height10 * 1.5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 3.5,
                                height: AppDimensions.height10 * 3.5,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 0.8),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/menu_goals_b.png'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 16.1,
                                height: AppDimensions.height10 * 2.2,
                                child: Text(
                                  'New Vision Score!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.height10 * 1.8,
                                      color: const Color(0xff437296)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 35.4,
                          height: AppDimensions.height10 * 53.2,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 1.5),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/timeline_4.png')),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/bg_stars.png')),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 26.6,
                                  height: AppDimensions.height10 * 3.4,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 3.2),
                                  child: Text(
                                    'New progress level',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppDimensions.height10 * 2.8,
                                        color: const Color(0xff437296)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 31.1,
                                  height: AppDimensions.height10 * 42.2,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 1.9),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: const Alignment(0, 1),
                                        child: Container(
                                          width: AppDimensions.height10 * 31.1,
                                          height: AppDimensions.height10 * 29.6,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  const Color(0xFFF9DCC0)
                                                      .withOpacity(0),
                                                  const Color(0xFFFF7975)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter),
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10 * 2.0),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              width:
                                                  AppDimensions.height10 * 25.8,
                                              height: AppDimensions.height10 *
                                                  5.866,
                                              margin: EdgeInsets.only(
                                                  bottom:
                                                      AppDimensions.height10 *
                                                          2.856,
                                                  top: AppDimensions.height10 *
                                                      1.1),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: AppDimensions
                                                              .height10 *
                                                          2.13,
                                                      height: AppDimensions
                                                              .height10 *
                                                          1.8,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/colon.png'),
                                                            fit:
                                                                BoxFit.contain),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const Alignment(0.7, 0),
                                                    child: SizedBox(
                                                      width: AppDimensions
                                                              .height10 *
                                                          25.5,
                                                      height: AppDimensions
                                                              .height10 *
                                                          5.366,

                                                      ///color: Colors.amber,
                                                      child: Center(
                                                        child: Text(
                                                          "I feel I am making small\nsteps forward",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  AppDimensions
                                                                          .height10 *
                                                                      1.8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: const Color(
                                                                  0xFFFFFFFF)),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const Alignment(0, -1),
                                        child: Container(
                                          width: AppDimensions.height10 * 26.8,
                                          height: AppDimensions.height10 * 26.8,
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10 * 6.0),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/orange_moon.png'),
                                                  fit: BoxFit.cover)),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: AppDimensions.height10 *
                                                    17.1,
                                                height: AppDimensions.height10 *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    top:
                                                        AppDimensions.height10 *
                                                            7.3),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Control my anger',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10 *
                                                          2.0,
                                                      height: AppDimensions
                                                              .height10 *
                                                          0.12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xff5B74A6)),
                                                ),
                                              ),
                                              Container(
                                                // width:
                                                //     AppDimensions.height10 * 20.9,
                                                height: AppDimensions.height10 *
                                                    3.63,
                                                margin: EdgeInsets.only(
                                                    top:
                                                        AppDimensions.height10 *
                                                            0.2),
                                                alignment: Alignment.center,
                                                child: Text(
                                                    '“I am someone who is in\ncontrol of my anger”',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10 *
                                                            1.4,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: const Color(
                                                            0xff5B74A6))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const Alignment(0, 0.2),
                                        child: Container(
                                          width: AppDimensions.height10 * 15.3,
                                          height: AppDimensions.height10 * 15.3,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(goal_level ==
                                                          1
                                                      ? 'assets/images/goal_level_1.png'
                                                      : goal_level == 2
                                                          ? 'assets/images/Goal level score.png'
                                                          : goal_level == 3
                                                              ? 'assets/images/goal_level_3.png'
                                                              : goal_level == 4
                                                                  ? 'assets/images/goal_level_4.png'
                                                                  : 'assets/images/goal_level_5.png'),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: AppDimensions.height10 * 6.2,
                      width: AppDimensions.height10 * 6.2,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 6.7),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3, color: const Color(0xFFF5F5F5)),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFF5F2E6), Color(0xffECDA91)])),
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'TUE',
                            style: TextStyle(
                                height: AppDimensions.height10 * 0.12,
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff5B74A6)),
                          ),
                          Text(
                            '02.07',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                height: AppDimensions.height10 * 0.12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff5B74A6)),
                          ),
                        ],
                      ))),
                  Container(
                      height: AppDimensions.height10 * 6.2,
                      width: AppDimensions.height10 * 6.2,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 6.0,
                          bottom: AppDimensions.height10 * 23.8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3, color: const Color(0xFFF5F5F5)),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFF5F2E6), Color(0xffECDA91)])),
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'MON',
                            style: TextStyle(
                                height: AppDimensions.height10 * 0.12,
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff5B74A6)),
                          ),
                          Text(
                            '01.07',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                height: AppDimensions.height10 * 0.12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff5B74A6)),
                          ),
                        ],
                      ))),
                ],
              ),
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            // color: Colors.blue,
            padding: EdgeInsets.only(right: AppDimensions.height10 * 2.2),
            height: AppDimensions.height10 * 7.0,
            width: AppDimensions.height10 * 41.4,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: AppDimensions.height10 * 66.0,
                      // height: AppDimensions.height10*5.0,
                      padding:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.2),
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 5.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: AppDimensions.height10 * 2.4,
                                height: AppDimensions.height10 * 2.4,

                                // padding: EdgeInsets.only(
                                //     top: AppDimensions.height10 * 0.5,
                                //     bottom: AppDimensions.height10 * 0.5),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/ic_filter_list.png',
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 0.5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _BottomSheet(context);
                                },
                                child: Container(
                                  width: AppDimensions.height10 * 11.5,
                                  height: AppDimensions.height10 * 3.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10 * 1.0),
                                      border: Border.all(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xFFE0E0E0))),
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 1.3,
                                      right: AppDimensions.height10 * 1.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 1.0),
                                        child: Text(
                                          'Goal:',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFA9934)),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 1.9,
                                        height: AppDimensions.height10 * 2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 0.8),
                                        child: Center(
                                          child: Text(
                                            'All',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xffFA9934)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 2.4,
                                        height: AppDimensions.height10 * 2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 0.8,
                                            bottom:
                                                AppDimensions.height10 * 0.3),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xffFA9934),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _showBottomSheet(context);
                                },
                                child: Container(
                                  width: AppDimensions.height10 * 11.6,
                                  height: AppDimensions.height10 * 3.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10 * 1.0),
                                      border: Border.all(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xFFE0E0E0))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 1.0),
                                        child: Text(
                                          'Action:',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFA9934)),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 1.9,
                                        height: AppDimensions.height10 * 2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 0.8),
                                        child: Center(
                                          child: Text(
                                            'All',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xffFA9934)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 2.4,
                                        height: AppDimensions.height10 * 2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 0.8,
                                            bottom:
                                                AppDimensions.height10 * 0.3),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xffFA9934),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _TimeBottomSheet(context);
                                },
                                child: Container(
                                  width: AppDimensions.height10 * 12.6,
                                  height: AppDimensions.height10 * 3.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10 * 1.0),
                                      border: Border.all(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xFFE0E0E0))),
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 1.3,
                                      right: AppDimensions.height10 * 1.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 1.0),
                                        child: Text(
                                          'Date from:',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFA9934)),
                                        ),
                                      ),
                                      Container(
                                        // width: AppDimensions.height10 * 1.9,
                                        height: AppDimensions.height10 * 2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 0.4),
                                        child: Center(
                                          child: Text(
                                            'All',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xffFA9934)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 2.4,
                                        height: AppDimensions.height10 * 2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 0.4,
                                            bottom:
                                                AppDimensions.height10 * 0.3),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xffFA9934),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _TimeBottomSheet(context);
                                },
                                child: Container(
                                  width: AppDimensions.height10 * 11.5,
                                  height: AppDimensions.height10 * 3.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10 * 1.0),
                                      border: Border.all(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xFFE0E0E0))),
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 1.3,
                                      right: AppDimensions.height10 * 1.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 1.0),
                                        child: Text(
                                          'Date to:',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFA9934)),
                                        ),
                                      ),
                                      Container(
                                        // width: AppDimensions.height10 * 1.9,
                                        height: AppDimensions.height10 * 2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 0.4),
                                        child: Center(
                                          child: Text(
                                            'All',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xffFA9934)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 2.4,
                                        height: AppDimensions.height10 * 2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10 * 0.8,
                                            bottom:
                                                AppDimensions.height10 * 0.3),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xffFA9934),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  // width: AppDimensions.height10 * 6.0,
                                  height: AppDimensions.height10 * 2.1,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 1.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Clear all',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline,
                                        color: const Color(0xFFFA9934)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: AppDimensions.height10 * 4.9,
                    height: AppDimensions.height10 * 5.0,
                    color: const Color(0xFFFBFBFB),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/Search.png',
                        width: AppDimensions.height10 * 5,
                        height: AppDimensions.height10 * 5,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                //const Padding(padding: EdgeInsets.all(10))
              ],
            ),
          ),
        ));
  }
}

_showBottomSheet(BuildContext context) {
  final bool bottom_sheet = true;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return MyBottomSheet(
          sheet_bottom: bottom_sheet,
        );
      });
    },
  ).then((value) {
    if (value != null) {
      // Do something with the selected statement
      print(value);
    }
  });
}

class MyBottomSheet extends StatefulWidget {
  final bool sheet_bottom;

  const MyBottomSheet({super.key, required this.sheet_bottom});
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int _selectedIndex = 0;

  final List<String> _goals_name = [
    'All',
    'Goal name 1',
    'Goal name 2',
    'Goal name 3',
    'Goal name 4'
  ];
  final List<String> _sessions = [
    'All',
    'Sessions completed',
    'Sessions upcoming',
    'Sessions missed',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          AppDimensions.height10 * 31.3, // Set the height of the bottom sheet
      child: Column(
        children: [
          Container(
            height: AppDimensions.height10 * 3.8,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: const Color(0xFF828282),
                        width: AppDimensions.height10 * 0.1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10 * 5.0,
                    height: AppDimensions.height10 * 2.1,
                    margin:
                        EdgeInsets.only(right: AppDimensions.height10 * 2.0),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //activity_duration = _selected_activity;
                      //activity_duration = _statements[_selectedIndex];
                    });
                    Navigator.of(context).pop(_sessions[_selectedIndex]);
                  },
                  child: Container(
                    width: AppDimensions.height10 * 3.7,
                    height: AppDimensions.height10 * 2.1,
                    margin:
                        EdgeInsets.only(right: AppDimensions.height10 * 1.9),
                    child: Text(
                      'Done',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 35,
              magnification: 1.2,
              useMagnifier: true, // Set the height of each statement
              children: widget.sheet_bottom
                  ? _sessions
                      .map((statement) => Text(statement,
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w400,
                          )))
                      .toList()
                  : _goals_name
                      .map((statement) => Text(statement,
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w400,
                          )))
                      .toList(),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                  //activity_duration = _statements[_selectedIndex];
                  //  _selected_activity = _statements[_selectedIndex];
                });
              },
            ),
          ),
          SizedBox(height: AppDimensions.height10 * 3.6),
        ],
      ),
    );
  }
}

_BottomSheet(BuildContext context) {
  final bool bottom_sheet = false;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return MyBottomSheet(
          sheet_bottom: bottom_sheet,
        );
      });
    },
  ).then((value) {
    if (value != null) {
      // Do something with the selected statement
      print(value);
    }
  });
}

class BottomSheet extends StatefulWidget {
  final bool sheet_bottom;

  const BottomSheet({super.key, required this.sheet_bottom});
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _BottomSheetState extends State<MyBottomSheet> {
  int _selectedIndex = 0;

  final List<String> _goals_name = [
    'All',
    'Goal name 1',
    'Goal name 2',
    'Goal name 3',
    'Goal name 4'
  ];
  final List<String> _sessions = [
    'All',
    'Sessions completed',
    'Sessions upcoming',
    'Sessions missed',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          AppDimensions.height10 * 31.3, // Set the height of the bottom sheet
      child: Column(
        children: [
          Container(
            height: AppDimensions.height10 * 3.8,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: const Color(0xFF828282),
                        width: AppDimensions.height10 * 0.1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10 * 5.0,
                    height: AppDimensions.height10 * 2.1,
                    margin:
                        EdgeInsets.only(right: AppDimensions.height10 * 2.0),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //activity_duration = _selected_activity;
                      //activity_duration = _statements[_selectedIndex];
                    });
                    Navigator.of(context).pop(_sessions[_selectedIndex]);
                  },
                  child: Container(
                    width: AppDimensions.height10 * 3.7,
                    height: AppDimensions.height10 * 2.1,
                    margin:
                        EdgeInsets.only(right: AppDimensions.height10 * 1.9),
                    child: Text(
                      'Done',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 35,
              magnification: 1.2,
              useMagnifier: true, // Set the height of each statement
              children: widget.sheet_bottom
                  ? _sessions
                      .map((statement) => Text(statement,
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w400,
                          )))
                      .toList()
                  : _goals_name
                      .map((statement) => Text(statement,
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w400,
                          )))
                      .toList(),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                  //activity_duration = _statements[_selectedIndex];
                  //  _selected_activity = _statements[_selectedIndex];
                });
              },
            ),
          ),
          SizedBox(height: AppDimensions.height10 * 3.6),
        ],
      ),
    );
  }
}

_TimeBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: AppDimensions.height10 * 30.3,
          child: Column(
            children: [
              Container(
                height: AppDimensions.height10 * 3.8,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFF828282),
                            width: AppDimensions.height10 * 0.1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensions.height10 * 5.0,
                        height: AppDimensions.height10 * 2.1,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 2.0),
                        child: Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF2F80ED)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: AppDimensions.height10 * 3.7,
                        height: AppDimensions.height10 * 2.1,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.9),
                        child: Text(
                          'Done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF2F80ED)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 26.0,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime value) {},
                ),
              ),
            ],
          ),
        );
      });
}
