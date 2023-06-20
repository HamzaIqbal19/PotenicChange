import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_dimensions.dart';

class AllGoals_shimmer extends StatelessWidget {
  const AllGoals_shimmer({
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
              Center(
                  child: Container(
                width: 100,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300]),
              )),
              SizedBox(
                height: AppDimensions.height10(context) * 1.6,
              ),
              Center(
                  child: Container(
                width: 260,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200]),
              )),
              SizedBox(
                height: AppDimensions.height10(context) * 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[200]),
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Center(
                      child: Container(
                    width: 100,
                    height: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[200]),
                  )),
                ],
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2.0,
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
                children: [
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
