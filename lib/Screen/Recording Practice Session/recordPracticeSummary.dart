import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';

import '../../utils/app_dimensions.dart';

class practice_summary extends StatefulWidget {
  const practice_summary({super.key});

  @override
  State<practice_summary> createState() => _practice_summaryState();
}

class _practice_summaryState extends State<practice_summary> {
  String date_time = 'Now';
  String time = 'Am';
  String day = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10 * 33.4,
                height: AppDimensions.height10 * 3.4,
                // color: Colors.amber,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 6.0),
                child: Center(
                  child: Text(
                    'Your Practice Summary',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 2.8,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 23.2,
                height: AppDimensions.height10 * 3.8,
                //  color: Colors.red,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.5),
                child: Center(
                  child: Text(
                    'Well done for recording\nyour practice!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 26.8,
                height: AppDimensions.height10 * 26.8,
                //color: Colors.amber,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.4),
                decoration: const BoxDecoration(
                    // color: const Color(0xff7c94b6),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/image3.png'),
                        colorFilter: ColorFilter.mode(
                            Color.fromRGBO(0, 0, 0, 0.5), BlendMode.dstATop),
                        fit: BoxFit.cover)),
                child: Stack(children: [
                  Align(
                      alignment: Alignment(0, -0.5),
                      child: Text(
                        'Control my anger',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff5B74A6)),
                      )),
                  Align(
                    alignment: Alignment(0, -0.2),
                    child: Text(
                        '“I am someone who is in\n control of my anger”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5B74A6))),
                  ),
                  Align(
                    alignment: const Alignment(0, 1),
                    child: Container(
                      height: AppDimensions.height10 * 13.8,
                      width: AppDimensions.height10 * 13.8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 5, color: Colors.white),
                          gradient: const RadialGradient(
                            // radius: 0.5,
                            colors: <Color>[
                              Color(0xFFDFF8EB), // yellow sun
                              Color(0xFFA3B6A4), // blue sky
                            ],
                          )),
                      child: Stack(children: [
                        Center(
                            child: Text(
                          'Meditation',
                          style: TextStyle(
                              color: Color(0xff1A481C),
                              fontSize: AppDimensions.height10 * 1.8,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Laila'),
                        )),
                        Align(
                            alignment: const Alignment(0, 1.3),
                            child: Container(
                                height: AppDimensions.height10 * 2.9,
                                width: AppDimensions.height10 * 2.9,
                                padding: EdgeInsets.all(
                                    AppDimensions.height10 * 0.7),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: ImageIcon(
                                  AssetImage('assets/images/tick_icon.png'),
                                  color: Color(0xff1A481C),
                                )))
                      ]),
                    ),
                  ),
                ]),
              ),
              Container(
                width: AppDimensions.height10 * 26.8,
                height: AppDimensions.height10 * 5.0,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.0),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 1.8),
                    border: Border.all(width: 1, color: Colors.white),
                    color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        //margin: EdgeInsets.only(left: 92, right: 66),
                        height: AppDimensions.height10 * 2.6,
                        width: AppDimensions.height10 * 21.0,
                        child: Text(
                          date_time,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontFamily: 'Laila',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildBottomPicker(CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.dateAndTime,
                                  //initialDateTime: date_time,
                                  onDateTimeChanged: (DateTime newDateTime) {
                                    if (mounted) {
                                      setState(() {
                                        if (newDateTime.weekday == 2) {
                                          setState(() {
                                            day = 'Tue';
                                          });
                                        } else if (newDateTime.weekday == 3) {
                                          setState(() {
                                            day = 'Wed';
                                          });
                                        } else if (newDateTime.weekday == 4) {
                                          setState(() {
                                            day = 'Thu';
                                          });
                                        } else if (newDateTime.weekday == 5) {
                                          setState(() {
                                            day = 'Fri';
                                          });
                                        } else if (newDateTime.weekday == 6) {
                                          setState(() {
                                            day = 'Sat';
                                          });
                                        } else if (newDateTime.weekday == 7) {
                                          setState(() {
                                            day = 'Sun';
                                          });
                                        } else {
                                          setState(() {
                                            day = 'Mon';
                                          });
                                        }
                                      });
                                      setState(() {
                                        if (newDateTime.hour > 11) {
                                          setState(() {
                                            time = 'Pm';
                                          });
                                        } else {
                                          setState(() {
                                            time = 'Am';
                                            //print(time);
                                          });
                                        }
                                      });
                                      setState(() => date_time =
                                          " ${day}:${newDateTime.hour}:${newDateTime.minute}:${time}");
                                      print(
                                          "${newDateTime.weekday}:${newDateTime.hour}:${newDateTime.minute}:${time}");
                                    }
                                  }));
                            },
                          );
                        },
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 30,
                        ))
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 32.6,
                height: AppDimensions.height10 * 4.8,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'How did you feel',
                          ),
                          TextSpan(
                              text: '\nbefore',
                              style: TextStyle(color: Color(0xff8C648A))),
                          TextSpan(
                            text: ' your practice?',
                          ),
                        ])),
              ),
              Container(
                width: AppDimensions.height10 * 13.4,
                height: AppDimensions.height10 * 13.4,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFA8552),
                          Color(0xffFAA960),
                        ])),
                child: Stack(children: [
                  Center(
                    child: Text(
                      'I felt good',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Laila'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => emotions(
                                      summary: true,
                                    )));
                      },
                      child: Container(
                          height: AppDimensions.height10 * 2.0,
                          width: AppDimensions.height10 * 2.0,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: ImageIcon(
                            AssetImage('assets/images/edit_icon.png'),
                            color: Colors.white,
                          )),
                    ),
                  )
                ]),
              ),
              Container(
                width: AppDimensions.height10 * 32.6,
                height: AppDimensions.height10 * 4.8,
//color: Colors.amber,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'How do you feel',
                          ),
                          TextSpan(
                              text: '\nafter',
                              style: TextStyle(color: Color(0xff8C648A))),
                          TextSpan(
                            text: ' your practice?',
                          ),
                        ])),
              ),
              Container(
                width: AppDimensions.height10 * 13.4,
                height: AppDimensions.height10 * 13.4,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.7),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFA8552),
                          Color(0xffFAA960),
                        ])),
                child: Stack(children: [
                  Center(
                    child: Text(
                      '“I feel focused\n& good”',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Laila'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: Container(
                        height: AppDimensions.height10 * 2.0,
                        width: AppDimensions.height10 * 2.0,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(width: 1, color: Colors.white)),
                        child: ImageIcon(
                          AssetImage('assets/images/edit_icon.png'),
                          color: Colors.white,
                        )),
                  )
                ]),
              ),
              Container(
                width: AppDimensions.height10 * 36.0,
                height: AppDimensions.height10 * 7.3,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: Colors.white),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: AppDimensions.height10 * 2.0,
                        right: AppDimensions.height10 * 2.0),
                    height: AppDimensions.height10 * 3.8,
                    width: AppDimensions.height10 * 32.0,
                    child: Text(
                      'This session works for me, it clears my head and makes me feel positive :)',
                      style: TextStyle(
                          color: Color(0xff646464),
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Laila'),
                    ),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 32.6,
                height: AppDimensions.height10 * 2.4,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                child: Center(
                  child: Text(
                    'How did the practice go?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 2.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 13.4,
                height: AppDimensions.height10 * 13.2,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    gradient: const RadialGradient(
                      radius: 0.5,
                      colors: <Color>[
                        Color(0xFFBDA7C2), // yellow sun
                        Color(0xFFB38FB4), // blue sky
                      ],
                    )),
                child: Stack(children: [
                  Center(
                    child: Text(
                      'Good, I liked it',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: Container(
                      height: AppDimensions.height10 * 2.0,
                      width: AppDimensions.height10 * 2.0,
                      padding: EdgeInsets.all(AppDimensions.height10 * 0.5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(width: 1, color: Colors.white)),
                      child: ImageIcon(
                        AssetImage('assets/images/edit_icon.png'),
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                width: AppDimensions.height10 * 38.3,
                height: AppDimensions.height10 * 5.0,
//color: Colors.red,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 6.4),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: AppDimensions.height10 * 5.0,
                      width: AppDimensions.height10 * 15.7,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.4),
                      decoration: BoxDecoration(
                        color: const Color(0xff464646),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 5.0),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 0.8),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Arial'),
                                ),
                              ),
                            ],
                          ))),
                  Container(
                      height: AppDimensions.height10 * 5.0,
                      width: AppDimensions.height10 * 21.2,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFCC10D),
                            Color(0xffFDA210),
                          ],
                        ),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 5.0),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => view_goals()));
                          },
                          child: Text(
                            'Save Practice',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins'),
                          )))
                ]),
              ),
              Container(
                width: AppDimensions.height10 * 17.0,
                height: AppDimensions.height10 * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 5.0),
                ),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.7,
                    bottom: AppDimensions.height10 * 5.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBottomPicker(Widget picker) {
  return Container(
    height: AppDimensions.height10 * 30.3,
    padding: EdgeInsets.only(top: AppDimensions.height10 * 0.60),
    color: CupertinoColors.white,
    child: DefaultTextStyle(
      style: TextStyle(
        color: CupertinoColors.black,
        fontSize: AppDimensions.height10 * 2.20,
      ),
      child: GestureDetector(
        // Blocks taps from propagating to the modal sheet and popping.
        onTap: () {},
        child: SafeArea(
          top: false,
          child: picker,
        ),
      ),
    ),
  );
}
