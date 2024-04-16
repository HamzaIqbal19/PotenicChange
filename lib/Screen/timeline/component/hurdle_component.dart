import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class HurdleComponent extends StatelessWidget {
  String mainText;
  String subText;
  final status;

  HurdleComponent({
    super.key,
    required this.mainText,
    required this.subText,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: AppDimensionsUpdated.width10(context) * 38.4,
      height: AppDimensionsUpdated.height10(context) * 38.4,
      margin: EdgeInsets.only(
          top: AppDimensionsUpdated.height10(context) * 2.0,
          left: AppDimensionsUpdated.width10(context) * 2,
          right: AppDimensionsUpdated.width10(context) * 2),
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
              right: AppDimensionsUpdated.width10(context) * 15.0,
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
                          image: AssetImage('assets/images/hurdle.webp'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: AppDimensionsUpdated.width10(context) * 13.4,
                  height: AppDimensionsUpdated.height10(context) * 2.2,
                  child: Text(
                    'Hurdle',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensionsUpdated.font10(context) * 1.8,
                        color: const Color(0xff437296)),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: AppDimensionsUpdated.width10(context) * 34,
            height: AppDimensionsUpdated.height10(context) * 29.9,
            margin: EdgeInsets.only(
              top: AppDimensionsUpdated.height10(context) * 1.5,
            ),
            decoration: status == true
                ? BoxDecoration(
                    color: const Color(0xff828282),
                    borderRadius: BorderRadius.circular(
                        AppDimensionsUpdated.height10(context) * 2.0),
                  )
                : status == false
                    ? BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/timeline_3.webp'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(
                            AppDimensionsUpdated.height10(context) * 2.0),
                      )
                    : BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/timeline_3.webp'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(
                            AppDimensionsUpdated.height10(context) * 2.0),
                      ),
            child: Column(
              children: [
                Container(
                  width: AppDimensionsUpdated.width10(context) * 22.7,
                  height: AppDimensionsUpdated.height10(context) * 3.4,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 3.0),
                  child: GradientText(
                    status == true
                        ? 'Hurdle deleted'
                        : status == false
                            ? 'Hurdle updated'
                            : status == 'Created'
                                ? "Hurdle created"
                                : 'Hurdle recorded',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensionsUpdated.font10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
                Container(
                  width: AppDimensionsUpdated.width10(context) * 16.1,
                  height: AppDimensionsUpdated.height10(context) * 16.1,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 2.589),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: status == true
                          ? const DecorationImage(
                              image:
                                  AssetImage('assets/images/black_hole.webp'),
                              opacity: 0.4)
                          : status == false
                              ? const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/black_hole.webp'),
                                )
                              : const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/black_hole.webp'))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppDimensionsUpdated.width10(context) * 8.873,
                        //height: AppDimensionsUpdated.height10(context) * 2.197,
                        child: Center(
                          child: Text(
                            mainText.trim(),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: status == 'delactive'
                                    ? Colors.white.withOpacity(0.4)
                                    : status == false
                                        ? Colors.white
                                        : Colors.white,
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.2,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppDimensionsUpdated.width10(context) * 9.641,
                        height: AppDimensionsUpdated.height10(context) * 4.81,
                        child: Center(
                          child: Text(
                            subText.trim(),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: status == true
                                    ? Colors.white.withOpacity(0.4)
                                    : status == false
                                        ? Colors.white
                                        : Colors.white,
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.8,
                                height: AppDimensionsUpdated.height10(context) *
                                    0.109,
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
