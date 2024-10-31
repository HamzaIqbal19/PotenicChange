import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class photo_pop_up extends StatefulWidget {
  const photo_pop_up({super.key});

  @override
  State<photo_pop_up> createState() => _photo_pop_upState();
}

class _photo_pop_upState extends State<photo_pop_up> {
  File? imageFile;

  void getImage({required ImageSource source}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final XFile? file = await ImagePicker().pickImage(
        source: source,
        //maxWidth: 640,
        // maxHeight: 480,
        imageQuality: 100 //0 - 100--
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
                  // edit_details: false,
                  // image_detals: false,
                  // image_save: false,
                  // image_create: false,
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
                    onTap: () async {
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
                    onTap: () async {
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
                    onTap: () async {
                      getImage(source: ImageSource.gallery);
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
