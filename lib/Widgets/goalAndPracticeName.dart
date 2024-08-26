import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

goalAndPractice(
  BuildContext,
  goalColor,
  pracColor,
  pracName,
) {
  return Container(
    width: AppDimensions.width10(BuildContext) * 30.0,
    height: AppDimensions.height10(BuildContext) * 11.2,
    margin: EdgeInsets.only(
        top: AppDimensions.height10(BuildContext) * 0.6,
      left: AppDimensions.height10(BuildContext) * 6
        ),
    // color: Colors.blue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: AppDimensions.width10(BuildContext) * 7.5,
          height: AppDimensions.height10(BuildContext) * 7.5,
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(-1, -0.3),
                child: Container(
                  width: AppDimensions.width10(BuildContext) * 6.5,
                  height: AppDimensions.height10(BuildContext) * 6.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: goalColor == null
                            ? const AssetImage('assets/images/orange_moon.webp')
                            : AssetImage(goalColor == null
                                ? "assets/images/orange_moon.webp"
                                : goalColor == "1"
                                    ? "assets/images/red_gradient.webp"
                                    : goalColor == "2"
                                        ? 'assets/images/orange_moon.webp'
                                        : goalColor == "3"
                                            ? "assets/images/lightGrey_gradient.webp"
                                            : goalColor == "4"
                                                ? "assets/images/lightBlue_gradient.webp"
                                                : goalColor == "5"
                                                    ? "assets/images/medBlue_gradient.webp"
                                                    : goalColor == "6"
                                                        ? "assets/images/Blue_gradient.webp"
                                                        : 'assets/images/orange_moon.webp'),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.8, -0.2),
                child: Container(
                  height: AppDimensions.height10(BuildContext) * 4.1,
                  width: AppDimensions.width10(BuildContext) * 4.061,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: pracColor == null
                              ? const AssetImage(
                                  'assets/images/Ellipse 158_wb.webp')
                              : AssetImage(pracColor == null
                                  ? 'assets/images/Ellipse 158_wb.webp'
                                  : pracColor == "1"
                                      ? "assets/images/Ellipse orange_wb.webp"
                                      : pracColor == "2"
                                          ? 'assets/images/Ellipse 158_wb.webp'
                                          : pracColor == "3"
                                              ? "assets/images/Ellipse 157_wb.webp"
                                              : pracColor == "4"
                                                  ? "assets/images/Ellipse light-blue_wb.webp"
                                                  : pracColor == "5"
                                                      ? "assets/images/Ellipse blue_wb.webp"
                                                      : pracColor == null
                                                          ? 'assets/images/Ellipse 158_wb.webp'
                                                          : 'assets/images/Ellipse 158_wb.webp'),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5,),
        SizedBox(
          width: AppDimensions.width10(BuildContext) * 16.6,
          height: AppDimensions.height10(BuildContext) * 2.4,

          child: Text(
            pracName ?? 'No data found',
            style: TextStyle(
                color:  const Color(0xff156F6D),
                height: 1.2,
                overflow: TextOverflow.ellipsis,
                fontSize: AppDimensions.font10(BuildContext) * 2.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
