import 'package:flutter/material.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class InspirationComponent extends StatelessWidget {
  final mainImage;
  String Text1;
  String Text2;
  InspirationComponent(
      {super.key,
      required this.mainImage,
      required this.Text1,
      required this.Text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 38.4,
      height: AppDimensions.height10(context) * 42.4,
      margin: EdgeInsets.only(
          top: AppDimensions.height10(context) * 2.0,
          left: AppDimensions.width10(context) * 1.4,
          right: AppDimensions.width10(context) * 1.4),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius:
            BorderRadius.circular(AppDimensions.height10(context) * 2.6),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimensions.width10(context) * 20.5,
            height: AppDimensions.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensions.width10(context) * 14.0,
              top: AppDimensions.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 3.5,
                  height: AppDimensions.height10(context) * 3.5,
                  margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 0.8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/inspiration.webp'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 13.4,
                  height: AppDimensions.height10(context) * 2.2,
                  child: Text(
                    'Inspiration',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.font10(context) * 1.8,
                        color: const Color(0xff437296)),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: AppDimensions.width10(context) * 34.6,
            height: AppDimensions.height10(context) * 33.2,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.5),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/bg_inpiration_purple.webp'),
                  fit: BoxFit.cover),
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
            ),
            child: Column(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 28.5,
                  height: AppDimensions.height10(context) * 3.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.0),
                  child: Text(
                    'Inspiration recorded',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.font10(context) * 2.8,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 17.2,
                  height: AppDimensions.height10(context) * 16.9,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(mainImage))),
                ),
                Container(
                  width: AppDimensions.width10(context) * 16.7,
                  height: AppDimensions.height10(context) * 1.7,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 0.6),
                  child: Text(
                    Text1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.font10(context) * 1.4,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 16.7,
                  height: AppDimensions.height10(context) * 3.0,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 0.2),
                  child: Text(
                    Text2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: AppDimensions.font10(context) * 1.1,
                        color: const Color(0xFFFFFFFF)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
