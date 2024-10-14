

import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/widgets/generateCircles.dart';
import 'package:potenic_app/Widgets/calender.dart';
import 'package:potenic_app/Widgets/circle_dates.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

calender(BuildContext context, noData, report,int completedCount){

  return Container(
    width: AppDimensions.width10(context) * 38.2,
    height: AppDimensions.height10(context) * 88.569,
    margin: EdgeInsets.only(
        top: AppDimensions.height10(context) * 3.7),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            AppDimensions.height10(context) * 2.0),
        color: const Color(0xFFFFFFFF)),
    child: Column(
      children: [
        SizedBox(
          height: AppDimensions.height10(context) * 5.0,
        ),
        Circulardates(
          size: AppDimensions.width10(context) * 24.0,
          outerCircleContainers: noData == true
              ? []
              : completedCount > 19
              ? generateCircleContainers(context, 20)
              : generateCircleEmptyContainers(
              context, 20 - completedCount) +
              generateCircleContainers(
                  context, completedCount)
          ,
          centerContainer: Container(
            height: AppDimensions.height10(context) * 20.6,
            width: AppDimensions.width10(context) * 14.9,
            margin: EdgeInsets.only(
                left: AppDimensions.width10(context) * 2.0),

            // color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width:
                    AppDimensions.width10(context) * 13.3,
                    height:
                    AppDimensions.height10(context) * 7.9,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // margin: EdgeInsets.only(left: AppDimensions.width10(context)*1.0),
                          // height:
                          //     AppDimensions.height10(context) *
                          //         7.7,
                          child: Text(
                            noData == true
                                ? '-'
                                : completedCount > 19
                                ? "20"
                                : completedCount
                                .toString(),
                            style: TextStyle(
                                fontSize:
                                AppDimensions.font10(
                                    context) *
                                    7.4,
                                color:
                                const Color(0xFF156F6D),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10(
                              context) *
                              7.7,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            '/20',
                            style: TextStyle(
                                fontSize:
                                AppDimensions.font10(
                                    context) *
                                    2.4,
                                color:
                                const Color(0xFF646464),
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height:
                    AppDimensions.height10(context) * 4.9,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) *
                            0.5),
                    child: Text(
                      'Active days\ncompleted!',
                      style: TextStyle(
                          fontSize:
                          AppDimensions.font10(context) *
                              1.8,
                          color: const Color(0xFF156F6D),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppDimensions.height10(context) * 8.0,
          width: AppDimensions.width10(context) * 23,
          child: Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'laila',
                      height: 1.2,
                      fontSize:
                      UpdatedDimensions.font10(context) * 1.4,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF5B74A6),
                    ),
                    children: const [
                      TextSpan(
                          text:
                          'You have completed this\nover '),
                      TextSpan(
                          text: '2 months',
                          style: TextStyle(
                              fontWeight: FontWeight.w700))
                    ])),
          ),
        ),
        Container(
            height: AppDimensions.height10(context) * 46.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 2.0)),
            child: CalendarWithRadioButtons(
              status: true,
              dateStatus: noData == true
                  ? {
                "2023-07-18": "completed",
                "2023-07-19": "completed",
                "2023-07-20": "completed",
                "2023-07-21": "completed",
                "2023-07-22": "completed",
                "2023-07-23": "completed",
                "2023-07-24": "completed",
                "2023-07-25": "completed",
                "2023-07-26": "completed",
                "2023-07-27": "completed",
                "2023-07-28": "completed",
                "2023-07-29": "completed",
                "2023-07-30": "completed",
                "2023-07-31": "missed",
                "2023-08-01": "completed",
                "2023-08-02": "completed",
                "2023-08-03": "completed",
                "2023-08-04": "completed",
                "2023-08-05": "completed",
                "2023-08-06": "missed"
              }
                  : report['practiceProgress'],
              limitCalender: true,
            )),
      ],
    ),
  );

}