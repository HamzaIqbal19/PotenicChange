
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/formattedTime.dart';

dashboardPlaceHolder(BuildContext context,){
  return SizedBox(
      width: double.infinity,
      child: Column(children: [

        Container(
          // width: 343,
          // height: 49,
          margin: EdgeInsets.only(
            top: UpdatedDimensions.height10(context) *
                3.9,
          ),
          child: Center(
            child: Text(
              'All your practices\nare inactive',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize:
                  UpdatedDimensions.font10(context) *
                      3.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Laila'),
            ),
          ),
        ),
        Container(
          // width: 269,
          // height: 58,
          margin: EdgeInsets.only(
              top: UpdatedDimensions.height10(context) *
                  1.8),
          child: Center(
            child: Text(
              "You don’t have any active or\nplanned practices. Please view\nyour current goals to manage\nand update your practices.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Laila',
                  fontSize:
                  UpdatedDimensions.font10(context) *
                      1.8,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        AnimatedScaleButton(
          onTap: (){
            Navigator.pushReplacement(context,
                FadePageRoute(page: const view_all_goals_menu()));
          },
          child: Container(
              height:
              UpdatedDimensions.height10(context) *
                  5.0,
              width: UpdatedDimensions.width10(context) *
                  24.3,
              margin: EdgeInsets.only(
                  top: UpdatedDimensions.height10(
                      context) *
                      4.6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFCC10D),
                      Color(0xffFDA210),
                    ]),
                borderRadius: BorderRadius.circular(
                    UpdatedDimensions.height10(context) *
                        5.0),
              ),
              child: Center(
                child: Text(
                  'View all goals',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: UpdatedDimensions.font10(
                          context) *
                          1.6,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Laila'),
                ),
              )),
        )
      ]));
}

