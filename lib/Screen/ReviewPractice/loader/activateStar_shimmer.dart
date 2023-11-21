import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_dimensions.dart';

class activateStar_shimmer extends StatelessWidget {
  const activateStar_shimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              SizedBox(
                height: AppDimensions.height10(context) * 15.0,
              ),
              Container(
                width: AppDimensions.width10(context) * 24.3,
                height: AppDimensions.height10(context) * 2.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: Colors.grey[300]),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 4.0,
              ),
              Container(
                width: AppDimensions.width10(context) * 30.4,
                height: AppDimensions.height10(context) * 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: Colors.grey[200]),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 1.0,
              ),
              Container(
                width: AppDimensions.width10(context) * 34.4,
                height: AppDimensions.height10(context) * 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: Colors.grey[200]),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 1.0,
              ),
              Container(
                width: AppDimensions.width10(context) * 32.4,
                height: AppDimensions.height10(context) * 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: Colors.grey[200]),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 1.0,
              ),
              Container(
                width: AppDimensions.width10(context) * 33.0,
                height: AppDimensions.height10(context) * 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: Colors.grey[200]),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 1.0,
              ),
              Container(
                width: AppDimensions.width10(context) * 25.4,
                height: AppDimensions.height10(context) * 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: Colors.grey[200]),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 13.0,
              ),
              Container(
                height: AppDimensions.height10(context) * 26.8,
                width: AppDimensions.width10(context) * 26.8,
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const continer_const(
                      height_of: 26.8,
                      width_of: 26.8,
                    ),
                    Align(
                        alignment: const Alignment(0.0, 1.7),
                        child: Container(
                          width: AppDimensions.width10(context) * 14.8,
                          height: AppDimensions.height10(context) * 14.8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[200]),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 6.0,
              ),
              Container(
                // width: AppDimensions.width10(context) * 30.4,
                height: AppDimensions.height10(context) * 1.2,
                margin: EdgeInsets.only(
                    left: AppDimensions.width10(context) * 10.6,
                    right: AppDimensions.width10(context) * 11.4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: Colors.grey[200]),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 1.0,
              ),
              Container(
                // width: AppDimensions.width10(context) * 30.4,
                height: AppDimensions.height10(context) * 1.2,
                margin: EdgeInsets.only(
                    left: AppDimensions.width10(context) * 11.6,
                    right: AppDimensions.width10(context) * 12.4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: Colors.grey[200]),
              ),
            ],
          )),
    );
  }
}

class continer_const extends StatelessWidget {
  final double height_of;
  final double width_of;
  const continer_const({
    Key? key,
    required this.height_of,
    required this.width_of,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * width_of,
      height: AppDimensions.height10(context) * height_of,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Color.fromARGB(144, 224, 224, 224)),
    );
  }
}
