import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_dimensions.dart';

class GoalCategory_shimmer extends StatelessWidget {
  const GoalCategory_shimmer({
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
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.0),
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
                height: AppDimensions.height10(context) * 5.0,
              ),
              const ContinerConst(),
              SizedBox(
                height: AppDimensions.height10(context) * 5,
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
              Center(
                  child: Container(
                width: 150,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200]),
              )),
              SizedBox(
                height: AppDimensions.height10(context) * 8.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContinerConst(),
                  ContinerConst(),
                ],
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2.5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContinerConst(),
                  ContinerConst(),
                ],
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2.5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContinerConst(),
                  ContinerConst(),
                ],
              ),
            ],
          )),
    );
  }
}

class ContinerConst extends StatelessWidget {
  const ContinerConst({
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
