import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';

class felling_hurdles extends StatefulWidget {
  const felling_hurdles({super.key});

  @override
  State<felling_hurdles> createState() => _felling_hurdlesState();
}

class _felling_hurdlesState extends State<felling_hurdles> {
  int circle_state = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  width: AppDimensions.height10 * 3.0,
                  height: AppDimensions.height10 * 3.0,
                  fit: BoxFit.cover,
                )),
          ),
          centerTitle: true,
          title: Container(
            width: AppDimensions.height10 * 18.9,
            height: AppDimensions.height10 * 2.4,
            child: Row(
              children: [
                GradientText(
                  'Capture Hurdle ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.0,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  ' 5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.0,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  '/5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.0,
                    fontWeight: FontWeight.w400,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ],
            ),
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
      body: Stack(children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/practicebackground.png'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              reverse: true,
              physics: ClampingScrollPhysics(),
              child: Column(children: [
                Container(
                  width: AppDimensions.height10 * 34.3,
                  height: AppDimensions.height10 * 7.3,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 18.0),
                  child: GradientText(
                    'How do you feel when\nthis hurdle happens??',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.8,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10 * 8.5,
                      )
                    : SizedBox(
                        height: AppDimensions.height10 * 6.5,
                      ),
                Container(
                  height: MediaQuery.of(context).viewInsets.bottom == 0
                      ? AppDimensions.height10 * 46.5
                      : AppDimensions.height10 * 30.7,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        for (int i = 1; i <= circle_state; i++) ...[
                          Column(
                            children: [
                              Container(
                                  width: AppDimensions.height10 * 18.1,
                                  height: AppDimensions.height10 * 18.1,
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10 * 0.8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xff546096),
                                            Color(0xff54A7BC)
                                          ])),
                                  child: Container(
                                    width: AppDimensions.height10 * 16.813,
                                    height: AppDimensions.height10 * 6.83,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: Center(
                                      child: TextField(
                                        expands: true,
                                        maxLines: null,
                                        minLines: null,
                                        scrollPhysics: ClampingScrollPhysics(),
                                        decoration: InputDecoration(
                                            hintText: 'I feel...',
                                            hintStyle: TextStyle(
                                                fontSize: AppDimensions
                                                        .height10 *
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
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )),
                              Container(
                                width: AppDimensions.height10 * 12.2,
                                height: AppDimensions.height10 * 2.0,
                                child: Row(
                                  children: [
                                    Text(
                                      'Character count: ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.3,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '100',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.3,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              MediaQuery.of(context).viewInsets.bottom == 0
                                  ? SizedBox(
                                      height: AppDimensions.height10 * 3.7,
                                    )
                                  : SizedBox(
                                      height: AppDimensions.height10 * 1.5,
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
                            width: AppDimensions.height10 * 4.7,
                            height: AppDimensions.height10 * 4.7,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10 * 1.1),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // border: Border.all(
                                //     width: AppDimensions.height10 * 0.3,
                                //     color: Colors.white)
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Addgoal.png'))),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 21.7,
                          height: AppDimensions.height10 * 1.9,
                          child: Text(
                            'Add another thought/feeling',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10 * 5.9,
                      )
                    : Container(
                        height: AppDimensions.height10 * 5.0,
                        width: AppDimensions.height10 * 16.7,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10 * 1.0,
                            bottom: AppDimensions.height10 * 1.0),
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
                              AppDimensions.height10 * 5.0),
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => summary_hurdles()));
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins'),
                            ))),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? Container(
                        width: AppDimensions.height10 * 17.0,
                        height: AppDimensions.height10 * 0.5,
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10 * 1.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                            color: Color(0xFFFFFFFF).withOpacity(0.3)),
                      )
                    : SizedBox(
                        height: AppDimensions.height10 * 0,
                      ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ]),
            )),
      ]),
    );
  }
}
