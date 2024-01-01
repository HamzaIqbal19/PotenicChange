// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/capture_inpirations_goals.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_motivation.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/link_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/video_access.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class inspiration_type extends StatefulWidget {
  const inspiration_type({super.key});

  @override
  State<inspiration_type> createState() => _inspiration_typeState();
}

class _inspiration_typeState extends State<inspiration_type> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context,
            FadePageRouteReverse(
                page: const inspiraton_goals(
                    update: false,
                    data_saved: false,
                    context: false,
                    note: true,
                    route: 'landing')));
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        FadePageRouteReverse(
                            page: const inspiraton_goals(
                                update: false,
                                data_saved: false,
                                context: false,
                                note: true,
                                route: 'landing')));
                  },
                  icon: Image.asset(
                    'assets/images/Back.webp',
                    //width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.8,
                    fit: BoxFit.contain,
                  )),
            ),
            //centerTitle: true,
            title: Container(
              width: AppDimensions.width10(context) * 18.9,
              height: AppDimensions.height10(context) * 2.6,
              margin:
                  EdgeInsets.only(left: AppDimensions.width10(context) * 6.6),
              child: Row(
                children: [
                  GradientText(
                    'Inspiration 2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.0,
                      fontWeight: FontWeight.w600,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                  GradientText(
                    '/2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.0,
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
                    onPressed: () => showAnimatedDialog(
                        animationType: DialogTransitionType.fadeScale,
                        curve: Curves.easeInOut,
                        duration: const Duration(seconds: 1),
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                              width: AppDimensions.width10(context) * 27.0,
                              height: AppDimensions.height10(context) * 21.0,
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 1.4)),
                                contentPadding: EdgeInsets.zero,
                                actionsPadding: EdgeInsets.zero,
                                titlePadding: EdgeInsets.zero,
                                title: Container(
                                  margin: const EdgeInsets.only(
                                      top: 19, right: 16, left: 16, bottom: 2),
                                  //  height: AppDimensions.height10(context) * 2.2,
                                  width: AppDimensions.width10(context) * 23.8,
                                  child: const Text(
                                    "Exit Inspiration?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                content: Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 19, left: 16, right: 16),
                                  //  height: 32,
                                  width: 238,
                                  child: const Text(
                                    "Please select from the options below",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.1,
                                        child: Divider(
                                          color: const Color(0XFF3C3C43)
                                              .withOpacity(0.29),
                                        ),
                                      ),
                                      Container(
                                        height: 42,
                                        width: double.infinity,
                                        // color: Colors.white,
                                        child: TextButton(
                                          onPressed: () async {
                                            InspirationApi()
                                                .checkUserInspiration()
                                                .then((response) {
                                                  if (response == true) {
                                                    Navigator.push(
                                                        context,
                                                        FadePageRouteReverse(
                                                            page:
                                                                const inspiration_landing(
                                                                    is_Updated:
                                                                        false)));
                                                  } else if (response ==
                                                      false) {
                                                    Navigator.push(
                                                        context,
                                                        FadePageRouteReverse(
                                                            page:
                                                                const inspiration_motivation(
                                                          goal_delete: false,
                                                          inspirationName: '',
                                                        )));
                                                  }
                                                })
                                                .catchError((error) {})
                                                .whenComplete(() {});

                                            final SharedPreferences prefs =
                                                await _prefs;
                                            var savedRoute = prefs.setString(
                                                'inspiration_saved_route',
                                                'type_inspiration');
                                          },
                                          child: const Text(
                                            'Exit & save progress',
                                            style: TextStyle(
                                                color: Color(0xFF007AFF),
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.1,
                                        child: Divider(
                                          color: const Color(0XFF3C3C43)
                                              .withOpacity(0.29),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 44,
                                        width: double.infinity,
                                        child: TextButton(
                                          onPressed: () async {
                                            InspirationApi()
                                                .checkUserInspiration()
                                                .then((response) {
                                                  if (response == true) {
                                                    Navigator.push(
                                                        context,
                                                        FadePageRouteReverse(
                                                            page:
                                                                const inspiration_landing(
                                                                    is_Updated:
                                                                        false)));
                                                  } else if (response ==
                                                      false) {
                                                    Navigator.push(
                                                        context,
                                                        FadePageRouteReverse(
                                                            page:
                                                                const inspiration_motivation(
                                                          goal_delete: false,
                                                          inspirationName: '',
                                                        )));
                                                  }
                                                })
                                                .catchError((error) {})
                                                .whenComplete(() {});

                                            final SharedPreferences prefs =
                                                await _prefs;
                                            var deleted = prefs.remove(
                                                'inspiration_saved_route');
                                          },
                                          child: const Text(
                                            'Exit & delete progress',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF007AFF)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.1,
                                        child: Divider(
                                          color: const Color(0XFF3C3C43)
                                              .withOpacity(0.29),
                                        ),
                                      ),
                                      Container(
                                        height: 42,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.0),
                                        // color: Colors.white,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Cancel exit',
                                            style: TextStyle(
                                                color: Color(0xFF007AFF),
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                    icon: Image.asset(
                      'assets/images/Close.webp',
                     // width: AppDimensions.width10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.8,
                      fit: BoxFit.contain,
                    )),
              )
            ]),
        extendBodyBehindAppBar: true,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/bg_inpiration_purple.webp'),
                    fit: BoxFit.cover)),
            child: Column(children: [
              Container(
                width: AppDimensions.width10(context) * 34.3,
                height: AppDimensions.height10(context) * 3.9,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 1.1,
                    top: AppDimensions.height10(context) * 17.2),
                child: Center(
                  child: GradientText(
                    'Your inspiration',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 34.3,
                // height: AppDimensions.height10(context) * 7.5,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 11.50),
                child: Center(
                  child: Text(
                    //add 2 px font_size
                    'What type of inspiration do you want to\nrecord?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 2.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              Container(
                height: AppDimensions.width10(context) * 13.3,
                //margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.6),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AnimatedScaleButton(
                        onTap: () async {
                          final SharedPreferences prefs = await _prefs;

                          var hurdleId = prefs.setInt('hurdleId', 1);
                          Navigator.push(context,
                              FadePageRoute(page: const photo_pop_up()));
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.3,
                          height: AppDimensions.width10(context) * 13.3,
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 1.4,

                              left: AppDimensions.width10(context) * 4.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              //borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Image_Subtract.webp'),
                                  fit: BoxFit.cover)),
                          child: Container(
                            margin: EdgeInsets.all(
                                AppDimensions.height10(context) * 0.758),
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
                                        width: AppDimensions.width10(context) *
                                            3.032,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.032,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.68),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/image_icon.webp'))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.0),
                                        child: Text(
                                          'Image',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            2.122,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.122,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.178),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Addgoal.webp'))),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () async {
                          final SharedPreferences prefs = await _prefs;

                          var hurdleId = prefs.setInt('hurdleId', 2);
                          Navigator.push(
                              context, FadePageRoute(page: const noteSaved()));
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.3,
                          height: AppDimensions.width10(context) * 13.3,
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 1.4),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Video_Subtract.webp'),
                                  fit: BoxFit.cover)),
                          child: Container(
                            margin: EdgeInsets.all(
                                AppDimensions.height10(context) * 0.758),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: DottedBorder(
                                borderType: BorderType.Circle,
                                color: Colors.white,
                                radius: Radius.circular(
                                    AppDimensions.height10(context) * 1.5),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            3.032,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.032,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.68),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/note_icon.webp'))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.0),
                                        child: Text(
                                          'Notes',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            2.122,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.122,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.178),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Addgoal.webp'))),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () async {
                          final SharedPreferences prefs = await _prefs;

                          var hurdleId = prefs.setInt('hurdleId', 4);
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const link_info(
                                link_state: false,
                              )));
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.3,
                          height: AppDimensions.width10(context) * 13.3,
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 1.4),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Image_Subtract.webp'),
                                  fit: BoxFit.cover)),
                          child: Container(
                            margin: EdgeInsets.all(
                                AppDimensions.height10(context) * 0.758),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: DottedBorder(
                                borderType: BorderType.Circle,
                                radius: Radius.circular(
                                    AppDimensions.height10(context) * 1.5),
                                // dashPattern: [10, 10],
                                color: Colors.white,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            3.032,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.032,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.68),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/link_icon.webp'))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.0),
                                        child: Text(
                                          'Link to connect',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            2.122,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.122,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.178),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Addgoal.webp'))),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () async {
                          final SharedPreferences prefs = await _prefs;

                          var hurdleId = prefs.setInt('hurdleId', 3);
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const video_info(link_state: false)));
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 13.3,
                          height: AppDimensions.width10(context) * 13.30,
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 0.7),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Video_Subtract.webp'),
                                  fit: BoxFit.cover)),
                          child: Container(
                            margin: EdgeInsets.all(
                                AppDimensions.height10(context) * 0.758),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: DottedBorder(
                                borderType: BorderType.Circle,
                                color: Colors.white,
                                radius: Radius.circular(
                                    AppDimensions.height10(context) * 1.5),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            3.032,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.032,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.68),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/video_icon.webp'))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.0),
                                        child: Text(
                                          'Video link',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            2.122,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.122,
                                        margin: EdgeInsets.only(
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.178),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Addgoal.webp'))),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
