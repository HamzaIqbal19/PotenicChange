import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class button_feilds extends StatelessWidget {
  final String feild_text;
  final bool icon_viible;
  final int text_color;
  const button_feilds(
      {super.key,
      required this.feild_text,
      required this.icon_viible,
      required this.text_color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppDimensions.height10 * 0.8,
          right: AppDimensions.height10 * 0.8),
      height: AppDimensions.height10 * 6.0,
      width: AppDimensions.height10 * 36.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.height10 * 2.0),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: AppDimensions.height10 * 23.9,
            height: AppDimensions.height10 * 2.2,
            margin: EdgeInsets.only(left: AppDimensions.height10 * 1.99),
            child: GestureDetector(
                onTap: () {},
                child: Text(
                  feild_text,
                  style: TextStyle(
                    color: Color(text_color),
                    fontSize: AppDimensions.height10 * 1.8,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          Container(
              width: AppDimensions.height10 * 2.4,
              height: AppDimensions.height10 * 1.39,
              margin: EdgeInsets.only(right: AppDimensions.height10 * 2.391),
              child: icon_viible
                  ? GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/BTN Back.png',
                        //width: AppDimensions.height10 * 2.6,
                        //height: AppDimensions.height10 * 2.6,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container())
        ],
      ),
    );
  }
}
