import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

void report(context) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(AppDimensions.height10(context) * 2.0)),
    builder: (context) => Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: AppDimensions.width10(context) * 39.4,
          height: AppDimensions.height10(context) * 51.3,
          margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 1.0,
              right: AppDimensions.width10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.3),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFFE1B3B7), Color(0XffC9B9CB)]),
            image: const DecorationImage(
                opacity: 0.7,
                image: AssetImage('assets/images/timeline_2.webp'),
                fit: BoxFit.cover),
            borderRadius:
            BorderRadius.circular(AppDimensions.height10(context) * 2.0),
          ),
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
              SizedBox(
                width: AppDimensions.width10(context) * 23.8,
                height: AppDimensions.height10(context) * 3.4,
                // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 3.2),
                child: Text(
                  'Congratulations!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppDimensions.font10(context) * 2.8,
                      color: const Color(0xff437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 32.8,
                height: AppDimensions.height10(context) * 2.4,
                margin:
                EdgeInsets.only(top: AppDimensions.height10(context) * 0.5),
                child: Text(
                  'Your 20 active day report is ready',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.12,
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimensions.font10(context) * 2.0,
                      color: const Color(0xff437296)),
                ),
              ),
              Container(
                //  width: AppDimensions.width10(context) * 33.8,
                // height: AppDimensions.height10(context) * 6.8,
                margin:
                EdgeInsets.only(top: AppDimensions.height10(context) * 1.5),
                child: Text(
                  'You have been consistently working on your\npractice for 20 active days now. We’ve put together\na practice report for you to review and evaluate\nyour journey.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: AppDimensions.font10(context) * 1.4,
                      color: const Color(0xff437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 23.7,
                height: AppDimensions.height10(context) * 25.5,
                margin:
                EdgeInsets.only(top: AppDimensions.height10(context) * 3.2),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/Report card.webp')),
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                ),
              )
            ],
          ),
        )),
  );
}
