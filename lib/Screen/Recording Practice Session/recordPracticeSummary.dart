import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEndosSession.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeFellingAftr.dart';

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
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
                        height: AppDimensions.height10 * 0.12,
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
                        image: AssetImage('assets/images/orange_moon.png'),
                        colorFilter: ColorFilter.mode(
                            Color.fromRGBO(0, 0, 0, 0.5), BlendMode.dstATop),
                        fit: BoxFit.cover)),
                child: Stack(children: [
                  Align(
                      alignment: const Alignment(0, -0.65),
                      child: Text(
                        'Control my anger',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff5B74A6)),
                      )),
                  Align(
                    alignment: const Alignment(0, -0.35),
                    child: Text(
                        '“I am someone who is in\n control of my anger”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff5B74A6))),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.975),
                    child: Container(
                      height: AppDimensions.height10 * 13.8,
                      width: AppDimensions.height10 * 13.8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 5, color: const Color(0xFF52855E)),
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
                              color: const Color(0xff1A481C),
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
                                    color: Color(0xFF52855E)),
                                child: const ImageIcon(
                                  AssetImage('assets/images/tick_icon.png'),
                                  color: Color(0xFFFFFFFF),
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
                        child: const Icon(
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
                          fontFamily: 'Laila',
                          height: AppDimensions.height10 * 0.12,
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        children: [
                          const TextSpan(
                            text: 'How did you feel',
                          ),
                          const TextSpan(
                              text: '\nbefore',
                              style: TextStyle(color: Color(0xff8C648A))),
                          const TextSpan(
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
                    alignment: const Alignment(0, 0.8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const emotions(
                                      summary: true,
                                    )));
                      },
                      child: Container(
                          height: AppDimensions.height10 * 2.0,
                          width: AppDimensions.height10 * 2.0,
                          padding: EdgeInsets.all(AppDimensions.height10 * 0.4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: const ImageIcon(
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
                          fontFamily: 'Laila',
                          height: AppDimensions.height10 * 0.12,
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        children: [
                          const TextSpan(
                            text: 'How do you feel',
                          ),
                          const TextSpan(
                              text: '\nafter',
                              style: TextStyle(color: Color(0xff8C648A))),
                          const TextSpan(
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
                      'I feel focused\n& good',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Laila'),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const feelingsAfter(
                                      summary: true,
                                    )));
                      },
                      child: Container(
                          height: AppDimensions.height10 * 2.0,
                          width: AppDimensions.height10 * 2.0,
                          padding: EdgeInsets.all(AppDimensions.height10 * 0.4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: const ImageIcon(
                            AssetImage('assets/images/edit_icon.png'),
                            color: Colors.white,
                          )),
                    ),
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
                child: Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 1.4,
                      left: AppDimensions.height10 * 2.0,
                      right: AppDimensions.height10 * 2.0),
                  height: AppDimensions.height10 * 3.8,
                  width: AppDimensions.height10 * 32.0,
                  child: Text(
                    'This session works for me, it clears my head and makes me feel positive :)',
                    style: TextStyle(
                        color: const Color(0xff646464),
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Laila'),
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
                      'Good, I liked\nit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const endofSession(
                                      summary: true,
                                    )));
                      },
                      child: Container(
                        height: AppDimensions.height10 * 2.0,
                        width: AppDimensions.height10 * 2.0,
                        padding: EdgeInsets.all(AppDimensions.height10 * 0.4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(width: 1, color: Colors.white)),
                        child: const ImageIcon(
                          AssetImage('assets/images/edit_icon.png'),
                          color: Colors.white,
                        ),
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
                              const Icon(
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
                                  ),
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
                                    builder: (context) => const view_goals(
                                          missed: false,
                                        )));
                          },
                          child: Text(
                            'Save Practice',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
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
