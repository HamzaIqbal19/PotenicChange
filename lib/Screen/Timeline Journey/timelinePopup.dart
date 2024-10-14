import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Subscription%20Journey/Subscription.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

void timelinePopup(context) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.width10(context) * 40,
          padding: EdgeInsets.only(bottom: AppDimensions.height10(context) * 3),
          margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 1.0,
              right: AppDimensions.width10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              color: const Color(0xFFF5F5F5)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
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
                        top: AppDimensions.height10(context) * 1.9,
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
                    top: AppDimensions.height10(context) * 1.5,
                    bottom: AppDimensions.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.width10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                //height: AppDimensions.height10(context) * 3.6,
                
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.4),
                child: Center(
                  child: Text(
                    'Timeline is only available\non Ownership Plan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.font10(context) * 2.6,
                        color: const Color(0xFF437296)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 34.2,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.2),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    
                      style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.6,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Laila',
                        color: const Color(0xFF437296),
                      ),
                      children: const [
                        TextSpan(
                          text:
                              'To see your Timeline journey experience and get exclusive access to other in-app benefits, please check if our Ownership Plan is for you.',
                        ),
                      ]),
                ),
              ),
              Container(
                 width: AppDimensions.width10(context) * 33.2,
                 height: AppDimensions.height10(context) * 29.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.0,
                    bottom: AppDimensions.height10(context) * 3.2),
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/timelineUnsubscribed.webp'))),
              ),
              AnimatedScaleButton(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        FadePageRouteReverse(page: const Subscription()));
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 36.0,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.7,bottom: AppDimensions.height10(context)*2.7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 5.0),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFFCC10D), Color(0xFFFCC10D)])),
                    child: Center(
                      child: Text(
                        'View subscription details',
                        style: TextStyle(
                            fontFamily: 'LAILA',
                            color: const Color(0xFFFFFFFF),
                            fontSize: AppDimensions.font10(context) * 1.8,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
             
            ],
          )),
    ),
  );
}
