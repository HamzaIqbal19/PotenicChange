import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/timeline/component/imageComponent.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class ReportComponent extends StatelessWidget {
  String goalName;
  String pracName;
  String color1;
  String color2;

  ReportComponent({
    super.key,
    required this.pracName,
    required this.goalName,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensionsUpdated.width10(context) * 38.4,
      height: AppDimensionsUpdated.height10(context) * 50.5,
      margin: EdgeInsets.only(
          top: AppDimensionsUpdated.height10(context) * 2.0,
          left: AppDimensionsUpdated.width10(context) * 1.4,
          right: AppDimensionsUpdated.width10(context) * 1.4),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius:
            BorderRadius.circular(AppDimensionsUpdated.height10(context) * 2.6),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimensionsUpdated.width10(context) * 20.5,
            height: AppDimensionsUpdated.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensionsUpdated.width10(context) * 14.9,
              top: AppDimensionsUpdated.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensionsUpdated.width10(context) * 3.5,
                  height: AppDimensionsUpdated.height10(context) * 3.5,
                  margin: EdgeInsets.only(
                      right: AppDimensionsUpdated.height10(context) * 0.8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/report.webp'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: AppDimensionsUpdated.width10(context) * 13.4,
                  child: Text(
                    'Practice Report',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensionsUpdated.font10(context) * 2,
                        color: const Color(0xff437296)),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: AppDimensionsUpdated.width10(context) * 35.4,
            height: AppDimensionsUpdated.height10(context) * 42.6,
            margin: EdgeInsets.only(
                top: AppDimensionsUpdated.height10(context) * 1.5),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFFE1B3B7), Color(0XffC9B9CB)]),
              image: const DecorationImage(
                  opacity: 0.7,
                  image: AssetImage('assets/images/timeline_2.webp')),
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(context) * 2.0),
            ),
            child: Column(
              children: [
                Container(
                  width: AppDimensionsUpdated.width10(context) * 23.8,

                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 3.2),
                  child: Text(
                    'Congratulations',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensionsUpdated.font10(context) * 2.6,
                        color: const Color(0xff437296)),
                  ),
                ),
                Container(
                  width: AppDimensionsUpdated.width10(context) * 32.7,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 0.9),
                  child: Text(
                    'Your 20 active day\nreport is ready',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: AppDimensionsUpdated.height10(context) * 0.12,
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensionsUpdated.font10(context) * 2,
                        color: const Color(0xff437296)),
                  ),
                ),
                Container(
                  width: AppDimensionsUpdated.width10(context) * 23.7,
                  height: AppDimensionsUpdated.height10(context) * 25.5,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 1.4),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0XffD9B4B4), Color(0xFFF5EDED)]),
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(AppDimensionsUpdated.height10(context)),
                          topRight:
                              Radius.circular(AppDimensionsUpdated.height10(context)),
                          bottomLeft:
                              Radius.circular(AppDimensionsUpdated.height10(context)),
                          bottomRight: Radius.circular(
                              AppDimensionsUpdated.height10(context) * 5))),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(-2.5, -2.0),
                        child: Container(
                          width: AppDimensionsUpdated.width10(context) * 18.7,
                          height: AppDimensionsUpdated.height10(context) * 18.7,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    goalImages(color1.toString()),
                                  ),
                                  fit: BoxFit.cover)),
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 11.5,
                            height: AppDimensionsUpdated.height10(context) * 4.8,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                AppDimensionsUpdated.height10(context) * 2),
                            alignment: const Alignment(-0.2, -0.1),
                            child: Text(
                              capitalizeFirstLetter(goalName),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: AppDimensionsUpdated.font10(context) * 2.0,
                                  height:
                                      AppDimensions.height10(context) * 0.15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff5B74A6)),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.3, -0.4),
                        child: Container(
                          width: AppDimensionsUpdated.width10(context) * 11.6,
                          height: AppDimensionsUpdated.height10(context) * 11.6,
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimensionsUpdated.width10(context)),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      practiceImages(color2).toString()),
                                  fit: BoxFit.contain)),
                          child: SizedBox(
                            width: AppDimensionsUpdated.width10(context) * 9.5,
                            height: AppDimensionsUpdated.height10(context) * 5.0,
                            child: Center(
                              child: Text(
                                capitalizeFirstLetter(pracName),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFFBFBFB)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(-1, 0.85),
                        child: Container(
                          width: AppDimensionsUpdated.width10(context) * 17.1,
                          height: AppDimensionsUpdated.height10(context) * 6.4,
                          padding: EdgeInsets.only(
                              left: AppDimensionsUpdated.width10(context) * 0.84,
                              top: AppDimensionsUpdated.height10(context) * 1.04),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  // begin: Alignment.topCenter,
                                  // end: Alignment.bottomCenter,
                                  colors: [
                                    const Color(0XFF91698C).withOpacity(0.7),
                                    const Color(0xFFC19CA7).withOpacity(0.7)
                                  ]),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                      AppDimensionsUpdated.height10(context)),
                                  bottomRight: Radius.circular(
                                      AppDimensionsUpdated.height10(context)))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '20 day report',
                                style: TextStyle(
                                    fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.9,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFFBFBFB)),
                              ),
                              Container(
                                width: AppDimensionsUpdated.width10(context) * 5.03,
                                // margin: EdgeInsets.only(
                                //     left: AppDimensions.width10(context)),
                                child: Divider(
                                  height: AppDimensionsUpdated.height10(context) * 0.1,
                                  color:
                                      const Color(0xFFFFFFFF).withOpacity(0.2),
                                ),
                              ),
                              Container(
                                // margin: EdgeInsets.only(
                                //     left: AppDimensions.width10(context)),
                                child: Text(
                                  'Ready',
                                  style: TextStyle(
                                      fontSize:
                                      AppDimensionsUpdated.font10(context) * 1.3,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFFBFBFB)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
