import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class message_center extends StatefulWidget {
  const message_center({super.key});

  @override
  State<message_center> createState() => _message_centerState();
}

class _message_centerState extends State<message_center> {
  bool options = false;
  bool delete = false;
  bool msg_1 = true;
  bool msg_2 = true;
  bool msg_3 = true;
  bool msg_4 = true;
  bool msg_5 = false;
  bool msg_6 = false;
  bool msg_7 = false;
  bool msg_8 = false;
  bool msg_9 = false;
  bool msg_10 = false;
  bool msg_11 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        leadingWidth: AppDimensions.height10 * 9.1,
        leading: options
            ? Center(
                child: Container(
                  margin: EdgeInsets.only(left: AppDimensions.height10 * 1.6),
                  // color: Colors.amber,
                  child: SizedBox(
                    width: AppDimensions.height10 * 7.5,
                    height: AppDimensions.height10 * 2.4,

                    // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.6),
                    child: Text(
                      'Delete All',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: const Color(0xFFFBFBFB)),
                    ),
                  ),
                ),
              )
            : Container(),
        actions: [
          Center(
            child: options
                ? GestureDetector(
                    onTap: () {
                      if (options == true) {
                        setState(() {
                          options = false;
                        });
                      }
                    },
                    child: SizedBox(
                      //  color: Colors.amber,
                      width: AppDimensions.height10 * 5.8,
                      height: AppDimensions.height10 * 2.4,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            color: const Color(0xFFFBFBFB)),
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/Close.png',
                      width: AppDimensions.height10 * 2.6,
                      height: AppDimensions.height10 * 2.6,
                      fit: BoxFit.cover,
                    )),
          ),
        ],
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: AppDimensions.height10 * 9.2,
              ),
              Container(
                width: AppDimensions.height10 * 9.0,
                height: AppDimensions.height10 * 9.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Group.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: AppDimensions.height10 * 32.9,
                height: AppDimensions.height10 * 3.6,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 1.9),
                child: Center(
                  child: Text(
                    'Message centre',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 3.0,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 28.4,
                height: AppDimensions.height10 * 2.2,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                child: Center(
                  child: Text(
                    'All your notifications in one place',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.8,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              ),
              delete
                  ? Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 34.3,
                          height: AppDimensions.height10 * 4.9,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 10.1),
                          child: Center(
                            child: Text(
                              'No messages',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 3.0,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFFBFBFB)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 33.2,
                          height: AppDimensions.height10 * 9.7,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 0.2),
                          child: Center(
                            child: Text(
                              'You currently have no\nmessages, your new\nalerts will appear\nhere.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFBFBFB)),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: AppDimensions.height10 * 1.2,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_1 == true) {
                                          setState(() {
                                            msg_1 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_1 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_1
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title: "Hi, it's Reda here",
                                  body:
                                      "You have an extra 20% chance of\nsuccess if you have a support buddy.\nHave you got one?"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.6,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_2 == true) {
                                          setState(() {
                                            msg_2 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_2 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_2
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title: "Hi, evaluate your goal",
                                  body:
                                      "It’s time to evaluate your progress and\nassess how close you are to living your\ngoal and desired identity. "),
                            ],
                          ),
                        ),
                        SizedBox(height: AppDimensions.height10 * 0.6),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_3 == true) {
                                          setState(() {
                                            msg_3 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_3 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_3
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title: "Hi, it’s practice time",
                                  body:
                                      "It’s time to record your practice session."),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.6,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_4 == true) {
                                          setState(() {
                                            msg_4 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_4 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_4
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title: "Hi, let’s plan for obstacles",
                                  body:
                                      "One of the best ways to achieve your goal is\na preparation, specifically visualising and\npractising hurdles that may come your way. "),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.60,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_5 == true) {
                                          setState(() {
                                            msg_5 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_5 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_5
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title: "Hi, record goal inspiration ",
                                  body:
                                      "Keep yourself motivated and focused by\nadding inspirational material to uplift you,\nespecially in those low moments or, when\nyou feel stuck. "),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.6,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_6 == true) {
                                          setState(() {
                                            msg_6 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_6 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_6
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title: "Hi, you’ve missed a practice session",
                                  body:
                                      "Oops, it seems as though you have missed a\nsession or haven’t recorded it. Consistency is\nan important ingredient to success. Let’s\nrecord it now."),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.6,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_7 == true) {
                                          setState(() {
                                            msg_7 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_7 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_7
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title:
                                      "Hi, your practice assessment is ready",
                                  body:
                                      "You have been consistently recording your\npractice for 20 active days now. We’ve put\ntogether a progress report for you to review\nand you can also evaluate your practice."),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.6,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_8 == true) {
                                          setState(() {
                                            msg_8 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_8 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_8
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title: "Hi, let’s view your hurdles ",
                                  body:
                                      "You haven’t viewed or recorded your hurdles\nin a while. It’s important to prepare and\nvisualise potential obstacles coming your way.\nLet’s do it now."),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.6,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_9 == true) {
                                          setState(() {
                                            msg_9 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_9 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_9
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title: "Hi, let’s view your inspirations ",
                                  body:
                                      "You haven’t viewed or recorded your\ninspirations in a while. Would you like to\nview your Inspiration Board?"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.6,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_10 == true) {
                                          setState(() {
                                            msg_10 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_10 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_10
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title:
                                      "Hi, you’ve missed a number of\npractice sessions",
                                  body:
                                      "You haven’t recorded your practice sessions in a\nwhile. Please visit your Schedule/Timeline to\nsee which practices you’ve missed that need\nrecording."),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.6,
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 14.4,
                          width: AppDimensions.height10 * 38.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              options
                                  ? GestureDetector(
                                      onTap: () {
                                        if (msg_11 == true) {
                                          setState(() {
                                            msg_11 = false;
                                          });
                                        } else {
                                          setState(() {
                                            msg_11 = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: AppDimensions.height10 * 3.3,
                                        width: AppDimensions.height10 * 3.3,
                                        margin: EdgeInsets.only(
                                            right:
                                                AppDimensions.height10 * 1.0),
                                        child: msg_11
                                            ? Image.asset(
                                                'assets/images/circle_tick.png')
                                            : Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .height10 *
                                                            0.2,
                                                        color: const Color(
                                                            0xFFFFFFFF))),
                                              ),
                                      ),
                                    )
                                  : Container(),
                              const messages(
                                  title: "Hi, we’ve paused your goal",
                                  body:
                                      "There has been no activity for 00 days and we\nhave paused your goal. Please review it now\nand update any details if you’d like it to be\nreinstated. "),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 7.6,
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: delete
          ? Container(
              width: AppDimensions.height10 * 38.259,
              height: AppDimensions.height10 * 9.707,
              margin: EdgeInsets.only(
                  bottom: AppDimensions.height10 * 2.093,
                  left: AppDimensions.height10 * 1.6,
                  right: AppDimensions.height10 * 1.6),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 2.0),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: AppDimensions.height10 * 1.261),
                    width: AppDimensions.height10 * 4.437,
                    height: AppDimensions.height10 * 4.437,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/circle_tick.png'))),
                  ),
                  Container(
                    width: AppDimensions.height10 * 6.9,
                    height: AppDimensions.height10 * 3.6,
                    margin:
                        EdgeInsets.only(left: AppDimensions.height10 * 1.232),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: AppDimensions.height10 * 4.6,
                          height: AppDimensions.height10 * 1.4,
                          //   color: Colors.amber,
                          child: Text(
                            'Deleted',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.3,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFFFFFF)),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10 * 6.9,
                          height: AppDimensions.height10 * 2.2,
                          child: Text(
                            'Alerts',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFFFFFF)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 8.1,
                    height: AppDimensions.height10 * 6.0,
                    margin:
                        EdgeInsets.only(left: AppDimensions.height10 * 15.1),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFFFFFFF), width: 1),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                    ),
                    child: Center(
                      child: Text(
                        'Undo',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(
              width: AppDimensions.height10 * 29.0,
              height: options
                  ? AppDimensions.height10 * 7.0
                  : AppDimensions.height10 * 5.0,
              margin: options
                  ? const EdgeInsets.all(0)
                  : EdgeInsets.only(
                      top: AppDimensions.height10 * 0.1,
                      right: AppDimensions.height10 * 6.2,
                      left: AppDimensions.height10 * 6.2,
                      bottom: AppDimensions.height10 * 2.2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(options
                      ? AppDimensions.height10 * 0
                      : AppDimensions.height10 * 5.0),
                  color: const Color(0xFFF5F5F5)),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    options = true;
                  });
                },
                child: options
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                      width: AppDimensions.height10 * 27.0,
                                      height: AppDimensions.height10 * 21.4,
                                      child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10 * 1.4)),
                                        contentPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10 *
                                                    1.9,
                                                right: AppDimensions.height10 *
                                                    1.6,
                                                left: AppDimensions.height10 *
                                                    1.6,
                                                bottom: AppDimensions.height10 *
                                                    0.2),
                                            height:
                                                AppDimensions.height10 * 4.4,
                                            width:
                                                AppDimensions.height10 * 23.8,
                                            child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    style: TextStyle(
                                                        fontFamily: 'laila',
                                                        height: AppDimensions
                                                                .height10 *
                                                            0.12,
                                                        fontSize: AppDimensions
                                                                .height10 *
                                                            1.7,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF000000)),
                                                    children: [
                                                      const TextSpan(
                                                          text:
                                                              'Are you sure you want\nto'),
                                                      const TextSpan(
                                                        text: ' delete ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      const TextSpan(
                                                          text: 'this alert?')
                                                    ]))),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10 * 1.5,
                                              left:
                                                  AppDimensions.height10 * 1.6,
                                              right:
                                                  AppDimensions.height10 * 1.6),
                                          height: AppDimensions.height10 * 3.4,
                                          width: AppDimensions.height10 * 23.8,
                                          child: Text(
                                            "By clicking 'Yes' you confirm that this\nalert will be deleted. ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(0XFF000000),
                                              letterSpacing:
                                                  AppDimensions.height10 * 0.1,
                                              fontSize:
                                                  AppDimensions.height10 * 1.3,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: AppDimensions.height10 *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10 *
                                                    4.2,
                                                width: double.infinity,
                                                color: const Color(0xFF007AFF),
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: AppDimensions
                                                                .height10 *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10 *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10 *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      delete = true;
                                                      options = false;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10 *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF007AFF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10 *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                            child: Container(
                              width: AppDimensions.height10 * 10.1,
                              height: AppDimensions.height10 * 5.0,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 2.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10 * 5.0),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFFFCC10D),
                                    Color(0xFFFDA210)
                                  ])),
                              child: Center(
                                child: Text('Delete ',
                                    style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFFFFFF),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 7.7,
                            height: AppDimensions.height10 * 2.1,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 2.0),
                            child: Center(
                              child: Text('10 selected',
                                  style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFFA9934),
                                  )),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          'Options',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.6,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFA9934)),
                        ),
                      ),
              ),
            ),
      extendBody: true,
    );
  }
}

class messages extends StatelessWidget {
  final String title;
  final String body;
  const messages({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10 * 14.4,
      width: AppDimensions.height10 * 34.5,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/Component 2.png',
        ),
        fit: BoxFit.cover,
      )),

      //color: Colors.blue,
      child: Stack(children: [
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
            top: AppDimensions.height10 * 0.6,
          ),
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10 * 31.1,
                height: AppDimensions.height10 * 4.0,
                margin: EdgeInsets.only(left: AppDimensions.height10 * 3.2),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.6,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(91, 116, 166, 1),
                    ),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 5.245,
                height: AppDimensions.height10 * 1.3,
                margin: EdgeInsets.only(right: AppDimensions.height10 * 22.0),
                child: const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(91, 116, 166, 1),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 31.1,
                // height: AppDimensions.height10 * 5.3,
                margin: EdgeInsets.only(
                  left: AppDimensions.height10 * 3.4,
                ),
                child: Text(
                  body,
                  // textAlign: TextAlign.left,

                  style: TextStyle(
                      height: AppDimensions.height10 * 0.15,
                      fontSize: AppDimensions.height10 * 1.4,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(91, 116, 166, 1)),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

void notifications_sheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.height10 * 2.0),
      )),
      builder: ((context) => Container(
            width: AppDimensions.height10 * 41.4,
            height: AppDimensions.height10 * 57.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppDimensions.height10 * 2.0)),
                color: const Color(0xFFF5F5F5)),
            child: Column(
              children: [
                Container(
                  //color: Colors.amber,
                  // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                  alignment: const Alignment(1, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: AppDimensions.height10 * 2.6,
                      height: AppDimensions.height10 * 2.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 1.5,
                          right: AppDimensions.height10 * 1.5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Close_blue.png'))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 1.9,
                      bottom: AppDimensions.height10 * 2.9),
                  child: Image.asset(
                    'assets/images/potenic__icon.png',
                    width: AppDimensions.height10 * 8.202,
                    height: AppDimensions.height10 * 11.2,
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 22.7,
                  height: AppDimensions.height10 * 3.6,
                  // color: Colors.amber,
                  alignment: Alignment.center,
                  //  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                  child: Text(
                    'Get Reminders',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 3.0,
                        letterSpacing: AppDimensions.height10 * 0.2,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF437296)),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 38.2,
                  height: AppDimensions.height10 * 5.7,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.1),
                  child: Center(
                    child: Text(
                      'In order to build consistent behaviour,\nallow us to gently nudge you to remind you to do\nyour practices and offer helpful tips.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.6,
                          height: AppDimensions.height10 * 0.15,
                          //letterSpacing: AppDimensions.height10 * 0.2,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF437296)),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 38.2,
                  height: AppDimensions.height10 * 21.0,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.6),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: AppDimensions.height10 * 0.1,
                          color: const Color(0xFFFBFBFB)),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                      gradient: const LinearGradient(colors: [
                        Color(0xFFE8776D),
                        Color(0xFFEF939D),
                        Color(0xFFEF939D)
                      ])),
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                        child: Image.asset(
                          'assets/images/notifications.png',
                          width: AppDimensions.height10 * 4.8,
                          height: AppDimensions.height10 * 4.8,
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 34.5,
                        height: AppDimensions.height10 * 5.1,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.4),
                        child: Center(
                            child: Text(
                          'We will check in with you to remind you\nabout your practices. You would be able to customise your\nnotifications later in your Account Settings. ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              height: AppDimensions.height10 * 0.12,
                              //letterSpacing: AppDimensions.height10 * 0.2,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFFFFFFF)),
                        )),
                      ),
                      Container(
                        width: AppDimensions.height10 * 34.3,
                        height: AppDimensions.height10 * 5.0,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.7),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: AppDimensions.height10 * 0.1,
                                color: const Color(0xFFFBFBFB)),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 5.0),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFFCC10D),
                                  Color(0xFFFDA210)
                                ])),
                        child: Center(
                          child: Text(
                            'Yes, remind Me',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                //  height: AppDimensions.height10 * 0.12,
                                //letterSpacing: AppDimensions.height10 * 0.2,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )));
}