import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';


class ReportComponent extends StatelessWidget {
  String mainText;
  String subText;
  final image;

   ReportComponent({super.key, required this.mainText, required this.subText,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 38.4,
      height: AppDimensions.height10(context) * 51.5,
      margin: EdgeInsets.only(
          top: AppDimensions.height10(context) * 2.0,
          left: AppDimensions.width10(context) * 1.4,
          right: AppDimensions.width10(context) * 1.4),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius: BorderRadius.circular(
            AppDimensions.height10(context) * 2.6),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimensions.width10(context) * 20.5,
            height: AppDimensions.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensions.width10(context) * 14.9,
              top: AppDimensions.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 3.5,
                  height: AppDimensions.height10(context) * 3.5,
                  margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) *
                          0.8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/report.webp'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 13.4,
                  height: AppDimensions.height10(context) * 2.2,
                  child: Text(
                    'Report',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:
                        AppDimensions.font10(context) * 1.8,
                        color: const Color(0xff437296)),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: AppDimensions.width10(context) * 35.4,
            height: AppDimensions.height10(context) * 43.0,
            margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 1.5),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color(0xFFE1B3B7),
                Color(0XffC9B9CB)
              ]),
              image: const DecorationImage(
                  opacity: 0.7,
                  image: AssetImage(
                      'assets/images/timeline_2.webp')),
              borderRadius: BorderRadius.circular(
                  AppDimensions.height10(context) * 2.0),
            ),
            child: Column(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 23.8,
                  height: AppDimensions.height10(context) * 3.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) *
                          3.2),
                  child: Text(
                    mainText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize:
                        AppDimensions.font10(context) * 2.8,
                        color: const Color(0xff437296)),
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 32.7,
                  height: AppDimensions.height10(context) * 5.0,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) *
                          0.5),
                  child: Text(
                    subText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height:
                        AppDimensions.height10(context) *
                            0.12,
                        fontWeight: FontWeight.w600,
                        fontSize:
                        AppDimensions.font10(context) * 2.0,
                        color: const Color(0xff437296)),
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 23.7,
                  height:
                  AppDimensions.height10(context) * 25.5,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) *
                          2.4),
                  decoration: BoxDecoration(
                    image:  DecorationImage(
                        image: AssetImage(
                            image)),
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2.0),
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
