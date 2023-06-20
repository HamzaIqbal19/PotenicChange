import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations_journey.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../utils/app_dimensions.dart';

class congratulations extends StatefulWidget {
  const congratulations({super.key});

  @override
  State<congratulations> createState() => _congratulationsState();
}

class _congratulationsState extends State<congratulations> {
  int goal_level = 2;
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
                    'assets/images/Close.png',
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
                  )),
            )
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/goal_achieved_bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                if (goal_level >= 5) {
                  Navigator.pop(context);
                  goal_achieved_sheet(context);
                } else {
                  _incrementValue();
                }
              },
              child: Container(
                width: AppDimensions.height10(context) * 35.5,
                //height: AppDimensions.height10(context) * 13.2,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 10.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'laila',
                          height: AppDimensions.height10(context) * 0.14,
                          //have reduced size so it does,nt overflow
                          fontSize: AppDimensions.height10(context) * 2.0,
                          color: const Color(0xFFFFFFFF),
                        ),
                        children: [
                          TextSpan(
                            text: 'Congratulations!\n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              // fontFamily: 'laila',
                              fontSize: AppDimensions.height10(context) * 3.0,
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
              width: AppDimensions.height10(context) * 35.3,
              height: AppDimensions.height10(context) * 38.1,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 3.7),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: AppDimensions.height10(context) * 35.3,
                      height: AppDimensions.height10(context) * 38.1,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/anger_2.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 1.625),
                    child: Container(
                      width: AppDimensions.height10(context) * 23.2,
                      height: AppDimensions.height10(context) * 23.2,
                      //same dimensions as design
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(goal_level == 1
                                  ? 'assets/images/goal_level_1.png'
                                  : goal_level == 2
                                      ? 'assets/images/goal_level_2.png'
                                      : goal_level == 3
                                          ? 'assets/images/goal_level_3.png'
                                          : goal_level == 4
                                              ? 'assets/images/goal_level_4.png'
                                              : 'assets/images/goal_level_5.png'),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Container(
                          width: AppDimensions.height10(context) * 14.655,
                          height: AppDimensions.height10(context) * 14.655,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10(context) * 3.9,
                                height: AppDimensions.height10(context) * 4.7,
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
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.12,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  0.8,
                                          color: const Color(0xFF424242),
                                        ),
                                        children: [
                                          TextSpan(
                                              text: goal_level! < 5
                                                  ? '$goal_level'
                                                  : '5',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.8,
                                              )),
                                          const TextSpan(
                                              text: '/5\n',
                                              style: TextStyle(
                                                  color: Color(0xFF828282))),
                                          const TextSpan(
                                            text: 'LEVEL',
                                          )
                                        ])),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 13.1,
                                height: AppDimensions.height10(context) * 5.1,
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
                                      height: AppDimensions.height10(context) *
                                          0.12,
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
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
                if (goal_level > 3) {
                  Navigator.push(
                    context,
                    FadePageRoute(page: const Congratulations_journey()),
                  );
                }
              },
              child: Container(
                width: AppDimensions.height10(context) * 29.0,
                height: AppDimensions.height10(context) * 5.0,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 7.3),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 5.0)),
                child: SizedBox(
                  width: AppDimensions.height10(context) * 6.9,
                  height: AppDimensions.height10(context) * 2.4,
                  child: Center(
                    child: Text(
                      goal_level > 3 ? 'Yes I am' : 'Exit',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.height10(context) * 1.6,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10(context) * 29.0,
              height: AppDimensions.height10(context) * 5.0,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 1.8),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 5.0)),
              child: SizedBox(
                width: AppDimensions.height10(context) * 23.4,
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
                      fontSize: AppDimensions.height10(context) * 1.6,
                      color: const Color(0xFFFA9934),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10(context) * 17.0,
              height: AppDimensions.height10(context) * 0.5,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                  color: const Color(0xFFFFFFFF).withOpacity(0.3)),
            ),
          ],
        ),
      ),
    );
  }
}

void goal_achieved_sheet(context) {
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
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          int goal_level = 1;
          void _incrementValue() {
            setState(() {
              goal_level++;
            });
          }

          return Container(
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 4.6),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: AppDimensions.height10(context) * 41.4,
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
                      // margin:   EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                      alignment: const Alignment(1, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: AppDimensions.height10(context) * 2.6,
                          height: AppDimensions.height10(context) * 2.6,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.5,
                              right: AppDimensions.height10(context) * 1.5),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Close_blue.png'))),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _incrementValue();
                        print('$goal_level');
                      },
                      child: Container(
                        // width: AppDimensions.height10(context) * 35.5,
                        //  height: AppDimensions.height10(context) * 3.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.5),
                        child: Text(
                          'Goal level has gone down',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 3.0,
                              // letterSpacing: AppDimensions.height10(context) * 0.2,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 32.7,
                      height: AppDimensions.height10(context) * 16.1,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.6),
                      child: Text(
                        'Based on your latest evaluation, your total goal\nscore level has gone down. Don’t despair yet.\nLife is a journey of ups and downs, and working\non yourself is part of the transformation\nprocess. Please review your latest assessment\nand adjust your original ‘why’ reasons if needed.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 26.8,
                      height: AppDimensions.height10(context) * 26.8,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 5.7),
                      child: Stack(
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 26.8,
                            height: AppDimensions.height10(context) * 26.8,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/orange_moon.png'),
                                    fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                Container(
                                  //width: AppDimensions.height10(context) * 17.1,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          7.9),
                                  child: Text(
                                    'Control my anger',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        //  height: AppDimensions.height10(context) * 0.12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                ),
                                Container(
                                  //width: AppDimensions.height10(context) * 20.2,
                                  height: AppDimensions.height10(context) * 4.0,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.3),
                                  child: Text(
                                    '“I am someone who is in\ncontrol of my anger”',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        //  height: AppDimensions.height10(context) * 0.12,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.italic,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 10.5),
                            child: Container(
                              width: AppDimensions.height10(context) * 24.2,
                              height: AppDimensions.height10(context) * 24.2,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(goal_level == 1
                                          ? 'assets/images/goal_level_1.png'
                                          : goal_level == 2
                                              ? 'assets/images/goal_level_2.png'
                                              : goal_level == 3
                                                  ? 'assets/images/goal_level_3.png'
                                                  : goal_level == 4
                                                      ? 'assets/images/goal_level_4.png'
                                                      : 'assets/images/goal_level_5.png'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                child: Container(
                                  width:
                                      AppDimensions.height10(context) * 14.655,
                                  height:
                                      AppDimensions.height10(context) * 14.655,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: AppDimensions.height10(context) *
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
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.8,
                                                  color:
                                                      const Color(0xFF424242),
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: goal_level! < 5
                                                          ? '$goal_level'
                                                          : '5',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: AppDimensions
                                                                .height10(
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
                                      Container(
                                        width: AppDimensions.height10(context) *
                                            13.1,
                                        height:
                                            AppDimensions.height10(context) *
                                                5.1,
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
                                              fontSize: AppDimensions.height10(
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
                        width: AppDimensions.height10(context) * 29.0,
                        height: AppDimensions.height10(context) * 5.0,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 13.1),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 5.0)),
                        child: SizedBox(
                          width: AppDimensions.height10(context) * 6.9,
                          height: AppDimensions.height10(context) * 2.4,
                          child: Center(
                            child: Text(
                              'Exit',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 29.0,
                      height: AppDimensions.height10(context) * 5.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.8,
                          bottom: AppDimensions.height10(context) * 4.3),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0)),
                      child: SizedBox(
                        width: AppDimensions.height10(context) * 23.4,
                        height: AppDimensions.height10(context) * 2.4,
                        child: Center(
                          child: Text(
                            'View goal level evaluation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimensions.height10(context) * 1.6,
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
      });
}
