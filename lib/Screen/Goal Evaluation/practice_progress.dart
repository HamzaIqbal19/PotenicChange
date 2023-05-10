import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/calender.dart';

import '../../utils/app_dimensions.dart';
import 'circle_container.dart';

String activity_duration = 'Last week ';
String _selected_activity = '';

class practice_progress extends StatefulWidget {
  const practice_progress({super.key});

  @override
  State<practice_progress> createState() => _practice_progressState();
}

class _practice_progressState extends State<practice_progress> {
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
                width: AppDimensions.height10 * 2.6,
                height: AppDimensions.height10 * 2.6,
                fit: BoxFit.cover,
              )),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              // mainAxisAlignment: ,
              children: [
                Container(
                  // width: AppDimensions.height10 * 12.5,
                  height: AppDimensions.height10 * 2.3,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 5.2),
                  child: const Text(
                    'Practice Progress',
                    style: TextStyle(
                        height: 1.2,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 17.1,
                  height: AppDimensions.height10 * 2.4,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 0.5),
                  child: Text(
                    'Control my anger',
                    style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 21.0,
                  height: AppDimensions.height10 * 11.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 0.6),
                  // color: Colors.blue,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(-1, 0),
                        child: Container(
                          width: AppDimensions.height10 * 8.36,
                          height: AppDimensions.height10 * 9.3,
                          decoration: const BoxDecoration(
                            // color: Colors.amber,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Group 9398.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(-0.495, -0.2),
                        child: Container(
                          height: AppDimensions.height10 * 4.1,
                          width: AppDimensions.height10 * 4.061,
                          decoration: const BoxDecoration(
                              //color: Colors.amber,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/image2.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.7, -0.175),
                        child: Container(
                          width: AppDimensions.height10 * 10.6,
                          height: AppDimensions.height10 * 2.4,
                          child: Text(
                            'Meditation',
                            style: TextStyle(
                                color: const Color(0xff156F6D),
                                height: 1.2,
                                fontSize: AppDimensions.height10 * 2.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 37.6,
                  height: AppDimensions.height10 * 7.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.9),
                  child: Center(
                    child: Text(
                      'Your practice\nsessions summary',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.2,
                          color: const Color(0xFFFBFBFB),
                          fontSize: AppDimensions.height10 * 3.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 30.3,
                  height: AppDimensions.height10 * 5.1,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 1.8),
                    border:
                        Border.all(width: 1, color: const Color(0xFFFBFBFB)),
                  ),
                  child: Center(
                    child: Container(
                      width: AppDimensions.height10 * 21.0,
                      height: AppDimensions.height10 * 2.6,
                      margin:
                          EdgeInsets.only(bottom: AppDimensions.height10 * 0.8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //width: AppDimensions.height10 * 16.7,
                            height: AppDimensions.height10 * 2.6,
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: const Color(0xFFFBFBFB),
                                        fontFamily: 'laila',
                                        fontSize: AppDimensions.height10 * 2.2,
                                        fontWeight: FontWeight.w400),
                                    children: [
                                  const TextSpan(text: 'View: '),
                                  const TextSpan(
                                      text: 'Last week',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600))
                                ])),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.8,
                                    left: AppDimensions.height10 * 1.2),
                                // width: AppDimensions.height10 * 2.4,
                                // height: AppDimensions.height10 * 2.4,
                                // color: Colors.green,
                                child: Image.asset(
                                  'assets/images/Polygon 9.png',
                                  width: AppDimensions.height10 * 1.7,
                                  height: AppDimensions.height10 * 1.7,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    width: AppDimensions.height10 * 38.2,
                    height: AppDimensions.height10 * 62.4,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 4.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: const Color(0xFFF5F5F5)),
                    child: Column(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 33.4,
                          height: AppDimensions.height10 * 9.1,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 3.0),
                          child: Center(
                            child: Text(
                              'How did you feel after\nfinishing your practice?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xFF437296),
                                  height: 1.2,
                                  fontSize: AppDimensions.height10 * 2.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 22.0,
                          height: AppDimensions.height10 * 8.8,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 1.0),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 22.0,
                                height: AppDimensions.height10 * 2.4,
                                // color: Colors.amber,
                                child: Center(
                                  child: Text(
                                    '“I felt focused & good”',
                                    style: TextStyle(
                                        color: const Color(0xFFB695B7),
                                        height: 1.2,
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 3.9,
                                height: AppDimensions.height10 * 3.4,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.0),
                                child: Center(
                                  child: Text(
                                    '11x',
                                    style: TextStyle(
                                        color: const Color(0xFFB695B7),
                                        height: 1.2,
                                        fontSize: AppDimensions.height10 * 2.8,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Container(
                                //width: AppDimensions.height10 * 16.0,
                                // height: AppDimensions.height10 * 1.0,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    11, // Replace 5 with the number of containers you want to create
                                    (index) => Container(
                                      width: AppDimensions.height10 * 1.0,
                                      height: AppDimensions.height10 * 1.0,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              AppDimensions.height10 * 0.25),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFB695B7),
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 8.4,
                          height: AppDimensions.height10 * 0.2,
                          color: const Color(0xFF437296),
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 2.7,
                              bottom: AppDimensions.height10 * 2.7),
                        ),
                        Container(
                          width: AppDimensions.height10 * 22.0,
                          height: AppDimensions.height10 * 8.8,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 1.0),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 22.0,
                                height: AppDimensions.height10 * 2.4,
                                // color: Colors.amber,
                                child: Center(
                                  child: Text(
                                    '“I felt ok”',
                                    style: TextStyle(
                                        color: const Color(0xFFB695B7),
                                        height: 1.2,
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 3.9,
                                height: AppDimensions.height10 * 3.4,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.0),
                                child: Center(
                                  child: Text(
                                    '6x',
                                    style: TextStyle(
                                        color: const Color(0xFFB695B7),
                                        height: 1.2,
                                        fontSize: AppDimensions.height10 * 2.8,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Container(
                                //width: AppDimensions.height10 * 16.0,
                                // height: AppDimensions.height10 * 1.0,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    6, // Replace 5 with the number of containers you want to create
                                    (index) => Container(
                                      width: AppDimensions.height10 * 1.0,
                                      height: AppDimensions.height10 * 1.0,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              AppDimensions.height10 * 0.25),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFB695B7),
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 8.4,
                          height: AppDimensions.height10 * 0.2,
                          color: const Color(0xFF437296),
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 2.7,
                              bottom: AppDimensions.height10 * 2.7),
                        ),
                        Container(
                          width: AppDimensions.height10 * 22.0,
                          height: AppDimensions.height10 * 8.8,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 1.0),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10 * 22.0,
                                height: AppDimensions.height10 * 2.4,
                                // color: Colors.amber,
                                child: Center(
                                  child: Text(
                                    '“I felt low and irritated ”',
                                    style: TextStyle(
                                        color: const Color(0xFFB695B7),
                                        height: 1.2,
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 3.9,
                                height: AppDimensions.height10 * 3.4,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.0),
                                child: Center(
                                  child: Text(
                                    '2x',
                                    style: TextStyle(
                                        color: const Color(0xFFB695B7),
                                        height: 1.2,
                                        fontSize: AppDimensions.height10 * 2.8,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Container(
                                //width: AppDimensions.height10 * 16.0,
                                // height: AppDimensions.height10 * 1.0,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    2, // Replace 5 with the number of containers you want to create
                                    (index) => Container(
                                      width: AppDimensions.height10 * 1.0,
                                      height: AppDimensions.height10 * 1.0,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              AppDimensions.height10 * 0.25),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFB695B7),
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: AppDimensions.height10 * 6.0,
                            width: AppDimensions.height10 * 34.2,
                            margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 2.7,
                              // left: AppDimensions.height10 * 2.0,
                              //right: AppDimensions.height10 * 1.9,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xFFB695B7),
                                ),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 2.0)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: AppDimensions.height10 * 23.9,
                                    height: AppDimensions.height10 * 2.2,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 1.99),
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'View timeline',
                                          style: TextStyle(
                                            color: const Color(0xFF828282),
                                            fontSize:
                                                AppDimensions.height10 * 1.8,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ),
                                  Container(
                                      width: AppDimensions.height10 * 2.4,
                                      height: AppDimensions.height10 * 1.39,
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10 * 2.391),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10 * 2.6,
                                          //height: AppDimensions.height10 * 2.6,
                                          color: const Color(0xFF828282),
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                ]))
                      ],
                    )),
                Container(
                  width: AppDimensions.height10 * 38.2,
                  height: AppDimensions.height10 * 57.6,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                      color: const Color(0xFFF5F5F5)),
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10 * 33.4,
                        height: AppDimensions.height10 * 9.1,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                        child: Center(
                          child: Text(
                            'How has your practice\nbeen going?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xFF437296),
                                height: 1.2,
                                fontSize: AppDimensions.height10 * 2.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 22.0,
                        height: AppDimensions.height10 * 8.8,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 22.0,
                              height: AppDimensions.height10 * 2.4,
                              // color: Colors.amber,
                              child: Center(
                                child: Text(
                                  '“Good, I liked it”',
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 3.9,
                              height: AppDimensions.height10 * 3.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Center(
                                child: Text(
                                  '11x',
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.8,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            Container(
                              //width: AppDimensions.height10 * 16.0,
                              // height: AppDimensions.height10 * 1.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  11, // Replace 5 with the number of containers you want to create
                                  (index) => Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            AppDimensions.height10 * 0.25),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFB695B7),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 8.4,
                        height: AppDimensions.height10 * 0.2,
                        color: const Color(0xFF437296),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 2.7,
                            bottom: AppDimensions.height10 * 2.7),
                      ),
                      Container(
                        width: AppDimensions.height10 * 22.0,
                        height: AppDimensions.height10 * 11.2,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 22.0,
                              height: AppDimensions.height10 * 4.8,
                              // color: Colors.amber,
                              child: Center(
                                child: Text(
                                  '“Great, in the\nzone”',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 3.9,
                              height: AppDimensions.height10 * 3.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Center(
                                child: Text(
                                  '6x',
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.8,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            Container(
                              //width: AppDimensions.height10 * 16.0,
                              // height: AppDimensions.height10 * 1.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  6, // Replace 5 with the number of containers you want to create
                                  (index) => Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            AppDimensions.height10 * 0.25),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFB695B7),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 8.4,
                        height: AppDimensions.height10 * 0.2,
                        color: const Color(0xFF437296),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 2.7,
                            bottom: AppDimensions.height10 * 2.7),
                      ),
                      Container(
                        width: AppDimensions.height10 * 22.0,
                        height: AppDimensions.height10 * 8.8,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 22.0,
                              height: AppDimensions.height10 * 2.4,
                              // color: Colors.amber,
                              child: Center(
                                child: Text(
                                  '“I felt low and irritated ”',
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 3.9,
                              height: AppDimensions.height10 * 3.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Center(
                                child: Text(
                                  '2x',
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.8,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            Container(
                              //width: AppDimensions.height10 * 16.0,
                              // height: AppDimensions.height10 * 1.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  2, // Replace 5 with the number of containers you want to create
                                  (index) => Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            AppDimensions.height10 * 0.25),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFB695B7),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // width: AppDimensions.height10 * 2.1,
                  //height: AppDimensions.height10 * 4.3,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                  child: Image.asset(
                    'assets/images/Arrow.png',
                    width: AppDimensions.height10 * 4.1,
                    height: AppDimensions.height10 * 4.3,
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 37.1,
                  height: AppDimensions.height10 * 5.4,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                  child: Center(
                    child: Text(
                      'Your last practice progress\nevaluation for periods',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: AppDimensions.height10 * 2.2,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFBFBFB),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 37.1,
                  height: AppDimensions.height10 * 3.4,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 0.6),
                  child: Center(
                    child: Text(
                      'DD/MMM/YY to DD/MMM/YY.',
                      style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.8,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFBFBFB),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 38.2,
                  height: AppDimensions.height10 * 111.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                      color: const Color(0xFFF5F5F5)),
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10 * 34.2,
                        height: AppDimensions.height10 * 7.2,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                        child: Center(
                          child: Text(
                            'How effective has this practice\nbeen in moving you closer towards\nyour goal?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xFF437296),
                                height: 1.2,
                                fontSize: AppDimensions.height10 * 2.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 28.6,
                        height: AppDimensions.height10 * 10.7,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 7.6,
                              height: AppDimensions.height10 * 5.3,
                              child: Center(
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: const Color(0xFFB695B7),
                                            fontFamily: 'laila',
                                            height: 1.2,
                                            fontSize:
                                                AppDimensions.height10 * 2.4,
                                            fontWeight: FontWeight.w400),
                                        children: [
                                      TextSpan(
                                        text: '2',
                                        style: TextStyle(
                                            color: const Color(0xFFB695B7),
                                            height: 1.2,
                                            fontSize:
                                                AppDimensions.height10 * 4.5,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const TextSpan(text: '/5')
                                    ])),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 28.6,
                              height: AppDimensions.height10 * 2.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Center(
                                child: Text(
                                  '“There is good improvement”',
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 7.0,
                              height: AppDimensions.height10 * 1.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFB695B7),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFB695B7),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 8.4,
                        height: AppDimensions.height10 * 0.2,
                        color: const Color(0xFF437296),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 2.7,
                            bottom: AppDimensions.height10 * 2.7),
                      ),
                      Container(
                        width: AppDimensions.height10 * 30.0,
                        height: AppDimensions.height10 * 17.5,
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 30.0,
                              height: AppDimensions.height10 * 4.8,
                              child: Center(
                                child: Text(
                                  'How much have you enjoyed\nthe journey during this period?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: const Color(0xFF437296),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 7.6,
                              height: AppDimensions.height10 * 5.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 2.0),
                              child: Center(
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: const Color(0xFFB695B7),
                                            fontFamily: 'laila',
                                            height: 1.2,
                                            fontSize:
                                                AppDimensions.height10 * 2.4,
                                            fontWeight: FontWeight.w400),
                                        children: [
                                      TextSpan(
                                        text: '1',
                                        style: TextStyle(
                                            color: const Color(0xFFB695B7),
                                            height: 1.2,
                                            fontSize:
                                                AppDimensions.height10 * 4.5,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const TextSpan(text: '/5')
                                    ])),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 28.6,
                              height: AppDimensions.height10 * 2.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Center(
                                child: Text(
                                  '“It is not bad ”',
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 7.0,
                              height: AppDimensions.height10 * 1.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFB695B7),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 8.4,
                        height: AppDimensions.height10 * 0.2,
                        color: const Color(0xFF437296),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 2.7,
                            bottom: AppDimensions.height10 * 2.7),
                      ),
                      Container(
                        width: AppDimensions.height10 * 34.8,
                        height: AppDimensions.height10 * 19.9,
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 34.8,
                              height: AppDimensions.height10 * 7.2,
                              child: Center(
                                child: Text(
                                  'How confident are you that this\npractice will help move you\ncloser towards achieving your goal?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: const Color(0xFF437296),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 7.6,
                              height: AppDimensions.height10 * 5.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 2.00),
                              child: Center(
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: const Color(0xFFB695B7),
                                            fontFamily: 'laila',
                                            height: 1.2,
                                            fontSize:
                                                AppDimensions.height10 * 2.4,
                                            fontWeight: FontWeight.w400),
                                        children: [
                                      TextSpan(
                                        text: '2',
                                        style: TextStyle(
                                            color: const Color(0xFFB695B7),
                                            height: 1.2,
                                            fontSize:
                                                AppDimensions.height10 * 4.5,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const TextSpan(text: '/5')
                                    ])),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 28.6,
                              height: AppDimensions.height10 * 2.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Center(
                                child: Text(
                                  '“I feel there is a good chance  ”',
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 7.0,
                              height: AppDimensions.height10 * 1.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFB695B7),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFB695B7),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 8.4,
                        height: AppDimensions.height10 * 0.2,
                        color: const Color(0xFF437296),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 2.7,
                            bottom: AppDimensions.height10 * 2.7),
                      ),
                      Container(
                        width: AppDimensions.height10 * 34.8,
                        height: AppDimensions.height10 * 19.9,
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 34.8,
                              height: AppDimensions.height10 * 7.2,
                              child: Center(
                                child: Text(
                                  'How easy is it to implement\nthis practice in to your life?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: const Color(0xFF437296),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 7.6,
                              height: AppDimensions.height10 * 5.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 2.00),
                              child: Center(
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: const Color(0xFFB695B7),
                                            fontFamily: 'laila',
                                            height: 1.2,
                                            fontSize:
                                                AppDimensions.height10 * 2.4,
                                            fontWeight: FontWeight.w400),
                                        children: [
                                      TextSpan(
                                        text: '2',
                                        style: TextStyle(
                                            color: const Color(0xFFB695B7),
                                            height: 1.2,
                                            fontSize:
                                                AppDimensions.height10 * 4.5,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const TextSpan(text: '/5')
                                    ])),
                              ),
                            ),
                            Container(
                              /// width: AppDimensions.height10 * 28.6,
                              height: AppDimensions.height10 * 2.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Center(
                                child: Text(
                                  '“I have more hard days than easy ”',
                                  style: TextStyle(
                                      color: const Color(0xFFB695B7),
                                      height: 1.2,
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 7.0,
                              height: AppDimensions.height10 * 1.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFB695B7),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFB695B7),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 1.0,
                                    height: AppDimensions.height10 * 1.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 0.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFB695B7))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 8.4,
                        height: AppDimensions.height10 * 0.2,
                        color: const Color(0xFF437296),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 2.7,
                            bottom: AppDimensions.height10 * 2.7),
                      ),
                      Container(
                          height: AppDimensions.height10 * 6.0,
                          width: AppDimensions.height10 * 34.2,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFFB695B7),
                              ),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 2.0)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 23.9,
                                  height: AppDimensions.height10 * 2.2,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 1.99),
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Practice assessment history',
                                        style: TextStyle(
                                          color: const Color(0xFF828282),
                                          fontSize:
                                              AppDimensions.height10 * 1.8,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ),
                                Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.39,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10 * 2.391),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10 * 2.6,
                                        //height: AppDimensions.height10 * 2.6,
                                        color: const Color(0xFF828282),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ]))
                    ],
                  ),
                ),
                Container(
                  // width: AppDimensions.height10 * 2.1,
                  //height: AppDimensions.height10 * 4.3,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                  child: Image.asset(
                    'assets/images/Arrow.png',
                    width: AppDimensions.height10 * 4.1,
                    height: AppDimensions.height10 * 4.3,
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 35.8,
                  height: AppDimensions.height10 * 5.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                  child: Center(
                    child: Text(
                      'Your next practice report will be\ndelivered in 9 Active Days',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: AppDimensions.height10 * 2.2,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFBFBFB),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 38.5,
                  height: AppDimensions.height10 * 84.669,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                      color: const Color(0xFFFFFFFF)),
                  child: Column(
                    children: [
                      Container(
                        height: AppDimensions.height10 * 24.8,
                        // color: Colors.amber,
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 4.6,
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Group 9458.png'))),
                      ),
                      Container(
                        height: AppDimensions.height10 * 8.0,
                        width: AppDimensions.height10 * 23,
                        child: Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(
                                    height: 1.2,
                                    fontSize: AppDimensions.height10 * 1.4,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF5B74A6),
                                  ),
                                  children: [
                                    TextSpan(
                                        text: 'You have completed this\nover '),
                                    TextSpan(
                                        text: '2 months',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700))
                                  ])),
                        ),
                      ),
                      Container(
                          height: AppDimensions.height10 * 46.8,
                          child: CalendarWithRadioButtons()),
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 35.8,
                  height: AppDimensions.height10 * 5.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 5.031),
                  child: Center(
                    child: Text(
                      'You have actively worked on this\npractice with us for 00 days.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: AppDimensions.height10 * 2.2,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFBFBFB),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 29.9,
                  height: AppDimensions.height10 * 5.0,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 4.8,
                      bottom: AppDimensions.height10 * 3.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 14.3,
                        height: AppDimensions.height10 * 5.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xffFCC10D).withOpacity(0.5),
                              const Color(0xffFDA210).withOpacity(0.5),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 5.0),
                        ),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Change habit',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white.withOpacity(0.5)),
                            )),
                      ),
                      Container(
                        width: AppDimensions.height10 * 14.3,
                        height: AppDimensions.height10 * 5.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xffFCC10D).withOpacity(0.5),
                              const Color(0xffFDA210).withOpacity(0.5),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 5.0),
                        ),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Pause habit',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white.withOpacity(0.5)),
                            )),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return MyBottomSheet();
    },
  ).then((value) {
    if (value != null) {
      // Do something with the selected statement
      print(value);
    }
  });
}

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int _selectedIndex = 0;
  final List<String> _statements = [
    'Last week',
    'Last 2 weeks ',
    'Last month ',
    'Last 2 month ',
    'Last 3 month ',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          AppDimensions.height10 * 31.3, // Set the height of the bottom sheet
      child: Column(
        children: [
          Container(
            height: AppDimensions.height10 * 3.8,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(0xFF828282),
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
                          color: Color(0xFF2F80ED)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //activity_duration = _selected_activity;
                      activity_duration = _statements[_selectedIndex];
                    });
                    Navigator.of(context).pop(_statements[_selectedIndex]);
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
                          color: Color(0xFF2F80ED)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 60,
              magnification: 1.2,
              useMagnifier: true, // Set the height of each statement
              children: _statements
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
                  _selected_activity = _statements[_selectedIndex];
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
