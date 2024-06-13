
import 'package:flutter/material.dart';
import 'package:potenic_app/MyServices/Notification/notificationApis.dart';
import 'package:potenic_app/MyServices/Notification/notificationRouting.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

void notificationsSheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimensions.height10(context) * 2.0),
          )),
      builder: ((context) => Container(
        width: AppDimensions.width10(context) * 41.4,
        height: AppDimensions.height10(context) * 57.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top:
                Radius.circular(AppDimensions.height10(context) * 2.0)),
            color: const Color(0xFFF5F5F5)),
        child: Column(
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
              width: AppDimensions.width10(context) * 38.2,
              height: AppDimensions.height10(context) * 5.7,
              margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 1.1),
              child: Center(
                child: Text(
                  'In order to build consistent behaviour,\nallow us to gently nudge you to remind you to do\nyour practices and offer helpful tips.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.4,
                      height: AppDimensions.height10(context) * 0.15,
                      //letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF437296)),
                ),
              ),
            ),
            Container(
              width: AppDimensions.width10(context) * 38.2,
              height: AppDimensions.height10(context) * 21.0,
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
                    width: AppDimensions.width10(context) * 34.5,
                    height: AppDimensions.height10(context) * 5.1,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.4),
                    child: Center(
                        child: Text(
                          'We will check in with you to remind you about your\npractices. You would be able to customise your\nnotifications later in your Account Settings. ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.4,
                              height: AppDimensions.height10(context) * 0.15,
                              //letterSpacing: AppDimensions.height10(context) * 0.2,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFFFFFFF)),
                        )),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 34.3,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.7),
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
                            fontSize: AppDimensions.font10(context) * 1.6,
                            //  height: AppDimensions.height10(context) * 0.12,
                            //letterSpacing: AppDimensions.height10(context) * 0.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )));
}

void seeMoreSheet(context, data) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimensions.height10(context) * 2.0),
          )),
      builder: ((context) => Container(
        width: AppDimensions.width10(context) * 41.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top:
                Radius.circular(AppDimensions.height10(context) * 2.0)),
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
                    horizontal: AppDimensionsUpdated.width10(context) * 1.162),
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
              width: AppDimensions.width10(context) * 38.2,
              margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 1.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'In order to build consistent behaviour,\nallow us to gently nudge you to remind you to do\nyour practices and offer helpful tips.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.8,
                        height: AppDimensions.height10(context) * 0.15,
                        //letterSpacing: AppDimensions.height10(context) * 0.2,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF437296)),
                  ),
                  Container(
                    width: UpdatedDimensions.width10(context) *5.245,
                    height: UpdatedDimensions.width10(context) *1.3,
                    child:const Divider(
                                  thickness:1,
                                  color: Color(0xFF437296),
                    ),
                  ),
                  SizedBox(height: AppDimensionsUpdated.height10(context),),
                  Text(
                    'You have been consistently recording your practice for 20 active days now. We’ve put together a progress report for you to review and you can also evaluate your practice.',
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.6,
                        height: AppDimensions.height10(context) * 0.15,
                        //letterSpacing: AppDimensions.height10(context) * 0.2,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF437296)),
                  ),

                ],
              ),
            ),
            SizedBox(height: AppDimensionsUpdated.height10(context)*2,),
            AnimatedScaleButton(child: Buttons().linearGradButton(AppDimensionsUpdated.height10(context)*5, AppDimensionsUpdated.width10(context)*29.5, "Primary CTA", AppDimensionsUpdated.font10(context)*1.6,const Color(0xFFFCC10D), const Color(0xFFFDA210), false), onTap: (){
              if(data["data"]["route"]!= ""){
                navigationRouting(context,data["data"]["route"],data["data"]["url"]??"");
              }}),

              SizedBox(height: AppDimensionsUpdated.height10(context)*2,),
              AnimatedScaleButton(child: Buttons
                ().deleteButton(context, AppDimensionsUpdated.height10(context)*5, AppDimensionsUpdated.width10(context)*29.5, "Delete alert CTA"), onTap: (){
                notificationApi.deleteUserNotification(data["id"]);
                Navigator.pop(context);
              }),

            SizedBox(height: AppDimensionsUpdated.height10(context)*2,),
          ],
        ),
      )));
}
