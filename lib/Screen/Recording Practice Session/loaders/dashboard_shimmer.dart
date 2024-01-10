import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_dimensions.dart';

class DashBoard_shimmer extends StatelessWidget {
  const DashBoard_shimmer({
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
                height: AppDimensions.height10(context) * 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 5.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(144, 224, 224, 224),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0),
                          child: Container(
                            width: 20,
                            height: 13,
                            decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0),
                          child: Container(
                            width: 20,
                            height: 13,
                            decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0.8),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromARGB(226, 224, 224, 224),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(144, 224, 224, 224),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0),
                          child: Container(
                            width: 20,
                            height: 13,
                            decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0),
                          child: Container(
                            width: 20,
                            height: 13,
                            decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0.8),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromARGB(226, 224, 224, 224),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 5.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(144, 224, 224, 224),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0),
                          child: Container(
                            width: 20,
                            height: 13,
                            decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0),
                          child: Container(
                            width: 20,
                            height: 13,
                            decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300]),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0.8),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromARGB(226, 224, 224, 224),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 4.4,
              ),
              Center(
                  child: Container(
                width: AppDimensions.width10(context) * 35.4,
                height: AppDimensions.height10(context) * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey[200]),
              )),
              SizedBox(
                height: AppDimensions.height10(context) * 1.0,
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 8.0,
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 26.8,
                width: AppDimensions.width10(context) * 26.8,
                child: const Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContinerConst(
                      height_of: 26.8,
                      width_of: 26.8,
                    ),
                    Align(
                      alignment: Alignment(0.4, 0.6),
                      child: ContinerConst(
                        height_of: 13.8,
                        width_of: 13.8,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 3.5,
              ),
              Container(
                width: AppDimensions.width10(context) * 35.3,
                height: AppDimensions.height10(context) * 14.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2),
                    color: const Color.fromARGB(144, 224, 224, 224)),
              )
            ],
          )),
    );
  }
}

class ContinerConst extends StatelessWidget {
  final double height_of;
  final double width_of;
  const ContinerConst({
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
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 70,
            //   height: 5,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5),
            //       color: Colors.grey[200]),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   width: 50,
            //   height: 5,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5),
            //       color: Colors.grey[300]),
            // ),
          ],
        )));
  }
}
