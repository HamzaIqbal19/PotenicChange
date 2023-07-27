import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/capture_inpirations_goals.dart';
import 'package:potenic_app/Screen/capture_inspiration/imagepicker.dart/imagePicker.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import '../../../Widgets/fading.dart';
import '../../../utils/app_dimensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      var image = prefs.setString('imagePicked', file!.path);
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
              width: AppDimensions.height10(context) * 27.0,
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
                          // width: AppDimensions.height10(context) * 23.8,
                          height: AppDimensions.height10(context) * 4.4,
                          child: Text(
                            'Potenic would like to access\nyour photos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.7,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.2),
                          // width: AppDimensions.height10(context) * 23.8,
                          height: AppDimensions.height10(context) * 3.4,
                          child: Text(
                            'To upload from your device, allow\naccess to your photos.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.3,
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
                  GestureDetector(
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
                              fontSize: AppDimensions.height10(context) * 1.7,
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
                  GestureDetector(
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
                              fontSize: AppDimensions.height10(context) * 1.7,
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
                  GestureDetector(
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
                              fontSize: AppDimensions.height10(context) * 1.7,
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
              width: AppDimensions.height10(context) * 17.0,
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
  String? imageLink;
  List selectedGoals = [];
  List<String> tagList = [];

  void getInspiration() async {
    final SharedPreferences prefs = await _prefs;
    final encodedGoals = prefs.getString('selected_goals_inspiration');
    if (encodedGoals != null) {
      List decodedGoals = List.from(json.decode(encodedGoals));
      setState(() {
        selectedGoals = decodedGoals;
      });
      print('SelectedGoals==============================$selectedGoals');
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
    print('---------------==============================$imageLink');

    link.text = imageLink!;
  }

  void getImageLink() async {
    final SharedPreferences prefs = await _prefs;

    var imageLinked = prefs.getString('ImageLink');

    setState(() {
      imageLink = imageLinked;
    });
    print('---------------==============================$imageLink');

    link.text = imageLink!;
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
    bool link_state = false;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffC4C4C4),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          color: const Color(0xffC4C4C4),
          child: Container(
            // height: AppDimensions.height10(context) * 84.8,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 5.4),
            child: Column(children: [
              Container(
                // width: AppDimensions.height10(context) * 41.1,
                height: AppDimensions.height10(context) * 5.1,
                //margin: EdgeInsets.only(top: AppDimensions.height10(context) * 5.4),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5).withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            AppDimensions.height10(context) * 1.0),
                        topRight: Radius.circular(
                            AppDimensions.height10(context) * 1.0))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: AppDimensions.height10(context) * 2.2,
                        width: AppDimensions.height10(context) * 3.3,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 4.9),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Back',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.5,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff007AFF)),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: AppDimensions.height10(context) * 2.2,
                          width: AppDimensions.height10(context) * 19.9,
                          child: Center(
                              child: widget.edit_details
                                  ? Text(
                                      'Edit image inspiration',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff282828)),
                                    )
                                  : Text(
                                      'Create image inspiration',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff282828)),
                                    )),
                        ),
                      ),
                      Container(
                        height: AppDimensions.height10(context) * 2.2,
                        width: AppDimensions.height10(context) * 4.3,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 4.9),
                        child: widget.image_detals
                            ? Container(
                                child: widget.image_save
                                    ? AnimatedScaleButton(
                                        onTap: () {
                                          widget.image_create
                                              ? InspirationApi()
                                                  .addInspiration(
                                                      1,
                                                      image,
                                                      title.text.toString(),
                                                      tagList,
                                                      link.text.toString(),
                                                      true,
                                                      statement.text.toString(),
                                                      selectedGoals)
                                                  .then((response) {
                                                  if (response.length != 0) {
                                                    print(
                                                        'Success======================');
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
                                                })
                                              : showAnimatedDialog(
                                                  animationType:
                                                      DialogTransitionType
                                                          .fadeScale,
                                                  curve: Curves.easeInOut,
                                                  duration:
                                                      Duration(seconds: 1),
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
                                                                        .height10(
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
                                                                        AppDimensions.height10(context) *
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
                                                                        .height10(
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
                                                                        AppDimensions.height10(context) *
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
                                                                              .addInspiration(1, image, title.text.toString(), ['#tags'], link.text.toString(), true, statement.text.toString(), [19])
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
                                                                              fontSize: AppDimensions.height10(context) * 1.7,
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
                                                                              fontSize: AppDimensions.height10(context) * 1.7,
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
                                        },
                                        child: Text(
                                          widget.image_create
                                              ? 'Create'
                                              : 'Save',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.5,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff007AFF)),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Create',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.5,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff007AFF)),
                                        ),
                                      ),
                              )
                            : Text(
                                'Create',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff007AFF)
                                        .withOpacity(0.4)),
                              ),
                      )
                    ]),
              ),
              Container(
                height: AppDimensions.height10(context) * 79.65,
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
                          left: AppDimensions.height10(context) * 1.8,
                        ),
                        width: AppDimensions.height10(context) * 24.4,
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
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 8.9,
                                    top: widget.image_detals
                                        ? AppDimensions.height10(context) * 3.9
                                        : AppDimensions.height10(context) *
                                            3.9),
                                child: Text(
                                  'Title',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: AppDimensions.height10(context) * 2.4,
                                width: AppDimensions.height10(context) * 30.5,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.6,
                                ),
                                child: TextField(
                                  controller: title,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.7,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff282828)),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          AppDimensions.height10(context) * 1.5,
                                          AppDimensions.height10(context) * 0.4,
                                          AppDimensions.height10(context) * 0.2,
                                          0),
                                      hintText: 'Give your inspiration a title',
                                      hintStyle: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
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
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 4.0),
                                child: widget.image_detals
                                    ? Text(
                                        'Description',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      )
                                    : Text(
                                        'Why is it inspirational to you',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: AppDimensions.height10(context) * 2.4,
                                width: AppDimensions.height10(context) * 30.5,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.6,
                                ),
                                child: TextField(
                                  controller: statement,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.7,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff282828)),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          AppDimensions.height10(context) * 1.5,
                                          AppDimensions.height10(context) * 0.4,
                                          AppDimensions.height10(context) * 0.2,
                                          0),
                                      hintText:
                                          'Say more about this inspiration',
                                      hintStyle: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
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
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 4.0),
                                child: Text(
                                  'Destination website',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    width:
                                        AppDimensions.height10(context) * 30.5,
                                    margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.height10(context) * 0.6,
                                    ),
                                    child: TextField(
                                      controller: link,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff282828)),
                                      decoration: InputDecoration(
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
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
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
                                  widget.image_detals
                                      ? Row(
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.5,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.15),
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.5,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  // image: DecorationImage(image: AssetImage()),
                                                  color: Colors.black,
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.8,
                                                  ),
                                                ),

                                                // margin: EdgeInsets.only(
                                                //     right: AppDimensions.height10(context) * 0.8),
                                                // decoration: BoxDecoration(

                                                //     image: DecorationImage(
                                                //         image: AssetImage(
                                                //             'assets/images/ic_add_circle_black.webp'),
                                                //         fit: BoxFit.cover)),
                                              ),
                                            ),
                                            AnimatedScaleButton(
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
                                          ],
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: link_set()));
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                2.5,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    4.85),
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.5,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              // image: DecorationImage(image: AssetImage()),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: AppDimensions.height10(
                                                        context) *
                                                    1.8,
                                              ),
                                            ),

                                            // margin: EdgeInsets.only(
                                            //     right: AppDimensions.height10(context) * 0.8),
                                            // decoration: BoxDecoration(

                                            //     image: DecorationImage(
                                            //         image: AssetImage(
                                            //             'assets/images/ic_add_circle_black.webp'),
                                            //         fit: BoxFit.cover)),
                                          ),
                                        ),
                                ],
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 4.0),
                                child: Text(
                                  'Tags',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: AppDimensions.height10(context) * 2.4,
                                width: AppDimensions.height10(context) * 30.5,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.6,
                                ),
                                child: TextField(
                                  controller: hastags,
                                  onChanged: (text) {
                                    List<String> words = text.split(' ');

                                    List<String> tags = words
                                        .where((word) => word.startsWith('#'))
                                        .toList();

                                    tagList.clear();

                                    tagList.addAll(tags.toSet());

                                    print(tagList);
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.7,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff282828)),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          AppDimensions.height10(context) * 1.5,
                                          AppDimensions.height10(context) * 0.4,
                                          AppDimensions.height10(context) * 0.2,
                                          0),
                                      hintText: 'Add #hashtags',
                                      hintStyle: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
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
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 8.9,
                                    top: widget.image_detals
                                        ? AppDimensions.height10(context) * 4.0
                                        : AppDimensions.height10(context) *
                                            3.0),
                                child: Text(
                                  'Attached goals',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.image_detals
                                      ? Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const inspiraton_goals(
                                            data_saved: true,
                                            route: 'photo_create',
                                          )))
                                      : Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: inspiraton_goals(
                                                  route: 'photo_create',
                                                  data_saved: false)));
                                },
                                child: Container(
                                  height: AppDimensions.height10(context) * 6.0,
                                  width: AppDimensions.height10(context) * 37.5,
                                  margin: EdgeInsets.only(
                                    // bottom: AppDimensions.height10(context) * 1.0,
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 1.9,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFF464646)),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: AppDimensions.height10(context) *
                                            23.9,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                1.99),
                                        child: GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              '${selectedGoals.length} impacted goals',
                                              style: TextStyle(
                                                fontFamily: 'laila',
                                                color: const Color(0xFF646464),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                      ),
                                      Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          margin: EdgeInsets.only(
                                              right: AppDimensions.height10(
                                                      context) *
                                                  2.391),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/BTN Back.webp',
                                              //width: AppDimensions.height10(context) * 2.6,
                                              //height: AppDimensions.height10(context) * 2.6,
                                              color: const Color(0xFF646464),
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              )
            ]),
          )),
    );
  }
}

class link_set extends StatefulWidget {
  const link_set({super.key});

  @override
  State<link_set> createState() => _link_setState();
}

class _link_setState extends State<link_set> {
  final linkController = TextEditingController();

  bool link_bt = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffC4C4C4),
      ),
      bottomNavigationBar: BottomAppBar(
        // elevation: 0,
        color: const Color(0xffC4C4C4),
        child: Container(
          margin: EdgeInsets.only(top: AppDimensions.height10(context) * 5.4),
          //height: AppDimensions.height10(context) * 83.517,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.height10(context) * 1.0),
                topRight:
                    Radius.circular(AppDimensions.height10(context) * 1.0)),
            color: const Color(0xFF828282),
          ),
          child: Column(
            children: [
              Container(
                // width: AppDimensions.height10(context) * 41.1,
                height: AppDimensions.height10(context) * 5.1,
                // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 5.4),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5).withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            AppDimensions.height10(context) * 1.0),
                        topRight: Radius.circular(
                            AppDimensions.height10(context) * 1.0))),
                child: link_bt
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  link_bt = false;
                                });
                              },
                              child: Container(
                                width: AppDimensions.height10(context) * 3.0,
                                height: AppDimensions.height10(context) * 3.0,
                                margin: EdgeInsets.only(
                                    right:
                                        AppDimensions.height10(context) * 0.8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFF828282)
                                        .withOpacity(0.85),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Close.webp'))),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 29.2,
                              height: AppDimensions.height10(context) * 3.4,
                              // color: Colors.amber,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 1.0),
                                  color: const Color(0xff767680)
                                      .withOpacity(0.12)),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 1.4,
                                    height:
                                        AppDimensions.height10(context) * 1.413,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            0.8),
                                    decoration: const BoxDecoration(
                                        //shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Light.webp'),
                                            fit: BoxFit.fill)),
                                  ),
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 23.8,
                                    height:
                                        AppDimensions.height10(context) * 2.2,
                                    //color: Colors.amber,
                                    // margin: EdgeInsets.only(
                                    //     top: AppDimensions.height10(context) * 1.5),
                                    child: TextFormField(
                                      controller: linkController,
                                      onChanged: (value) {
                                        setState(() {
                                          link_bt = true;
                                        });
                                      },
                                      textAlign: TextAlign.left,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          decorationThickness: 0,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff3C3C43)
                                              .withOpacity(0.6)),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              AppDimensions.height10(context) *
                                                  0.6,
                                              AppDimensions.height10(context) *
                                                  0.4,
                                              0,
                                              0),
                                          hintText: 'Enter website address',
                                          hintStyle: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10(context) *
                                                      1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff3C3C43)
                                                  .withOpacity(0.6)),
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent))),
                                    ),
                                  ),
                                  AnimatedScaleButton(
                                    onTap: () {
                                      setState(() {});
                                      linkController.clear();
                                    },
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 2.3,
                                      height:
                                          AppDimensions.height10(context) * 2.3,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/ic_refresh.webp'))
                                          // color: Color(0xff282828),
                                          ),
                                      // child: Image.asset(
                                      //   'assets/images/ic_refresh.webp',
                                      //  // width: AppDimensions.height10(context) * 0.941,
                                      //   //height: AppDimensions.height10(context) * 1.4,
                                      //   color: Color(0xff282828),
                                      // ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () async {
                                final SharedPreferences prefs = await _prefs;
                                var link = prefs.setString('ImageLink',
                                    linkController.text.toString());
                                print(linkController.text.toString());
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const photo_info(
                                      edit_details: false,
                                      image_detals: true,
                                      image_save: true,
                                      image_create: true,
                                    )));
                              },
                              child: Container(
                                height: AppDimensions.height10(context) * 4.2,
                                width: AppDimensions.height10(context) * 6.2,
                                margin: EdgeInsets.only(
                                    left:
                                        AppDimensions.height10(context) * 0.9),
                                child: Center(
                                  child: Text(
                                    'Add link',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.5,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff007AFF)),
                                  ),
                                ),
                              ),
                            )
                          ])
                    : Row(
                        //it is centered to make it consistent on differernt devices
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Container(
                              width: AppDimensions.height10(context) * 33.7,
                              height: AppDimensions.height10(context) * 3.4,
                              // color: Colors.amber,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 1.0),
                                  color: const Color(0xff767680)
                                      .withOpacity(0.12)),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 1.4,
                                    height:
                                        AppDimensions.height10(context) * 1.413,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            0.8),
                                    decoration: const BoxDecoration(
                                        //shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Light.webp'),
                                            fit: BoxFit.fill)),
                                  ),
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 28.3,
                                    height:
                                        AppDimensions.height10(context) * 2.2,
                                    //color: Colors.amber,
                                    // margin: EdgeInsets.only(
                                    //     top: AppDimensions.height10(context) * 1.5),
                                    child: TextFormField(
                                      controller: linkController,
                                      onChanged: (value) {
                                        setState(() {
                                          link_bt = true;
                                        });
                                      },
                                      textAlign: TextAlign.left,
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          decorationThickness: 0,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff3C3C43)
                                              .withOpacity(0.6)),
                                      decoration: InputDecoration(
                                          hintText: 'Enter website address',
                                          hintStyle: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff3C3C43)
                                                  .withOpacity(0.6)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent)),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent))),
                                    ),
                                  ),
                                  AnimatedScaleButton(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 2.3,
                                      height:
                                          AppDimensions.height10(context) * 2.3,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/close_dark.webp'))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 4.2,
                              width: AppDimensions.height10(context) * 6.2,
                              child: Center(
                                child: link_bt
                                    ? AnimatedScaleButton(
                                        onTap: () async {
                                          final SharedPreferences prefs =
                                              await _prefs;
                                          var link = prefs.setString(
                                              'ImageLink',
                                              linkController.text.toString());
                                          print(linkController.text.toString());
                                          Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page: const photo_info(
                                                edit_details: false,
                                                image_detals: true,
                                                image_save: false,
                                                image_create: false,
                                              )));
                                        },
                                        child: Text(
                                          'Add Link',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.5,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff007AFF)),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.5,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff007AFF)),
                                        ),
                                      ),
                              ),
                            )
                          ]),
              ),
              Container(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
