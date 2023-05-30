// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class prac_score extends StatefulWidget {
  const prac_score({
    super.key,
  });

  @override
  State<prac_score> createState() => _prac_scoreState();
}

class _prac_scoreState extends State<prac_score> {
  bool select_item = true;
  bool bt_visible = false;
  bool saved = false;
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
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Background.png'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: AppDimensions.height10 * 36.5,
                height: AppDimensions.height10 * 48.2,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.4),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 2.0),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFF9DCC0).withOpacity(0),
                        const Color(0XFF825179).withOpacity(1)
                      ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: AppDimensions.height10 * 30.1,
                      height: AppDimensions.height10 * 3.6,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 7.1),
                      child: Text(
                        'Practice Evaluation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 3.0,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 32.1,
                      height: AppDimensions.height10 * 4.4,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 3.1),
                      alignment: Alignment.topCenter,
                      child: Text(
                        '‘Meditation’ for goal ‘Control My Anger’\n20 active day',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 32.1,
                      height: AppDimensions.height10 * 1.9,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 2.5),
                      child: Text(
                        'from [dd/mmm/yy] to [dd/mmm/yy]',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 8.7,
                      height: AppDimensions.height10 * 8.7,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 3.2),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: AppDimensions.height10 * 0.1,
                            color: const Color(0xFFFFFFFF)),
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
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
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10 * 3.2,
                            height: AppDimensions.height10 * 3.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 2.4,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                                Text(
                                  '/5',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 28.8,
                      height: AppDimensions.height10 * 4.2,
                      alignment: Alignment.topCenter,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 3.3),
                      child: Text(
                        'Please assess the practice on helping\nyou reach your goal so far...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      // width: AppDimensions.height10 * 2.1,
                      //height: AppDimensions.height10 * 4.3,

                      child: Image.asset(
                        'assets/images/Arrow.png',
                        width: AppDimensions.height10 * 4.1,
                        height: AppDimensions.height10 * 4.1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 37.0,
                height: AppDimensions.height10 * 11.9,
                margin: EdgeInsets.only(
                  top: AppDimensions.height10 * 4.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppDimensions.height10 * 15.5,
                      height: AppDimensions.height10 * 2.9,
                      child: Text(
                        'Question 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.0,
                      height: AppDimensions.height10 * 4.9,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                      child: Text(
                        'How effective has this practice been in\nmoving you closer to reaching your goal?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.9,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 16.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    left: AppDimensions.height10 * 0.425),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  'No help at all',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          width: AppDimensions.height10 * 12.95,
                          height: AppDimensions.height10 * 12.95,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 1.5),
                          child: Stack(children: [
                            Container(
                              width: AppDimensions.height10 * 12.95,
                              height: AppDimensions.height10 * 12.95,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: select_item
                                      ? const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                              Color(0xFFA88CA5),
                                              Color(0xFFBF9BA7)
                                            ])
                                      : const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                              Color(0XFFFFFFFF),
                                              Color(0xFFFFFFFF)
                                            ]),
                                  border: Border.all(
                                      width: AppDimensions.height10 * 0.3,
                                      color: select_item
                                          ? const Color(0xFFFFFFFF)
                                          : const Color(0xFFEE8F70))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 3.2,
                                          fontWeight: FontWeight.w500,
                                          color: select_item
                                              ? const Color(0xFFFFFFFF)
                                              : const Color(0xFFFA9934)),
                                    ),
                                  ),
                                  Text(
                                    'There is slow\nprogress',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: select_item
                                            ? const Color(0xFFFFFFFF)
                                            : const Color(0xFFFA9934)),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 1.35),
                              child: Container(
                                width: AppDimensions.height10 * 4.0,
                                height: AppDimensions.height10 * 4.0,
                                padding: EdgeInsets.all(
                                    AppDimensions.height10 * 0.2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xFFFFFFFF))),
                                child: Container(
                                  width: AppDimensions.height10 * 2.4,
                                  height: AppDimensions.height10 * 2.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xFFFFFFFF)),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Tick.png'))),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "There've been\nsome\nprogress",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "There's been\ngood\nimprovement",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "It's been very\neffective so\nfar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 7.2,
                height: AppDimensions.height10 * 0.1,
                color: const Color(0xFFFFFFFF),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    bottom: AppDimensions.height10 * 3.0),
              ),
              Container(
                width: AppDimensions.height10 * 37.0,
                height: AppDimensions.height10 * 11.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppDimensions.height10 * 15.5,
                      height: AppDimensions.height10 * 2.9,
                      child: Text(
                        'Question 2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.0,
                      height: AppDimensions.height10 * 5.1,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                      child: Text(
                        'How much have you enjoyed performing\nthe practice during this period?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.9,
                            //height: AppDimensions.height10 * 0.12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  enjoyment(context);
                },
                child: Container(
                  // margin: EdgeInsets.only(
                  //   top: AppDimensions.height10 * 0.7,
                  // ),
                  child: Image.asset(
                    "assets/images/ic_info_outline.png",
                    width: AppDimensions.height10 * 3.0,
                    height: AppDimensions.height10 * 3.0,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 16.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 4.725,
                    left: AppDimensions.height10 * 0.425),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  'Didn’t like it,\nnot useful to\nme',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "It's not been\nbad",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "I'm starting to\nenjoy it",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  'I quite like\nworking on it',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "It's been fun\nand truly\nenjoyable",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 7.2,
                height: AppDimensions.height10 * 0.1,
                color: const Color(0xFFFFFFFF),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    bottom: AppDimensions.height10 * 3.0),
              ),
              Container(
                width: AppDimensions.height10 * 37.0,
                height: AppDimensions.height10 * 11.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppDimensions.height10 * 15.5,
                      height: AppDimensions.height10 * 2.9,
                      child: Text(
                        'Question 3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.0,
                      //  height: AppDimensions.height10 * 7.0,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                      child: Text(
                        'How confident are you that this\npractice will help move you closer\ntowards your goal?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.9,
                            // height: 1.2,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 16.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    left: AppDimensions.height10 * 0.425),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "I don't feel\nconfident at\nthis point",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  'I feel it is\npossible',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 3.2,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF8C648A)),
                                ),
                                Text(
                                  'I feel it is\npossible',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 3.2,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF8C648A)),
                                ),
                                Text(
                                  "It's helping me\nalready",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  'Very confident',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 7.2,
                height: AppDimensions.height10 * 0.1,
                color: const Color(0xFFFFFFFF),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    bottom: AppDimensions.height10 * 3.0),
              ),
              Container(
                width: AppDimensions.height10 * 37.0,
                height: AppDimensions.height10 * 11.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppDimensions.height10 * 15.5,
                      height: AppDimensions.height10 * 2.9,
                      child: Text(
                        'Question 4',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.0,
                      height: AppDimensions.height10 * 6.8,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                      child: Text(
                        'How easy is it to implement this\npractice in to your life?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.9,
                            //  height: 1.2,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 16.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    left: AppDimensions.height10 * 0.425),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "I feel it's\nalmost\nimpossible",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  'It feels\nchallenging',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "I find it hard,\nbut willing to\nwork on it",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  'NRelatively easy',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFA17F9E),
                              Color(0xFFC9AFBA)
                            ])),
                        child: Center(
                          child: Container(
                            width: AppDimensions.height10 * 12.95 - 4,
                            height: AppDimensions.height10 * 12.95 - 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFFFFF),
                              // border: Border.all(
                              //     width: AppDimensions.height10 * 0.3,
                              //     color: const Color(0xFF8C648A))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF8C648A)),
                                  ),
                                ),
                                Text(
                                  "It's tough\nwork, but I am\nenjoying it",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF8C648A)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              saved
                  ? Container(
                      width: AppDimensions.height10 * 38.259,
                      height: AppDimensions.height10 * 9.707,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 9.9,
                          bottom: AppDimensions.height10 * 2.193),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.261),
                            width: AppDimensions.height10 * 4.437,
                            height: AppDimensions.height10 * 4.437,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/circle_tick.png'))),
                          ),
                          Container(
                            width: AppDimensions.height10 * 10.8,
                            height: AppDimensions.height10 * 3.673,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.232),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  //  width: AppDimensions.height10 * 4.6,
                                  height: AppDimensions.height10 * 1.4,
                                  //   color: Colors.amber,
                                  child: Text(
                                    'Changes saved',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.3,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                SizedBox(
                                  // width: AppDimensions.height10 * 6.9,
                                  height: AppDimensions.height10 * 2.2,
                                  child: Text(
                                    'Goal Criteria',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                saved = false;
                              });
                            },
                            child: Container(
                              width: AppDimensions.height10 * 8.1,
                              height: AppDimensions.height10 * 6.0,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 11.2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFFFFFFFF), width: 1),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 2.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Undo',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      width: AppDimensions.height10 * 35.4,
                      height: AppDimensions.height10 * 5.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 10.9,
                          bottom: AppDimensions.height10 * 3.6),
                      child: Row(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 8.0,
                            height: AppDimensions.height10 * 5.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 5.0),
                            ),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Cancel',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w600,
                                      color: bt_visible
                                          ? const Color(0xFFFA9934)
                                          : const Color(0xFFFA9934)
                                              .withOpacity(0.5)),
                                )),
                          ),
                          Container(
                            width: AppDimensions.height10 * 8.0,
                            height: AppDimensions.height10 * 5.0,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 5.0),
                            ),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Clear',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w600,
                                      color: bt_visible
                                          ? const Color(0xFFFA9934)
                                          : const Color(0xFFFA9934)
                                              .withOpacity(0.5)),
                                )),
                          ),
                          Container(
                            width: AppDimensions.height10 * 17.4,
                            height: AppDimensions.height10 * 5.0,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.0),
                            decoration: BoxDecoration(
                              gradient: bt_visible
                                  ? const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffFCC10D),
                                        Color(0xffFDA210),
                                      ],
                                    )
                                  : LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(0xffFCC10D)
                                            .withOpacity(0.5),
                                        const Color(0xffFDA210)
                                            .withOpacity(0.5),
                                      ],
                                    ),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 5.0),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (bt_visible == true) {
                                    setState(() {
                                      saved = true;
                                    });
                                  }
                                },
                                child: Text(
                                  'Save updates',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w600,
                                      color: bt_visible
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.5)),
                                )),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

void enjoyment(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10 * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10 * 39.4,
          height: AppDimensions.height10 * 62.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.height10 * 2.0),
                  topRight: Radius.circular(AppDimensions.height10 * 2.0)),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
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
                        top: AppDimensions.height10 * 1.9,
                        right: AppDimensions.height10 * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Close_blue.png'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 1.5,
                    bottom: AppDimensions.height10 * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.png',
                  width: AppDimensions.height10 * 8.202,
                  height: AppDimensions.height10 * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.height10 * 30.7,
                height: AppDimensions.height10 * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                child: Text(
                  'How we define\n‘enjoyment’',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10 * 0.15,
                      fontSize: AppDimensions.height10 * 3.0,
                      // letterSpacing: AppDimensions.height10 * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensions.height10 * 35.2,
                  //  height: AppDimensions.height10 * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.9),
                  child: RichText(
                      //textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontFamily: 'laila',
                              height: AppDimensions.height10 * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: [
                        TextSpan(text: 'When we talk about'),
                        const TextSpan(
                            text: ' ‘enjoyment’ ',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                                "we generally mean a\nsatisfying experience of performing a certain action.\n\nHowever,"),
                        const TextSpan(
                            text: ' ‘enjoyment’ ',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                                "can mean different things for\ndifferent people depending on time, environment and\ncontext.\n\nFor Potenic and this question specifically,"),
                        const TextSpan(
                            text: ' ‘enjoyment’ ',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                                "means few things:\n\n1. Feeling empowered\n2. Being in control\n3. Making progress\n4. Having choice\nHaving freedom\n\nWhen you evaluate your practice for this question, just bear this in mind to help you :)")
                      ]))),
            ],
          )),
    ),
  );
}
