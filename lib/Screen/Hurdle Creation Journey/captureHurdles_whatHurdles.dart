import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdle_new_hurdle.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class what_hurdles extends StatefulWidget {
  const what_hurdles({super.key});

  @override
  State<what_hurdles> createState() => _what_hurdlesState();
}

class _what_hurdlesState extends State<what_hurdles> {
  int circle_state = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Buttons().backButton(context, () {
            Navigator.pop(context);
          }),
          centerTitle: true,
          title: Container(
            width: AppDimensions.width10(context) * 17.0,
            height: AppDimensions.height10(context) * 4.8,
            child: GradientText(
              'Hurdle‘s positive\nactions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.font10(context) * 2.0,
                fontWeight: FontWeight.w600,
              ),
              colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
            ),
          ),
          actions: [Buttons().closeButton(context, () {})]),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/practicebackground.webp'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              reverse: true,
              physics: const ClampingScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppDimensions.width10(context) * 34.3,
                      height: AppDimensions.height10(context) * 10.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 14.7),
                      child: GradientText(
                        'What actions can you take to get over this\nhurdle?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.8,
                          fontWeight: FontWeight.w700,
                        ),
                        colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                      ),
                    ),
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? SizedBox(
                            height: AppDimensions.height10(context) * 5.4,
                          )
                        : SizedBox(
                            height: AppDimensions.height10(context) * 3.2,
                          ),
                    Container(
                      height: MediaQuery.of(context).viewInsets.bottom == 0
                          ? AppDimensions.height10(context) * 46.5
                          : AppDimensions.height10(context) * 30.7,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            for (int i = 1; i <= circle_state; i++) ...[
                              Column(
                                children: [
                                  Container(
                                      width:
                                          AppDimensions.width10(context) * 18.1,
                                      height: AppDimensions.height10(context) *
                                          18.1,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  0.8),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xffFF783E),
                                                Color(0xffFF783E)
                                              ])),
                                      child: Container(
                                        width: AppDimensions.width10(context) *
                                            16.813,
                                        height:
                                            AppDimensions.height10(context) *
                                                6.83,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: TextField(
                                            expands: true,
                                            maxLines: null,
                                            minLines: null,
                                            scrollPhysics:
                                                const ClampingScrollPhysics(),
                                            decoration: InputDecoration(
                                                hintText: 'I feel...',
                                                hintStyle: TextStyle(
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent)),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent))),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                decorationThickness: 0,
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.4,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    width:
                                        AppDimensions.width10(context) * 12.2,
                                    height:
                                        AppDimensions.height10(context) * 2.0,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Character count: ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '100',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  MediaQuery.of(context).viewInsets.bottom == 0
                                      ? SizedBox(
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.7,
                                        )
                                      : SizedBox(
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                        ),
                                ],
                              ),
                            ],
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  circle_state = circle_state + 1;
                                });
                              },
                              child: Container(
                                width: AppDimensions.width10(context) * 4.7,
                                height: AppDimensions.height10(context) * 4.7,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 1.1),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    // border: Border.all(
                                    //     width: AppDimensions.width10(context) * 0.3,
                                    //     color: Colors.white)
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Addgoal.webp'))),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 21.7,
                              height: AppDimensions.height10(context) * 1.9,
                              child: Text(
                                'Add another thought/feeling',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.0,
                          bottom: AppDimensions.height10(context) * 1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: AppDimensions.height10(context) * 5.0,
                              width: AppDimensions.width10(context) * 12.8,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.width10(context) * 1.4),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    width: 1, color: const Color(0xffFA9934)),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 5.0),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context) *
                                            0.8),
                                    child: Text(
                                      'Reset',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Arial'),
                                    ),
                                  ))),
                          Container(
                              height: AppDimensions.height10(context) * 5.0,
                              width: AppDimensions.width10(context) * 21.2,
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
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const new_hurdles()));
                                  },
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Laila'),
                                  ))),
                        ],
                      ),
                    ),
                    // MediaQuery.of(context).viewInsets.bottom == 0
                    //     ? Container(
                    //         width: AppDimensions.width10(context) * 17.0,
                    //         height: AppDimensions.height10(context) * 0.5,
                    //         margin: EdgeInsets.only(
                    //             top: AppDimensions.height10(context) * 2.6,
                    //             bottom: AppDimensions.height10(context) * 1.0),
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(
                    //                 AppDimensions.height10(context) * 2.0),
                    //             color:
                    //                 const Color(0xFFFFFFFF).withOpacity(0.3)),
                    //       )
                    //     : SizedBox(
                    //         height: AppDimensions.height10(context) * 0,
                    //       ),
                    // Padding(
                    //     padding: EdgeInsets.only(
                    //         bottom: MediaQuery.of(context).viewInsets.bottom))
                  ]),
            )),
      ]),
    );
  }
}
