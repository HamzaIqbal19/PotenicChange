import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class button_feilds extends StatelessWidget {
  final String feild_text;
  final String feild_text_2;
  final String feild_text_3;
  final String feild_text_4;
  final bool icon_viible;
  final int text_color;
  final int text_color_2;
  const button_feilds(
      {super.key,
      required this.feild_text,
      required this.icon_viible,
      required this.text_color,
      required this.feild_text_2,
      required this.text_color_2,
      required this.feild_text_3,
      required this.feild_text_4});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(
      //     left: AppDimensions.height10(context) * 0.8,
      //     right: AppDimensions.height10(context) * 0.8),
      height: AppDimensions.height10(context) * 6.0,
      width: AppDimensions.height10(context) * 36.0,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 2.0),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: AppDimensions.height10(context) * 23.9,
            height: AppDimensions.height10(context) * 2.2,
            margin:
                EdgeInsets.only(left: AppDimensions.height10(context) * 1.99),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Color(text_color),
                        fontFamily: 'laila',
                        fontSize: AppDimensions.height10(context) * 1.6,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                    TextSpan(text: feild_text),
                    TextSpan(
                      text: feild_text_2,
                      style: TextStyle(
                        color: Color(text_color_2),
                        fontFamily: '',
                        fontSize: AppDimensions.height10(context) * 1.4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(text: feild_text_3),
                    TextSpan(
                      text: feild_text_4,
                      style: TextStyle(
                        color: Color(text_color_2),
                        fontFamily: '',
                        fontSize: AppDimensions.height10(context) * 1.4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ])),
            ),
          ),
          Container(
              width: AppDimensions.height10(context) * 2.4,
              height: AppDimensions.height10(context) * 1.39,
              margin: EdgeInsets.only(
                  right: AppDimensions.height10(context) * 2.391),
              child: icon_viible
                  ? Image.asset(
                      'assets/images/BTN Back.webp',
                      //width: AppDimensions.height10(context) * 2.6,
                      //height: AppDimensions.height10(context) * 2.6,
                      fit: BoxFit.cover,
                    )
                  : Container())
        ],
      ),
    );
  }
}
