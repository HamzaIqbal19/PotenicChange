import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_assets.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

goalWidget(BuildContext context, height, width, color, name, reason, font1,
    font2, Color textColor) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(color == "1"
                ? AppAssets.goal1
                : color == "2"
                    ? AppAssets.goal2
                    : color == "3"
                        ? AppAssets.goal3
                        : color == "4"
                            ? AppAssets.goal4
                            : color == "5"
                                ? AppAssets.goal5
                                : color == "6"
                                    ? AppAssets.goal6
                                    : AppAssets.goal2),
            fit: BoxFit.cover)),
    child: Stack(
      children: [
        Align(
            alignment: const Alignment(0, -0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: UpdatedDimensions.height10(context) * 2.0,
                      bottom: UpdatedDimensions.height10(context) * 0),
                  width: UpdatedDimensions.width10(context) * 19.9,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: font1,
                        height: UpdatedDimensions.height10(context) * 0.15,
                        fontWeight: FontWeight.w600,
                        color: textColor),
                  ),
                ),
              ],
            )),
        Align(
          alignment: const Alignment(0, -0.10),
          child: SizedBox(
            height: UpdatedDimensions.height10(context) * 4.0,
            width: UpdatedDimensions.width10(context) * 22.0,
            child: Text(reason,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    height: UpdatedDimensions.height10(context) * 0.15,
                    fontSize: font2,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: textColor)),
          ),
        )
      ],
    ),
  );
}

practiceWidget(BuildContext context, height, width, color, name, status) {
  return Container(
    height: height,
    width: width,
    padding:
        EdgeInsets.symmetric(horizontal: UpdatedDimensions.width10(context)),
    decoration: BoxDecoration(
        //color: Colors.amber,
      shape: status == 'Not Started'? BoxShape.circle:BoxShape.rectangle,
      border: status == 'Not Started'?Border.all(color: Colors.white,width: 2):Border.all(color: Colors.transparent),
        image: DecorationImage(
            image: status == "missed"
                ? AssetImage(color == "1"
                    ? AppAssets.practiceMissed1
                    : color == "2"
                        ? AppAssets.practiceMissed2
                        : color == "3"
                            ? AppAssets.practiceMissed3
                            : color == "4"
                                ? AppAssets.practiceMissed4
                                : color == "5"
                                    ? AppAssets.practiceMissed5
                                    : AppAssets.practiceMissed2)
                : status == "completed"
                    ? AssetImage(color == "1"
                        ? AppAssets.practiceComplete1
                        : color == "2"
                            ? AppAssets.practiceComplete2
                            : color == "3"
                                ? AppAssets.practiceComplete3
                                : color == "4"
                                    ? AppAssets.practiceComplete4
                                    : color == "5"
                                        ? AppAssets.practiceComplete5
                                        : AppAssets.practiceComplete2)
                    : AssetImage(color == "1"
                        ? AppAssets.practice1
                        : color == "2"
                            ? AppAssets.practice2
                            : color == "3"
                                ? AppAssets.practice3
                                : color == "4"
                                    ? AppAssets.practice4
                                    : color == "5"
                                        ? AppAssets.practice5
                                        : AppAssets.practice2),
            fit: BoxFit.contain)),
    child: Stack(children: [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: UpdatedDimensions.width10(context),
        ),
        child: Center(
            child: SizedBox(
          //height: UpdatedDimensions.height10(context) * 6.064,
          width: UpdatedDimensions.width10(context) * 11.225,
          child: Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: status == "Not Started"
                    ? const Color(0xFFFBFBFB)
                    : color == "1"
                        ? const Color(0XFFFC7133)
                        : color == "2"
                            ? const Color(0xFF1A481C)
                            : color == "3"
                                ? const Color(0xFF6D4B77)
                                : color == "4"
                                    ? const Color(0xFF5C75A6)
                                    : color == "5"
                                        ? const Color(0xFF315291)
                                        : const Color(0xFFFBFBFB),
                height: UpdatedDimensions.height10(context) * 0.14,
                fontSize: UpdatedDimensions.font10(context) * 1.8,
                fontWeight: FontWeight.w500),
          ),
        )),
      ),
    ]),
  );
}
