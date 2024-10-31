import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:potenic_app/MyServices/Notification/notificationApis.dart';
import 'package:potenic_app/MyServices/Notification/notificationRouting.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/PracticeName.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

void notificationsSheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
          bottom: Radius.circular(16),
        ),
      ),
      builder: ((context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: AppDimensions.width10(context) * 40.4,
              //height: AppDimensions.height10(context) * 57.6,
              margin: EdgeInsets.only(
                  left: AppDimensions.width10(context) * 1.0,
                  right: AppDimensions.width10(context) * 1.0,
                  bottom: AppDimensions.height10(context) * 1.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          AppDimensions.height10(context) * 2.0)),
                  color: const Color(0xFFF5F5F5)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    //color: Colors.amber,
                    // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                    alignment: const Alignment(1, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensions.width10(context) * 2.6,
                        height: AppDimensions.height10(context) * 2.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.5,
                            right: AppDimensions.width10(context) * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Close_blue.webp'))),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.9,
                        bottom: AppDimensions.height10(context) * 2.9),
                    child: Image.asset(
                      'assets/images/potenic__icon.webp',
                      width: AppDimensions.width10(context) * 8.202,
                      height: AppDimensions.height10(context) * 11.2,
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 22.7,
                    height: AppDimensions.height10(context) * 3.6,
                    // color: Colors.amber,
                    alignment: Alignment.center,
                    //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                    child: Text(
                      'Get Reminders',
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.4,
                          letterSpacing: AppDimensions.height10(context) * 0.2,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF437296)),
                    ),
                  ),
                  Container(
                   // width: AppDimensions.width10(context) * 38.2,
                    //height: AppDimensions.height10(context) * 5.7,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.1),
                    child: Center(
                      child: Text(
                        "To build consistent behaviour would you\nlike to receive gentle reminders from us?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.9,
                            height: AppDimensions.height10(context) * 0.15,
                            //letterSpacing: AppDimensions.height10(context) * 0.2,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 38.2,
                    //height: AppDimensions.height10(context) * 21.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.6),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: AppDimensions.width10(context) * 0.1,
                            color: const Color(0xFFFBFBFB)),
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        gradient: const LinearGradient(colors: [
                          Color(0xFFE8776D),
                          Color(0xFFEF939D),
                          Color(0xFFEF939D)
                        ])),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.0),
                          child: Image.asset(
                            'assets/images/notifications.webp',
                            width: AppDimensions.width10(context) * 4.8,
                            height: AppDimensions.height10(context) * 4.8,
                          ),
                        ),
                        Container(
                         // width: AppDimensions.width10(context) * 34.5,
                         // height: AppDimensions.height10(context) * 5.1,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.4),
                          child: Center(
                              child: Text(
                            'You would be able to customise your\nnotifications later in your Account Settings.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.9,
                                height: AppDimensions.height10(context) * 0.15,
                                //letterSpacing: AppDimensions.height10(context) * 0.2,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFFFFFF)),
                          )),
                        ),
                        AnimatedScaleButton(
                          onTap: () async {
                            Navigator.of(context).pop();
                            await openAppSettings();
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 34.3,
                            height: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.7,
                                bottom: AppDimensions.height10(context) * 1.7),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.1,
                                    color: const Color(0xFFFBFBFB)),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 5.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFFCC10D),
                                      Color(0xFFFDA210)
                                    ])),
                            child: Center(
                              child: Text(
                                'Yes, remind Me',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2,
                                    //  height: AppDimensions.height10(context) * 0.12,
                                    //letterSpacing: AppDimensions.height10(context) * 0.2,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 2,
                  )
                ],
              ),
            ),
          )));
}

void seeMoreSheet(context, data, final VoidCallback tap1) {
  showModalBottomSheet(
      context: context,
      //isScrollControlled: true,
      backgroundColor: Colors.transparent,
      scrollControlDisabledMaxHeightRatio: 500,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      builder: ((context) => Container(
            width: AppDimensions.width10(context) * 40,
            margin: EdgeInsets.only(
                left: AppDimensions.width10(context) * 1.0,
                right: AppDimensions.width10(context) * 1.0,
                bottom: AppDimensions.height10(context) * 1.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
                    AppDimensionsUpdated.height10(context) * 2)),
                color: const Color(0XFFE4CDCD)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  //color: Colors.amber,
                  // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                  alignment: const Alignment(1, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: AppDimensions.width10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.5,
                          right: AppDimensions.width10(context) * 1.5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Close_blue.webp'))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9,
                      bottom: AppDimensions.height10(context) * 0.9),
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 7.6,
                    height: AppDimensionsUpdated.height10(context) * 7.6,
                    padding: EdgeInsets.symmetric(
                        vertical: AppDimensionsUpdated.height10(context) * 0.85,
                        horizontal:
                            AppDimensionsUpdated.width10(context) * 1.162),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Image.asset(
                      'assets/images/Vector Smart Object_1.webp',
                      width: AppDimensionsUpdated.width10(context) * 5.275,
                      height: AppDimensionsUpdated.height10(context) * 5.991,
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 22.7,
                  height: AppDimensions.height10(context) * 3.6,
                  // color: Colors.amber,
                  alignment: Alignment.center,
                  //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                  child: Text(
                    'Alert',
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 3,
                        letterSpacing: AppDimensions.height10(context) * 0.2,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF437296)),
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 29.2,
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: AppDimensions.width10(context) * 3.5),
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalizeFirstLetter(data["title"]),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2,
                            height: AppDimensions.height10(context) * 0.15,
                            //letterSpacing: AppDimensions.height10(context) * 0.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF437296)),
                      ),
                      Container(
                        width: UpdatedDimensions.width10(context) * 5.245,
                        height: UpdatedDimensions.width10(context) * 1.3,
                        child: const Divider(
                          thickness: 1,
                          color: Color(0xFF437296),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensionsUpdated.height10(context),
                      ),
                      Text(
                        capitalizeFirstLetter(data["body"]),
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.8,
                            height: AppDimensions.height10(context) * 0.15,
                            //letterSpacing: AppDimensions.height10(context) * 0.2,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF437296)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensionsUpdated.height10(context) * 2,
                ),
                data["data"] != null
                    ? data['status'] != 'read'
                        ? AnimatedScaleButton(
                            child: Buttons().linearGradButton(
                                AppDimensionsUpdated.height10(context) * 5,
                                AppDimensionsUpdated.width10(context) * 29.5,
                                routeName(data["data"]["route"]),
                                AppDimensionsUpdated.font10(context) * 2,
                                const Color(0xFFFCC10D),
                                const Color(0xFFFDA210),
                                false),
                            onTap: () {
                              if (data["data"]["route"] != "") {
                                navigationIds(data["data"]);
                                navigationRouting(
                                    context,
                                    data["data"]["route"],
                                    data["data"]["url"] ?? "");
                              }
                            })
                        : Container()
                    : Container(),
                SizedBox(
                  height: AppDimensionsUpdated.height10(context) * 2,
                ),
                AnimatedScaleButton(
                    child: Buttons().deleteButton(
                        context,
                        AppDimensionsUpdated.height10(context) * 5,
                        AppDimensionsUpdated.width10(context) * 29.5,
                        "Delete alert"),
                    onTap: tap1),
                SizedBox(
                  height: AppDimensionsUpdated.height10(context) * 1.8,
                ),
              ],
            ),
          )));
}

String routeName(route) {
  if (route == 'community') {
    return 'View Community';
  } else if (route == 'contactUs') {
    return 'Send us your story';
  } else {
    return 'Action it';
  }
}
