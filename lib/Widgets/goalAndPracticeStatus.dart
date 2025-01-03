import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

goalAndPracticeStatus(BuildContext, goalColor, pracColor, pracName, missed) {
  return Container(
    width: AppDimensions.width10(BuildContext) * 30.0,
    height: AppDimensions.height10(BuildContext) * 11.2,
    margin: EdgeInsets.only(
        top: AppDimensions.height10(BuildContext) * 0.6,
        left: AppDimensions.width10(BuildContext) * 5),
    // color: Colors.blue,
    child: Row(
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
                  height: AppDimensions.height10(BuildContext) * 4.2,
                  width: AppDimensions.width10(BuildContext) * 4.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: pracColor == null
                              ? const AssetImage(
                                  'assets/images/Ellipse 158_wb.webp')
                              : AssetImage(missed == true
                                  ? pracColor == "1"
                                      ? 'assets/images/Missed_3.webp'
                                      : pracColor == "2"
                                          ? 'assets/images/Missed_1.webp'
                                          : pracColor == "3"
                                              ? "assets/images/Missed_2.webp"
                                              : pracColor == "4"
                                                  ? "assets/images/Missed_4.webp"
                                                  : pracColor == "5"
                                                      ? "assets/images/Missed_4.webp"
                                                      : "assets/images/Missed_1.webp"
                                  : pracColor == "1"
                                      ? "assets/images/Practice_Completed_1.webp"
                                      : pracColor == "2"
                                          ? 'assets/images/Practice_Completed_2.webp'
                                          : pracColor == "3"
                                              ? "assets/images/Practice_Completed_3.webp"
                                              : pracColor == "4"
                                                  ? "assets/images/Practice_Completed_4.webp"
                                                  : pracColor == "5"
                                                      ? "assets/images/Practice_Completed_4.webp"
                                                      : 'assets/images/Practice_Completed_2.webp'),
                          fit: BoxFit.contain)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: AppDimensions.width10(BuildContext) * 21.6,
          height: AppDimensions.height10(BuildContext) * 4.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pracName ?? 'No data found',
                style: TextStyle(
                    color: const Color(0xfff6f6f6),
                    height: 1.2,
                    overflow: TextOverflow.ellipsis,
                    fontSize: AppDimensions.font10(BuildContext) * 2.0,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                missed ? 'Session missed' : 'Session completed',
                style: TextStyle(
                    color: missed
                        ? const Color(0xffEB5757)
                        : const Color(0xff156F6D),
                    height: 1.2,
                    overflow: TextOverflow.ellipsis,
                    fontSize: AppDimensions.font10(BuildContext) * 1.8,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
