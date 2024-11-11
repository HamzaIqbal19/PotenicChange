import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/new_progress_score.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class GoalScreenBox {
  alertBox(
      BuildContext context, String title, String content, onCnfrm, onDismiss) {
    return showAnimatedDialog(
        animationType: DialogTransitionType.fadeScale,
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 1),
        context: context,
        builder: (BuildContext context) => Container(
            width: AppDimensions.width10(context) * 27.0,
            height: AppDimensions.height10(context) * 18.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 1.4)),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 1.4)),
              contentPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              title: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 1.4)),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.9,
                    right: AppDimensions.width10(context) * 1.6,
                    left: AppDimensions.width10(context) * 1.6,
                    bottom: AppDimensions.height10(context) * 0.2),
                height: AppDimensions.height10(context) * 2.2,
                width: AppDimensions.width10(context) * 23.8,
                child: Text(
                  title,
                  // "Exit without saving changes?",
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
                    left: AppDimensions.width10(context) * 1.6,
                    right: AppDimensions.height10(context) * 1.6),
                width: AppDimensions.width10(context) * 23.8,
                child: Text(
                  content,
                  // "Are you sure you want to exit, all your\nchanges will be lost?",
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
                    Container(
                      height: AppDimensions.height10(context) * 4.2,
                      width: double.infinity,
                      color: const Color(0xFF007AFF),
                      child: TextButton(
                        onPressed: onCnfrm,
                        //  () {
                        //   Navigator.push(
                        //       context,
                        //       FadePageRouteReverse(
                        //           page: new_progress_score(
                        //         evaluationIndex: widget.index,
                        //         premium: widget.premium,
                        //       )));
                        // },
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
                        onPressed: onDismiss,
                        //  () {
                        //   Navigator.pop(context);
                        // },
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
            )));
  }
}
