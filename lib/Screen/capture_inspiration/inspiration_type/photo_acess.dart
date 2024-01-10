// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/capture_inpirations_goals.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_type.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/link_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/video_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiratoinEdit/photoEdit.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiratoinEdit/videoEdit.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import '../../../Widgets/fading.dart';
import '../../../utils/app_dimensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class photo_pop_up extends StatefulWidget {
  const photo_pop_up({super.key});

  @override
  State<photo_pop_up> createState() => _photo_pop_upState();
}

TextEditingController link = TextEditingController();
TextEditingController statement = TextEditingController();
TextEditingController title = TextEditingController();
TextEditingController hastags = TextEditingController();

class _photo_pop_upState extends State<photo_pop_up> {
  File? imageFile;

  void getImage({required ImageSource source}) async {
    final SharedPreferences prefs = await _prefs;
    final file = await ImagePicker().pickImage(
        source: source,
        //maxWidth: 640,
        // maxHeight: 480,
        imageQuality: 100 //0 - 100
        );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
      // final bytes = imageFile?.readAsBytesSync();
      // String imageString = base64Encode(bytes!);
      await prefs.setString('imagePicked', file!.path);
      Navigator.push(
          context,
          FadePageRoute(
              page: const photo_info(
            edit_details: false,
            image_detals: false,
            image_save: false,
            image_create: false,
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xff646464),
        child: Stack(children: [
          Align(
            alignment: const Alignment(0, 0),
            child: Container(
              width: AppDimensions.width10(context) * 27.0,
              height: AppDimensions.height10(context) * 24.8,
              decoration: BoxDecoration(
                  color: const Color(0xff1E1E1E).withOpacity(0.75),
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 1.4)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppDimensions.height10(context) * 11.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: AppDimensions.width10(context) * 23.8,
                          height: AppDimensions.height10(context) * 4.4,
                          child: Text(
                            'Potenic would like to access\nyour photos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.7,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.2),
                          // width: AppDimensions.width10(context) * 23.8,
                          height: AppDimensions.height10(context) * 3.4,
                          child: Text(
                            'To upload from your device, allow\naccess to your photos.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.3,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.1,
                    child: Divider(
                      color: const Color(0xff545458).withOpacity(0.65),
                      //thickness: AppDimensions.height10(context) * 0.5,
                      height: AppDimensions.height10(context) * 0.5,
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                    },
                    child: SizedBox(
                      height: AppDimensions.height10(context) * 4.3,
                      child: Center(
                        child: Text(
                          'Select Photos...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.7,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0A84FF)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.1,
                    child: Divider(
                      color: const Color(0xff545458).withOpacity(0.65),
                      //thickness: AppDimensions.height10(context) * 0.5,
                      height: AppDimensions.height10(context) * 0.5,
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                    },
                    child: SizedBox(
                      height: AppDimensions.height10(context) * 4.3,
                      child: Center(
                        child: Text(
                          'Allow Access to All Photos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.7,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0A84FF)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.1,
                    child: Divider(
                      color: const Color(0xff545458).withOpacity(0.65),
                      //thickness: AppDimensions.height10(context) * 0.5,
                      height: AppDimensions.height10(context) * 0.5,
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: AppDimensions.height10(context) * 4.3,
                      child: Center(
                        child: Text(
                          'Don’t Allow',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.7,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff0A84FF)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Container(
              width: AppDimensions.width10(context) * 17.0,
              height: AppDimensions.height10(context) * 0.5,
              margin: EdgeInsets.only(
                  bottom: AppDimensions.height10(context) * 1.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                  color: const Color(0xFFFFFFFF).withOpacity(0.3)),
            ),
          )
        ]),
      ),
    );
  }
}

class photo_info extends StatefulWidget {
  final bool image_detals;
  final bool image_save;
  final bool edit_details;
  final bool image_create;
  const photo_info(
      {super.key,
      required this.image_detals,
      required this.image_save,
      required this.edit_details,
      required this.image_create});

  @override
  State<photo_info> createState() => _photo_infoState();
}

class _photo_infoState extends State<photo_info> {
  var image;
  var imageLink;
  List selectedGoals = [];
  List<String> tagList = [];
  List<String> stringTagList = [];
  bool btEnable = true;

  void getInspiration() async {
    final SharedPreferences prefs = await _prefs;
    final encodedGoals = prefs.getString('selected_goals_inspiration');
    if (encodedGoals != null) {
      List decodedGoals = List.from(json.decode(encodedGoals));
      setState(() {
        selectedGoals = decodedGoals;
      });
    }
  }

  void getImage() async {
    final SharedPreferences prefs = await _prefs;
    var imagePick = prefs.getString('imagePicked');
    var imageLinked = prefs.getString('imageLink');

    setState(() {
      image = imagePick;
      imageLink = imageLinked;
    });
  }

  void getImageLink() async {
    final SharedPreferences prefs = await _prefs;

    var imageLinked = prefs.getString('ImageLink');
    setState(() {
      imageLink = imageLinked;
    });

    if (prefs.getString('ImageLink').toString().isNotEmpty) {
      link.text = imageLink!;
    }
  }

  @override
  void initState() {
    super.initState();
    getImage();
    getImageLink();
    getInspiration();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: const Color(0xffC4C4C4),
                elevation: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: AppDimensions.height10(context) * 5.1,
                flexibleSpace: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.width10(context) * 1.5),
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5).withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              AppDimensions.height10(context) * 1.0),
                          topRight: Radius.circular(
                              AppDimensions.height10(context) * 1.0))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedScaleButton(
                          onTap: () async {
                            final SharedPreferences prefs = await _prefs;
                            await prefs.remove('ImageLink');
                            title.clear();
                            link.clear();
                            statement.clear();
                            hastags.clear();

                            if (widget.image_detals == true) {
                              Navigator.push(
                                  context,
                                  FadePageRouteReverse(
                                      page: const inspiration_type()));
                            } else {
                              Navigator.push(
                                  context,
                                  FadePageRouteReverse(
                                      page: const inspiration_type()));
                            }
                          },
                          child: Center(
                            child: Text(
                              'Back',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.7,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff007AFF)),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            // height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.width10(context) * 28.5,
                            child: Center(
                                child: widget.edit_details
                                    ? Text(
                                        'Edit image inspiration',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.8,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff282828)),
                                      )
                                    : Text(
                                        'Create image inspiration',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.8,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff282828)),
                                      )),
                          ),
                        ),
                        Container(
                          //height: AppDimensions.height10(context) * 2.2,
                          //width: AppDimensions.width10(context) * 6.1,
                          // margin: EdgeInsets.only(
                          //     right: AppDimensions.width10(context) * 1.5),
                          child: widget.image_detals
                              ? Container(
                                  child: widget.image_save
                                      ? AnimatedScaleButton(
                                          onTap: () async {
                                            final SharedPreferences prefs =
                                                await _prefs;
                                            await
                                                prefs.remove('ImageLink');

                                            if (widget.image_create == true) {
                                              if (title.text
                                                      .toString()
                                                      .isNotEmpty &&
                                                  statement.text
                                                      .toString()
                                                      .isNotEmpty) {
                                                if (btEnable == true) {
                                                  setState(() {
                                                    btEnable = false;
                                                  });
                                                }
                                               

                                                InspirationApi()
                                                    .addInspiration(
                                                        1,
                                                        File(image),
                                                        title.text.toString(),
                                                        tagList,
                                                        '',
                                                        link.text
                                                                .toString()
                                                                .isEmpty
                                                            ? ""
                                                            : link.text
                                                                .toString(),
                                                        true,
                                                        statement.text
                                                            .toString(),
                                                        selectedGoals)
                                                    .then((response) async {
                                                  if (response.length != 0) {
                                                    setState(() {
                                                      btEnable = true;
                                                    });

                                                    title.clear();
                                                    link.clear();
                                                    statement.clear();
                                                    hastags.clear();

                                                    Navigator.push(
                                                        context,
                                                        FadePageRoute(
                                                            page:
                                                                const updatedLandingPage(
                                                                    delete:
                                                                        false,
                                                                    is_Updated:
                                                                        false)));
                                                    final SharedPreferences
                                                        prefs = await _prefs;
                                                    prefs.remove(
                                                        'inspiration_saved_route');
                                                  } else {}
                                                });
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "Title or Inspiration is empty.")));
                                              }
                                              final SharedPreferences prefs =
                                                  await _prefs;
                                              prefs.remove(
                                                  'inspiration_saved_route');
                                            } else {
                                              showAnimatedDialog(
                                                  animationType:
                                                      DialogTransitionType
                                                          .fadeScale,
                                                  curve: Curves.easeInOut,
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          SizedBox(
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                27.0,
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                18.2,
                                                            child: AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          AppDimensions.height10(context) *
                                                                              1.4)),
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              actionsPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              titlePadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              title: Container(
                                                                margin: EdgeInsets.only(
                                                                    top: AppDimensions.height10(
                                                                            context) *
                                                                        1.9,
                                                                    right: AppDimensions
                                                                            .height10(
                                                                                context) *
                                                                        1.6,
                                                                    left: AppDimensions.height10(
                                                                            context) *
                                                                        1.6,
                                                                    bottom: AppDimensions.height10(
                                                                            context) *
                                                                        0.2),
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    2.2,
                                                                width: AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    23.8,
                                                                child: Text(
                                                                  "Save changes?",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        AppDimensions.font10(context) *
                                                                            1.7,
                                                                    fontFamily:
                                                                        'laila',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                              content:
                                                                  Container(
                                                                margin: EdgeInsets.only(
                                                                    bottom:
                                                                        AppDimensions.height10(context) *
                                                                            1.5,
                                                                    left: AppDimensions.height10(
                                                                            context) *
                                                                        1.6,
                                                                    right: AppDimensions.height10(
                                                                            context) *
                                                                        1.6),
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    3.4,
                                                                width: AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    23.8,
                                                                child: Text(
                                                                  "Are you sure you want to save your\nupdates?",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        AppDimensions.font10(context) *
                                                                            1.3,
                                                                    fontFamily:
                                                                        'laila',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
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
                                                                      child:
                                                                          Divider(
                                                                        color: const Color(0XFF3C3C43)
                                                                            .withOpacity(0.29),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              4.2,
                                                                      width: double
                                                                          .infinity,
                                                                      color: const Color(
                                                                          0xFF007AFF),
                                                                      child:
                                                                          TextButton(
                                                                        onPressed:
                                                                            () async {
                                                                          InspirationApi()
                                                                              .addInspiration(1, imageLink, title.text.toString(), ['#tags'], '', link.text.toString(), true, statement.text.toString(), [19])
                                                                              .then((response) {
                                                                            if (response.statusCode ==
                                                                                200) {
                                                                              Navigator.push(
                                                                                  context,
                                                                                  FadePageRoute(
                                                                                      page: const note_info(
                                                                                    note_saved: true,
                                                                                    type_switch: 1,
                                                                                  )));
                                                                            }
                                                                          });
                                                                        },
                                                                        // Navigator.push(
                                                                        //     context,
                                                                        //     FadePageRoute(
                                                                        //         page: widget.edit_details
                                                                        //             ? const inspiration_landing(
                                                                        //                 muliple_insp: false,
                                                                        //                 is_Updated: true,
                                                                        //               )
                                                                        //             : const inspiration_landing(
                                                                        //                 muliple_insp: false,
                                                                        //                 is_Updated: false,
                                                                        //               )));

                                                                        child:
                                                                            Text(
                                                                          'Yes',
                                                                          style: TextStyle(
                                                                              color: const Color(0xFFFFFFFF),
                                                                              fontSize: AppDimensions.font10(context) * 1.7,
                                                                              fontFamily: "Laila",
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              0.1,
                                                                      child:
                                                                          Divider(
                                                                        color: const Color(0XFF3C3C43)
                                                                            .withOpacity(0.29),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              4.4,
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Cancel',
                                                                          style: TextStyle(
                                                                              fontSize: AppDimensions.font10(context) * 1.7,
                                                                              fontFamily: "Laila",
                                                                              fontWeight: FontWeight.w400,
                                                                              color: const Color(0xFF007AFF)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              0.1,
                                                                      child:
                                                                          Divider(
                                                                        color: const Color(0XFF3C3C43)
                                                                            .withOpacity(0.29),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ));
                                            }
                                          },
                                          child: Center(
                                            child: Text(
                                              widget.image_create
                                                  ? 'Create'
                                                  : 'Save',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff007AFF)),
                                            ),
                                          ),
                                        )
                                      : AnimatedScaleButton(
                                          onTap: () {
                                            InspirationApi()
                                                .addInspiration(
                                                    1,
                                                    image,
                                                    title.text.toString(),
                                                    tagList,
                                                    '',
                                                    link.text.toString(),
                                                    true,
                                                    statement.text.toString(),
                                                    selectedGoals)
                                                .then((response) {
                                              if (response.length != 0) {
                                                title.clear();
                                                link.clear();
                                                statement.clear();
                                                hastags.clear();
                                                Navigator.push(
                                                    context,
                                                    FadePageRoute(
                                                        page:
                                                            const inspiration_landing(
                                                      is_Updated: false,
                                                    )));
                                              }
                                            });
                                          },
                                          child: Center(
                                            child: Text(
                                              'Create',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff007AFF)),
                                            ),
                                          ),
                                        ),
                                )
                              : ValueListenableBuilder<TextEditingValue>(
                                  valueListenable: title,
                                  builder: (context, value, child) {
                                    return ValueListenableBuilder<
                                            TextEditingValue>(
                                        valueListenable: statement,
                                        builder: (context, value, child) {
                                          return AnimatedScaleButton(
                                            onTap: () async {
                                              if (title.text
                                                      .toString()
                                                      .isNotEmpty &&
                                                  statement.text
                                                      .toString()
                                                      .isNotEmpty) {
                                                if (btEnable == true) {
                                                  setState(() {
                                                    btEnable = false;
                                                  });
                                                }
                                               
                                              

                                                InspirationApi()
                                                    .addInspiration(
                                                        1,
                                                        File(image),
                                                        title.text.toString(),
                                                        tagList,
                                                        ' ',
                                                        link.text
                                                                .toString()
                                                                .isEmpty
                                                            ? ""
                                                            : link.text
                                                                .toString(),
                                                        true,
                                                        statement.text
                                                            .toString(),
                                                        selectedGoals)
                                                    .then((response) {
                                                  if (response.length != 0) {
                                                    setState(() {
                                                      btEnable = true;
                                                    });

                                                    title.clear();
                                                    link.clear();
                                                    statement.clear();
                                                    hastags.clear();

                                                    Navigator.push(
                                                        context,
                                                        FadePageRoute(
                                                            page:
                                                                const updatedLandingPage(
                                                                    delete:
                                                                        false,
                                                                    is_Updated:
                                                                        false)));
                                                  } else {}
                                                });
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "Title or Inspiration is empty.")));
                                              }
                                            },
                                            child: btEnable == false
                                                ? Center(
                                                    child: SpinKitThreeBounce(
                                                      color: const Color(
                                                          0xff007AFF),
                                                      // delay: Duration(milliseconds: 0),
                                                      size: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.6,
                                                    ),
                                                  )
                                                : Center(
                                                    child: Text(
                                                      'Create',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.6,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: title.text
                                                                      .toString()
                                                                      .isNotEmpty &&
                                                                  statement.text
                                                                      .toString()
                                                                      .isNotEmpty
                                                              ? const Color(
                                                                  0xff007AFF)
                                                              : const Color(
                                                                      0xff007AFF)
                                                                  .withOpacity(
                                                                      0.5)),
                                                    ),
                                                  ),
                                          );
                                        });
                                  }),
                        )
                      ]),
                ),
              ),
              body: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.9,
                          left: AppDimensions.width10(context) * 1.8,
                        ),
                        width: AppDimensions.width10(context) * 24.4,
                        height: AppDimensions.height10(context) * 24.4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(File(image)),
                                fit: BoxFit.cover)),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.width10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 2.0,
                                    right: AppDimensions.width10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 3.9),
                                child: Text(
                                  'Title',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                // height: AppDimensions.height10(context) * 2.4,

                                //width: AppDimensions.width10(context) * 30.5,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 0.6,
                                ),
                                child: TextFormField(
                                  controller: title,
                                  maxLines: null,
                                  textAlignVertical: TextAlignVertical.top,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff282828)),
                                  decoration: InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          AppDimensions.height10(context) * 1.5,
                                          0,
                                          AppDimensions.height10(context) * 4,
                                          0),
                                      hintText: 'Give your inspiration a title',
                                      hintStyle: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff828282)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.width10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 2.0,
                                    right: AppDimensions.width10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 4.0),
                                child: widget.image_detals
                                    ? Text(
                                        'Description',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      )
                                    : Text(
                                        'Why is it inspirational to you',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,

                                // height: AppDimensions.height10(context) * 2.4,
                                // width: AppDimensions.width10(context) * 30.5,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 0.6,
                                ),
                                child: TextFormField(
                                  controller: statement,
                                  textAlignVertical: TextAlignVertical.top,
                                  maxLines: null,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff282828)),
                                  decoration: InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          AppDimensions.height10(context) * 1.5,
                                          0,
                                          AppDimensions.height10(context) * 4,
                                          0),
                                      hintText:
                                          'Say more about this inspiration',
                                      hintStyle: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff828282)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.width10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 2.0,
                                    right: AppDimensions.width10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 4.0),
                                child: Text(
                                  'Destination website (optional)',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    // height:
                                    //     AppDimensions.height10(context) * 2.4,
                                    width:
                                        AppDimensions.width10(context) * 30.5,
                                    margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.width10(context) * 0.6,
                                    ),
                                    child: TextField(
                                      controller: link,
                                      scrollPadding: EdgeInsets.zero,
                                      textAlignVertical: TextAlignVertical.top,
                                      maxLines: null,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff282828)),
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              AppDimensions.height10(context) *
                                                  1.5,
                                              AppDimensions.height10(context) *
                                                  0.4,
                                              AppDimensions.height10(context) *
                                                  0.2,
                                              0),
                                          hintText: 'Add link',
                                          hintStyle: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.8,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff828282)),
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent))),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 2),
                                  Row(
                                    children: [
                                      AnimatedScaleButton(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page: link_set(
                                                route: 'image',
                                                link: link.text,
                                              )));
                                        },
                                        child: Container(
                                          width:
                                              AppDimensions.width10(context) *
                                                  2.5,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.5,
                                          // margin: EdgeInsets.only(
                                          //     right: AppDimensions.width10(context) * 0.8),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: AppDimensions.height10(
                                                    context) *
                                                2,
                                          ),
                                        ),
                                      ),
                                      link.text.isNotEmpty
                                          ? AnimatedScaleButton(
                                              onTap: () {
                                                link.clear();
                                              },
                                              child: Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.5,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.5,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.85),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  // image: DecorationImage(image: AssetImage()),
                                                  color: Colors.black,
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                    size:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.8,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.width10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 2.0,
                                    right: AppDimensions.width10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 4.0),
                                child: Text(
                                  'Tags (optional)',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              Container(
                                //alignment: Alignment.centerLeft,
                                // height: AppDimensions.height10(context) * 2.4,

                                //width: AppDimensions.width10(context) * 30.5,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 0.6,
                                ),
                                child: TextFormField(
                                    controller: hastags,
                                    maxLines: null,
                                    onTap: () {
                                      if (hastags.text.isEmpty) {
                                        hastags.text = '#';
                                      }
                                      hastags.selection =
                                          TextSelection.fromPosition(
                                        TextPosition(
                                            offset: hastags.text.length),
                                      );
                                    },
                                    scrollPadding: EdgeInsets.zero,
                                    onChanged: (text) {
                                      List<String> words = text.split(' ');

                                      List<String> tags = words
                                          .where((word) => word.startsWith('#'))
                                          .toList();
                                      stringTagList = tagList
                                          .map((tag) => tag.toString())
                                          .toList();

                                      List<String> finalResult = tags
                                          .map((tag) =>
                                              '"${tag.replaceAll('#', '')}"')
                                          .toList();

                                      tagList.clear();

                                      tagList.addAll(finalResult.toSet());
                                    },
                                    textAlignVertical: TextAlignVertical.top,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff282828)),
                                    decoration: InputDecoration(
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.fromLTRB(
                                            AppDimensions.height10(context) *
                                                1.5,
                                            0,
                                            AppDimensions.height10(context) * 4,
                                            0),
                                        hintText: 'Add #hashtags',
                                        hintStyle: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.8,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff828282)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent))),
                                    inputFormatters: [
                                      TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                        if (newValue.text.isNotEmpty &&
                                            !newValue.text.startsWith('#')) {
                                          return TextEditingValue(
                                            text: '#${newValue.text}',
                                            selection: TextSelection.collapsed(
                                                offset:
                                                    newValue.text.length + 1),
                                          );
                                        }
                                        return newValue;
                                      }),
                                    ]),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.width10(context) * 30.5,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 2.0,
                                    bottom:
                                        AppDimensions.height10(context) * 0.5,
                                    right: AppDimensions.width10(context) * 8.9,
                                    top: widget.image_detals
                                        ? AppDimensions.height10(context) * 4.0
                                        : AppDimensions.height10(context) *
                                            3.0),
                                child: Text(
                                  'Attached goals',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              AnimatedScaleButton(
                                onTap: () {
                                  widget.image_detals
                                      ? Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const inspiraton_goals(
                                            update: false,
                                            data_saved: true,
                                            route: 'photo_create',
                                            context: false,
                                            note: false,
                                          )))
                                      : Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const inspiraton_goals(
                                                  update: false,
                                                  route: 'photo_create',
                                                  context: false,
                                                  note: false,
                                                  data_saved: true)));
                                },
                                child: Container(
                                  height: AppDimensions.height10(context) * 6.0,
                                  width: AppDimensions.width10(context) * 37.5,
                                  margin: EdgeInsets.only(
                                    // bottom: AppDimensions.height10(context) * 1.0,

                                    left: AppDimensions.width10(context) * 2.0,
                                    right: AppDimensions.width10(context) * 1.9,
                                  ),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFBFBFB),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            23.9,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                1.99),
                                        child: Text(
                                          '${selectedGoals.length} impacted goals',
                                          style: TextStyle(
                                            fontFamily: 'laila',
                                            color: const Color(0xFF646464),
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.9,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: AppDimensions.height10(
                                                      context) *
                                                  2.391),
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                                color: const Color(0xFF437296),
                                                fontWeight: FontWeight.w700,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationThickness:
                                                    AppDimensions.height10(
                                                            context) *
                                                        0.2,
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.4),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).viewInsets.bottom ==
                                            0
                                        ? AppDimensions.height10(context) * 4
                                        : AppDimensions.height10(context) * 8.0,
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class link_set extends StatefulWidget {
  final String route;
  final String link;
  const link_set({super.key, required this.route, required this.link});

  @override
  State<link_set> createState() => _link_setState();
}

class _link_setState extends State<link_set> {
  final linkController = TextEditingController();

  bool linkbt = false;
  bool showKeyboardOverlay = false;
  List allgoalsSelected = [];

  final FocusNode _textFocusNode = FocusNode();
  String linkUrl = '';
  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          debugPrint("Loading: $progress%");
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    );

  @override
  void initState() {
    super.initState();
    linkController.text = widget.link;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (showKeyboardOverlay) {
          FocusScope.of(context).unfocus();
          setState(() {
            showKeyboardOverlay = false;
          });
        }
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFFC4C4C4),
              child: linkUrl == ''
                  ? Container()
                  : WebViewWidget(controller: _controller),
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xFFC4C4C4),
              toolbarHeight: AppDimensions.height10(context) * 5.1,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5).withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            AppDimensions.height10(context) * 1.0),
                        topRight: Radius.circular(
                            AppDimensions.height10(context) * 1.0))),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  linkController.text.isNotEmpty
                      ? AnimatedScaleButton(
                          onTap: () {
                            setState(() {
                              linkbt = false;
                            });
                            Navigator.pop(context);
                            linkController.clear();
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 3.0,
                            height: AppDimensions.height10(context) * 3.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 0.8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    const Color(0xFF828282).withOpacity(0.85),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Close.webp'))),
                          ),
                        )
                      : Container(),
                  Container(
                    width: linkController.text.isNotEmpty
                        ? AppDimensions.height10(context) * 29.2
                        : AppDimensions.height10(context) * 33.7,
                    height: AppDimensions.height10(context) * 3.4,
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 1.0),
                        color: const Color(0xff767680).withOpacity(0.12)),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.width10(context) * 1.4,
                          height: AppDimensions.height10(context) * 1.413,
                          margin: EdgeInsets.only(
                              left: AppDimensions.width10(context) * 0.8),
                          decoration: const BoxDecoration(
                              //shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Light.webp'),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: linkController.text.isNotEmpty
                              ? AppDimensions.height10(context) * 23.8
                              : AppDimensions.height10(context) * 28.3,
                          height: AppDimensions.height10(context) * 2.2,
                          //color: Colors.amber,
                          // margin: EdgeInsets.only(
                          //     top: AppDimensions.height10(context) * 1.5),
                          child: TextFormField(
                            controller: linkController,
                            focusNode: _textFocusNode,
                            onChanged: (value) {
                              setState(() {
                                linkbt = true;
                              });
                            },
                            onTap: () {
                              _textFocusNode
                                  .requestFocus(); // Keep the focus on tap
                            },
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationThickness: 0,
                                fontSize: AppDimensions.font10(context) * 1.5,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xff3C3C43).withOpacity(0.6)),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(
                                    AppDimensions.height10(context) * 0.6,
                                    AppDimensions.height10(context) * 0.4,
                                    0,
                                    0),
                                hintText: 'Enter website address',
                                hintStyle: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff3C3C43)
                                        .withOpacity(0.6)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                            onFieldSubmitted: (value) async {
                              String url = linkController.text;
                              if (!url.startsWith("https://")) {
                                url = "https://$url";
                              }

                              _controller.loadRequest(Uri.parse(url));

                              setState(() {
                                linkUrl = linkController.text.toString();
                              });
                            },
                          ),
                        ),
                        linkController.text.isNotEmpty
                            ? AnimatedScaleButton(
                                onTap: () {
                                  setState(() {});
                                  linkController.clear();
                                  linkUrl = '';
                                  _controller.clearCache();
                                },
                                child: Container(
                                  width: AppDimensions.width10(context) * 2.3,
                                  height: AppDimensions.height10(context) * 2.3,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/ic_refresh.webp'))
                                      // color: Color(0xff282828),
                                      ),
                                  // child: Image.asset(
                                  //   'assets/images/ic_refresh.webp',
                                  //  // width: AppDimensions.width10(context) * 0.941,
                                  //   //height: AppDimensions.height10(context) * 1.4,
                                  //   color: Color(0xff282828),
                                  // ),
                                ),
                              )
                            : AnimatedScaleButton(
                                onTap: () {
                                  Navigator.pop(context);
                                  linkController.clear();
                                },
                                child: Container(
                                  width: AppDimensions.width10(context) * 2.3,
                                  height: AppDimensions.height10(context) * 2.3,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/close_dark.webp'))),
                                ),
                              )
                      ],
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () async {
                      final SharedPreferences prefs = await _prefs;
                      await prefs.setString(
                          'ImageLink', linkController.text.toString());
                      if (widget.route == 'image') {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const photo_info(
                              edit_details: false,
                              image_detals: true,
                              image_save: true,
                              image_create: true,
                            )));
                      } else if (widget.route == 'link') {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const link_info(
                              link_state: true,
                            )));
                      } else if (widget.route == 'video') {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const video_info(
                              link_state: true,
                            )));
                      } else if (widget.route == 'edit_image') {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const photo_Edit(
                              updateData: true,
                            )));
                      } else if (widget.route == 'video_edit') {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const videoEdit(
                              updateData: true,
                              context: false,
                              note: false,
                            )));
                      } else if (widget.route == 'content_edit') {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const videoEdit(
                              updateData: true,
                              context: true,
                              note: false,
                            )));
                      }
                      _controller.clearCache();
                      linkController.clear();
                    },
                    child: Container(
                      height: AppDimensions.height10(context) * 4.2,
                      width: AppDimensions.width10(context) * 6.2,
                      margin: EdgeInsets.only(
                          left: AppDimensions.width10(context) * 0.9),
                      child: Center(
                        child: Text(
                          'Add link',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff007AFF)),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              automaticallyImplyLeading: false,
            ),
          ),
        ),
      ),
    );
  }
}
