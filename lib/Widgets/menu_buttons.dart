import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class ButtonFields extends StatelessWidget {
  final String fieldText;
  final String fieldText2;
  final String fieldText3;
  final String fieldText4;
  final bool iconVisible;
  final int textColor;
  final int textColor2;
  final bool premium;
  const ButtonFields(
      {super.key,
      required this.fieldText,
      required this.iconVisible,
      required this.textColor,
      required this.fieldText2,
      required this.textColor2,
      required this.fieldText3,
      required this.fieldText4,
      required this.premium});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(
      //     left: AppDimensions.width10(context) * 0.8,
      //     right: AppDimensions.width10(context) * 0.8),
      height: AppDimensions.height10(context) * 6.0,
      width: AppDimensions.width10(context) * 38.4,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 2.0),
          color: premium ? Colors.white : Colors.white.withOpacity(0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: AppDimensions.width10(context) * 29.9,
            margin: EdgeInsets.only(left: AppDimensions.width10(context) * 2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Color(textColor),
                        fontFamily: 'laila',
                        fontSize: AppDimensions.font10(context) * 2.0,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                    TextSpan(text: fieldText),
                    TextSpan(
                      text: fieldText2,
                      style: TextStyle(
                        color: Color(textColor2),
                        fontFamily: 'laila',
                        fontSize: AppDimensions.font10(context) * 1.6,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(text: fieldText3),
                    TextSpan(
                      text: fieldText4,
                      style: TextStyle(
                        color: Color(textColor2),
                        fontFamily: 'laila',
                        fontSize: AppDimensions.font10(context) * 1.6,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ])),
            ),
          ),
          Container(
              width: AppDimensions.width10(context) * 2.4,
              height: AppDimensions.height10(context) * 1.39,
              margin:
                  EdgeInsets.only(right: AppDimensions.width10(context) * 2),
              child: iconVisible
                  ? Image.asset(
                      'assets/images/BTN Back.webp',
                      //width: AppDimensions.width10(context) * 2.6,
                      //height: AppDimensions.height10(context) * 2.6,
                      fit: BoxFit.cover,
                    )
                  : Container())
        ],
      ),
    );
  }
}
