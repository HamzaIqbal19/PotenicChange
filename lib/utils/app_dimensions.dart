// import 'package:get/get.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  // screen height 866.2857142857143
  // screen width  411.4285714285714
  double pageView(BuildContext context) => screenHeight(context) / 2.71;
  double pageViewContainer(BuildContext context) =>
      screenHeight(context) / 3.94;
  double pageViewTextContainer(BuildContext context) =>
      screenHeight(context) / 7.22;

  // dynamic heights

  static check(context) {
    if (MediaQuery.of(context).size.height < 690) {
      return ((7.545.h));
    } else {
      return (screenHeight(context) / 90.196080);
    }
  }

  static checkWidth(context) {
    if (MediaQuery.of(context).size.height < 690) {
      return ((8.5.w));
    } else {
      return (screenHeight(context) /90.196080);
    }
  }

  static checkText(context) {
    if (MediaQuery.of(context).size.height < 690) {
      return ((8.22.sp));
    } else {
      return (screenHeight(context) / 90.196080);
    }
  }

  static double height10(BuildContext context) => check(context);
  static double font10(BuildContext context) => checkText(context);

  // static double height10(BuildContext context) =>
  //     screenHeight(context) / 90.196080;
  static double width10(BuildContext context) => checkWidth(context);
}

class AppDimensions2 {
  static double screenHeight = Get.height;
  static double screenWidth = Get.width;

  // screen height 866.2857142857143
  // screen width  411.4285714285714

  static double pageView = screenHeight / 2.71;
  static double pageViewContainer = screenHeight / 3.94;
  static double pageViewTextContainer = screenHeight / 7.22;

  // dynamic heights
  static double height2 = screenHeight / 433.14;
  static double height3 = screenHeight / 288.76;
  static double height5 = screenHeight / 173.26;
  static double height10 = screenHeight / 90.196080;

  static double height15 = screenHeight / 57.75;
  static double height20 = screenHeight / 43.31;
  static double height30 = screenHeight / 28.8;
  static double height45 = screenHeight / 19.25;
  static double height72 = screenHeight / 12.527;
  static double height120 = screenHeight / 7.22;
  static double height350 = screenHeight / 1.577;

  static double height254 = screenHeight / 3.55;

  // dynamic widths
  static double width5 = screenHeight / 173.26;
  static double width10 = screenHeight / 86.63;
  static double width15 = screenHeight / 57.75;
  static double width20 = screenHeight / 43.31;
  static double width30 = screenHeight / 28.8;
  static double width45 = screenHeight / 19.25;

  // font sizes
  static double font12 = screenHeight / 72.19;
  static double font16 = screenHeight / 54.14;
  static double font20 = screenHeight / 43.31;
  static double font26 = screenHeight / 33.33;
  static double fontHeight = screenHeight / 721.90;

  // dynamic radius
  static double radius15 = screenHeight / 57.75;
  static double radius20 = screenHeight / 43.31;
  static double radius30 = screenHeight / 28.8;

  // dynamic icon size
  static double iconSize15 = screenHeight / 57.75;
  static double iconSize16 = screenHeight / 54.14;
  static double iconSize20 = screenHeight / 43.31;
  static double iconSize24 = screenHeight / 36.09;

  // dynamic list view size
  static double listViewImgSize = screenWidth / 3.43;
  static double listTextContSize = screenWidth / 4.11;

  // dynamic icons container size
  static double iconConWidth = screenWidth / 9.14;
  static double iconConHeight = screenHeight / 19.25;
  static double iconSize = screenWidth / 17.14;
}
