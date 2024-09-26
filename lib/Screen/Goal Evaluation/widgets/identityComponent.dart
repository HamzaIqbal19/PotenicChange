

import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

identityComponent(BuildContext context,index, text){
  return Container(
    width: AppDimensions.width10(context) * 28.8,
    height: AppDimensions.height10(context) * 13.0,
    margin: EdgeInsets.only(
      left:  index == 0? AppDimensions.width10(context) * 3:AppDimensions.width10(context) * 2
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.height10(context) * 1.8)),
      gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)]),
    ),
    child:  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: AppDimensions.width10(context) * 32.0,
            padding: EdgeInsets.only(
                top: AppDimensions.height10(context) * 2,
                right: AppDimensions.width10(context) * 2,
                left: AppDimensions.width10(context) * 2),
            child: Text('I am someone who',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Laila",
                  color: const Color(0xFFFFFFFF),
                  fontSize: AppDimensions.font10(context) * 2.2,
                ))),
        Container(
            width: AppDimensions.width10(context) * 32.0,
            padding: EdgeInsets.only(
                top: AppDimensions.height10(context) * 0.9,
                right: AppDimensions.width10(context) * 2,
                left: AppDimensions.width10(context) * 2),
            child: Text(text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Laila",
                  color: const Color(0xFFFFFFFF),
                  fontSize: AppDimensions.font10(context) * 1.8,
                ))),
      ],
    ),
  );
}