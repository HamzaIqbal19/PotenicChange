import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_dimensions.dart';

class Create_practice_shimmer extends StatelessWidget {
  const Create_practice_shimmer({
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
              Container(
                padding:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 5.0),
                child: Center(
                    child: Container(
                  width: 150,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200]),
                )),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 1.0),
                child: Center(
                    child: Container(
                  width: 140,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200]),
                )),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 3.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: [
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
                            alignment: Alignment(1.5, 0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromARGB(226, 224, 224, 224),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2,
              ),
              Center(
                  child: Container(
                width: 200,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200]),
              )),
              SizedBox(
                height: AppDimensions.height10(context) * 1.0,
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  continer_const(),
                  continer_const(),
                ],
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  continer_const(),
                  continer_const(),
                ],
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  continer_const(),
                  continer_const(),
                ],
              ),
            ],
          )),
    );
  }
}

class continer_const extends StatelessWidget {
  const continer_const({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(144, 224, 224, 224)),
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
        )));
  }
}
