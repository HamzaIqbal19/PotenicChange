import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/webVisit.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

void journeyBottomSheet(context, title, body, link) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.width10(context) * 40,
          //height: AppDimensions.height10(context) * 57.7,
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
                child: AnimatedScaleButton(
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
                    bottom: AppDimensions.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.width10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                // width: AppDimensions.width10(context) * 28.7,
                //height: AppDimensions.height10(context) * 3.4,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.8,
                      height: AppDimensions.height10(context) * .16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 33.2,
                //height: AppDimensions.height10(context) * 26.9,
                //color: Colors.grey,
                margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 1.2,
                ),
                child: Text(
                  body,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.8,
                      //height: AppDimensions.height10(context) * 0.14,
                      //letterSpacing: AppDimensions.height10(context) * 0.12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF437296)),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2,
              ),
              AnimatedScaleButton(
                onTap: () {
                  webVisit(link);
                },
                child: Container(
                  width: AppDimensions.height10(context) * 37.5,
                  height: AppDimensions.height10(context) * 5,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10(context) * 2.4,
                        height: AppDimensions.height10(context) * 2.4,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/youtubeIcon.png'),
                              fit: BoxFit.contain,
                            )),
                      ),
                      SizedBox(
                        width: AppDimensions.height10(context),
                      ),
                      Text(
                        'Watch Demo',
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF646464),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    ),
  );
}
