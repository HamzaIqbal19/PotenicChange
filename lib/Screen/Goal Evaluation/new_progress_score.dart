// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/goal_criteria.dart';

import '../../utils/app_dimensions.dart';

String activity_duration = 'From 01 Jan 23 to 01 Feb 23 ';
int goal_level = 0;
String _selected_activity = '';

class new_progress_score extends StatefulWidget {
  const new_progress_score({super.key});

  @override
  State<new_progress_score> createState() => _new_progress_scoreState();
}

class _new_progress_scoreState extends State<new_progress_score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/Back.png',
                  width: AppDimensions.height10 * 3.0,
                  height: AppDimensions.height10 * 3.0,
                  fit: BoxFit.cover,
                )),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    evaluation_sheet(context);
                  },
                  icon: Image.asset(
                    'assets/images/ic_info_outline.png',
                    width: AppDimensions.height10 * 3.0,
                    height: AppDimensions.height10 * 3.0,
                    fit: BoxFit.cover,
                  )),
            ),
          ]),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: AppDimensions.height10 * 33.5,
                height: AppDimensions.height10 * 3.6,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 11.1),
                //color: Colors.amber,
                child: Center(
                  child: Text(
                    'Goal Level Evaluation',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 3.0,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 22.6,
                height: AppDimensions.height10 * 2.4,
                //  color: Colors.grey,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.4),
                child: Center(
                  child: Text(
                    'For ‘Control My Anger’',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 2.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 36.5,
                height: AppDimensions.height10 * 58.1,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          _showBottomSheet(context);
                          setState(() {});
                        },
                        child: Container(
                          width: AppDimensions.height10 * 30.3,
                          height: AppDimensions.height10 * 12.3,
                          decoration: BoxDecoration(

                              border: Border.all(
                                  width: AppDimensions.height10 * 0.1,
                                  color: const Color(0xFFFFFFFF)),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.8)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 27.4,
                                height: AppDimensions.height10 * 2.2,
                                // color: Colors.grey,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10 * 24.2,
                                      child: Text(
                                        activity_duration,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.8,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                    SizedBox(
                                        // width: AppDimensions.height10 * 2.4,
                                        // height: AppDimensions.height10 * 2.4,
                                        // color: Colors.green,
                                        child: Image.asset(
                                      'assets/images/Polygon 9.png',
                                      width: AppDimensions.height10 * 1.7,
                                      height: AppDimensions.height10 * 1.7,
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                  width: AppDimensions.height10 * 23.7,
                                  height: AppDimensions.height10 * 7.1,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 0.7),
                                  child: Text(
                                    'This is how close you were\nto living your goal and\ndesired identity.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: AppDimensions.height10*0.15,
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: AppDimensions.height10 * 36.5,
                        height: AppDimensions.height10 * 52.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFFF9DCC0).withOpacity(0),
                                  const Color(0XffFF7975).withOpacity(1)
                                ]),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: AppDimensions.height10 * 18.0,
                              height: AppDimensions.height10 * 18.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 10.9),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.1,
                                    color: const Color(0xFFFFFFFF)),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Nebula Pie.png'),
                                ),
                                // color: Colors.amber,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10 * 2.6,
                                      height: AppDimensions.height10 * 1.2,
                                      child: Center(
                                        child: Text(
                                          'LEVEL',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 0.8,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF464646)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppDimensions.height10 * 6.0,
                                      height: AppDimensions.height10 * 3.3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$goal_level',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        2.4,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF646464)),
                                          ),
                                          Text(
                                            '/5',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.6,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xFF828282)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 24.9,
                              height: AppDimensions.height10 * 8.1,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.1),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: AppDimensions.height10 * 2.5,
                                      height: AppDimensions.height10 * 1.6,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/colon.png'),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0.5, 0),
                                    child: SizedBox(
                                      width: AppDimensions.height10 * 21.4,
                                      height: AppDimensions.height10 * 7.3,

                                      //color: Colors.amber,
                                      child: Center(
                                        child: Text(
                                          "I'm making small steps forward",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 2.0,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFFFFFFFF)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 33.0,
                              height: AppDimensions.height10 * 4.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 2.1),
                              child: Center(
                                child: Text(
                                  'Please evaluate each criteria below to see\nyour goal level progress.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppDimensions.height10 * 1.6,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                            Container(
                              // width: AppDimensions.height10 * 2.1,
                              // height: AppDimensions.height10 * 4.3,
                              child: Image.asset(
                                'assets/images/Arrow.png',
                                width: AppDimensions.height10 * 4.1,
                                height: AppDimensions.height10 * 4.1,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 44.1,
                height: AppDimensions.height10 * 67.2,
                // color: Colors.amberAccent,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const your_why(
                                      evaluation: false,
                                    )));
                      },
                      child: const goal_criteria(
                          criteria: 'Goal Criteria 1',
                          identity: 'Your Why’s',
                          text_span_1: 'I’m making small steps\ntowards my ',
                          text_span_2: 'why',
                          text_span_3: '',
                          margin_top: 0),
                    ),
                    const goal_criteria(
                        criteria: 'Goal Criteria 2',
                        identity: 'Your new identity',
                        text_span_1: 'I’m making small steps\ntowards my ',
                        text_span_2: 'new identity',
                        text_span_3: '',
                        margin_top: 1.0),
                    const goal_criteria(
                        criteria: 'Goal Criteria 3',
                        identity: 'Your vision for\nnew self',
                        text_span_1: 'I’m making small steps\ntowards my ',
                        text_span_2: 'vision',
                        text_span_3: '',
                        margin_top: 1.0),
                    const goal_criteria(
                        criteria: 'Goal Criteria 4',
                        identity: 'Impact on your\nlife',
                        text_span_1: 'It has ',
                        text_span_2: 'little impact ',
                        text_span_3: 'on\nmy life',
                        margin_top: 1.0),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 17.0,
                height: AppDimensions.height10 * 0.5,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 20.3,
                    bottom: AppDimensions.height10 * 1.0),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: const Color(0xFFFFFFFF).withOpacity(0.3)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class goal_criteria extends StatelessWidget {
  final String criteria;
  final String identity;
  final double margin_top;
  final String text_span_1;
  final String text_span_2;
  final String text_span_3;

  const goal_criteria(
      {super.key,
      required this.criteria,
      required this.identity,
      required this.text_span_1,
      required this.text_span_2,
      required this.text_span_3,
      required this.margin_top});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.height10 * 44.1,
      height: AppDimensions.height10 * 14.8,
      margin: EdgeInsets.only(top: AppDimensions.height10 * margin_top),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color(0xFFE97B74).withOpacity(0.9),
        const Color(0xFFD8C1C4).withOpacity(0.9)
      ])),
      child: Row(
        children: [
          Container(
            width: AppDimensions.height10 * 21.6,
            //  height: AppDimensions.height10 * 9.9,
            margin: EdgeInsets.only(
                left: AppDimensions.height10 * 3.0,
                top: AppDimensions.height10 * 2.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppDimensions.height10 * 19.6,
                  height: AppDimensions.height10 * 2.2,
                  child: Text(
                    criteria,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimensions.height10 * 1.6,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
                SizedBox(
                  width: AppDimensions.height10 * 21.6,
                  // height: AppDimensions.height10 * 3.7,
                  child: Text(
                    identity,
                    style: TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.height10 * 2.4,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
                SizedBox(
                    width: AppDimensions.height10 * 19.2,
                    // height: AppDimensions.height10 * 4.0,
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'laila',

                                fontWeight: FontWeight.w400,
                                fontSize: AppDimensions.height10 * 1.6,
                                color: const Color(0xFFFFFFFF)),
                            children: [
                          TextSpan(text: text_span_1),
                          TextSpan(
                              text: text_span_2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700)),
                          TextSpan(text: text_span_3)
                        ])))
              ],
            ),
          ),
          Container(
            width: AppDimensions.height10 * 8.7,
            height: AppDimensions.height10 * 8.7,
            margin: EdgeInsets.only(left: AppDimensions.height10 * 1.0),
            decoration: goal_level != 0
                ? BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFFFFFFF))
                : BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                        width: AppDimensions.height10 * 0.1,
                        color: Color(0xFFFFFFFF))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppDimensions.height10 * 3.4,
                  height: AppDimensions.height10 * 1.3,
                  child: Text(
                    'Level',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.4,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF646464)),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 3.2,
                  height: AppDimensions.height10 * 3.7,
                  margin: EdgeInsets.only(left: AppDimensions.height10 * 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$goal_level',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF646464)),
                      ),
                      Text(
                        '/5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF828282)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              width: AppDimensions.height10 * 2.4,
              height: AppDimensions.height10 * 1.31,
              margin: EdgeInsets.only(left: AppDimensions.height10 * 1.7),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/BTN Back.png',
                  color: const Color(0xFFFFFFFF),
                  //width: AppDimensions.height10 * 2.6,
                  //height: AppDimensions.height10 * 2.6,
                  fit: BoxFit.cover,
                ),
              )),
        ],
      ),
    );
  }
}

void evaluation_sheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.height10 * 2.0),
      )),
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: AppDimensions.height10 * 41.4,
              height: AppDimensions.height10 * 80.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppDimensions.height10 * 2.0)),
                  color: const Color(0xFFFBFBFB)),
              child: Column(
                children: [
                  Container(
                    //color: Colors.amber,
                    // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                    alignment: const Alignment(1, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensions.height10 * 2.6,
                        height: AppDimensions.height10 * 2.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 1.5,
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Close_blue.png'))),
                      ),
                    ),
                  ),
                  Container(
                    // width: AppDimensions.height10 * 8.202,
                    // height: AppDimensions.height10 * 11.2,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.9),
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image:
                    //             AssetImage('assets/images/potenic__icon.png'),
                    //         fit: BoxFit.contain)),
                    child: Image.asset(
                      'assets/images/potenic__icon.png',
                      width: AppDimensions.height10 * 8.202,
                      height: AppDimensions.height10 * 11.2,
                    ),
                  ),
                  Container(
                    // width: AppDimensions.height10 * 35.5,
                    height: AppDimensions.height10 * 3.6,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.9),
                    child: Text(
                      'Goal Level Evaluation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 35.2,
                    height: AppDimensions.height10 * 56.0,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.1),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                height: 1.2,
                                fontFamily: 'laila',
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF437296)),
                            children: const [
                          TextSpan(
                              text:
                                  'It’s important to have clarity on the progress you’re\nmaking with your personal development goals.\n\nFor this purpose, we’ve created a '),
                          TextSpan(
                              text: 'Goal Level\nEvaluation ',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          TextSpan(
                              text:
                                  'feature to help you assess your goal\nprogress in relation to your original reasons for\nwanting to achieve it (remember the statements you\nhad to complete during onboarding and creating your\ngoal? We use these exact reasons for you to evaluate).\n\n'),
                          TextSpan(
                              text: 'Goal Level Evaluation ',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          TextSpan(
                              text:
                                  'has four core criteria that you’ll need to assess:\n\n 1.Your why’s\n 2.Your new identity\n 3.Your vision for new self\n 4.Impact on your life\n\nBy navigating to each of different criteria, you would\nbe able to '),
                          TextSpan(
                              text: 'evaluate your progress.\n\n',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          TextSpan(
                              text:
                                  'Have fun with it, but also make sure you’re honest\nwith yourself. It’s totally ok to give yourself a low level\nscore if you feel you’re not making a considerable\nprogress yet. This way, we can better support you.\n\nDepending on a goal, some take longer that others to\nachieve. What matters is the '),
                          TextSpan(
                              text: 'daily practices ',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          TextSpan(
                              text:
                                  ' you perform\nthat will eventually help you observe\nmeaningful changes into your life.'),
                        ])),
                  )
                ],
              ),
            ),
          ));
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
    '01 Jan 23 to 01 Feb 23 (2/5) ',
    '01 Dec 22 to 01 Jan 23 (-/5)  ',
    '01 Nov 22 to 01 Dec 22 (2/5)  ',
    '01 Oct 22 to 01 Nov 22 (3/5)  ',
    '01 Sep 22 to 01 Oct 22 (2/5)  ',
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
