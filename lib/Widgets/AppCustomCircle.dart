import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class AppCustomCircle {
  Widget CustomContainer(context,
      {gradient, image, child, border, margin, padding}) {
    bool smallScreen = MediaQuery.of(context).size.height < 690;
    return Container(
      width: !smallScreen
          ? AppDimensions.width10(context) * 15.1
          : AppDimensions.width10(context) * 13.1,
      height: !smallScreen
          ? AppDimensions.width10(context) * 15.1
          : AppDimensions.width10(context) * 13.1,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
        image: image,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
