import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/AppCustomCircle.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CircleType {
  Widget customCircleType(
    context, {
    Function? onTap,
    String? bgimage,
    String? image,
    String? text,
    double? left,
  }) {
    return AnimatedScaleButton(
      onTap: onTap!,
      child: AppCustomCircle().CustomContainer(
        context,
        margin: EdgeInsets.only(
            right: AppDimensions.width10(context) * 1.4, left: left!),
        image: DecorationImage(image: AssetImage(bgimage!), fit: BoxFit.cover),
        child: Container(
          margin: EdgeInsets.all(AppDimensions.height10(context) * 0.758),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(5)
          ),
          child: DottedBorder(
              borderType: BorderType.Circle,
              color: Colors.white,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppDimensions.width10(context) * 3.032,
                      height: AppDimensions.height10(context) * 3.032,
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) * 0.68),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(image!))),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) * 1.0),
                      child: Text(
                        text!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.8,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 2.122,
                      height: AppDimensions.height10(context) * 2.122,
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) * 0.178),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/Addgoal.webp'))),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
