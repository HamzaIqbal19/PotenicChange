import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations_journey.dart';

import '../../utils/app_dimensions.dart';

class congratulations extends StatefulWidget {
  const congratulations({super.key});

  @override
  State<congratulations> createState() => _congratulationsState();
}

class _congratulationsState extends State<congratulations> {
  @override
  Widget build(BuildContext context) {
    int goal_level = 4;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
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
                // goal_level++;
              },
              child: Container(
                width: AppDimensions.height10 * 35.5,
                height: AppDimensions.height10 * 13.2,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 10.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'laila',
                          height: AppDimensions.height10 * 0.12,
                          //have reduced size so it does,nt overflow
                          fontSize: AppDimensions.height10 * 2.0,
                          color: const Color(0xFFFFFFFF),
                        ),
                        children: [
                          TextSpan(
                            text: 'Congratulations!\n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              // fontFamily: 'laila',
                              fontSize: AppDimensions.height10 * 3.0,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  'You’ve gone up a level, it’s another\nstep towards living your goal and\nyour desired identity.')
                        ])),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 35.3,
              height: AppDimensions.height10 * 38.1,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 3.7),
              child: Stack(
                children: [
                  Container(
                    width: AppDimensions.height10 * 35.3,
                    height: AppDimensions.height10 * 38.1,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/anger_2.png'),
                            fit: BoxFit.cover)),
                  ),
                  Align(
                    alignment: const Alignment(0, 1.2),
                    child: Container(
                      width: AppDimensions.height10 * 21.2,
                      height: AppDimensions.height10 * 21.2,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(goal_level == 2
                                  ? 'assets/images/goal_level_2.png'
                                  : 'assets/images/goal_level_3.png'),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Container(
                          width: AppDimensions.height10 * 14.655,
                          height: AppDimensions.height10 * 14.655,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 3.9,
                                height: AppDimensions.height10 * 4.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.728),
                                //color: Colors.amber,
                                alignment: Alignment.bottomCenter,
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'laila',
                                          fontWeight: FontWeight.w500,
                                          height: AppDimensions.height10 * 0.12,
                                          fontSize:
                                              AppDimensions.height10 * 0.8,
                                          color: Color(0xFF424242),
                                        ),
                                        children: [
                                          TextSpan(
                                              text: '$goal_level',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        2.8,
                                              )),
                                          TextSpan(
                                              text: '/5\n',
                                              style: TextStyle(
                                                  color: Color(0xFF828282))),
                                          TextSpan(
                                            text: 'LEVEL',
                                          )
                                        ])),
                              ),
                              Container(
                                width: AppDimensions.height10 * 13.1,
                                height: AppDimensions.height10 * 5.1,
                                child: Center(
                                  child: Text(
                                    goal_level == 2
                                        ? 'I feel like I’m living\nmy goal and desired\nidentity'
                                        : "I'm almost there",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'laila',
                                      fontWeight: FontWeight.w400,
                                      height: AppDimensions.height10 * 0.12,
                                      fontSize: AppDimensions.height10 * 1.4,
                                      color: Color(0xFF000000),
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
                    MaterialPageRoute(
                        builder: (context) => Congratulations_journey()),
                  );
                }
              },
              child: Container(
                width: AppDimensions.height10 * 29.0,
                height: AppDimensions.height10 * 5.0,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 7.3),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 5.0)),
                child: SizedBox(
                  width: AppDimensions.height10 * 6.9,
                  height: AppDimensions.height10 * 2.4,
                  child: Center(
                    child: Text(
                      goal_level > 3 ? 'Yes I am' : 'Exit',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        fontSize: AppDimensions.height10 * 1.6,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 29.0,
              height: AppDimensions.height10 * 5.0,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 1.8),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 5.0)),
              child: SizedBox(
                width: AppDimensions.height10 * 23.4,
                height: AppDimensions.height10 * 2.4,
                child: Center(
                  child: Text(
                    goal_level < 4
                        ? 'View goal level evaluation'
                        : 'No I’m not, review evaluation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: AppDimensions.height10 * 1.6,
                      color: const Color(0xFFFA9934),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 17.0,
              height: AppDimensions.height10 * 0.5,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 4.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 2.0),
                  color: const Color(0xFFFFFFFF).withOpacity(0.3)),
            ),
          ],
        ),
      ),
    );
  }
}
