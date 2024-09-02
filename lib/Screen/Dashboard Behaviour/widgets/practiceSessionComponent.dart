

import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/mult_circles.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

dashBoardSessionComponent(BuildContext context,data ,final VoidCallback action1, final VoidCallback tap1, final VoidCallback tap2){
  return Column(
    children: [
      Container(
        width: UpdatedDimensions
            .width10(
            context) *
            35.6,
        height: UpdatedDimensions
            .height10(
            context) *
            4.7,
        margin: EdgeInsets.only(
            left: UpdatedDimensions
                .height10(
                context) *
                2.4,
            right: UpdatedDimensions
                .height10(
                context) *
                3.4,
            ),
        child: Column(
            children: [
              GestureDetector(
                onTap:action1,
                child:
                Container(
                  alignment:
                  Alignment.centerLeft,
                  child:
                  Text(
                    data['time'].toString().substring(
                        0,
                        5),
                    style:
                    TextStyle(
                      fontSize:
                      UpdatedDimensions.font10(context) * 1.8,
                      fontWeight:
                      FontWeight.w600,
                      color:
                      Colors.white,
                    ),
                  ),
                ),
              ),
              Divider(
                height:
                UpdatedDimensions.height10(context) *
                    0.2,
                color: Colors
                    .white,
              ),
              Container(
                alignment:
                Alignment
                    .centerLeft,
                child:
                Text(
                  data['time']
                      .toString()
                      .trim()
                      .substring(5)
                      .toUpperCase(),
                  style:
                  TextStyle(
                    fontSize:
                    UpdatedDimensions.font10(context) * 1.2,
                    fontWeight:
                    FontWeight.w500,
                    color:
                    Colors.white,
                  ),
                ),
              ),
            ]),
      ),
      Column(
        children: [
          Center(
            child: align_circles(
                goalColor: data['data']['userGoal']['color'] ??"2",
                practiceStatus: data['status'],
                smallCircleText: data['data']['name'],
                practiceColor:data['data']['color']??"2",
                headText: data['data']['userGoal']['name'],
                bodyText: data['data']['userGoal']['identityStatement'][0]['text'],
                headTextColor: 0xff5B74A6,
                bodyTextSize: UpdatedDimensions.font10(context) * 1.6,
                headTextSize: UpdatedDimensions.font10(context) * 2.0,
                isRight: true,
                onTap1: tap1,
                onTap2: tap2,
          ))
        ],
      ),
      SizedBox(
        height: UpdatedDimensions
            .height10(
            context) *
            3.0,
      ),
    ],
  );
}