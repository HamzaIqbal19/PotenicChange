import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEndosSession.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeFellingAftr.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import '../Recording Practice Session/recordPracticeEmotions.dart';

class record_summary extends StatefulWidget {
  const record_summary({super.key});

  @override
  State<record_summary> createState() => _record_summaryState();
}

class _record_summaryState extends State<record_summary> {
  String date_time = 'Now';
  String time = 'Am';
  String day = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.webp',
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
          image: AssetImage('assets/images/prac_assesment.webp'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10(context) * 33.4,
                height: AppDimensions.height10(context) * 3.4,
                // color: Colors.amber,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
                child: Center(
                  child: Text(
                    'Your Practice Summary',
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 2.8,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 23.2,
                height: AppDimensions.height10(context) * 3.8,
                //  color: Colors.red,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.5),
                child: Center(
                  child: Text(
                    'Well done for recording your\npractice!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: AppDimensions.height10(context) * 0.15,
                        fontSize: AppDimensions.height10(context) * 1.6,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 26.8,
                height: AppDimensions.height10(context) * 26.8,
                //color: Colors.amber,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.4),
                decoration: const BoxDecoration(
                    // color: const Color(0xff7c94b6),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/orange_moon.webp'),
                        colorFilter: ColorFilter.mode(
                            Color.fromRGBO(0, 0, 0, 0.5), BlendMode.dstATop),
                        fit: BoxFit.cover)),
                child: Stack(children: [
                  Align(
                      alignment: Alignment(0, -0.5),
                      child: Text(
                        'Control my anger',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff5B74A6)),
                      )),
                  Align(
                    alignment: Alignment(0, -0.2),
                    child: Text(
                        '“I am someone who is in\n control of my anger”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5B74A6))),
                  ),
                  Align(
                    alignment: const Alignment(0, 1),
                    child: Container(
                      height: AppDimensions.height10(context) * 13.8,
                      width: AppDimensions.height10(context) * 13.8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Meditation Completed.webp'))),
                    ),
                  ),
                ]),
              ),
              Container(
                width: AppDimensions.height10(context) * 26.8,
                height: AppDimensions.height10(context) * 5.0,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 1.8),
                    border: Border.all(width: 1, color: Colors.white),
                    color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        //margin: EdgeInsets.only(left: 92, right: 66),
                        height: AppDimensions.height10(context) * 2.6,
                        width: AppDimensions.height10(context) * 20.0,
                        child: Text(
                          date_time,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.0,
                            fontFamily: 'Laila',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                    IconButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) {
                              return _buildBottomPicker(
                                CupertinoDatePicker(
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
                                              day = 'Thur';
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
                                    }),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: AppDimensions.height10(context) * 3.0,
                        ))
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 32.6,
                height: AppDimensions.height10(context) * 4.8,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.0,
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
                width: AppDimensions.height10(context) * 13.4,
                height: AppDimensions.height10(context) * 13.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: AppDimensions.height10(context) * 0.2,
                        color: Colors.white),
                    color: Colors.transparent),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     FadePageRoute(
                          //         page: const emotions(
                          //       summary: true,
                          //     )));
                        },
                        child: Container(
                            height: AppDimensions.height10(context) * 2.8,
                            width: AppDimensions.height10(context) * 2.8,
                            padding: EdgeInsets.all(
                                AppDimensions.height10(context) * 0.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: ImageIcon(
                              AssetImage('assets/images/edit_icon.webp'),
                              color: Colors.white,
                            )),
                      ),
                      Text(
                        'Update',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Laila'),
                      ),
                    ]),
              ),
              Container(
                width: AppDimensions.height10(context) * 32.6,
                height: AppDimensions.height10(context) * 4.8,
//color: Colors.amber,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.0,
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
                width: AppDimensions.height10(context) * 13.4,
                height: AppDimensions.height10(context) * 13.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: AppDimensions.height10(context) * 0.2,
                        color: Colors.white),
                    color: Colors.transparent),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const feelingsAfter(summary: true)));
                        },
                        child: Container(
                            height: AppDimensions.height10(context) * 2.8,
                            width: AppDimensions.height10(context) * 2.8,
                            padding: EdgeInsets.all(
                                AppDimensions.height10(context) * 0.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: ImageIcon(
                              AssetImage('assets/images/edit_icon.webp'),
                              color: Colors.white,
                            )),
                      ),
                      Text(
                        'Update',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Laila'),
                      ),
                    ]),
              ),
              Container(
                width: AppDimensions.height10(context) * 32.6,
                height: AppDimensions.height10(context) * 2.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.0),
                child: Center(
                  child: Text(
                    'How did the practice go?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 2.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 13.4,
                height: AppDimensions.height10(context) * 13.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: AppDimensions.height10(context) * 0.2,
                        color: Colors.white),
                    color: Colors.transparent),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const endofSession(summary: true)));
                        },
                        child: Container(
                            height: AppDimensions.height10(context) * 2.8,
                            width: AppDimensions.height10(context) * 2.8,
                            padding: EdgeInsets.all(
                                AppDimensions.height10(context) * 0.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: ImageIcon(
                              AssetImage('assets/images/edit_icon.webp'),
                              color: Colors.white,
                            )),
                      ),
                      Text(
                        'Update',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Laila'),
                      ),
                    ]),
              ),
              Container(
                width: AppDimensions.height10(context) * 38.3,
                height: AppDimensions.height10(context) * 5.0,
//color: Colors.red,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 6.4),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: AppDimensions.height10(context) * 5.0,
                      width: AppDimensions.height10(context) * 14.3,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0),
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.2,
                              color: Color(0xffFA9934))),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Reset',
                            style: TextStyle(
                                color: Color(0xffFA9934),
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w600),
                          ))),
                  Container(
                      height: AppDimensions.height10(context) * 5.0,
                      width: AppDimensions.height10(context) * 21.2,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFCC10D),
                            Color(0xffFDA210),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 5.0),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Save Practice',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins'),
                          )))
                ]),
              ),
              Container(
                width: AppDimensions.height10(context) * 17.0,
                height: AppDimensions.height10(context) * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 5.0),
                ),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 3.7,
                    bottom: AppDimensions.height10(context) * 5.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBottomPicker(Widget picker) {
  return Builder(builder: (context) {
    return Container(
      height: AppDimensions.height10(context) * 21.6,
      padding: EdgeInsets.only(top: AppDimensions.height10(context) * 0.60),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.black,
          fontSize: AppDimensions.height10(context) * 2.20,
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
  });
}
