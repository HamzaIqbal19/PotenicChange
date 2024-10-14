
import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

noMessages(BuildContext context){
  return Column(
    children: [
      Container(
        margin:
        EdgeInsets.only(top: AppDimensions.height10(context) * 15.2),
        child: Center(
          child: Text(
            'No messages',
            style: TextStyle(
                fontSize: AppDimensions.font10(context) * 2.4,
                fontWeight: FontWeight.w600,
                fontFamily: 'Laila',
                color: const Color(0xFFFBFBFB)),
          ),
        ),
      ),
      Container(

        margin:
        EdgeInsets.only(top: AppDimensions.height10(context) * 1.0),
        child: Center(
          child: Text(
            'You currently have no messages,\nyour new alerts will appear here.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.8,
                fontWeight: FontWeight.w500,
                fontFamily: 'Laila',
                color: const Color(0xFFFBFBFB)),
          ),
        ),
      ),
    ],
  );
}