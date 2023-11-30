import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations_journey.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../utils/app_dimensions.dart';

class congratulations extends StatefulWidget {
  const congratulations({super.key});

  @override
  State<congratulations> createState() => _congratulationsState();
}

class _congratulationsState extends State<congratulations> {
  int goal_level = 0;
  var goalName;

  var identity;
  var color;
  bool Loading = true;

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          Loading = false;
          goalName = response["name"];
          color = response["color"];
          identity = response["identityStatement"][0]['text'];
          goal_level = response["goalLevel"];
          ;
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
  }

  void _incrementValue() {
    setState(() {
      goal_level++;
    });
  }

  void _decrementValue() {
    setState(() {
      goal_level--;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'assets/images/Close.webp',
                     // width: AppDimensions.width10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.6,
                      fit: BoxFit.contain,
                    )),
              )
            ]),
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/goal_achieved_bg.webp'),
                  fit: BoxFit.cover)),
          child: Loading == false
              ? Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // goal_achieved_sheet(
                        //     context, goal_level, goalName, identity, "$color");
                        _incrementValue();
                      },
                      child: Container(
                        width: AppDimensions.width10(context) * 35.5,
                        //height: AppDimensions.height10(context) * 13.2,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 10.0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'laila',
                                  height:
                                      AppDimensions.height10(context) * 0.14,
                                  //have reduced size so it does,nt overflow
                                  fontSize: AppDimensions.font10(context) * 2.0,
                                  color: const Color(0xFFFFFFFF),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Congratulations!\n\n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      // fontFamily: 'laila',
                                      fontSize:
                                          AppDimensions.font10(context) * 3.0,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  TextSpan(
                                      text: goal_level == 5
                                          ? '\nYou are living your goal and your\ndesired identity :)'
                                          : 'You’ve gone up a level, it’s another\nstep towards living your goal and\nyour desired identity.',
                                      style: const TextStyle(
                                          //height: AppDimensions.height10(context) * 0.14,
                                          ))
                                ])),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 26.8,
                      height: AppDimensions.height10(context) * 26.8,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 12.7),
                      child: Stack(
                        children: [
                          AnimatedScaleButton(
                            onTap: () {},
                            child: Container(
                              width: AppDimensions.width10(context) * 26.8,
                              height: AppDimensions.height10(context) * 26.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('$color' == '1'
                                        ? "assets/images/red_gradient.webp"
                                        : '$color' == '2'
                                            ? 'assets/images/orange_moon.webp'
                                            : '$color' == '3'
                                                ? "assets/images/lightGrey_gradient.webp"
                                                : '$color' == '4'
                                                    ? "assets/images/lightBlue_gradient.webp"
                                                    : '$color' == '5'
                                                        ? "assets/images/medBlue_gradient.webp"
                                                        : '$color' == '6'
                                                            ? "assets/images/Blue_gradient.webp"
                                                            : 'assets/images/orange_moon.webp'),
                                    fit: BoxFit.contain),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // color: Colors.red,
                                    height:
                                        AppDimensions.height10(context) * 9.0,
                                    width:
                                        AppDimensions.width10(context) * 24.0,
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppDimensions.height10(context) *
                                                2.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          goalName,
                                          // "Control my anger",

                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  2.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.14,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff5B74A6)),
                                        ),
                                        SizedBox(
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.7,
                                        ),
                                        SizedBox(
                                          // color: Colors.green,
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.0,
                                          width:
                                              AppDimensions.width10(context) *
                                                  22.0,
                                          child: Text('"$identity"',
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff5B74A6))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 4.3,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 6),
                            child: Container(
                              width: AppDimensions.width10(context) * 23.2,
                              height: AppDimensions.height10(context) * 23.2,
                              //same dimensions as design
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(goal_level == 1
                                          ? 'assets/images/goal_level_1.webp'
                                          : goal_level == 2
                                              ? 'assets/images/goal_level_2.webp'
                                              : goal_level == 3
                                                  ? 'assets/images/goal_level_3.webp'
                                                  : goal_level == 4
                                                      ? 'assets/images/goal_level_4.webp'
                                                      : 'assets/images/goal_level_5.webp'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                child: SizedBox(
                                  width:
                                      AppDimensions.height10(context) * 14.655,
                                  height:
                                      AppDimensions.height10(context) * 14.655,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            3.9,
                                        height:
                                            AppDimensions.height10(context) *
                                                4.7,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                1.728),
                                        //color: Colors.amber,
                                        alignment: Alignment.bottomCenter,
                                        child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                                style: TextStyle(
                                                  fontFamily: 'laila',
                                                  fontWeight: FontWeight.w500,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.12,
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          0.8,
                                                  color:
                                                      const Color(0xFF424242),
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: goal_level == 0
                                                          ? '-'
                                                          : goal_level < 5
                                                              ? '$goal_level'
                                                              : '5',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            2.8,
                                                      )),
                                                  const TextSpan(
                                                      text: '/5\n',
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF828282))),
                                                  const TextSpan(
                                                    text: 'LEVEL',
                                                  )
                                                ])),
                                      ),
                                      SizedBox(
                                        width: AppDimensions.width10(context) *
                                            13.1,
                                        height:
                                            AppDimensions.height10(context) *
                                                5.1,
                                        child: Center(
                                          child: Text(
                                            goal_level == 1
                                                ? "I'm making\nconsiderable steps\nforward"
                                                : goal_level == 2
                                                    ? "I'm making\nconsiderable steps\nforward"
                                                    : goal_level == 3
                                                        ? "I'm almost there"
                                                        : goal_level == 4
                                                            ? 'I feel like I’m living\nmy goal and desired\nidentity '
                                                            : "I've achieved my\ngoal and living my\nnew identity :)",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.12,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              color: const Color(0xFF000000),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        if (goal_level > 3) {
                          Navigator.push(
                            context,
                            FadePageRoute(
                                page: const Congratulations_journey()),
                          );
                        }
                      },
                      child: Container(
                        width: AppDimensions.width10(context) * 29.0,
                        height: AppDimensions.height10(context) * 5.0,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 10.3),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 5.0)),
                        child: SizedBox(
                          width: AppDimensions.width10(context) * 6.9,
                          height: AppDimensions.height10(context) * 2.4,
                          child: Center(
                            child: Text(
                              goal_level > 3 ? 'Yes I am' : 'Exit',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: AppDimensions.font10(context) * 1.6,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 29.0,
                      height: AppDimensions.height10(context) * 5.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.8),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0)),
                      child: SizedBox(
                        width: AppDimensions.width10(context) * 23.4,
                        height: AppDimensions.height10(context) * 2.4,
                        child: Center(
                          child: Text(
                            goal_level < 4
                                ? 'View goal level evaluation'
                                : 'No I’m not, review evaluation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              height: AppDimensions.height10(context) * 0.15,
                              fontSize: AppDimensions.font10(context) * 1.6,
                              color: const Color(0xFFFA9934),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 17.0,
                      height: AppDimensions.height10(context) * 0.5,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                    ),
                  ],
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ));
  }
}

void goal_achieved_sheet(
    context, int goal_level, String goalName, String identity, String color) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.height10(context) * 2.0),
      )),
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(top: AppDimensions.height10(context) * 4.6),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: AppDimensions.width10(context) * 41.4,
              //  height: AppDimensions.height10(context) * 87.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          AppDimensions.height10(context) * 2.0)),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFE7DEDF), Color(0xFFF9F7F9)])),
              child: Column(
                children: [
                  Container(
                    //color: Colors.amber,
                    // margin:   EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                    alignment: const Alignment(1, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensions.width10(context) * 2.6,
                        height: AppDimensions.height10(context) * 2.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.5,
                            right: AppDimensions.width10(context) * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Close_blue.webp'))),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 0.5),
                      child: Text(
                        'Goal level has gone down',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 3.0,
                            // letterSpacing: AppDimensions.height10(context) * 0.2,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 32.7,
                    height: AppDimensions.height10(context) * 16.1,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.6),
                    child: Text(
                      'Based on your latest evaluation, your total goal\nscore level has gone down. Don’t despair yet.\nLife is a journey of ups and downs, and working\non yourself is part of the transformation\nprocess. Please review your latest assessment\nand adjust your original ‘why’ reasons if needed.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 1.6,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 26.8,
                    height: AppDimensions.height10(context) * 26.8,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 5.7),
                    child: Stack(
                      children: [
                        Container(
                          width: AppDimensions.width10(context) * 26.8,
                          height: AppDimensions.height10(context) * 26.8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(color == '1'
                                    ? "assets/images/red_gradient.webp"
                                    : color == '2'
                                        ? 'assets/images/orange_moon.webp'
                                        : color == '3'
                                            ? "assets/images/lightGrey_gradient.webp"
                                            : color == '4'
                                                ? "assets/images/lightBlue_gradient.webp"
                                                : color == '5'
                                                    ? "assets/images/medBlue_gradient.webp"
                                                    : color == '6'
                                                        ? "assets/images/Blue_gradient.webp"
                                                        : 'assets/images/orange_moon.webp'),
                                fit: BoxFit.contain),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // color: Colors.red,
                                height: AppDimensions.height10(context) * 9.0,
                                width: AppDimensions.width10(context) * 24.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensions.height10(context) * 2.0),
                                child: Column(
                                  children: [
                                    Text(
                                      goalName,
                                      // "Control my anger",

                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  2.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff5B74A6)),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.7,
                                    ),
                                    SizedBox(
                                      // color: Colors.green,
                                      height:
                                          AppDimensions.height10(context) * 4.0,
                                      width:
                                          AppDimensions.width10(context) * 22.0,
                                      child: Text('"$identity"',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff5B74A6))),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 4.3,
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 10.5),
                          child: Container(
                            width: AppDimensions.width10(context) * 24.2,
                            height: AppDimensions.height10(context) * 24.2,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(goal_level == 1
                                        ? 'assets/images/goal_level_1.webp'
                                        : goal_level == 2
                                            ? 'assets/images/goal_level_2.webp'
                                            : goal_level == 3
                                                ? 'assets/images/goal_level_3.webp'
                                                : goal_level == 4
                                                    ? 'assets/images/goal_level_4.webp'
                                                    : 'assets/images/goal_level_5.webp'),
                                    fit: BoxFit.cover)),
                            child: Center(
                              child: SizedBox(
                                width: AppDimensions.width10(context) * 14.655,
                                height:
                                    AppDimensions.height10(context) * 14.655,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 3.9,
                                      height:
                                          AppDimensions.height10(context) * 4.7,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.728),
                                      //color: Colors.amber,
                                      alignment: Alignment.bottomCenter,
                                      child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              style: TextStyle(
                                                fontFamily: 'laila',
                                                fontWeight: FontWeight.w500,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.12,
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    0.8,
                                                color: const Color(0xFF424242),
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: goal_level < 5
                                                        ? '$goal_level'
                                                        : '5',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              2.8,
                                                    )),
                                                const TextSpan(
                                                    text: '/5\n',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF828282))),
                                                const TextSpan(
                                                  text: 'LEVEL',
                                                )
                                              ])),
                                    ),
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 13.1,
                                      height:
                                          AppDimensions.height10(context) * 5.1,
                                      child: Center(
                                        child: Text(
                                          // goal_level == 2
                                          //     ? 'I feel like I’m living\nmy goal and desired\nidentity':
                                          "I am making small\nsteps towards my\ngoal",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'laila',
                                            fontWeight: FontWeight.w400,
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.12,
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.4,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // if (goal_level > 3) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const Congratulations_journey()),
                      //   );
                      // }
                    },
                    child: Container(
                      width: AppDimensions.width10(context) * 29.0,
                      height: AppDimensions.height10(context) * 5.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 13.1),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0)),
                      child: SizedBox(
                        width: AppDimensions.width10(context) * 6.9,
                        height: AppDimensions.height10(context) * 2.4,
                        child: Center(
                          child: Text(
                            'Exit',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimensions.font10(context) * 1.6,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 29.0,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.8,
                        bottom: AppDimensions.height10(context) * 4.3),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 5.0)),
                    child: SizedBox(
                      width: AppDimensions.width10(context) * 23.4,
                      height: AppDimensions.height10(context) * 2.4,
                      child: Center(
                        child: Text(
                          'View goal level evaluation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: AppDimensions.font10(context) * 1.6,
                            color: const Color(0xFFFA9934),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
