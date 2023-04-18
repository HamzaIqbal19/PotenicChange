import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_fellings.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';

class hurdle_statement extends StatefulWidget {
  const hurdle_statement({super.key});

  @override
  State<hurdle_statement> createState() => _hurdle_statementState();
}

class _hurdle_statementState extends State<hurdle_statement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
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
                  '4',
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
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/practicebackground.png'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: AppDimensions.height10 * 34.3,
                height: AppDimensions.height10 * 7.3,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 18.0),
                child: GradientText(
                  'How this hurdle is\nimpacting you?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.8,
                    fontWeight: FontWeight.w700,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 18.1,
                height: AppDimensions.height10 * 18.1,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.132),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/black_hole.png'))),
                child: Center(
                  child: Text(
                    'Husband',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 8.0,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 5.563),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          color: Colors.white),
                      child: Column(
                        //                  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 17.4,
                            height: AppDimensions.height10 * 2.0,
                            margin: EdgeInsets.only(
                                //left: AppDimensions.height10 * 2.0,
                                top: AppDimensions.height10 * 1.3,
                                right: AppDimensions.height10 * 16.9),
                            child: Center(
                              child: Text(
                                'Action / Trigger statement',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.3,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff646464)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.0,
                                right: AppDimensions.height10 * 5.0,
                                top: AppDimensions.height10 * 0.6),
                            height: AppDimensions.height10 * 2.9,
                            width: AppDimensions.height10 * 30.5,
                            child: Center(
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.4,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffB353C9)),
                                decoration: InputDecoration(
                                    hintText: 'Makes simple mistakes',
                                    hintStyle: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.4,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffB353C9)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent))),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    width: AppDimensions.height10 * 12.3,
                    height: AppDimensions.height10 * 2.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 1.0,
                        left: AppDimensions.height10 * 3.1,
                        right: AppDimensions.height10 * 26.0),
                    child: Text(
                      'Character count: 80',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.3,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                  height: AppDimensions.height10 * 5.0,
                  width: AppDimensions.height10 * 16.7,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 20.5),
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
                                builder: (context) => felling_hurdles()));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ))),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ]),
          )),
    );
  }
}
