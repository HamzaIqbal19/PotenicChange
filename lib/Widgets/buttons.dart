import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class Buttons {
  linearGradButton(double height, double width, String text, double fontSize,
      Color colour1, Color colour2, bool transparent) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40.0)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: transparent
                  ? [const Color(0xFF282828).withOpacity(0.5)]
                  : [colour1, colour2])),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }

  deleteButton(context, double height, double width, String text) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
              width: AppDimensions.width10(context) * 0.1,
              color: const Color(0xFFFFFFFF)),
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 4.0),
          color: const Color(0xff464646)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppDimensions.width10(context) * 2.4,
            height: AppDimensions.height10(context) * 2.4,
            margin: EdgeInsets.only(
              right: AppDimensions.height10(context) * 0.5,
            ),
            child: const Icon(
              Icons.delete,
              color: Color(0XFFFFFFFF),
            ),
          ),
          SizedBox(
            height: AppDimensions.height10(context) * 2.2,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  fontSize: AppDimensions.font10(context) * 1.8,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffffffff)),
            )),
          ),
        ],
      ),
    );
  }
}
