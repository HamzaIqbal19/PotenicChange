import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class DayTimeComponent extends StatelessWidget {
  String DayText;
  String TimeText;
  DayTimeComponent({super.key, required this.DayText, required this.TimeText});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppDimensionsUpdated.height10(context) * 8.2,
        width: AppDimensionsUpdated.width10(context) * 8.2,
        margin:
            EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 2.8),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: const Color(0xFFF5F5F5)),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF5F2E6), Color(0xffECDA91)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DayText,
              style: TextStyle(
                  fontSize: AppDimensionsUpdated.font10(context) * 2,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff5B74A6)),
            ),
            Text(
              TimeText,
              style: TextStyle(
                  fontSize: AppDimensionsUpdated.font10(context) * 2,
                  height: AppDimensionsUpdated.height10(context) * 0.12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff5B74A6)),
            ),
          ],
        ));
  }
}
