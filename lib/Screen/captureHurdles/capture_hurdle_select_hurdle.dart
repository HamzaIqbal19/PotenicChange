import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_name.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class select_hurdle extends StatefulWidget {
  const select_hurdle({super.key});

  @override
  State<select_hurdle> createState() => _select_hurdleState();
}

class _select_hurdleState extends State<select_hurdle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 3.0,
                  height: AppDimensions.height10(context) * 3.0,
                  fit: BoxFit.cover,
                )),
          ),
          centerTitle: true,
          title: SizedBox(
            width: AppDimensions.height10(context) * 19.0,
            height: AppDimensions.height10(context) * 2.4,
            child: Row(
              children: [
                GradientText(
                  'Capture Hurdle ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  ' 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  '/5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w400,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ],
            ),
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
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // margin: EdgeInsets.only(top:   AppDimensions.height10(context)(context)* 6.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/practicebackground.webp'),
                fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: AppDimensions.height10(context) * 33.7,
            height: AppDimensions.height10(context) * 7.3,
            margin:
                EdgeInsets.only(top: AppDimensions.height10(context) * 18.0),
            child: Center(
              //slight width issue
              child: GradientText(
                'What or who has\ntriggered your hurdle?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppDimensions.height10(context) * 2.8,
                  fontWeight: FontWeight.w700,
                ),
                colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.9),
            child: Row(
              children: [
                Container(
                  width: AppDimensions.height10(context) * 14.1,
                  height: AppDimensions.height10(context) * 14.1,
                  margin: EdgeInsets.only(
                    left: AppDimensions.height10(context) * 5.1,
                    right: AppDimensions.height10(context) * 4.5,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)),
                  padding:
                      EdgeInsets.all(AppDimensions.height10(context) * 0.5),
                  child: Container(
                    height: AppDimensions.height10(context) * 13.1,
                    width: AppDimensions.height10(context) * 13.1,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: AppDimensions.height10(context) * 0.1,
                            color: Colors.white),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xffBE3FC6), Color(0xff642445)])),
                    child: Center(
                      child: Text(
                        'People /\n person',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: AppDimensions.height10(context) * 13.1,
                  width: AppDimensions.height10(context) * 13.1,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: AppDimensions.height10(context) * 0.1,
                          color: Colors.white),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xffBE3FC6), Color(0xff642445)])),
                  child: Center(
                    child: Text(
                      'Negative\nthought',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10(context) * 1.6,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: AppDimensions.height10(context) * 5.8,
                right: AppDimensions.height10(context) * 5.1,
                top: AppDimensions.height10(context) * 1.0,
                bottom: AppDimensions.height10(context) * 2.0),
            child: Row(children: [
              Container(
                height: AppDimensions.height10(context) * 13.1,
                width: AppDimensions.height10(context) * 13.1,
                margin: EdgeInsets.only(
                  right: AppDimensions.height10(context) * 4.5,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: AppDimensions.height10(context) * 0.1,
                        color: Colors.white),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffBE3FC6), Color(0xff642445)])),
                child: Center(
                  child: Text(
                    'Place',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.6,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: AppDimensions.height10(context) * 13.1,
                width: AppDimensions.height10(context) * 13.1,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: AppDimensions.height10(context) * 0.1,
                        color: Colors.white),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xffBE3FC6), Color(0xff642445)])),
                child: Center(
                  child: Text(
                    'Event',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.6,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ]),
          ),
          Container(
            height: AppDimensions.height10(context) * 13.1,
            width: AppDimensions.height10(context) * 13.1,
            margin: EdgeInsets.only(
              right: AppDimensions.height10(context) * 22.9,
              left: AppDimensions.height10(context) * 5.1,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: AppDimensions.height10(context) * 0.1,
                    color: Colors.white),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffBE3FC6), Color(0xff642445)])),
            child: Center(
              child: Text(
                'Other',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: AppDimensions.height10(context) * 1.6,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            width: AppDimensions.height10(context) * 25.4,
            height: AppDimensions.height10(context) * 5.0,
            margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 8.2,
                bottom: AppDimensions.height10(context) * 2.6),
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
                  BorderRadius.circular(AppDimensions.height10(context) * 5.0),
            ),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, FadePageRoute(page: const hurdle_name()));
                },
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 1.6,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
          ),
          Container(
            width: AppDimensions.height10(context) * 17.0,
            height: AppDimensions.height10(context) * 0.5,
            margin:
                EdgeInsets.only(bottom: AppDimensions.height10(context) * 1.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 2.0),
                color: const Color(0xFFFFFFFF).withOpacity(0.3)),
          )
        ]),
      ),
    );
  }
}
