import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class AlertBox {
  void alertDialog(context, String text, Function() onTap) {
    showAnimatedDialog(
        animationType: DialogTransitionType.fadeScale,
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 1),
        context: context,
        builder: (BuildContext context) => SizedBox(
              width: AppDimensions.width10(context) * 27.0,
              height: AppDimensions.height10(context) * 24.0,
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
                  // height:
                  //     AppDimensions.height10(context) * 2.2,
                  width: AppDimensions.width10(context) * 23.8,
                  child: Text(
                    "Exit $text",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                content: Container(
                  margin:
                      const EdgeInsets.only(bottom: 19, left: 16, right: 16),
                  // height:
                  //     AppDimensions.height10(context) * 1.6,
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
                        height: AppDimensions.height10(context) * 0.1,
                        child: Divider(
                          color: const Color(0XFF3C3C43).withOpacity(0.29),
                        ),
                      ),
                      SizedBox(
                        height: 44,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: onTap,
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
                        height: AppDimensions.height10(context) * 0.1,
                        child: Divider(
                          color: const Color(0XFF3C3C43).withOpacity(0.29),
                        ),
                      ),
                      Container(
                        height: 42,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 1.0),
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
            ));
  }
}
