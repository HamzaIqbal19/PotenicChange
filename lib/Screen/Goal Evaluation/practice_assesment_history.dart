import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';

import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class practice_assesment extends StatefulWidget {
  const practice_assesment({super.key});

  @override
  State<practice_assesment> createState() => _practice_assesmentState();
}

class _practice_assesmentState extends State<practice_assesment> {
  var goalDetails;
  var pracDetails;
  bool Loader = true;

  void fetchGoalDetails() async {
    final SharedPreferences prefs = await _prefs;

    AdminGoal.getUserGoalById(prefs.get('goal_num')).then((response) async {
      if (response.length != 0) {
        setState(() {
          goalDetails = response;
          pracDetails = response['userPractices'];
        });
        print('Practices<==================>$pracDetails');
        loadData();
        print(response);
      } else {
        loadData();
      }
    }).catchError((error) {
      print("error");
    }).whenComplete(() {});
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchGoalDetails();
  }

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
                'assets/images/Back.webp',
                width: AppDimensions.height10(context) * 2.6,
                height: AppDimensions.height10(context) * 2.6,
                fit: BoxFit.cover,
              )),
        ),
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
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/prac_assesment.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              // width: AppDimensions.height10(context) * 27.9,
              // alignment: Alignment.center,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 5.2),
              child: const Text(
                'Practice Assessment History',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              width: AppDimensions.height10(context) * 41.3,
              height: AppDimensions.height10(context) * 22.9,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 4.5),
              child: Stack(children: [
                Align(
                  alignment: const Alignment(1, -1.3),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/ic_info_outline.webp',
                        height: AppDimensions.height10(context) * 3.0,
                        width: AppDimensions.height10(context) * 3.0,
                      )),
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: SizedBox(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 24.7,
                    child: Column(
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 5.9,
                          width: AppDimensions.height10(context) * 36.0,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.2),
                          child: Column(children: [
                            SizedBox(
                              height: AppDimensions.height10(context) * 2.1,
                              child: Text(
                                'Practice Assessment',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 1.7,
                              child: Text(
                                'Here is your latest 20 active day evaluation.',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                            Container(
                              height: AppDimensions.height10(context) * 1.7,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.3),
                              child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontFamily: 'laila',
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.15,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xfff5f5f5)),
                                      children: const [
                                    TextSpan(text: 'Next assessment is in'),
                                    TextSpan(
                                        text: '-19 active days.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700))
                                  ])),
                            )
                          ]),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom:
                                      AppDimensions.height10(context) * 1.2),
                              child: const button_feilds(
                                feild_text: 'Progress report',
                                icon_viible: true,
                                text_color: 0xff646464,
                                feild_text_2: ' DD/MMM/YY',
                                text_color_2: 0xff8EA1B1,
                                feild_text_3: '',
                                feild_text_4: '',
                              ),
                            ),
                            const button_feilds(
                              feild_text: 'Evaluation level ',
                              icon_viible: true,
                              text_color: 0xff646464,
                              feild_text_2: '(',
                              text_color_2: 0xff8EA1B1,
                              feild_text_3: '2',
                              feild_text_4: '/5)',
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              width: double.infinity,
              height: AppDimensions.height10(context) * 0.1,
              color: const Color(0xFFFFFFFF).withOpacity(0.5),
              // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
            ),
            Container(
              width: AppDimensions.height10(context) * 41.3,
              height: AppDimensions.height10(context) * 22.9,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
              child: Stack(children: [
                Align(
                  alignment: const Alignment(0.9, -1.3),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/ic_info_outline.webp',
                        height: AppDimensions.height10(context) * 3.0,
                        width: AppDimensions.height10(context) * 3.0,
                      )),
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: SizedBox(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 24.7,
                    child: Column(
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 5.9,
                          width: AppDimensions.height10(context) * 36.0,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.2),
                          child: Column(children: [
                            SizedBox(
                              height: AppDimensions.height10(context) * 2.1,
                              child: Text(
                                'Practice Assessment',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 3.4,
                              child: Text(
                                'Here is your 20 active day evaluation\nfor periods DD/MMM/YY to DD/MMM/YY.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                          ]),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom:
                                      AppDimensions.height10(context) * 1.2),
                              child: const button_feilds(
                                feild_text: 'Progress report',
                                icon_viible: true,
                                text_color: 0xff646464,
                                feild_text_2: ' DD/MMM/YY',
                                text_color_2: 0xff8EA1B1,
                                feild_text_3: '',
                                feild_text_4: '',
                              ),
                            ),
                            const button_feilds(
                              feild_text: 'Evaluation level ',
                              icon_viible: true,
                              text_color: 0xff646464,
                              feild_text_2: '(',
                              text_color_2: 0xff8EA1B1,
                              feild_text_3: '2',
                              feild_text_4: '/5)',
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              width: double.infinity,
              height: AppDimensions.height10(context) * 0.1,
              color: const Color(0xFFFFFFFF).withOpacity(0.5),
              // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
            ),
            Container(
              width: AppDimensions.height10(context) * 41.3,
              height: AppDimensions.height10(context) * 22.9,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
              child: Stack(children: [
                Align(
                  alignment: const Alignment(0.9, -1.3),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/ic_info_outline.webp',
                        height: AppDimensions.height10(context) * 3.0,
                        width: AppDimensions.height10(context) * 3.0,
                      )),
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: SizedBox(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 24.7,
                    child: Column(
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 5.9,
                          width: AppDimensions.height10(context) * 36.0,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.2),
                          child: Column(children: [
                            SizedBox(
                              height: AppDimensions.height10(context) * 2.1,
                              child: Text(
                                'Practice Assessment',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 3.4,
                              child: Text(
                                'Here is your 20 active day evaluation\nfor periods DD/MMM/YY to DD/MMM/YY.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                          ]),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom:
                                      AppDimensions.height10(context) * 1.2),
                              child: const button_feilds(
                                feild_text: 'Progress report',
                                icon_viible: true,
                                text_color: 0xff646464,
                                feild_text_2: ' DD/MMM/YY',
                                text_color_2: 0xff8EA1B1,
                                feild_text_3: '',
                                feild_text_4: '',
                              ),
                            ),
                            const button_feilds(
                              feild_text: 'Evaluation level ',
                              icon_viible: true,
                              text_color: 0xff646464,
                              feild_text_2: '(',
                              text_color_2: 0xff8EA1B1,
                              feild_text_3: '2',
                              feild_text_4: '/5)',
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              width: double.infinity,
              height: AppDimensions.height10(context) * 0.1,
              color: const Color(0xFFFFFFFF).withOpacity(0.5),
              // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
            ),
            Container(
              width: AppDimensions.height10(context) * 41.3,
              height: AppDimensions.height10(context) * 22.9,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
              child: Stack(children: [
                Align(
                  alignment: const Alignment(0.9, -1.3),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/ic_info_outline.webp',
                        height: AppDimensions.height10(context) * 3.0,
                        width: AppDimensions.height10(context) * 3.0,
                      )),
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: SizedBox(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 24.7,
                    child: Column(
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 5.9,
                          width: AppDimensions.height10(context) * 36.0,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.2),
                          child: Column(children: [
                            SizedBox(
                              height: AppDimensions.height10(context) * 2.1,
                              child: Text(
                                'Practice Assessment',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 3.4,
                              child: Text(
                                'Here is your 20 active day evaluation\nfor periods DD/MMM/YY to DD/MMM/YY.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                          ]),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom:
                                      AppDimensions.height10(context) * 1.2),
                              child: const button_feilds(
                                feild_text: 'Progress report',
                                icon_viible: true,
                                text_color: 0xff646464,
                                feild_text_2: ' DD/MMM/YY',
                                text_color_2: 0xff8EA1B1,
                                feild_text_3: '',
                                feild_text_4: '',
                              ),
                            ),
                            const button_feilds(
                              feild_text: 'Evaluation level ',
                              icon_viible: true,
                              text_color: 0xff646464,
                              feild_text_2: '(',
                              text_color_2: 0xff8EA1B1,
                              feild_text_3: '2',
                              feild_text_4: '/5)',
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              width: double.infinity,
              height: AppDimensions.height10(context) * 0.1,
              color: const Color(0xFFFFFFFF).withOpacity(0.5),
              // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
            ),
          ],
        )),
      ),
    );
  }
}
