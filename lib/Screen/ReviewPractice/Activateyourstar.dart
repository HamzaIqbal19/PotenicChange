import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/review_habits_dashboard/dashboard.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ActivateStar extends StatefulWidget {
  const ActivateStar({Key? key}) : super(key: key);

  @override
  State<ActivateStar> createState() => _ActivateStarState();
}

class _ActivateStarState extends State<ActivateStar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: Center(
          // alignment: Alignment.center,
          child: IconButton(
            icon: Image.asset(
              'assets/images/Back.png',
              width: AppDimensions.height10 * 3,
              height: AppDimensions.height10 * 3,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomeScreen(),
              //   ),
              // );
              // Add code for performing close action
            },
          ),
        ),
        actions: [
          Center(
            // alignment: Alignment.center,
            child: IconButton(
              icon: Image.asset(
                'assets/images/Close.png',
                width: AppDimensions.height10 * 3.0,
                height: AppDimensions.height10 * 3.0,
                fit: BoxFit.contain,
              ),
              onPressed: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomeScreen(),
                //   ),
                // );
                // Add code for performing close action
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Activatestarbg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimensions.height10 * 8.9,
              ),
              Container(
                width: AppDimensions.height10 * 28.3,
                height: AppDimensions.height10 * 7.2,
                // padding: EdgeInsets.only(top: AppDimensions.height10 * 10),
                child: Center(
                  child: GradientText(
                    "Activate your star ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      // color: Colors.white,
                      fontSize: AppDimensions.height10 * 3,
                    ),
                    colors: [
                      const Color(0xFFFFFFFF),
                      const Color(0xFFFFFFFF).withOpacity(0.90),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 2.5,
              ),
              Container(
                  // color: Colors.black,
                  height: AppDimensions.height10 * 13.2,
                  width: AppDimensions.height10 * 35.7,
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            "I desire to grow and improve my identity. By activating my star, I will be able to evaluate my chosen practice every 20 active days and evaluate my active goal progress monthly. ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 1.8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: AppDimensions.height10 * 3.6,
              ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      login_sheet(context);
                    },
                    child: Container(
                      child: Image(
                        image: const AssetImage(
                            'assets/images/angerwithoutreview.png'),
                        height: AppDimensions.height10 * 38.1,
                        width: AppDimensions.height10 * 35.3,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      // alignment: Alignment.bottomCenter,
                      alignment:
                          Alignment(0.01, AppDimensions.height10 * 0.016 + 0.9),
                      //heightFactor: 0.5,
                      child: Container(
                        // height: AppDimensions.height10*17.5,
                        // width:  AppDimensions.height10*17.5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              FadePageRoute(
                                page: const dashBoard(
                                  saved: false,
                                  helpful_tips: false,
                                  membership: true,
                                  dashboard_ctrl: false,
                                  cancel: false,
                                  trial: false,
                                ),
                              ),
                            );
                            dashboard_sheet(context);
                          },
                          child: Image(
                            image:
                                const AssetImage('assets/images/Asfinger.png'),
                            height: AppDimensions.height10 * 16.0,
                            width: AppDimensions.height10 * 16.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppDimensions.height10 * 1.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      // color: Colors.black,

                      height: AppDimensions.height10 * 5.4,
                      width: AppDimensions.height10 * 27.4,
                      child: Column(
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                "To begin your journey press and hold here.  ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

void dashboard_sheet(context) {
  bool hide = true;
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    enableDrag: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10 * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10 * 39.4,
          height: AppDimensions.height10 * 62.3,
          margin: EdgeInsets.only(
              left: AppDimensions.height10 * 1.0,
              right: AppDimensions.height10 * 1.0,
              bottom: AppDimensions.height10 * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.height10 * 2.0),
              color: const Color(0xFFF5F5F5)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      FadePageRoute(
                        page: const dashBoard(
                          helpful_tips: true,
                          membership: true,
                          dashboard_ctrl: false,
                          cancel: false,
                          trial: false,
                          saved: false,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 1.9,
                        right: AppDimensions.height10 * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Close_blue.png'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 1.5,
                    bottom: AppDimensions.height10 * 2.0),
                child: Image.asset(
                  'assets/images/potenic__icon.png',
                  width: AppDimensions.height10 * 8.202,
                  height: AppDimensions.height10 * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.height10 * 30.7,
                height: AppDimensions.height10 * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                child: Text(
                  'Welcome to\nyour Dashboard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10 * 0.12,
                      fontSize: AppDimensions.height10 * 2.8,
                      //letterSpacing: AppDimensions.height10 * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  //  width: AppDimensions.height10 * 33.2,
                  //  height: AppDimensions.height10 * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.1),
                  child: Center(
                    child: Text(
                      'This is a one-stop place to manage your\npersonal development journey. From\nDashboard, you can quickly navigate to\nyour goals, view your practices, record\nhurdles and inspirations.\n\nHave a tour of what’s available to you\nand how you can access the tools that\nare important to your personal growth.\n\nWe look forward to supporting you.\nEnjoy your journey :)',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.8,
                          // letterSpacing: AppDimensions.height10 * 0.2,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF437296)),
                    ),
                  )),
            ],
          )),
    ),
  );
}

void login_sheet(context) {
  bool hide = true;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10 * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10 * 39.4,
          height: AppDimensions.height10 * 54.4,
          // margin: EdgeInsets.only(
          //     left: AppDimensions.height10 * 1.0,
          //     right: AppDimensions.height10 * 1.0,
          //     bottom: AppDimensions.height10 * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.height10 * 2.0)),
              color: const Color(0xFFF5F5F5)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  child: Container(
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 1.9,
                        right: AppDimensions.height10 * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Close_blue.png'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 1.5,
                    bottom: AppDimensions.height10 * 2.0),
                child: Image.asset(
                  'assets/images/potenic__icon.png',
                  width: AppDimensions.height10 * 8.202,
                  height: AppDimensions.height10 * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.height10 * 30.7,
                height: AppDimensions.height10 * 3.4,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                child: Text(
                  'Login to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10 * 0.12,
                      fontSize: AppDimensions.height10 * 2.8,
                      //letterSpacing: AppDimensions.height10 * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  //  width: AppDimensions.height10 * 33.2,
                  height: AppDimensions.height10 * 20.1,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.4,
                            height: AppDimensions.height10 * 0.13,
                            fontFamily: 'laila',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF437296),
                          ),
                          children: [
                            TextSpan(text: 'In order to '),
                            TextSpan(
                                text: 'activate your star ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(text: 'and view your\n'),
                            TextSpan(
                                text: 'Dashboard ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    ", you need to create an account or login in.\nYou’ve already completed a big step in setting and\ndefining your vision for better-self.\n\nYou have goal and practice set up. One more step and\nyou can access other tools that are available to you to\nhelp you in your personal growth journey :)\n\nVisit your "),
                            TextSpan(
                                text: 'Dashboard ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'now without losing any\nprogress you’ve made so far.  ')
                          ]))),
              Container(
                width: AppDimensions.height10 * 28.0,
                margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppDimensions.height10 * 13.0,
                      height: AppDimensions.height10 * 5.0,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 5.0),
                          color: Color(0xFFFBFBFB)),
                      child: Center(
                        child: Text(
                          'I’m new here',
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF8C648A),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 13.0,
                      height: AppDimensions.height10 * 5.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 5.0),
                          color: Color(0xFF5A4D73)),
                      child: Center(
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFBFBFB),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
