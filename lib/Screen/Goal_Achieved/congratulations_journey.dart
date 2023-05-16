import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class Congratulations_journey extends StatefulWidget {
  const Congratulations_journey({super.key});

  @override
  State<Congratulations_journey> createState() =>
      _Congratulations_journeyState();
}

class _Congratulations_journeyState extends State<Congratulations_journey> {
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
                image:
                    AssetImage('assets/images/Background Congratulations.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 85.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_0.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 32.7,
                      height: AppDimensions.height10 * 37.7,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 29.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 24.7,
                            height: AppDimensions.height10 * 7.2,
                            //color: Colors.amber,
                            child: Text(
                              'Your journey\nwith us',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // letterSpacing: AppDimensions.height10 * 0.2,
                                fontSize: AppDimensions.height10 * 3.0,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFFBFBFB),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 32.7,
                            height: AppDimensions.height10 * 14.6,
                            //color: Colors.amber,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 4.8),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'We’ve put together your\npersonal development\njourney for you.\nTake a look...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  letterSpacing: AppDimensions.height10 * 0.2,
                                  height: AppDimensions.height10 * 0.15,
                                  fontSize: AppDimensions.height10 * 2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFBFBFB),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 19.1,
                            height: AppDimensions.height10 * 2.2,
                            //  color: Colors.amber,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 2.6),
                            child: Center(
                              child: Text(
                                'When did it start?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.0,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFBFBFB),
                                    height: AppDimensions.height10 * 0.12),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 2.0),
                            child: Image.asset(
                              'assets/images/Arrow.png',
                              width: AppDimensions.height10 * 4.3,
                              height: AppDimensions.height10 * 4.3,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: AppDimensions.height10 * 26.7,
              // ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 85.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_1.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 34.7,
                    height: AppDimensions.height10 * 10.8,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 4.7),
                    child: Center(
                      child: Text(
                        'You started your\ngoal with\nus on...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: AppDimensions.height10 * 0.2,
                            fontSize: AppDimensions.height10 * 3.0,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 4.9,
                  ),
                  Container(
                    width: AppDimensions.height10 * 16.9,
                    height: AppDimensions.height10 * 14.4,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // width: AppDimensions.height10 * 5.7,
                          height: AppDimensions.height10 * 14.4,
                          child: Center(
                            child: Text(
                              '11',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 9.6,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -6,
                                  fontFamily: 'Poppins',
                                  color: const Color(0xFFFBFBFB),
                                  height: AppDimensions.height10 * 0.12),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 7.0,
                          height: AppDimensions.height10 * 8.4,

                          // margin: EdgeInsets.only(
                          //     top: AppDimensions.height10 * 4.0),

                          child: Center(
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.0,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Poppins',
                                        color: const Color(0xFFFBFBFB),
                                        height: AppDimensions.height10 * 0.12),
                                    children: [
                                  const TextSpan(
                                      text: 'Jun\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  const TextSpan(text: '2020')
                                ])),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 26.8,
                    height: AppDimensions.height10 * 26.8,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.1),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/anger_3.png'))),
                  ),
                  Container(
                    width: AppDimensions.height10 * 24.0,
                    height: AppDimensions.height10 * 2.2,
                    //  color: Colors.amber,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 9.8),
                    child: Center(
                      child: Text(
                        'Practices created',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 3.2),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 2.9,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: const Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 89.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_2.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 34.7,
                    height: AppDimensions.height10 * 14.8,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 9.0),
                    child: Text(
                      'You implemented new\nbehaviour practices to\nreach your goal...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          letterSpacing: AppDimensions.height10 * 0.2,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.15),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 32.9,
                    height: AppDimensions.height10 * 36.0,
                    child: Stack(children: [
                      Align(
                        alignment: const Alignment(0, -1),
                        child: SizedBox(
                            width: AppDimensions.height10 * 5.7,
                            height: AppDimensions.height10 * 14.4,
                            child: Center(
                              child: Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: AppDimensions.height10 * 9.6,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xFFFBFBFB),
                                      height: AppDimensions.height10 * 0.12)),
                            )),
                      ),
                      Align(
                        alignment: const Alignment(0.175, 1),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.8,
                            width: AppDimensions.height10 * 13.8,
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
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(1, 0.03),
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
                        alignment: const Alignment(-1, 0.3),
                        child: GestureDetector(
                          onTap: () {},
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
                    ]),
                  ),
                  Container(
                    width: AppDimensions.height10 * 15.0,
                    height: AppDimensions.height10 * 2.242,
                    //  color: Colors.amber,
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 15.695),
                    child: Center(
                      child: Text(
                        'Hurdles faced',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 3.354),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 2.9,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: const Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                // width: AppDimensions.height10 * 41.5,
                height: AppDimensions.height10 * 89.5,

                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_1.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 34.7,
                    height: AppDimensions.height10 * 14.4,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 2.8,
                        bottom: AppDimensions.height10 * 7.3),
                    child: Text(
                      'You faced and\nrecorded these\nhurdles to reach your goal...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: AppDimensions.height10 * 0.2,
                          fontSize: AppDimensions.height10 * 3.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.15),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 38.9,
                    height: AppDimensions.height10 * 34.9,
                    //  color: Colors.grey,
                    child: Stack(children: [
                      Align(
                        alignment: const Alignment(0, -1),
                        child: SizedBox(
                            width: AppDimensions.height10 * 5.7,
                            height: AppDimensions.height10 * 14.4,
                            child: Center(
                              child: Text('4',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: AppDimensions.height10 * 9.6,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xFFFBFBFB),
                                      height: AppDimensions.height10 * 0.12)),
                            )),
                      ),
                      Align(
                        alignment: const Alignment(-0.6, 1),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.245,
                            width: AppDimensions.height10 * 13.23,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'),
                                    fit: BoxFit.contain)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  //height: AppDimensions.height10 * 1.9,
                                  child: Center(
                                    child: Text(
                                      'People',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 7.471,
                                  // height: AppDimensions.height10 * 4.38,

                                  child: Text(
                                    'Children',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.425, 0.8),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.245,
                            width: AppDimensions.height10 * 13.23,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'),
                                    fit: BoxFit.contain)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  //height: AppDimensions.height10 * 1.9,
                                  child: Center(
                                    child: Text(
                                      'EVENT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 7.471,
                                  // height: AppDimensions.height10 * 4.38,

                                  child: Text(
                                    'Work',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(1, -0.25),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.245,
                            width: AppDimensions.height10 * 13.23,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'),
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  //height: AppDimensions.height10 * 1.9,
                                  child: Center(
                                    child: Text(
                                      'Mood',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 7.471,
                                  // height: AppDimensions.height10 * 4.38,

                                  child: Text(
                                    'Tiredness',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(-1, -0.175),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.245,
                            width: AppDimensions.height10 * 13.23,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'),
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  //height: AppDimensions.height10 * 1.9,
                                  child: Center(
                                    child: Text(
                                      'Husband',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10 * 1.2,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 7.9,
                                  height: AppDimensions.height10 * 4.0,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 0.4),
                                  child: Text(
                                    'Makes a\nmistake',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        height: AppDimensions.height10 * 0.12,
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    width: AppDimensions.height10 * 22.7,
                    height: AppDimensions.height10 * 2.242,
                    //  color: Colors.amber,
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 15.695),
                    child: Center(
                      child: Text(
                        'Your inspirations',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 2.6),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 3.1,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: const Color(0xFF0000000),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 2,
                  ),
                ]),
              ),
              Container(
                // width: AppDimensions.height10 * 41.5,
                height: AppDimensions.height10 * 89.5,

                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_2.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 35.5,
                    height: AppDimensions.height10 * 21.6,
                    margin:
                        EdgeInsets.only(bottom: AppDimensions.height10 * 8.5),
                    child: Text(
                      'This is your\ninspirational board\nthat you created to\nboost your motivation\nto reach your desired\ngoal...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          letterSpacing: AppDimensions.height10 * 0.2,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.15),
                    ),
                  ),
                  SizedBox(
                      width: AppDimensions.height10 * 5.7,
                      height: AppDimensions.height10 * 14.4,
                      child: Center(
                        child: Text('4',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: AppDimensions.height10 * 9.6,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFFFBFBFB),
                                height: AppDimensions.height10 * 0.12)),
                      )),
                  Container(
                    width: double.infinity,
                    height: AppDimensions.height10 * 22.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Container(
                          width: AppDimensions.height10 * 18.0,
                          height: AppDimensions.height10 * 22.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.5),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Video_Subtract.png'))),
                          margin:
                              EdgeInsets.only(left: AppDimensions.height10 * 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 8.253,
                                height: AppDimensions.height10 * 8.253,
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 0.68),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/video_image.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                width: AppDimensions.height10 * 10.5,
                                height: AppDimensions.height10 * 4.0,
                                // margin: EdgeInsets.only(
                                //     bottom: AppDimensions.height10 * 1.0),
                                child: Text(
                                  'Music Eye Of\nThe Tiger ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: AppDimensions.height10 * 1.5,
                                      height: AppDimensions.height10 * 0.12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 3.8,
                                child: Divider(
                                  thickness: AppDimensions.height10 * 0.1,
                                  height: AppDimensions.height10 * 0.1,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 6.3,
                                height: AppDimensions.height10 * 1.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.0),
                                child: Text(
                                  'Survivors',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: AppDimensions.height10 * 1.4,
                                      height: AppDimensions.height10 * 0.12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 18.0,
                          height: AppDimensions.height10 * 22.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.5),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Rectangle 10.png'),
                                  fit: BoxFit.cover)),
                          margin:
                              EdgeInsets.only(left: AppDimensions.height10 * 1),
                        ),
                        Container(
                          width: AppDimensions.height10 * 18.0,
                          height: AppDimensions.height10 * 22.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.5),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Image_Subtract.png'))),
                          margin:
                              EdgeInsets.only(left: AppDimensions.height10 * 1),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 6.75,
                                height: AppDimensions.height10 * 6.687,
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 1.49,
                                    top: AppDimensions.height10 * 2.736),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/link_image.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                width: AppDimensions.height10 * 15.7,
                                height: AppDimensions.height10 * 5.41,
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 1.418),
                                child: Center(
                                  child: Text(
                                    'Finding clarity\nand peace through\nthe storm ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: AppDimensions.height10 * 1.4,
                                        height: AppDimensions.height10 * 0.12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 15.0,
                                height: AppDimensions.height10 * 3.4,
                                child: Center(
                                  child: Text(
                                    'www.angermanagment\ncom',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: AppDimensions.height10 * 1.1,
                                        height: AppDimensions.height10 * 0.12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 18.0,
                          height: AppDimensions.height10 * 22.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.5),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Video_Subtract.png'))),
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 1,
                              right: AppDimensions.height10 * 1),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Lorem ipsum dolor sit\namet, consectetur\nadipiscing elit.\nAenean quis aliquam\nligula, sit amet viverra\nnibh. Quisque finibus\nvolutpat dapibus.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: AppDimensions.height10 * 1.4,
                                    height: AppDimensions.height10 * 0.15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 25.8,
                    height: AppDimensions.height10 * 2.2,
                    //  color: Colors.amber,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 6.5),
                    child: Center(
                      child: Text(
                        'Practice sessions recorded',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 3.2),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 2.9,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: const Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 89.6,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_1.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 35.5,
                    height: AppDimensions.height10 * 7.2,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 4.5),
                    child: Text(
                      'Your effort\nsince joining us ...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          letterSpacing: AppDimensions.height10 * 0.2,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.15),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 13.315,
                    height: AppDimensions.height10 * 14.0,
                    //    margin: EdgeInsets.only(top: AppDimensions.height10 * 8.5),
                    child: Center(
                      child: Text(
                        '87',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 9.6,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0,
                            fontFamily: 'Poppins',
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 38.8,
                    height: AppDimensions.height10 * 3.6,

                    //color: Colors.amber,
                    child: Center(
                      child: Text(
                        'Active Days',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 3.0,
                            fontWeight: FontWeight.w700,
                            letterSpacing: AppDimensions.height10 * 0,
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        height: AppDimensions.height10 * 40.0,
                        width: AppDimensions.height10 * 60.0,
                        padding: EdgeInsets.all(AppDimensions.height10 * 0.5),
                        // color: Colors.transparent,
                        child: RandomContainers()),
                  ),
                  Container(
                    width: AppDimensions.height10 * 16.784,
                    height: AppDimensions.height10 * 4.4,
                    //  color: Colors.amber,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 3.9),
                    child: Center(
                      child: Text(
                        'And now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 2.1),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 5.1,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: const Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 89.6,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_2.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 38.826,
                    height: AppDimensions.height10 * 10.8,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 31.0),
                    //REMOVED 20PX SPACE FROM DESIGN
                    child: Text(
                      'You have\nachieved your desired\nlevel!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          letterSpacing: AppDimensions.height10 * 0.2,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.15),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 16.784,
                    height: AppDimensions.height10 * 2.242,
                    //  color: Colors.amber,
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 32.304),
                    child: Center(
                      child: Text(
                        'Well done!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.8,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 3.354),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 5.5,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: const Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 89.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_1.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 36.7,
                    height: AppDimensions.height10 * 18.2,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 11.4),
                    child: Text(
                      'Congratulations!\nYou are living your goal\nand desired identity :)\n\nIt’s time to celebrate!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          letterSpacing: AppDimensions.height10 * 0.2,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.16),
                    ),
                  ),
                  SizedBox(
                    width: AppDimensions.height10 * 35.3,
                    height: AppDimensions.height10 * 38.1,
                    child: Stack(children: [
                      Container(
                        width: AppDimensions.height10 * 35.3,
                        height: AppDimensions.height10 * 38.1,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 5.3),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/anger_2.png'))),
                      ),
                      Align(
                        alignment: Alignment(0, 1),
                        child: Container(
                          width: AppDimensions.height10 * 12.5,
                          height: AppDimensions.height10 * 12.5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/share_exp.png'))),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    width: AppDimensions.height10 * 16.784,
                    height: AppDimensions.height10 * 2.242,
                    //  color: Colors.amber,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 4.04),
                    child: Center(
                      child: Text(
                        'What’s next?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 3.354),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 4.1,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: const Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 89.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_2.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 36.1,
                    height: AppDimensions.height10 * 18.0,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 5.3),
                    child: Text(
                      'What do you want to\ndo next, now that you\nare living your goal\nand your desired\nidentity?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          letterSpacing: AppDimensions.height10 * 0.2,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.15),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 15.0,
                    height: AppDimensions.height10 * 15.0,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 11.7),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFA9934),
                        border: Border.all(
                            width: AppDimensions.height10 * 0.3,
                            color: const Color(0xFFFFFFFF))),
                    child: Center(
                        child: Text(
                      'Pause this\ngoal & start a\nnew one',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: AppDimensions.height10 * 0.15,
                          color: Colors.white,
                          fontSize: AppDimensions.height10 * 1.8,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                  Container(
                    width: AppDimensions.height10 * 27.6,
                    height: AppDimensions.height10 * 11.2,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 4.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 11.2,
                          height: AppDimensions.height10 * 11.2,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF646464),
                              border: Border.all(
                                  width: AppDimensions.height10 * 0.2,
                                  color: const Color(0xFFFFFFFF))),
                          child: Center(
                              child: Text(
                            'Pause\ngoal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                        Container(
                          width: AppDimensions.height10 * 11.2,
                          height: AppDimensions.height10 * 11.2,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF646464),
                              border: Border.all(
                                  width: AppDimensions.height10 * 0.2,
                                  color: const Color(0xFFFFFFFF))),
                          child: Center(
                              child: Text(
                            'Continue\ngoal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              // Container()
            ],
          ),
        ),
      ),
    );
  }
}

class RandomContainers extends StatefulWidget {
  @override
  _RandomContainersState createState() => _RandomContainersState();
}

class _RandomContainersState extends State<RandomContainers> {
  List<Widget> _containers = [];

  final double _minPosition = 0;
  final double _maxPosition = 850.0;
  final int _numberOfContainers = 80;

  @override
  void initState() {
    super.initState();
    _generateContainers();
  }

  void _generateContainers() {
    _containers.clear();
    final random = Random();

    for (int i = 0; i < _numberOfContainers; i++) {
      double x =
          _minPosition + random.nextDouble() * (_maxPosition - _minPosition);
      double y =
          _minPosition + random.nextDouble() * (_maxPosition - _minPosition);

      Widget container = Positioned(
        left: x,
        top: y,
        child: SizedBox(
          width: AppDimensions.height10 * 6.5,
          height: AppDimensions.height10 * 7.4,
          child: Stack(children: [
            Container(
              width: AppDimensions.height10 * 6.5,
              height: AppDimensions.height10 * 7.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Ellipse 158.png')),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: SizedBox(
                width: AppDimensions.height10 * 2.7,
                height: AppDimensions.height10 * 3.4,
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w400),
                        children: [
                      TextSpan(
                        text: 'Tue',
                      ),
                      TextSpan(
                          text: '01/07',
                          style:
                              TextStyle(fontSize: AppDimensions.height10 * 0.9))
                    ])),
              )),
            ),
            Align(
              alignment: Alignment(0, 1.0),
              child: Container(
                width: AppDimensions.height10 * 2.0,
                height: AppDimensions.height10 * 2.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/task_comp.png'))),
              ),
            )
          ]),
        ),
      );

      _containers.add(container);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: AppDimensions.height10 * 60.0,
        height: AppDimensions.height10 * 40.0,
        child: Stack(
          children: _containers,
        ),
      ),
    );
  }
}


// class RandomNonOverlappingContainers extends StatefulWidget {
//   @override
//   _RandomNonOverlappingContainersState createState() =>
//       _RandomNonOverlappingContainersState();
// }

// class _RandomNonOverlappingContainersState
//     extends State<RandomNonOverlappingContainers> {
//   List<Widget> _containers = [];

//   final double _minPosition = 50.0;
//   final double _maxPosition = 250.0;
//   final int _numberOfContainers = 10;

//   @override
//   void initState() {
//     super.initState();
//     _generateContainers();
//   }

//  bool _isOverlap(Offset position) {
//   for (var container in _containers) {
//     if (container.key?.currentContext == null) continue; // check for null value
//     final RenderBox box = container.key.currentContext.findRenderObject();
//     final containerRect = box.localToGlobal(Offset.zero) & box.size;
//     if (containerRect.contains(position)) {
//       return true;
//     }
//   }
//   return false;
// }

//   void _generateContainers() {
//     _containers.clear();
//     final random = Random();

//     for (int i = 0; i < _numberOfContainers; i++) {
//       double x = _minPosition + random.nextDouble() * (_maxPosition - _minPosition);
//       double y = _minPosition + random.nextDouble() * (_maxPosition - _minPosition);

//       Offset position = Offset(x, y);

//       while (_isOverlap(position)) {
//         x = _minPosition + random.nextDouble() * (_maxPosition - _minPosition);
//         y = _minPosition + random.nextDouble() * (_maxPosition - _minPosition);
//         position = Offset(x, y);
//       }

//       Widget container = Positioned(
//         key: UniqueKey(),
//         left: x,
//         top: y,
//         child: Container(
//             width: AppDimensions.height10 * 6.5,
//           height: AppDimensions.height10 * 7.4,
//           color: Colors.blue,
//         ),
//       );

//       _containers.add(container);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: _containers,
//       ),
//     );
//   }
// }