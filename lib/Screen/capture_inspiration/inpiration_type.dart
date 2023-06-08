import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/hurdle_positive_alternates/select_image.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/link_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/video_access.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class inspiration_type extends StatelessWidget {
  const inspiration_type({super.key});

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
          //centerTitle: true,
          title: Container(
            width: AppDimensions.height10 * 18.9,
            height: AppDimensions.height10 * 2.4,
            margin: EdgeInsets.only(left: AppDimensions.height10 * 6.6),
            child: Row(
              children: [
                GradientText(
                  'Inspiration 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.0,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  '/2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.0,
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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_inpiration_purple.png'),
                  fit: BoxFit.cover)),
          child: Column(children: [
            Container(
              width: AppDimensions.height10 * 34.3,
              height: AppDimensions.height10 * 3.9,
              margin: EdgeInsets.only(
                  bottom: AppDimensions.height10 * 1.1,
                  top: AppDimensions.height10 * 17.2),
              child: Center(
                child: GradientText(
                  'Your inspiration',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.8,
                    fontWeight: FontWeight.w700,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 34.3,
              // height: AppDimensions.height10 * 7.5,
              margin: EdgeInsets.only(bottom: AppDimensions.height10 * 11.50),
              child: Center(
                child: Text(
                  //add 2 px font_size
                  'What type of inspiration do you want to\nrecord?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF)),
                ),
              ),
            ),
            Container(
              height: AppDimensions.height10 * 13.3,
              //margin: EdgeInsets.only(left: AppDimensions.height10 * 1.6),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 13.3,
                      height: AppDimensions.height10 * 13.3,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10 * 1.4,
                          left: AppDimensions.height10 * 4.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          //borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Image_Subtract.png'),
                              fit: BoxFit.cover)),
                      child: Container(
                        margin: EdgeInsets.all(AppDimensions.height10 * 0.758),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(5)
                        ),
                        child: DottedBorder(
                            borderType: BorderType.Circle,
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
                                    decoration: const BoxDecoration(
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
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const photo_pop_up()));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.122,
                                      height: AppDimensions.height10 * 2.122,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10 * 0.178),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Addgoal.png'))),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 13.3,
                      height: AppDimensions.height10 * 13.3,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Video_Subtract.png'),
                              fit: BoxFit.cover)),
                      child: Container(
                        margin: EdgeInsets.all(AppDimensions.height10 * 0.758),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: DottedBorder(
                            borderType: BorderType.Circle,
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
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/note_icon.png'))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: AppDimensions.height10 * 1.0),
                                    child: Text(
                                      'Notes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const note_info(
                                            note_saved: false,
                                            type_switch: 1,
                                          )));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.122,
                                      height: AppDimensions.height10 * 2.122,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10 * 0.178),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Addgoal.png'))),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 13.3,
                      height: AppDimensions.height10 * 13.3,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Image_Subtract.png'),
                              fit: BoxFit.cover)),
                      child: Container(
                        margin: EdgeInsets.all(AppDimensions.height10 * 0.758),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: DottedBorder(
                            borderType: BorderType.Circle,
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
                                    decoration: const BoxDecoration(
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
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const link_info()));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.122,
                                      height: AppDimensions.height10 * 2.122,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10 * 0.178),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Addgoal.png'))),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 13.3,
                      height: AppDimensions.height10 * 13.30,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 0.7),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Video_Subtract.png'),
                              fit: BoxFit.cover)),
                      child: Container(
                        margin: EdgeInsets.all(AppDimensions.height10 * 0.758),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: DottedBorder(
                            borderType: BorderType.Circle,
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
                                    decoration: const BoxDecoration(
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
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const video_info()));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.122,
                                      height: AppDimensions.height10 * 2.122,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10 * 0.178),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Addgoal.png'))),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
