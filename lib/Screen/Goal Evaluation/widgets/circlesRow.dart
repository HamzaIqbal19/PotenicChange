import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

circlesInRowColored(BuildContext context, int iteration, Color circleColor) {
  return Container(
    //width: AppDimensions.width10(context) * 16.0,
    // height: AppDimensions.height10(context) * 1.0,
    margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        (iteration / 5).ceil(),
            (rowIndex) => Container(
          margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (rowIndex == (iteration / 5).floor()
                  ? (iteration % 5)
                  : 5), // Replace 5 with the number of containers you want to create
                  (index) => Container(
                width: AppDimensions.width10(context) * 1.5,
                height: AppDimensions.height10(context) * 1.5,
                margin: EdgeInsets.symmetric(
                    horizontal: AppDimensions.width10(context) * 0.25),
                decoration:
                BoxDecoration(color: circleColor, shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}


circlesInRow(BuildContext context, int iteration) {
  return Container(
    //width: AppDimensions.width10(context) * 16.0,
    // height: AppDimensions.height10(context) * 1.0,
    margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.8),
    child: Column(
      children: List.generate(
        (iteration / 10).ceil(),
            (rowIndex) => Container(
          margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (rowIndex == (iteration / 10).floor()
                  ? (iteration % 10)
                  : 10), // Replace 5 with the number of containers you want to create
                  (index) => Container(
                width: AppDimensions.width10(context) * 1.0,
                height: AppDimensions.height10(context) * 1.0,
                margin: EdgeInsets.symmetric(
                    horizontal: AppDimensions.width10(context) * 0.25),
                decoration: const BoxDecoration(
                    color: Color(0xFFB695B7), shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
