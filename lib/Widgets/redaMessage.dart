import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/MyServices/Notification/notificationApis.dart';
import 'package:potenic_app/MyServices/Notification/notificationRouting.dart';
import 'package:potenic_app/Screen/Alerts/widgets/notificationSheet.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:carousel_slider/carousel_slider.dart';

reda(BuildContext context, notificationData, final VoidCallback onTap) {
  return AnimatedScaleButton(
    onTap: () {
      //notificationApi.markAsRead(notificationData["id"]);
      seeMoreSheet(context, notificationData);
      onTap();
    },
    child: Container(
      height: UpdatedDimensions.height10(context) * 16.7,
      width: UpdatedDimensions.width10(context) * 35.335,
      margin: EdgeInsets.only(
          top: UpdatedDimensions.height10(context) * 1,
          right: UpdatedDimensions.height10(context) * 3),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/Component 1.webp',
        ),
        fit: BoxFit.contain,
      )),
      child: Stack(children: [
        Align(
          alignment: const Alignment(0.93, 0),
          child: Image.asset(
            "assets/images/Vector Smart Object.webp",
            height: UpdatedDimensions.height10(context) * 9.296,
            width: UpdatedDimensions.width10(context) * 4.16,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: UpdatedDimensions.height10(context) * 4.7,
          ),
          child: Column(
            children: [
              Container(
                width: UpdatedDimensions.width10(context) * 26.7,
                //height: UpdatedDimensions.width10(context) * 2.3,
                margin: EdgeInsets.only(
                    left: UpdatedDimensions.width10(context) * 3.4),
                child: Text(
                  notificationData["title"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: UpdatedDimensions.font10(context) * 2,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(91, 116, 166, 1),
                  ),
                ),
              ),
              Container(
                width: UpdatedDimensions.width10(context) * 5.245,
                height: UpdatedDimensions.width10(context) * 1.3,
                margin: EdgeInsets.only(
                    right: UpdatedDimensions.height10(context) * 17.5),
                child: const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(91, 116, 166, 1),
                ),
              ),
              Container(
                width: UpdatedDimensions.width10(context) * 26.7,
                height: UpdatedDimensions.height10(context) * 5.3,
                margin: EdgeInsets.only(
                    left: UpdatedDimensions.width10(context) * 3.4,
                    bottom: UpdatedDimensions.height10(context) * 1.2),
                child: Text(
                  notificationData["body"],
                  // textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: UpdatedDimensions.font10(context) * 1.8,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(91, 116, 166, 1)),
                ),
              )
            ],
          ),
        ),
      ]),
    ),
  );
}


// NotificationCarousol(BuildContext context){
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     child: CarouselSlider.builder(itemCount: 3,
//         itemBuilder: (BuildContext context,int itemIndex, int pageViewIndex)=>reda(
//             context,"Hi, it's Reda here", notificationsController.getNotificationBody, false, notificationsController.getNotificationRoute, notificationsController.getNotificationUrl, (){
//           setState(() {
//             isVisible = !isVisible;
//           });
//           print("isVisible $isVisible");
//         }),
//         options: CarouselOptions(enlargeCenterPage: true, height: 200,)),
//   );
// }

// reda(
// context,"Hi, it's Reda here", notificationsController.getNotificationBody, false, notificationsController.getNotificationRoute, notificationsController.getNotificationUrl, (){
// setState(() {
// isVisible = !isVisible;
// });
// print("isVisible $isVisible");
// })