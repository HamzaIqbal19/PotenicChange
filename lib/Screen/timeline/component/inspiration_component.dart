import 'package:flutter/material.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/utils.dart';

class InspirationComponent extends StatelessWidget {
  String mainImage;
  String Text1;
  String Text2;
  final status;
  String inspirationId;
  InspirationComponent({
    super.key,
    required this.mainImage,
    required this.Text1,
    required this.Text2,
    required this.inspirationId,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensionsUpdated.width10(context) * 38.4,
      height: AppDimensionsUpdated.height10(context) * 42.4,
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
              right: AppDimensionsUpdated.width10(context) * 14.0,
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
                          image: AssetImage('assets/images/inspiration.webp'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: AppDimensionsUpdated.width10(context) * 13.4,
                  height: AppDimensionsUpdated.height10(context) * 2.2,
                  child: Text(
                    'Inspiration',
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
            width: AppDimensionsUpdated.width10(context) * 34.6,
            height: AppDimensionsUpdated.height10(context) * 33.2,
            margin: EdgeInsets.only(
                top: AppDimensionsUpdated.height10(context) * 1.5),
            decoration: status == true
                ? BoxDecoration(
                    color: const Color(0xff828282),
                    borderRadius: BorderRadius.circular(
                        AppDimensionsUpdated.height10(context) * 2.0),
                  )
                : status == false
                    ? BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/bg_inpiration_purple.webp'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(
                            AppDimensionsUpdated.height10(context) * 2.0),
                      )
                    : BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/bg_inpiration_purple.webp'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(
                            AppDimensionsUpdated.height10(context) * 2.0),
                      ),
            child: Column(
              children: [
                Container(
                  width: AppDimensionsUpdated.width10(context) * 28.5,
                  height: AppDimensionsUpdated.height10(context) * 3.4,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 3.0),
                  child: Text(
                    status == true
                        ? 'Inspiration deleted'
                        : status == false
                            ? 'Inspiration updated'
                            : 'Inspiration created',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensionsUpdated.font10(context) * 2.8,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
                inspirationId == '1'
                    ? Container(
                        width: AppDimensionsUpdated.width10(context) * 19.2,
                        height: AppDimensionsUpdated.height10(context) * 19.2,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context),
                            bottom: AppDimensions.height10(context)),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 18),
                          child: FadeInImage(
                            placeholder: const AssetImage(
                                'assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                            image: NetworkImage(mainImage),
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.contain,
                          ),
                        ),
                      )
                    : Container(
                        width: AppDimensionsUpdated.width10(context) * 17.2,
                        height: AppDimensionsUpdated.height10(context) * 16.9,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 1.9),
                        decoration: BoxDecoration(
                            gradient: inspirationId == '2'
                                ? const RadialGradient(colors: [
                                    Color(0xFFE9A594),
                                    Color(0xFFEEBEB2)
                                  ])
                                : const RadialGradient(colors: [
                                    Color(0xFFD9D9D9),
                                    Color(0xFFD9D9D9)
                                  ]),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(inspirationId == '4'
                                    ? 'assets/images/distraction content.webp'
                                    : inspirationId == '3'
                                        ? 'assets/images/video_play.webp'
                                        : ''),
                                fit: BoxFit.cover)),
                        child: inspirationId == '2'
                            ? Center(
                                child: Text(
                                  Text2,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimensionsUpdated.height10(
                                              context) *
                                          1.4),
                                ),
                              )
                            : Container(),
                      ),
                Container(
                  width: AppDimensionsUpdated.width10(context) * 16.7,
                  height: AppDimensionsUpdated.height10(context) * 1.7,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 0.6),
                  child: Text(
                    Text1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimensionsUpdated.font10(context) * 1.4,
                      color: status == true
                          ? Colors.white.withOpacity(0.4)
                          : status == false
                              ? Colors.white
                              : Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: AppDimensionsUpdated.width10(context) * 16.7,
                  height: AppDimensionsUpdated.height10(context) * 3.0,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 0.2),
                  child: Text(
                    Text2,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: AppDimensionsUpdated.font10(context) * 1.1,
                      color: status == true
                          ? Colors.white.withOpacity(0.4)
                          : status == false
                              ? Colors.white
                              : Colors.white,
                    ),
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
