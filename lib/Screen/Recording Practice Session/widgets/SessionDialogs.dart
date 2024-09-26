
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

sessionDialog(BuildContext context, onTap){
  return showAnimatedDialog(
    animationType: DialogTransitionType.fadeScale,
    curve: Curves.easeInOut,
    duration: const Duration(seconds: 1),
    context: context,
    builder: (BuildContext context) => SizedBox(
      width: AppDimensionsUpdated.width10(context) * 27.0,
      height: AppDimensionsUpdated.height10(context) * 18.2,
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                AppDimensionsUpdated.height10(context) *
                    1.4)),
        title: Container(
          margin: const EdgeInsets.only(
              top: 19,
              right: 16,
              left: 16,
              bottom: 2),
          height:
          AppDimensionsUpdated.height10(context) * 2.2,
          width:
          AppDimensionsUpdated.width10(context) * 23.8,
          child: Text(
            "Are you sure?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF000000),
              fontSize:
              AppDimensionsUpdated.font10(context) * 1.7,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        content: Container(
          margin: EdgeInsets.only(
              bottom:
              AppDimensionsUpdated.height10(context) *
                  1.9,
              left: AppDimensionsUpdated.height10(context) *
                  1.6,
              right: AppDimensionsUpdated.width10(context) *
                  1.6),
          height:
          AppDimensionsUpdated.height10(context) * 3.2,
          width:
          AppDimensionsUpdated.width10(context) * 23.8,
          child: Text(
            "If you close it now, you will lose all your progress.",
            textAlign: TextAlign.center,
            style: TextStyle(
              height:
              AppDimensionsUpdated.height10(context) *
                  0.15,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: <Widget>[
          Column(
            children: [
              Container(
                height: 42,
                width: double.infinity,
                color: const Color(0xFF007AFF),
                child: TextButton(
                  onPressed: onTap,
                  child: const Text(
                    'Close',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 17,
                        fontFamily: "Laila",
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 44,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Laila",
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF007AFF)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}