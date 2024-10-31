import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

menuItems(BuildContext context, route, title,bool border) {
  final colorC = Color.alphaBlend(
      const Color(0xFF000000).withOpacity(0.2), const Color(0XFF5B74A6));
  return AnimatedScaleButton(
    onTap: route,
    child: Container(
      width: AppDimensions.width10(context) * 33.4,
      height: AppDimensions.height10(context) * 5.5,
      decoration:border==false?const BoxDecoration(): BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: AppDimensions.width10(context) * 0.1, color: colorC))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            //width: AppDimensions.width10(context) * 20.6,
            //height: AppDimensions.height10(context) * 1.9,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: AppDimensions.font10(context) * 2,
                  fontWeight: FontWeight.w500,
                  color: colorC),
            ),
          ),
          SizedBox(
              width: AppDimensions.height10(context) * 2.4,
              height: AppDimensions.height10(context) * 1.39,
              child: Image.asset(
                'assets/images/BTN Back.webp',
                //width: AppDimensions.width10(context) * 2.6,
                //height: AppDimensions.height10(context) * 2.6,
                color: colorC,
                fit: BoxFit.cover,
              ))
        ],
      ),
    ),
  );
}
