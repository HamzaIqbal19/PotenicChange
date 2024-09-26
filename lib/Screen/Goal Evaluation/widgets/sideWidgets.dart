import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

sideWidget(BuildContext context, noData, name){
  return Container(
    width: AppDimensions.width10(context) * 40.872,
    height: AppDimensions.height10(context) * 11.0,
    margin: EdgeInsets.only(
        top: AppDimensions.height10(context) * 11.1,
        right: AppDimensions.width10(context) * 10.7),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(
                AppDimensions.height10(context) * 2.0),
            bottomRight: Radius.circular(
                AppDimensions.height10(context) * 2.0)),
        gradient: const LinearGradient(
            colors: [Color(0xFF91698C), Color(0xFFC19CA7)])),
    child: Container(
      width: AppDimensions.width10(context) * 24.3,
      height: AppDimensions.height10(context) * 7.0,
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          top: AppDimensions.height10(context) * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppDimensions.width10(context) * 24.3,
            height: AppDimensions.height10(context) * 2.6,
            child: Text(
              'Practice progress report',
              style: TextStyle(
                  fontSize:
                  AppDimensions.font10(context) * 2.0,
                  height:
                  AppDimensions.height10(context) * 0.12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFFFFFF)),
            ),
          ),
          Container(
            width: AppDimensions.width10(context) * 3.3,
            height: AppDimensions.height10(context) * 0.2,
            margin: EdgeInsets.only(
                bottom: AppDimensions.height10(context) * 1.7,
                top: AppDimensions.height10(context) * 0.45),
            decoration:
            const BoxDecoration(color: Color(0xFFFFFFFF)),
          ),
          SizedBox(
            // width: AppDimensions.width10(context) * 10.1,
            height: AppDimensions.height10(context) * 2.4,
            child: Text(
              noData == true
                  ? 'No data found'
                  : name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize:
                  AppDimensions.font10(context) * 2.0,
                  height:
                  AppDimensions.height10(context) * 0.12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFFFFFFF)),
            ),
          ),
        ],
      ),
    ),
  );
}