import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_dimensions.dart';

class categories_shimmer extends StatelessWidget {
  const categories_shimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.8,
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            // baseColor: Colors.white60,
            // highlightColor: Colors.white.withOpacity(0.2),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: AppDimensions.height10(context) * 5.0),
                  child: Center(
                      child: Container(
                    width: 120,
                    height: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[200]),
                  )),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 12.0,
                ),
                Center(
                    child: Container(
                  width: 260,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200]
                  ),
                )),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.0,
                ),
                Center(
                    child: Container(
                  width: 230,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[300]),
                )),
                SizedBox(
                  height: AppDimensions.height10(context) * 6.7,
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 17.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        4, // ensure itemCount doesn't exceed 4 or length of list
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppDimensions.height10(context) * 2.0,
                          ),
                          Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color:
                                      const Color.fromARGB(144, 224, 224, 224)),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[200]),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[200]),
                                  ),
                                ],
                              ))),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 13.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          4, // ensure itemCount doesn't exceed 4 or length of list
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppDimensions.height10(context) * 2.0,
                            ),
                            Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color:
                                        const Color.fromARGB(144, 224, 224, 224)),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.grey[200]),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.grey[300]),
                                    ),
                                  ],
                                ))),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 12.6,
                ),
                Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(144, 224, 224, 224)),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300]),
                        ),
                      ],
                    ))),
              ],
            )),
      ),
    );
  }
}
