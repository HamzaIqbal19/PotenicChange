import 'package:flutter/material.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class PracticeSessionComponent extends StatelessWidget {
  String scheduleTime;
  PracticeSessionComponent({super.key, required this.scheduleTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 39.5,
      height: AppDimensions.height10(context) * 25.4,
      margin: EdgeInsets.only(
        top: AppDimensions.height10(context) * 1.9,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius:
            BorderRadius.circular(AppDimensions.height10(context) * 2.6),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimensions.width10(context) * 30.7,
            height: AppDimensions.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensions.width10(context) * 4.5,
              top: AppDimensions.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 3.5,
                  height: AppDimensions.height10(context) * 3.5,
                  margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 0.7),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/session_stored.webp'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 23.6,
                  height: AppDimensions.height10(context) * 2.2,
                  child: Text(
                    'Practice session',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.font10(context) * 1.8,
                        color: const Color(0xff437296)),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: AppDimensions.width10(context) * 35.5,
            height: AppDimensions.height10(context) * 16.3,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: AppDimensions.height10(context) * 0.5,
                  blurRadius: AppDimensions.height10(context) * 0.7,
                  offset: const Offset(0, 3),
                )
              ],
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFD9B4B4), Color(0xFFF5EDED)]),
            ),
            child: Stack(children: [
              Align(
                alignment: const Alignment(-1.45, 0),
                child: Container(
                  width: AppDimensions.width10(context) * 17.6,
                  height: AppDimensions.height10(context) * 19.3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/orange_moon.webp'),
                          fit: BoxFit.cover)),
                  child: Container(
                    width: AppDimensions.width10(context) * 15.8,
                    height: AppDimensions.height10(context) * 4.8,
                    alignment: const Alignment(0.1, -0.1),
                    //changed font family due to client's request
                    child: Text(
                      ' Control\nmy anger',
                      style: TextStyle(
                          height: AppDimensions.height10(context) * 0.15,
                          fontSize: AppDimensions.font10(context) * 1.6,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff5B74A6)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-0.175, 0),
                child: Container(
                  width: AppDimensions.width10(context) * 11.6,
                  height: AppDimensions.height10(context) * 11.7,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Ellipse 158.webp'),
                          fit: BoxFit.contain)),
                  child: Center(
                    child: Text(
                      'Meditation',
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 1.8,
                          height: AppDimensions.height10(context) * 0.12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffFBFBFB)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.9, 0),
                child: SizedBox(
                  width: AppDimensions.width10(context) * 8.2,
                  height: AppDimensions.height10(context) * 4.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppDimensions.height10(context) * 8.2,
                        height: AppDimensions.height10(context) * 2.0,
                        child: Text(
                          'Scheduled',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.4,
                              height: AppDimensions.height10(context) * 0.12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffFA8552)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 6.3,
                        height: AppDimensions.height10(context) * 1.9,
                        alignment: Alignment.topCenter,
                        child: Text(
                          scheduleTime,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              height: AppDimensions.height10(context) * 0.12,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffFBFBFB)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
