import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/capture_inpirations_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class AttachedGoals {
  Widget customAttachedWidget(
      BuildContext context, selectedGoals, void Function() ontap) {
    return AnimatedScaleButton(
      onTap: ontap,
      child: Container(
        height: AppDimensions.height10(context) * 6.0,
        width: AppDimensions.width10(context) * 37.5,
        margin: EdgeInsets.only(
          left: AppDimensions.width10(context) * 2.0,
          right: AppDimensions.width10(context) * 1.9,
        ),
        decoration: BoxDecoration(
            color: const Color(0xFFFBFBFB),
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 2.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: AppDimensions.width10(context) * 23.9,
              margin:
                  EdgeInsets.only(left: AppDimensions.height10(context) * 1.99),
              child: Text(
                '${selectedGoals!.length} impacted goals',
                style: TextStyle(
                  color: const Color(0xFF646464),
                  fontSize: AppDimensions.font10(context) * 1.9,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    right: AppDimensions.width10(context) * 2.391),
                child: Text(
                  'View',
                  style: TextStyle(
                      color: const Color(0xFF437296),
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationThickness:
                          AppDimensions.height10(context) * 0.2,
                      fontSize: UpdatedDimensions.font10(context) * 1.6),
                ))
          ],
        ),
      ),
    );
  }

  Widget customAttachContainer(BuildContext context) {
    return Container(
      height: AppDimensions.height10(context) * 2.2,
      width: AppDimensions.width10(context) * 30.5,
      margin: EdgeInsets.only(
          left: AppDimensions.width10(context) * 2.0,
          right: AppDimensions.width10(context) * 8.9,
          bottom: AppDimensions.height10(context) * 0.5,
          top: AppDimensions.height10(context) * 3.9),
      child: Text(
        'Attached goals',
        style: TextStyle(
            fontSize: AppDimensions.font10(context) * 1.6,
            fontWeight: FontWeight.w400,
            color: const Color(0xff828282)),
      ),
    );
  }
}
