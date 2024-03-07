import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

resetDialog(BuildContext context, text, Function function) {
  return showAnimatedDialog(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        width: AppDimensions.height10(context) * 27.0,
        height: AppDimensions.height10(context) * 18.2,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 1.4)),
            margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 1.9,
                right: AppDimensions.height10(context) * 1.6,
                left: AppDimensions.height10(context) * 1.6,
                bottom: AppDimensions.height10(context) * 0.2),
            height: AppDimensions.height10(context) * 2.2,
            width: AppDimensions.height10(context) * 23.8,
            child: Text(
              "Reset answers?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.7,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          content: Container(
            margin: EdgeInsets.only(
                bottom: AppDimensions.height10(context) * 1.5,
                left: AppDimensions.height10(context) * 1.6,
                right: AppDimensions.height10(context) * 1.6),
            // height: AppDimensions.height10(context) * 3.2,
            width: AppDimensions.height10(context) * 23.8,
            child: Text(
              "Are you sure you want to reset, all your\nchanges for $text?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.3,
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
                GestureDetector(
                  onTap: function()

                  // selectedItemIndexesOuter!.clear();
                  ,
                  child: Container(
                    height: AppDimensions.height10(context) * 4.2,
                    width: double.infinity,
                    color: const Color(0xFF007AFF),
                    child: Center(
                      child: Text(
                        'Yes',
                        style: TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontSize: AppDimensions.font10(context) * 1.7,
                            fontFamily: "Laila",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.1,
                  child: Divider(
                    color: const Color(0XFF3C3C43).withOpacity(0.29),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 4.4,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
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
                  height: AppDimensions.height10(context) * 0.1,
                  child: Divider(
                    color: const Color(0XFF3C3C43).withOpacity(0.29),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
    animationType: DialogTransitionType.fadeScale,
    curve: Curves.easeInOut,
    duration: const Duration(seconds: 1),
  );
}

dialog(BuildContext context, text, Function function, bool tapOn) {
  return showAnimatedDialog(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        width: AppDimensions.height10(context) * 27.0,
        height: AppDimensions.height10(context) * 18.2,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 1.4)),
            margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 1.9,
                right: AppDimensions.height10(context) * 1.6,
                left: AppDimensions.height10(context) * 1.6,
                bottom: AppDimensions.height10(context) * 0.2),
            height: AppDimensions.height10(context) * 2.2,
            width: AppDimensions.height10(context) * 23.8,
            child: Text(
              "Alert",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.7,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          content: Container(
            margin: EdgeInsets.only(
                bottom: AppDimensions.height10(context) * 1.5,
                left: AppDimensions.height10(context) * 1.6,
                right: AppDimensions.height10(context) * 1.6),
            // height: AppDimensions.height10(context) * 3.2,
            width: AppDimensions.height10(context) * 23.8,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.3,
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
                  height: AppDimensions.height10(context) * 4.4,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      function();
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 1.7,
                          fontFamily: "Laila",
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF007AFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.1,
                  child: Divider(
                    color: const Color(0XFF3C3C43).withOpacity(0.29),
                  ),
                ),
                tapOn
                    ? Column(
                        children: [
                          SizedBox(
                            height: AppDimensions.height10(context) * 0.1,
                            child: Divider(
                              color: const Color(0XFF3C3C43).withOpacity(0.29),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 4.4,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.7,
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF007AFF)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 0.1,
                            child: Divider(
                              color: const Color(0XFF3C3C43).withOpacity(0.29),
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ],
        ),
      );
    },
    animationType: DialogTransitionType.fadeScale,
    curve: Curves.easeInOut,
    duration: const Duration(seconds: 1),
  );
}
