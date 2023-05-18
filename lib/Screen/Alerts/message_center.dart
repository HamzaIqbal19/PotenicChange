import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class message_center extends StatefulWidget {
  const message_center({super.key});

  @override
  State<message_center> createState() => _message_centerState();
}

class _message_centerState extends State<message_center> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Center(
            child: IconButton(
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
              Image.asset(
                "assets/images/Group.png",
                height: AppDimensions.height10 * 7.6,
                width: AppDimensions.height10 * 7.6,
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
              SizedBox(
                height: AppDimensions.height10 * 1.2,
              ),
              const messages(
                  title: "Hi, it's Reda here",
                  body:
                      "You have an extra 20% chance of\nsuccess if you have a support buddy.\nHave you got one?"),
              SizedBox(
                height: AppDimensions.height10 * 0.6,
              ),
              const messages(
                  title: "Hi, evaluate your goal",
                  body:
                      "It’s time to evaluate your progress and\nassess how close you are to living your\ngoal and desired identity. "),
              SizedBox(height: AppDimensions.height10 * 0.6),
              const messages(
                  title: "Hi, it’s practice time",
                  body: "It’s time to record your practice session."),
              SizedBox(
                height: AppDimensions.height10 * 0.6,
              ),
              const messages(
                  title: "Hi, let’s plan for obstacles",
                  body:
                      "One of the best ways to achieve your goal is\na preparation, specifically visualising and\npractising hurdles that may come your way. "),
              SizedBox(
                height: AppDimensions.height10 * 0.60,
              ),
              const messages(
                  title: "Hi, record goal inspiration ",
                  body:
                      "Keep yourself motivated and focused by\nadding inspirational material to uplift you,\nespecially in those low moments or, when you\nfeel stuck. "),
              SizedBox(
                height: AppDimensions.height10 * 0.6,
              ),
              const messages(
                  title: "Hi, you’ve missed a practice session",
                  body:
                      "Oops, it seems as though you have missed a\nsession or haven’t recorded it. Consistency is\nan important ingredient to success. Let’s\nrecord it now."),
              SizedBox(
                height: AppDimensions.height10 * 0.6,
              ),
              const messages(
                  title: "Hi, your practice assessment is ready",
                  body:
                      "You have been consistently recording your\npractice for 20 active days now. We’ve put\ntogether a progress report for you to review\nand you can also evaluate your practice."),
              SizedBox(
                height: AppDimensions.height10 * 0.6,
              ),
              const messages(
                  title: "Hi, let’s view your hurdles ",
                  body:
                      "You haven’t viewed or recorded your hurdles\nin a while. It’s important to prepare and\nvisualmeise potential obstacles coming your way.\nLet’s do it now."),
              SizedBox(
                height: AppDimensions.height10 * 0.6,
              ),
              const messages(
                  title: "Hi, let’s view your inspirations ",
                  body:
                      "You haven’t viewed or recorded your\ninspirations in a while. Would you like to\nview your Inspiration Board?"),
              SizedBox(
                height: AppDimensions.height10 * 0.6,
              ),
              const messages(
                  title: "Hi, you’ve missed a number of\npractice sessions",
                  body:
                      "You haven’t recorded your practice sessions in a\nwhile. Please visit your Schedule/Timeline to\nsee which practices you’ve missed that need\nrecording."),
              SizedBox(
                height: AppDimensions.height10 * 0.6,
              ),
              const messages(
                  title: "Hi, we’ve paused your goal",
                  body:
                      "There has been no activity for 00 days and we\nhave paused your goal. Please review it now\nand update any details if you’d like it to be\nreinstated. "),
              SizedBox(
                height: AppDimensions.height10 * 7.6,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: AppDimensions.height10 * 29.0,
        height: AppDimensions.height10 * 5.0,
        margin: EdgeInsets.only(
            top: AppDimensions.height10 * 0.1,
            right: AppDimensions.height10 * 6.2,
            left: AppDimensions.height10 * 6.2,
            bottom: AppDimensions.height10 * 2.2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.height10 * 5.0),
            color: const Color(0xFFF5F5F5)),
        child: Center(
          child: Text(
            'Options',
            style: TextStyle(
                fontSize: AppDimensions.height10 * 1.6,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFA9934)),
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
          'assets/images/Component 1.png',
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
                color: Color(0xFFF5F5F5)),
            child: Column(
              children: [
                Container(
                  //color: Colors.amber,
                  // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                  alignment: Alignment(1, 0),
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
                      decoration: BoxDecoration(
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
                        color: Color(0xFF437296)),
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
                          height: AppDimensions.height10 * 0.12,
                          //letterSpacing: AppDimensions.height10 * 0.2,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF437296)),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 38.2,
                  height: AppDimensions.height10 * 21.0,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.6),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                      gradient: LinearGradient(colors: [
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
                              color: Color(0xFFFFFFFF)),
                        )),
                      ),
                      Container(
                        width: AppDimensions.height10 * 34.3,
                        height: AppDimensions.height10 * 5.0,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 5.0),
                            gradient: LinearGradient(
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
                                color: Color(0xFFFFFFFF)),
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
