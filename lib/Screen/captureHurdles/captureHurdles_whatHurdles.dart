import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_fellings.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';

class what_hurdles extends StatefulWidget {
  const what_hurdles({super.key});

  @override
  State<what_hurdles> createState() => _what_hurdlesState();
}

class _what_hurdlesState extends State<what_hurdles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            width: AppDimensions.height10 * 17.0,
            height: AppDimensions.height10 * 4.8,
            child: GradientText(
              'Hurdle‘s positive\nactions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.height10 * 2.0,
                fontWeight: FontWeight.w600,
              ),
              colors: [Color(0xffFA9934), Color(0xffEDD15E)],
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: AppDimensions.height10 * 34.3,
              height: AppDimensions.height10 * 10.6,
              margin: EdgeInsets.only(
                  bottom: AppDimensions.height10 * 8.7,
                  top: AppDimensions.height10 * 14.7),
              child: GradientText(
                'What actions can you take to get over this\nhurdle?',
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
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffFF783E), Color(0xffFDA452)])),
                child: Center(
                    child: TextField(
                  scrollPhysics: ClampingScrollPhysics(),
                  decoration: InputDecoration(
                      hintText: 'I can/will...',
                      hintStyle: TextStyle(
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.4,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ))),
            Container(
              width: AppDimensions.height10 * 12.2,
              height: AppDimensions.height10 * 2.0,
              margin: EdgeInsets.only(bottom: AppDimensions.height10 * 3.7),
              child: Text(
                'Character count: 50 ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.height10 * 1.3,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 4.7,
              height: AppDimensions.height10 * 4.7,
              margin: EdgeInsets.only(bottom: AppDimensions.height10 * 1.1),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(
                  //     width: AppDimensions.height10 * 0.3,
                  //     color: Colors.white)
                  image: DecorationImage(
                      image: AssetImage('assets/images/Addgoal.png'))),
            ),
            Container(
              width: AppDimensions.height10 * 14.4,
              height: AppDimensions.height10 * 1.9,
              child: Text(
                'Add another action',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.height10 * 1.3,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppDimensions.height10 * 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: AppDimensions.height10 * 5.0,
                      width: AppDimensions.height10 * 12.8,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.4),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Color(0xffFA9934)),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 5.0),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 0.8),
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Arial'),
                            ),
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
                                    builder: (context) => felling_hurdles()));
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins'),
                          ))),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom))
          ])),
    );
  }
}
