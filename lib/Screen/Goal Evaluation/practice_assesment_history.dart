import 'package:flutter/material.dart';

import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';

class practice_assesment extends StatelessWidget {
  const practice_assesment({super.key});

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
                  'assets/images/Close.png',
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
          image: AssetImage('assets/images/Mask Group.png'),
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
              child: Text(
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
                        'assets/images/ic_info_outline.png',
                        height: AppDimensions.height10(context) * 3.0,
                        width: AppDimensions.height10(context) * 3.0,
                      )),
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: Container(
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
                            Container(
                              height: AppDimensions.height10(context) * 1.9,
                              child: Text(
                                'Practice Assessment',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                            Container(
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
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xfff5f5f5)),
                                      children: [
                                    TextSpan(text: 'Next assessment is in'),
                                    const TextSpan(
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
                              child: button_feilds(
                                feild_text: 'Progress report',
                                icon_viible: true,
                                text_color: 0xff828282,
                                feild_text_2: ' DD/MMM/YY',
                              ),
                            ),
                            button_feilds(
                              feild_text: 'Evaluation level (2/5)',
                              icon_viible: true,
                              text_color: 0xff828282,
                              feild_text_2: '',
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
                  alignment: const Alignment(1, -1.3),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/ic_info_outline.png',
                        height: AppDimensions.height10(context) * 3.0,
                        width: AppDimensions.height10(context) * 3.0,
                      )),
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: Container(
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
                            Container(
                              height: AppDimensions.height10(context) * 1.9,
                              child: Text(
                                'Practice Assessment',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                            Container(
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
                              child: button_feilds(
                                feild_text: 'Progress report',
                                icon_viible: true,
                                text_color: 0xff828282,
                                feild_text_2: ' DD/MMM/YY',
                              ),
                            ),
                            button_feilds(
                              feild_text: 'Evaluation level (2/5)',
                              icon_viible: true,
                              text_color: 0xff828282,
                              feild_text_2: '',
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
                  alignment: const Alignment(1, -1.3),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/ic_info_outline.png',
                        height: AppDimensions.height10(context) * 3.0,
                        width: AppDimensions.height10(context) * 3.0,
                      )),
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: Container(
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
                            Container(
                              height: AppDimensions.height10(context) * 1.9,
                              child: Text(
                                'Practice Assessment',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                            Container(
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
                              child: button_feilds(
                                feild_text: 'Progress report',
                                icon_viible: true,
                                text_color: 0xff828282,
                                feild_text_2: ' DD/MMM/YY',
                              ),
                            ),
                            button_feilds(
                              feild_text: 'Evaluation level (2/5)',
                              icon_viible: true,
                              text_color: 0xff828282,
                              feild_text_2: '',
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
                  alignment: const Alignment(1, -1.3),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/ic_info_outline.png',
                        height: AppDimensions.height10(context) * 3.0,
                        width: AppDimensions.height10(context) * 3.0,
                      )),
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: Container(
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
                            Container(
                              height: AppDimensions.height10(context) * 1.9,
                              child: Text(
                                'Practice Assessment',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xfff5f5f5)),
                              ),
                            ),
                            Container(
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
                              child: button_feilds(
                                feild_text: 'Progress report',
                                icon_viible: true,
                                text_color: 0xff828282,
                                feild_text_2: ' DD/MMM/YY',
                              ),
                            ),
                            button_feilds(
                              feild_text: 'Evaluation level (2/5)',
                              icon_viible: true,
                              text_color: 0xff828282,
                              feild_text_2: '',
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
