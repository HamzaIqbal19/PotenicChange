import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReviewWhy.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Widgets/fading2.dart';
import '../HomeScreen/HomeScreen.dart';

class StarReview extends StatefulWidget {
  const StarReview({Key? key}) : super(key: key);

  @override
  State<StarReview> createState() => _StarReviewState();
}

class _StarReviewState extends State<StarReview> {
  Future<List<String>>? _goalNamesFuture;
  var goalName;
  var reason;
  var reason2;
  var reason3;
  var identity;
  var visualize;
  bool Loading = true;

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          Loading = false;
          goalName = response["name"];
          // reason = response["reason"][0]['text'];
          // reason2 = response["reason"][0]['text'];
          // reason3 = response["reason"][0]['text'];
          identity = response["identityStatement"][0]['text'];
          visualize = response["visualizingYourSelf"][0]['text'];
        });
      } else {
        setState(() {
          Loading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        Loading = false;
      });
      print("error");
    });

    // setState(() {
    //   goalName = AdminGoal().getUserGoal();
    // });
    // print('GoalName: $goalName');
  }

  @override
  Widget build(BuildContext context) {
    // GoalReviewBg.webp
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Loading == false
            ? Text(
                "Review goal details",
                style: TextStyle(
                    color: Color(0xFF5B74A6),
                    fontWeight: FontWeight.w600,
                    fontSize: AppDimensions.height10(context) * 2.0),
              )
            : Container(),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: Center(
          // alignment: Alignment.center,
          child: Loading == false
              ? IconButton(
                  icon: Image.asset(
                    'assets/images/Back.webp',
                    width: AppDimensions.height10(context) * 3,
                    height: AppDimensions.height10(context) * 3,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    Navigator.pop(context);

                    // Add code for performing close action
                  },
                )
              : Container(),
        ),
      ),
      body: Stack(
        children: [
          Loading == false
              ? Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/GoalReviewBg.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  color: Colors.white,
                ),
          Loading == false
              ? SingleChildScrollView(
                  reverse: true,
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppDimensions.height10(context) * 9.2,
                      ),
                      Container(
                          width: AppDimensions.height10(context) * 10.4,
                          height: AppDimensions.height10(context) * 11.2,
                          padding: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 1.5,
                              right: AppDimensions.height10(context) * 1.5),
                          child: Image.asset(
                            "assets/images/image3.webp",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        height: AppDimensions.height10(context) * 0.6,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Star Details",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF437296),
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
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.white,
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
                                      height:
                                          AppDimensions.height10(context) * 2.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.7,
                                          width:
                                              AppDimensions.height10(context) *
                                                  30.5,

                                          // color: Colors.blue,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/reviewsearch.webp"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        // SizedBox(width: ),
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.0,
                                          width:
                                              AppDimensions.height10(context) *
                                                  3.0,

                                          // color: Colors.blue,
                                          margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                          ),
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/btnedit.webp"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.5,
                                    ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 2.3,
                                      // width: AppDimensions.height10(context) *
                                      //     23.9,
                                      child: Center(
                                        child: Text(
                                          goalName != null
                                              ? "$goalName"
                                              : "Your Goal Name",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.15,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF5B74A6)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 2.3,
                                    ),
                                    inner_text1('Control my anger'),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 2.0,
                                    ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 2.2,
                                      width: AppDimensions.height10(context) *
                                          23.9,
                                      child: Center(
                                        child: Text(
                                          "Select colour",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF5B74A6)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 1.6,
                                    ),
                                    Container(
                                      height: AppDimensions.height10(context) *
                                          12.6,
                                      width: AppDimensions.height10(context) *
                                          20.1,
                                      // color: Colors.blue,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/selectcolor.webp"),
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
                          height: AppDimensions.height10(context) * 49.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.white,
                                  width: AppDimensions.height10(context) * 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context) * 1.8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppDimensions.height10(context) * 49.5,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              print('hello world');
                                              // AdminGoal().getUserGoal();
                                              print("Admin");
                                            },
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.7,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  30.5,

                                              // color: Colors.blue,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/reviewsearch.webp"),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(width: ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                FadePageRoute2(
                                                  true,
                                                  exitPage: StarReview(),
                                                  enterPage: StarReviewWhy(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.0,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  3.0,

                                              // color: Colors.blue,
                                              margin: EdgeInsets.only(
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    1.5,
                                              ),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/btnedit.webp"),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.5,
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        width: AppDimensions.height10(context) *
                                            24,
                                        child: Center(
                                          child: Text(
                                            "Your reasons ‘Why’",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.12,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF5B74A6)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.3,
                                      ),
                                      inner_text(
                                        'Reason 1',
                                        reason != null
                                            ? '$reason'
                                            : 'I want to achieve this goal to be in control\nof my anger and to regain control of my\nlife.',
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.0,
                                      ),
                                      inner_text(
                                        'Reason 2',
                                        reason2 != null
                                            ? '$reason2'
                                            : 'I want to be closer and respect my wife\nand children.',
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.0,
                                      ),
                                      inner_text(
                                        'Reason 3',
                                        reason3 != null
                                            ? '$reason3'
                                            : 'I don’t want my anger to hold me back\nfrom enjoying life.',
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
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
                          height: AppDimensions.height10(context) * 24.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.white,
                                  width: AppDimensions.height10(context) * 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context) * 1.8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppDimensions.height10(context) * 24,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.7,
                                            width: AppDimensions.height10(
                                                    context) *
                                                30.5,

                                            // color: Colors.blue,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/reviewsearch.webp"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(width: ),
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.0,
                                            width: AppDimensions.height10(
                                                    context) *
                                                3.0,

                                            // color: Colors.blue,
                                            margin: EdgeInsets.only(
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.5,
                                            ),
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/btnedit.webp"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.5,
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        width: AppDimensions.height10(context) *
                                            30.9,
                                        child: Center(
                                          child: Text(
                                            "Your New identity Statement",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.12,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF5B74A6)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.3,
                                      ),
                                      inner_text(
                                          'Statement 1',
                                          identity != null
                                              ? "$identity"
                                              : 'I am someone who is in control of my\nanger'),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.0,
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.6,
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
                          height: AppDimensions.height10(context) * 24.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.white,
                                  width: AppDimensions.height10(context) * 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context) * 1.8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppDimensions.height10(context) * 24,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.7,
                                            width: AppDimensions.height10(
                                                    context) *
                                                30.5,

                                            // color: Colors.blue,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/reviewsearch.webp"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(width: ),
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.0,
                                            width: AppDimensions.height10(
                                                    context) *
                                                3.0,

                                            // color: Colors.blue,
                                            margin: EdgeInsets.only(
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.5,
                                            ),
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/btnedit.webp"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.5,
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        width: AppDimensions.height10(context) *
                                            30.9,
                                        child: Center(
                                          child: Text(
                                            "Your ‘New self’",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.12,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF5B74A6)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                2.3,
                                      ),
                                      inner_text(
                                          'Statement 1',
                                          visualize != null
                                              ? "$visualize"
                                              : "I picture myself talking more calmly to\nmy wife when she has made a mistake. "),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.0,
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.6,
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
                                "assets/images/Moreactions.webp",
                                fit: BoxFit.contain,
                              )),
                          GestureDetector(
                            onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Container(
                                width: AppDimensions.height10(context) * 27.0,
                                height: AppDimensions.height10(context) * 24.6,
                                child: AlertDialog(
                                  actionsPadding: const EdgeInsets.all(0.0),
                                  contentPadding: const EdgeInsets.all(0.0),
                                  titlePadding: const EdgeInsets.all(0.0),
                                  title: Container(
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            1.9,
                                        right: AppDimensions.height10(context) *
                                            1.6,
                                        left: AppDimensions.height10(context) *
                                            1.6,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                0),
                                    height:
                                        AppDimensions.height10(context) * 4.4,
                                    width:
                                        AppDimensions.height10(context) * 23.8,
                                    child: Text.rich(
                                      textAlign: TextAlign.center,
                                      TextSpan(
                                        text: 'Are you sure you want\n to ',
                                        style: TextStyle(
                                          color: const Color(0xFF000000),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.9,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'delete ',
                                              style: TextStyle(
                                                color: const Color(0xFF000000),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.9,
                                                fontWeight: FontWeight.w700,
                                              )),

                                          TextSpan(
                                              text: 'this goal?',
                                              style: TextStyle(
                                                color: const Color(0xFF000000),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
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
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        left: AppDimensions.height10(context) *
                                            1.6,
                                        right: AppDimensions.height10(context) *
                                            1.6,
                                        top: AppDimensions.height10(context) *
                                            0.5),
                                    height:
                                        AppDimensions.height10(context) * 6.8,
                                    width:
                                        AppDimensions.height10(context) * 23.8,
                                    child: Text(
                                      "By clicking 'Yes' you confirm that this\ngoal will be deleted and all your data\nthat relates to this goal won't be\nrecoverable. ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.5,
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
                                              AppDimensions.height10(context) *
                                                  4.4,
                                          width: double.infinity,
                                          color: const Color.fromRGBO(
                                              0, 122, 255, 1),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontFamily: "Laila",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  27.0,
                                          child: TextButton(
                                            onPressed: () {
                                              AdminGoal()
                                                  .deleteUserGoal()
                                                  .then((response) {
                                                if (response == true) {
                                                  print(
                                                      "==================>Successfully deleted");
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomeScreen(
                                                          login: true,
                                                        ),
                                                      ));
                                                } else {
                                                  print('Goal is not deleted');
                                                }
                                              }).catchError((error) {
                                                print("error");
                                              });
                                            },
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
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
                                    colors: [
                                      Color(0xFF464646),
                                      Color(0xFF464646)
                                    ]),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/bin.webp",
                                    height:
                                        AppDimensions.height10(context) * 1.2,
                                    width:
                                        AppDimensions.height10(context) * 1.4,
                                  ),
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 1.4,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            1.3,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.3),
                                    child: Text(
                                      "Delete Goal",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        color: Colors.white,
                                        // height: AppDimensions.height10*0.1,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w700,
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
              : Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
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
              child: Text("Control my anger",
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

class inner_text extends StatefulWidget {
  final String circle_text;
  final String panel_Text;

  inner_text(this.circle_text, this.panel_Text, {super.key});

  @override
  State<inner_text> createState() => _inner_textState();
}

class _inner_textState extends State<inner_text> {
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
      width: AppDimensions.height10(context) * 36.0,
      decoration: BoxDecoration(
          gradient: _focusNode.hasFocus
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)])
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)]),
          // color: Colors.white,

          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.height10(context) * 1.8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: AppDimensions.height10(context) * 32.0,
              padding:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 1.3),
              child: Text("${widget.circle_text}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Laila",
                    color: _focusNode.hasFocus
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFFFFFFFF),
                    fontSize: AppDimensions.height10(context) * 2.2,
                  ))),
          SizedBox(
            height: AppDimensions.height10(context) * 0.9,
          ),
          Container(
              padding: EdgeInsets.only(
                  bottom: AppDimensions.height10(context) * 2.4),
              width: AppDimensions.height10(context) * 32.0,
              child: CupertinoTextField(
                placeholder: widget.panel_Text,
                placeholderStyle: TextStyle(
                    fontSize: AppDimensions.height10(context) * 1.6,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Laila",
                    height: AppDimensions.height10(context) * 0.12,
                    color: const Color(0xFFFFFFFF)),
                controller: body_text,
                focusNode: _focusNode,
                // maxLines: 4,
                minLines: null,
                maxLines: null,
                expands: true,

                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF)),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              )),
        ],
      ),
    );
  }
}
