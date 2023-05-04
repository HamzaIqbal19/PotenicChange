import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/hurdle_positive_alternates/hurdles_details/video_details.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../utils/app_dimensions.dart';

class select_video extends StatefulWidget {
  const select_video({super.key});

  @override
  State<select_video> createState() => _select_videoState();
}

class _select_videoState extends State<select_video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: SizedBox(
            width: AppDimensions.height10 * 17.0,
            height: AppDimensions.height10 * 4.8,
            child: GradientText(
              'Hurdle‘s positive\nalternatives',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppDimensions.height10 * 13.339,
              height: AppDimensions.height10 * 16.674,
              margin: EdgeInsets.only(right: AppDimensions.height10 * 1.4),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/Video_Subtract.png'))),
              child: Container(
                margin: EdgeInsets.all(AppDimensions.height10 * 0.758),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5)),
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: Colors.white,
                    radius: Radius.circular(AppDimensions.height10 * 1.5),
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 3.032,
                            height: AppDimensions.height10 * 3.032,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10 * 0.68),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/video_icon.png'))),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10 * 1.0),
                            child: Text(
                              'Video link',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 2.122,
                            height: AppDimensions.height10 * 2.122,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10 * 0.178),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Addgoal.png'))),
                          ),
                          Container(
                            child: Text(
                              'Attach',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 36.0,
              height: AppDimensions.height10 * 6.0,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 8.026),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 2.0),
                  color: Colors.white),
              child: Container(
                margin: EdgeInsets.only(
                    left: AppDimensions.height10 * 2.0,
                    right: AppDimensions.height10 * 2.0),
                height: AppDimensions.height10 * 2.2,
                width: AppDimensions.height10 * 30.5,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Video’s URL',
                        hintStyle: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff828282)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
              ),
            ),
            Container(
                height: AppDimensions.height10 * 5.0,
                width: AppDimensions.height10 * 25.4,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.0),
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
                              builder: (context) => video_details()));
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ))),
          ],
        ),
      ),
    );
  }
}
