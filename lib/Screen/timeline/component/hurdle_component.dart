import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class HurdleComponent extends StatelessWidget {
  String mainText;
  String subText;
  HurdleComponent({super.key, required this.mainText, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 38.4,
      height: AppDimensions.height10(context) * 39.4,
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
              right: AppDimensions.width10(context) * 15.0,
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
                          image: AssetImage('assets/images/hurdle.webp'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 13.4,
                  height: AppDimensions.height10(context) * 2.2,
                  child: Text(
                    'Hurdle',
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
            width: AppDimensions.width10(context) * 35.5,
            height: AppDimensions.height10(context) * 29.9,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.5),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/timeline_3.webp'),
                  fit: BoxFit.cover),
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
            ),
            child: Column(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 22.7,
                  height: AppDimensions.height10(context) * 3.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.0),
                  child: GradientText(
                    'Hurdle recorded',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 16.1,
                  height: AppDimensions.height10(context) * 16.1,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 2.589),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/black_hole.webp'))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppDimensions.width10(context) * 6.873,
                        height: AppDimensions.height10(context) * 2.197,
                        child: Center(
                          child: Text(
                            mainText,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.font10(context) * 1.6,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.width10(context) * 9.641,
                        height: AppDimensions.height10(context) * 4.81,
                        child: Center(
                          child: Text(
                            subText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.font10(context) * 1.8,
                                height: AppDimensions.height10(context) * 0.109,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
