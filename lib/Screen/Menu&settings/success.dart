import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Container(
            width: AppDimensions.height10(context) * 27.0,
            height: AppDimensions.height10(context) * 13.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 1.4),
                color: const Color(0xFFF2F2F2).withOpacity(0.9)),
            child: Column(
              children: [
                Container(
                  width: AppDimensions.height10(context) * 23.8,
                  height: AppDimensions.height10(context) * 2.2,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9),
                  child: Center(
                      child: Text(
                    'Success',
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.7,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF000000)),
                  )),
                ),
                Container(
                  width: AppDimensions.height10(context) * 23.8,
                  height: AppDimensions.height10(context) * 3.2,
                  child: Center(
                      child: Text(
                    'Please check your inbox and follow\ninstructions to reset your password.',
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.3,
                        // height: AppDimensions.height10(context) * 0.12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF000000)),
                  )),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.9,
                ),
                Divider(
                  height: AppDimensions.height10(context) * 0.05,
                  color: const Color(0xFF3C3C43).withOpacity(0.29),
                ),
                Container(
                  width: AppDimensions.height10(context) * 2.4,
                  height: AppDimensions.height10(context) * 2.2,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.15),
                  child: Text(
                    'OK',
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.7,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF007AFF)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
