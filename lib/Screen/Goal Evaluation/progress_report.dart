import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/menu_buttons.dart';

import '../../Widgets/calender.dart';
import '../../utils/app_dimensions.dart';

class progress_report extends StatelessWidget {
  const progress_report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/GoalReviewBg.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10 * 40.872,
                height: AppDimensions.height10 * 11.0,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 11.1,
                    right: AppDimensions.height10 * 10.7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.height10 * 2.0),
                        bottomRight:
                            Radius.circular(AppDimensions.height10 * 2.0)),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF91698C), Color(0xFFC19CA7)])),
                child: Container(
                  width: AppDimensions.height10 * 24.3,
                  height: AppDimensions.height10 * 7.0,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 24.3,
                        height: AppDimensions.height10 * 2.6,
                        child: Text(
                          'Practice progress report',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.0,
                              height: AppDimensions.height10 *0.12,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 3.3,
                        height: AppDimensions.height10 * 0.2,
margin: EdgeInsets.only(bottom: AppDimensions.height10*1.7,top: AppDimensions.height10*0.45),
                        decoration:
                            const BoxDecoration(color: Color(0xFFFFFFFF)),
                      ),
                      Container(
                        width: AppDimensions.height10 * 10.1,
                        height: AppDimensions.height10 * 2.4,
                        child: Text(
                          'Meditation',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.0,
                              height: AppDimensions.height10 *0.12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 31.7,
                height: AppDimensions.height10 * 3.6,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 5.0),
                child: Text(
                  'Congratulations!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 3.0,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 35.0,
                height: AppDimensions.height10 * 5.0,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.7),
                child: Text(
                  'You have been consistently doing\nyour practice for 20 active days ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.0,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 35.0,
                height: AppDimensions.height10 * 3.3,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.5),
                child: Text(
                  //we will give duration of 20 days
                  'from [dd/mmm/yy] to [dd/mmm/yy]',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.6,
                      height: 1.2,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 25.5,
                height: AppDimensions.height10 * 3.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 1.9),
                child: Text(
                  'You are a rockstar! :)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.2,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 29.0,
                height: AppDimensions.height10 * 11.2,
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 10.4,
                      height: AppDimensions.height10 * 11.2,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 0.7),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/orange_flair.png'))),
                      child: Align(
                        alignment: const Alignment(0.7, 0.4),
                        child: Container(
                          width: AppDimensions.height10 * 4.9,
                          height: AppDimensions.height10 * 4.9,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: AppDimensions.height10 * 0.2,
                                color: const Color(0xFFFFFFFF),
                              ),
                              gradient: const RadialGradient(colors: [
                                Color(0xFFB3F0D1),
                                Color(0xFF1A481C)
                              ])),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 17.9,
                      height: AppDimensions.height10 * 5.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 17.9,
                            height: AppDimensions.height10 * 3.0,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10 * 0.1),
                            child: Text(
                              'Control my anger',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 2.0,
                                  height: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF437296)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 17.9,
                            height: AppDimensions.height10 * 2.7,
                            child: Text(
                              'Meditation ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  height: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF156F6D)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // width: AppDimensions.height10 * 2.1,
                //height: AppDimensions.height10 * 4.3,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                child: Image.asset(
                  'assets/images/Arrow.png',
                  width: AppDimensions.height10 * 4.1,
                  height: AppDimensions.height10 * 4.3,
                ),
              ),
              Container(
                width: double.infinity,
                //padding: EdgeInsets.all(0),
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.7),
                height: AppDimensions.height10 * 63.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/pro_report_bg#2.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 27.4,
                      height: AppDimensions.height10 * 2.9,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 7.0),
                      child: Text(
                        'New identity statement',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    SizedBox(
                      width: AppDimensions.height10 * 35.6,
                      height: AppDimensions.height10 * 10.9,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-0.875, -0.5),
                            child: Container(
                              width: AppDimensions.height10 * 2.5,
                              height: AppDimensions.height10 * 1.6,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/colon.png'),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(1, 0),
                            child: SizedBox(
                              width: AppDimensions.height10 * 34.7,
                              height: AppDimensions.height10 * 10.9,

                              ///color: Colors.amber,
                              child: Center(
                                child: Text(
                                  "I am in control of my anger, and I see\nmyself as a calm individual who acts level\nheaded in tense situations...",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.italic,
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: AppDimensions.height10 * 30.517,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 3.0,
                        // left: AppDimensions.height10 * 2.7
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 33.153,
                              height: AppDimensions.height10 * 30.517,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 2.8098,
                                  right: AppDimensions.height10 * 1.098),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Rectangle 148.png'))),
                            ),
                            Container(
                              width: AppDimensions.height10 * 33.153,
                              height: AppDimensions.height10 * 30.517,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 1.098),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Rectangle 178.png'))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 27.2,
                height: AppDimensions.height10 * 5.369,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 7.0),
                child: Text(
                  'You have completed 20 active days of practice!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.4,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 38.5,
                height: AppDimensions.height10 * 84.569,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.7),
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
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Group 9458.png'))),
                    ),
                    Container(
                      height: AppDimensions.height10 * 8.0,
                      width: AppDimensions.height10 * 23,
                      child: Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'laila',
                                  height: 1.2,
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF5B74A6),
                                ),
                                children: [
                                  const TextSpan(
                                      text: 'You have completed this\nover '),
                                  const TextSpan(
                                      text: '2 months',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700))
                                ])),
                      ),
                    ),
                    Container(
                        height: AppDimensions.height10 * 46.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0)),
                        child: CalendarWithRadioButtons()),
                  ],
                ),
              ),
              Container(
                // width: AppDimensions.height10 * 2.1,
                //height: AppDimensions.height10 * 4.3,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.7),
                child: Image.asset(
                  'assets/images/Arrow.png',
                  width: AppDimensions.height10 * 4.1,
                  height: AppDimensions.height10 * 4.3,
                ),
              ),
              Container(
                width: AppDimensions.height10 * 27.2,
                height: AppDimensions.height10 * 8.5,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.0),
                child: Text(
                  'This is how you felt\nimplementing your new\npractice',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.4,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 38.2,
                height: AppDimensions.height10 * 90.8,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.0),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: const Color(0xFFFFFFFFF)),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 38.2,
                      height: AppDimensions.height10 * 51.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppDimensions.height10 * 2.0),
                          ),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFEDF1FA),
                                Color(0xFFFCD9C3),
                                Color(0xFFFAB2A3),
                                Color(0xFFEB9FA3)
                              ])),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 20.0,
                            height: AppDimensions.height10 * 20.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 5.1),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Day Count.png'))),
                          ),
                          Container(
                            width: AppDimensions.height10 * 8.4,
                            height: AppDimensions.height10 * 0.2,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 0.9),
                            color: const Color(0xFFFFFFFF),
                          ),
                          Container(
                            width: AppDimensions.height10 * 30.9,
                            height: AppDimensions.height10 * 3.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 0.6),
                            child: Center(
                              child: Text(
                                'Majority of the time',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.8,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 30.9,
                            height: AppDimensions.height10 * 3.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 1.2),
                            child: Center(
                              child: Text(
                                '“I felt focused & good”',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.8,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFFD6F32)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 1.2),
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 4.5,
                                        fontFamily: 'laila',
                                        height: 1.2,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFFFFFFF)),
                                    children: [
                                  const TextSpan(text: '11'),
                                  TextSpan(
                                      text: 'x',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 2.0))
                                ])),
                          ),
                          Container(
                            width: AppDimensions.height10 * 10.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                5, // Replace 5 with the number of containers you want to create
                                (index) => Container(
                                  width: AppDimensions.height10 * 1.5,
                                  height: AppDimensions.height10 * 1.5,
                                  margin: EdgeInsets.all(
                                      AppDimensions.height10 * 0.3),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFF6C2C),
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 10.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                5, // Replace 5 with the number of containers you want to create
                                (index) => Container(
                                  width: AppDimensions.height10 * 1.5,
                                  height: AppDimensions.height10 * 1.5,
                                  margin: EdgeInsets.all(
                                      AppDimensions.height10 * 0.3),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFF6C2C),
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 10.5,
                            //height: AppDimensions.height10 * 1.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                1, // Replace 5 with the number of containers you want to create
                                (index) => Container(
                                  width: AppDimensions.height10 * 1.5,
                                  height: AppDimensions.height10 * 1.5,
                                  margin: EdgeInsets.all(
                                      AppDimensions.height10 * 0.3),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFF6C2C),
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 17.7,
                      height: AppDimensions.height10 * 3.4,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 2.4),
                      child: Center(
                        child: Text(
                          '“It was ok”',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.8,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFEDD264)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: AppDimensions.height10 * 0),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 4.5,
                                  fontFamily: 'laila',
                                  height: 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFEDD264)),
                              children: [
                            const TextSpan(text: '5'),
                            TextSpan(
                                text: 'x',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.0))
                          ])),
                    ),
                    Container(
                      width: AppDimensions.height10 * 10.5,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          5, // Replace 5 with the number of containers you want to create
                          (index) => Container(
                            width: AppDimensions.height10 * 1.5,
                            height: AppDimensions.height10 * 1.5,
                            margin:
                                EdgeInsets.all(AppDimensions.height10 * 0.3),
                            decoration: const BoxDecoration(
                                color: Color(0xFFEDD264),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 34.1,
                      height: AppDimensions.height10 * 3.4,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 5.5),
                      child: Center(
                        child: Text(
                          '“I felt low and irritated”',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.8,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF7190A0)),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 0.8),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 4.5,
                                  fontFamily: 'laila',
                                  height: 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF7190A0)),
                              children: [
                            const TextSpan(text: '4'),
                            TextSpan(
                                text: 'x',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.0))
                          ])),
                    ),
                    Container(
                      width: AppDimensions.height10 * 10.5,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4, // Replace 5 with the number of containers you want to create
                          (index) => Container(
                            width: AppDimensions.height10 * 1.5,
                            height: AppDimensions.height10 * 1.5,
                            margin:
                                EdgeInsets.all(AppDimensions.height10 * 0.3),
                            decoration: const BoxDecoration(
                                color: Color(0xFF7190A0),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 22.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 12.1),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(


                        colors: [Color(0xFF91698C), Color(0xFFC19CA7)])),
                child: Container(
                  width: AppDimensions.height10 * 36.0,
                  height: AppDimensions.height10 * 16.9,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10 * 36.0,
                        height: AppDimensions.height10 * 1.9,
                        child: Text(
                          'Practice Assessment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.6,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFF5F5F5)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 35.0,
                        height: AppDimensions.height10 * 1.8,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 0.8,
                            bottom: AppDimensions.height10 * 1.2),
                        child: Text(
                          'Your latest 20 active day evaluation.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              height: 1.2,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFF5F5F5)),
                        ),
                      ),
                      const button_feilds(
                          feild_text: 'Practice score (2/5)',
                          icon_viible: true,
                          text_color: 0xFF646464,
                          feild_text_2: ''),
                      Container(
                        width: AppDimensions.height10 * 36.0,
                        height: AppDimensions.height10 * 6.0,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: AppDimensions.height10 * 0.1,
                                color: const Color(0xFFFFFFFF)),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),

                        ),
                        child: Center(
                          child: Container(
                          //  width: AppDimensions.height10 * 7.2,
                            height: AppDimensions.height10 * 2.1,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 0.2),
                            child: Center(
                              child: Text(
                                'Exit report',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.8,
                                    height: 1.2,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
