import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/hurdle_positive_alternates/select_image.dart';
import 'package:potenic_app/Screen/captureHurdles/new_hurdle_summary.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../utils/app_dimensions.dart';
import 'hurdle_positive_alternates/select_link.dart';
import 'hurdle_positive_alternates/select_notes.dart';
import 'hurdle_positive_alternates/select_video.dart';

class new_hurdles extends StatelessWidget {
  const new_hurdles({super.key});

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: AppDimensions.height10 * 34.3,
              height: AppDimensions.height10 * 3.9,
              margin: EdgeInsets.only(
                  bottom: AppDimensions.height10 * 1.1,
                  top: AppDimensions.height10 * 13.7),
              child: Center(
                child: GradientText(
                  'Motivational Material',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.8,
                    fontWeight: FontWeight.w700,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 34.3,
              height: AppDimensions.height10 * 7.5,
              margin: EdgeInsets.only(bottom: AppDimensions.height10 * 13.0),
              child: Center(
                child: GradientText(
                  'Are there any supporting materials you\ncan use to help you get over\nthis hurdle?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 1.8,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ),
            ),
            Container(
              height: AppDimensions.height10 * 16.678,
              margin: EdgeInsets.only(bottom: AppDimensions.height10 * 23.36),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 13.339,
                      height: AppDimensions.height10 * 16.674,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10 * 1.4,
                          left: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Image_Subtract.png'))),
                      child: Container(
                        margin: EdgeInsets.all(AppDimensions.height10 * 0.758),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5)),
                        child: DottedBorder(
                            borderType: BorderType.RRect,
                            color: Colors.white,
                            radius:
                                Radius.circular(AppDimensions.height10 * 1.5),
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
                                                'assets/images/image_icon.png'))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: AppDimensions.height10 * 1.0),
                                    child: Text(
                                      'Image',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  upload_image_popup()));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.122,
                                      height: AppDimensions.height10 * 2.122,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10 * 0.178),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Addgoal.png'))),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Upload',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.2,
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
                      width: AppDimensions.height10 * 13.339,
                      height: AppDimensions.height10 * 16.674,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.4),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Video_Subtract.png'))),
                      child: Container(
                        margin: EdgeInsets.all(AppDimensions.height10 * 0.758),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5)),
                        child: DottedBorder(
                            borderType: BorderType.RRect,
                            color: Colors.white,
                            radius:
                                Radius.circular(AppDimensions.height10 * 1.5),
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
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  select_video()));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.122,
                                      height: AppDimensions.height10 * 2.122,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10 * 0.178),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Addgoal.png'))),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Attach',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.2,
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
                      width: AppDimensions.height10 * 13.339,
                      height: AppDimensions.height10 * 16.674,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.4),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Video_Subtract.png'))),
                      child: Container(
                        margin: EdgeInsets.all(AppDimensions.height10 * 0.758),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5)),
                        child: DottedBorder(
                            borderType: BorderType.RRect,
                            color: Colors.white,
                            radius:
                                Radius.circular(AppDimensions.height10 * 1.5),
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
                                                'assets/images/note_icon.png'))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: AppDimensions.height10 * 1.0),
                                    child: Text(
                                      'Note',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  select_note()));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.122,
                                      height: AppDimensions.height10 * 2.122,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10 * 0.178),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Addgoal.png'))),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Write',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.2,
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
                      width: AppDimensions.height10 * 13.339,
                      height: AppDimensions.height10 * 16.674,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.4),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 1.0),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Image_Subtract.png'))),
                      child: Container(
                        margin: EdgeInsets.all(AppDimensions.height10 * 0.758),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 1.0)),
                        child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius:
                                Radius.circular(AppDimensions.height10 * 1.5),
                            // dashPattern: [10, 10],
                            color: Colors.white,
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
                                                'assets/images/link_icon.png'))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: AppDimensions.height10 * 1.0),
                                    child: Text(
                                      'Link to connect',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  select_link()));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.122,
                                      height: AppDimensions.height10 * 2.122,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10 * 0.178),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Addgoal.png'))),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Link',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.2,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: AppDimensions.height10 * 4.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: AppDimensions.height10 * 5.0,
                      width: AppDimensions.height10 * 10.6,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.0),
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
                              'Skip',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Arial'),
                            ),
                          ))),
                  Container(
                      height: AppDimensions.height10 * 5.0,
                      width: AppDimensions.height10 * 16.7,
                      decoration: BoxDecoration(
                        color: Color(0xff282828),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 5.0),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        new_hurdles_summary()));
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins'),
                          ))),
                ],
              ),
            )
          ])),
    );
  }
}
