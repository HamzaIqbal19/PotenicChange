import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReview.dart';
import 'package:potenic_app/Widgets/TimeWidget.dart';
import 'package:potenic_app/Widgets/routinecommitment.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../API/Practice.dart';

class PracticeReview extends StatefulWidget {
  const PracticeReview({Key? key}) : super(key: key);

  @override
  State<PracticeReview> createState() => _PracticeReviewState();
}

class _PracticeReviewState extends State<PracticeReview> {
  Future<List<String>>? _goalNamesFuture;
  var goalName;
  var reminder;
  var starttime;
  var visualize;

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  void _fetchGoalNames() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        setState(() {
          goalName = response[0][0];
          reminder = response[0]["reminder"];
          starttime = response[0]["schedule"][0]['starttime'];
          visualize = response[0]["visualizingYourSelf"][0];
        });
        print("response123:$goalName");
      } else {
        print("response:$response");
      }
    }).catchError((error) {
      print("fuck");
    });

    // setState(() {
    //   goalName = AdminGoal().getUserGoal();
    // });
    // print('GoalName: $goalName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        // title: Text("Review",style: TextStyle(color: Color(0xFF5B74A6),fontWeight: FontWeight.w600,fontSize: AppDimensions.height10(context) *2.0),),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: Center(
          // alignment: Alignment.center,
          child: IconButton(
            icon: Image.asset(
              'assets/images/Back.png',
              width: AppDimensions.height10(context) * 3,
              height: AppDimensions.height10(context) * 3,
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
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/GoalReviewBg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.2),
                  child: Center(
                    child: Text(
                      "Review",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF5B74A6),
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.0,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Control my anger",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF5B74A6),
                        fontSize: AppDimensions.height10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.0,
                            right: AppDimensions.height10(context) * 1.0),
                        width: AppDimensions.height10(context) * 10.4,
                        height: AppDimensions.height10(context) * 11.2,
                        child: Image.asset(
                          "assets/images/createprac.png",
                          fit: BoxFit.contain,
                        )),
                    Container(
                      child: Center(
                        child: Text(
                          "Meditation",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF156F6D),
                            fontSize: AppDimensions.height10(context) * 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.6,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Practice Details",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF437296),
                        fontSize: AppDimensions.height10(context) * 3.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.7,
                ),
                Container(
                  height: AppDimensions.height10(context) * 2.2,
                  width: AppDimensions.height10(context) * 23.9,
                  child: Center(
                    child: Text(
                      "Review your summary here.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF5B74A6)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                ),
                Container(
                    width: AppDimensions.height10(context) * 38.2,
                    height: AppDimensions.height10(context) * 40.6,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFBFBFB),
                        border: Border.all(
                            color: const Color(0xFFFBFBFB),
                            width: AppDimensions.height10(context) * 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(
                            AppDimensions.height10(context) * 1.8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppDimensions.height10(context) * 39.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: AppDimensions.height10(context) * 2.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 3.7,
                                    width:
                                        AppDimensions.height10(context) * 28.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.5),

                                    // color: Colors.blue,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/reviewsearch.png"),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: ),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 3.0,
                                    width:
                                        AppDimensions.height10(context) * 3.0,

                                    // color: Colors.blue,
                                    margin: EdgeInsets.only(
                                      bottom:
                                          AppDimensions.height10(context) * 1.5,
                                    ),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/btnedit.png"),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 0.5,
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.height10(context) * 23.9,
                                child: Center(
                                  child: Text(
                                    "$goalName",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF5B74A6)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 2.3,
                              ),
                              inner_text1('Meditation'),
                              SizedBox(
                                height: AppDimensions.height10(context) * 2.0,
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.height10(context) * 23.9,
                                child: Center(
                                  child: Text(
                                    "Select colour",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF5B74A6)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 1.6,
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 12.6,
                                width: AppDimensions.height10(context) * 20.1,
                                // color: Colors.blue,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/practicecolor.png"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.5,
                ),
                Container(
                    width: AppDimensions.height10(context) * 38.2,
                    height: AppDimensions.height10(context) * 91.3,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFBFBFB),
                        border: Border.all(
                            color: const Color(0xFFFBFBFB),
                            width: AppDimensions.height10(context) * 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(
                            AppDimensions.height10(context) * 1.8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppDimensions.height10(context) * 90.3,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: AppDimensions.height10(context) * 2.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 3.7,
                                      width: AppDimensions.height10(context) *
                                          28.0,
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  2.5),

                                      // color: Colors.blue,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/reviewsearch.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 3.0,
                                      width:
                                          AppDimensions.height10(context) * 3.0,

                                      // color: Colors.blue,
                                      margin: EdgeInsets.only(
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.5,
                                      ),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/btnedit.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 0.5,
                                ),
                                Container(
                                  height: AppDimensions.height10(context) * 2.2,
                                  width: AppDimensions.height10(context) * 23.9,
                                  child: Center(
                                    child: Text(
                                      "Your routine commitment",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  2.0,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B74A6)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 2.9,
                                ),
                                Container(
                                  height: AppDimensions.height10(context) * 0.5,
                                  width: AppDimensions.height10(context) * 6.1,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF437296),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              AppDimensions.height10(context) *
                                                  0.5))),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 1.5,
                                ),
                                Container(
                                  height:
                                      AppDimensions.height10(context) * 89.5,
                                  child: routinecommitment(),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 1.6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.1,
                ),
                Container(
                    width: AppDimensions.height10(context) * 38.2,
                    height: AppDimensions.height10(context) * 29.9,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFBFBFB),
                        border: Border.all(
                            color: const Color(0xFFFBFBFB),
                            width: AppDimensions.height10(context) * 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(
                            AppDimensions.height10(context) * 1.8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppDimensions.height10(context) * 29,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: AppDimensions.height10(context) * 2.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 3.7,
                                      width: AppDimensions.height10(context) *
                                          28.0,
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  2.5),

                                      // color: Colors.blue,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/reviewsearch.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 3.0,
                                      width:
                                          AppDimensions.height10(context) * 3.0,

                                      // color: Colors.blue,
                                      margin: EdgeInsets.only(
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.5,
                                      ),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/btnedit.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 0.5,
                                ),
                                Container(
                                  height: AppDimensions.height10(context) * 2.4,
                                  width: AppDimensions.height10(context) * 38.4,
                                  child: Center(
                                    child: Text(
                                      "Your Reminders",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  2.0,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B74A6)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 2.3,
                                ),
                                Container(
                                  height:
                                      AppDimensions.height10(context) * 17.0,
                                  width: AppDimensions.height10(context) * 36.4,
                                  // padding:  EdgeInsets.only(top: AppDimensions.height10(context)*2, bottom: AppDimensions.height10(context)*4.8, left: AppDimensions.height10(context)*2.0,right: AppDimensions.height10(context)*3.5),
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFFE8776D),
                                            Color(0xFFEF939D),
                                            Color(0xFFD6C4C6)
                                          ]),
                                      border: Border.all(
                                          color: Colors.white, width: 0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              AppDimensions.height10(context) *
                                                  2.0))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // color: Colors.blue,
                                            width: AppDimensions.height10(
                                                    context) *
                                                25.9,
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.6,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                    width: AppDimensions
                                                            .height10(context) *
                                                        3.5,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            3.5,
                                                    child: Image.asset(
                                                      "assets/images/notifications.png",
                                                      fit: BoxFit.contain,
                                                    )),
                                                Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      20.4,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  child: Text(
                                                    "Yes, remind me",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Laila",
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                                // color: Colors.red,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    3.3,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.3,
                                                child: Image.asset(
                                                    "assets/images/uncheckradio.png")),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                3.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                5.1,
                                            width: AppDimensions.height10(
                                                    context) *
                                                34.5,
                                            padding: EdgeInsets.only(
                                                right: AppDimensions.height10(
                                                        context) *
                                                    2.0,
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.7),
                                            child: Text(
                                              "We will check in with you to remind you about your practices. You would be able to customise your notifications later in your Account Settings. ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Laila-Regular",
                                                color: const Color(0xFFFFFFFF),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.4,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 7.2,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 5.0,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        // color: Colors.blue,
                        width: AppDimensions.height10(context) * 5.0,
                        height: AppDimensions.height10(context) * 5.0,
                        child: Image.asset(
                          "assets/images/Moreactions.png",
                          fit: BoxFit.contain,
                        )),
                    GestureDetector(
                      onTap: () => showAnimatedDialog(
                        animationType: DialogTransitionType.fadeScale,
                        curve: Curves.easeInOut,
                        duration: Duration(seconds: 1),
                        context: context,
                        builder: (BuildContext context) => Container(
                          width: AppDimensions.height10(context) * 27.0,
                          height: AppDimensions.height10(context) * 24.6,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 1.4)),
                            actionsPadding: const EdgeInsets.all(0.0),
                            contentPadding: const EdgeInsets.all(0.0),
                            titlePadding: const EdgeInsets.all(0.0),
                            title: Container(
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.9,
                                  right: AppDimensions.height10(context) * 1.6,
                                  left: AppDimensions.height10(context) * 1.6,
                                  bottom: AppDimensions.height10(context) * 0),
                              width: AppDimensions.height10(context) * 23.8,
                              child: Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  text: 'Are you sure you want\n to ',
                                  style: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.9,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'delete ',
                                        style: TextStyle(
                                          color: const Color(0xFF000000),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.9,
                                          fontWeight: FontWeight.w700,
                                        )),

                                    TextSpan(
                                        text: 'this goal?',
                                        style: TextStyle(
                                          color: const Color(0xFF000000),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.9,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    // can add more TextSpans here...

                                    // can add more TextSpans here...

                                    // can add more TextSpans here...
                                  ],
                                ),
                              ),
                            ),
                            content: Container(
                              // color:Colors.red,
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10(context) * 1.9,
                                  left: AppDimensions.height10(context) * 1.6,
                                  right: AppDimensions.height10(context) * 1.6,
                                  top: AppDimensions.height10(context) * 0.5),

                              width: AppDimensions.height10(context) * 23.8,
                              child: Text(
                                "By clicking 'Yes' you confirm that this\ngoal will be deleted and all your data\nthat relates to this goal won't be\nrecoverable. ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.5,
                                  fontFamily: "Laila",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              Column(
                                children: [
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 4.4,
                                    width: double.infinity,
                                    color: const Color.fromRGBO(0, 122, 255, 1),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 4.4,
                                    width:
                                        AppDimensions.height10(context) * 27.0,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontFamily: "Laila",
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              0, 122, 255, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.height10(context) * 31.3,
                        decoration: BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(color: Colors.transparent),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF464646), Color(0xFF464646)]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/bin.png",
                              height: AppDimensions.height10(context) * 1.8,
                              width: AppDimensions.height10(context) * 1.4,
                            ),
                            SizedBox(
                              width: AppDimensions.height10(context) * 1.3,
                            ),
                            Container(
                              child: Text(
                                "Delete Practice",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.5,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class inner_text1 extends StatefulWidget {
  final String circle_text;

  inner_text1(this.circle_text, {super.key});

  @override
  State<inner_text1> createState() => _inner_text1State();
}

class _inner_text1State extends State<inner_text1> {
  final TextEditingController body_text = TextEditingController();

  final TextEditingController heading_text = TextEditingController();

  late FocusNode _focusNode;

  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocus);
  }

  void _onFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10(context) * 8.9,
      width: AppDimensions.height10(context) * 36.0,
      padding: EdgeInsets.only(
          top: AppDimensions.height10(context) * 2,
          bottom: 1,
          left: AppDimensions.height10(context),
          right: AppDimensions.height10(context) * 6.0),
      decoration: BoxDecoration(
          gradient: _focusNode.hasFocus
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEFBEB2), Color(0xFFFEAA897)])
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEECDC5), Color(0xFFF6E0DB)]),
          // color: Colors.white,

          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.height10(context) * 1.8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: AppDimensions.height10(context) * 3.6,
              width: AppDimensions.height10(context) * 26.9,
              child: Text("${widget.circle_text}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: _focusNode.hasFocus
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFFFFFFFF),
                    fontSize: AppDimensions.height10(context) * 2.2,
                  ))),
        ],
      ),
    );
  }
}
