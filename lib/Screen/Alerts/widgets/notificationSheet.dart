
import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

void notifications_sheet(context) {
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
