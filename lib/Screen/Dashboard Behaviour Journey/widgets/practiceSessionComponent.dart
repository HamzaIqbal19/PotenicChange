import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/widgets/tooltips.dart';
import 'package:potenic_app/Widgets/mult_circles.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

dashBoardSessionComponent(
    BuildContext context,
    superTooltipController1,
    superTooltipController2,
    superTooltipController3,
    skipFunc,
    nextFunc,
    index,
    data,
    final VoidCallback action1,
    final VoidCallback tap1,
    final VoidCallback tap2) {
  return Column(
    children: [
      Container(
        width: UpdatedDimensions.width10(context) * 35.6,
        height: UpdatedDimensions.height10(context) * 4.7,
        margin: EdgeInsets.only(
          left: UpdatedDimensions.height10(context) * 2.4,
          right: UpdatedDimensions.height10(context) * 3.4,
        ),
        child: Column(children: [
          GestureDetector(
            onTap: action1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                data['time'].toString().substring(0, 5),
                style: TextStyle(
                  fontSize: UpdatedDimensions.font10(context) * 1.8,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Divider(
            height: UpdatedDimensions.height10(context) * 0.2,
            color: Colors.white,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              data['time'].toString().trim().substring(5).toUpperCase(),
              style: TextStyle(
                fontSize: UpdatedDimensions.font10(context) * 1.2,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          //down
          index == 0
              ? Align(
                  alignment: const Alignment(-0.95, 1),
                  child: dashboardTooltip(
                    superTooltipController3,
                    context,
                    3,
                    'down',
                    skipFunc,
                    nextFunc,
                    Container(
                      height: 0,
                      width: 0,
                    ),
                  ),
                )
              : Container()
        ]),
      ),
      Column(
        children: [
          //up

          Center(
            child: align_circles(
              goalColor: data['data']['userGoal']['color'] ?? "2",
              practiceStatus: data['status'],
              smallCircleText: data['data']['name'],
              practiceColor: data['data']['color'] ?? "2",
              headText: data['data']['userGoal']['name'],
              bodyText: data['data']['userGoal']['identityStatement'][0]
                  ['text'],
              headTextColor: 0xff5B74A6,
              bodyTextSize: UpdatedDimensions.font10(context) * 1.6,
              headTextSize: UpdatedDimensions.font10(context) * 2.0,
              isRight: true,
              onTap1: tap1,
              onTap2: tap2,
              index: index,
              superTooltipController1: superTooltipController1,
              superTooltipController2: superTooltipController2,
              skipFunc: skipFunc,
              nextFunc: nextFunc,
            ),
          )
        ],
      ),
      SizedBox(
        height: UpdatedDimensions.height10(context) * 3.0,
      ),
    ],
  );
}
