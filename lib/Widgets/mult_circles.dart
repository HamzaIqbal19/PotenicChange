import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/widgets/tooltips.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/goalWidget.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../utils/app_dimensions.dart';

class align_circles extends StatelessWidget {
  final String goalColor;
  final String practiceColor;
  final String practiceStatus;
  final String headText;
  final String bodyText;
  final double bodyTextSize;
  final double headTextSize;
  final int headTextColor;
  final bool isRight;
  final SuperTooltipController superTooltipController1;
  final SuperTooltipController superTooltipController2;
  final VoidCallback skipFunc;
  final VoidCallback nextFunc;
  final int index;

  final String smallCircleText;
  // final VoidCallback? onTap1;
  final Function onTap2;
  final Function onTap1;

  const align_circles(
      {super.key,
      required this.goalColor,
      required this.smallCircleText,
      required this.headText,
      required this.bodyText,
      required this.isRight,
      required this.bodyTextSize,
      required this.headTextSize,
      required this.headTextColor,
      required this.onTap1,
      required this.onTap2, required this.practiceStatus, required this.practiceColor, required this.index, required this.superTooltipController1, required this.superTooltipController2, required this.skipFunc, required this.nextFunc});

  @override
  Widget build(BuildContext context) {
    bool smallScreen = MediaQuery.of(context).size.height < 690;
    return SizedBox(
      width: smallScreen
          ? UpdatedDimensions.width10(context) * 27.8
          : UpdatedDimensions.width10(context) * 26.8,
      height: smallScreen
          ? UpdatedDimensions.height10(context) * 33.2
          : UpdatedDimensions.height10(context) * 30.2,
      // color: Colors.blue,
      // margin: const EdgeInsets.only(top: 29, bottom: 12, right: 45),
      child: Stack(children: [
        index == 0? Align(
          alignment: const Alignment(0, -0.5),
          child: dashboardTooltip(superTooltipController1, context, 1, 'up',skipFunc, nextFunc,Container(height: 0,width: 0,),
          ),
        ):Container(),
        Align(
          alignment: Alignment.center,
          child: AnimatedScaleButton(
            onTap: onTap1,
              child: goalWidget(context, smallScreen
                  ? UpdatedDimensions.height10(context) * 29.9
                  : UpdatedDimensions.height10(context) * 26.8, smallScreen
                  ? UpdatedDimensions.height10(context) * 29.9
                  : UpdatedDimensions.height10(context) * 26.8, goalColor, headText, bodyText, headTextSize, bodyTextSize, Color(headTextColor)),
            ),

        ),
        index == 0? Align(
          alignment: const Alignment(0.4, 0.3),
          child: dashboardTooltip(superTooltipController2, context, 2, 'up',skipFunc,nextFunc,Container(height: 0,width: 0,),
          ),
        ):Container(),
        Align(
          alignment:
          isRight ? const Alignment(0.7, 1.3) : const Alignment(-0.45, 1),
          child: AnimatedScaleButton(
            onTap: onTap2,
              child: practiceWidget(context, smallScreen
                  ? UpdatedDimensions.height10(context) * 16.6
                  : UpdatedDimensions.height10(context) * 14.1, smallScreen
                  ? UpdatedDimensions.height10(context) * 16.6
                  : UpdatedDimensions.height10(context) * 14.1, practiceColor, smallCircleText, practiceStatus)

          ),
        ),
      ]),
    );
  }
}
