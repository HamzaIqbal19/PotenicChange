import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_dimensions.dart';

class practice_session_shimmer extends StatelessWidget {
  const practice_session_shimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                SizedBox(
                  height: AppDimensions.height10(context) * 10.0,
                ),
                Center(
                    child: Container(
                  width: AppDimensions.width10(context) * 21.7,
                  height: AppDimensions.height10(context) * 3.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 2.0),
                      color: Colors.grey[200]),
                )),
                SizedBox(
                  height: AppDimensions.height10(context),
                ),
                Center(
                    child: Container(
                  width: AppDimensions.width10(context) * 18.7,
                  height: AppDimensions.height10(context) * 3.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 2.0),
                      color: Colors.grey[200]),
                )),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.1,
                ),
                Container(
                  height: AppDimensions.height10(context) * 26.8,
                  margin: EdgeInsets.only(
                      left: AppDimensions.height10(context),
                      right: AppDimensions.height10(context) * 12.1),
                  child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      const continer_const(
                        height_of: 26.8,
                        width_of: 26.8,
                      ),
                      Align(
                        alignment: const Alignment(0, 1.5),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10(context),
                          ),
                          child: Row(
                            children: [
                              const continer_const(
                                height_of: 13.8,
                                width_of: 13.8,
                              ),
                              SizedBox(width: AppDimensions.width10(context)),
                              const continer_const(
                                height_of: 13.8,
                                width_of: 13.8,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 7.7,
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.1,
                ),
                Container(
                  height: AppDimensions.height10(context) * 26.8,
                  margin: EdgeInsets.only(
                      left: AppDimensions.height10(context),
                      right: AppDimensions.height10(context) * 12.1),
                  child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      const continer_const(
                        height_of: 26.8,
                        width_of: 26.8,
                      ),
                      Align(
                        alignment: const Alignment(0, 1.5),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10(context),
                          ),
                          child: Row(
                            children: [
                              const continer_const(
                                height_of: 13.8,
                                width_of: 13.8,
                              ),
                              SizedBox(width: AppDimensions.width10(context)),
                              const continer_const(
                                height_of: 13.8,
                                width_of: 13.8,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.5,
                ),
              ],
            )),
      ),
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
