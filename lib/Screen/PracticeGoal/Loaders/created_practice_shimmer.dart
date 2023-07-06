import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_dimensions.dart';

class practiceFinished_shimmer extends StatelessWidget {
  const practiceFinished_shimmer({
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
                width: AppDimensions.height10(context) * 24.3,
                height: AppDimensions.height10(context) * 2.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: Colors.grey[300]),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 1.5,
              ),
              Container(
                width: AppDimensions.height10(context) * 14.3,
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
                width: AppDimensions.height10(context) * 30.4,
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
                width: AppDimensions.height10(context) * 26.8,
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const continer_const(
                      height_of: 26.8,
                      width_of: 26.8,
                    ),
                    Align(
                        alignment: const Alignment(0.5, 1.7),
                        child: Container(
                          width: AppDimensions.height10(context) * 14.8,
                          height: AppDimensions.height10(context) * 14.8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[200]),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 14.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      // color: Colors.blue,
                      width: AppDimensions.height10(context) * 5.0,
                      height: AppDimensions.height10(context) * 5.0,
                      child: Image.asset(
                        "assets/images/Moreactions.webp",
                        fit: BoxFit.contain,
                      )),
                  SizedBox(
                    width: AppDimensions.height10(context) * 1.8,
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 31.3,
                    height: AppDimensions.height10(context) * 5.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 5),
                        color: Colors.grey[300]),
                  ),
                ],
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
      width: AppDimensions.height10(context) * width_of,
      height: AppDimensions.height10(context) * height_of,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Color.fromARGB(144, 224, 224, 224)),
    );
  }
}
