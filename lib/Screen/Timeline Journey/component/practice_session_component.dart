import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Timeline%20Journey/component/imageComponent.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class PracticeSessionComponent extends StatelessWidget {
  String scheduleTime;
  String orangeText;
  String greenText;
  final image1;
  final image2;
  final status;

  PracticeSessionComponent(
      {super.key,
      required this.scheduleTime,
      required this.greenText,
      required this.orangeText,
      required this.image1,
      required this.status,
      required this.image2});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: AppDimensionsUpdated.width10(context) * 33.5,
      height: AppDimensionsUpdated.height10(context) * 25.4,
      margin: EdgeInsets.only(
        top: AppDimensionsUpdated.height10(context) * 1.9,
        left: AppDimensionsUpdated.height10(context) * 2,
        right: AppDimensionsUpdated.height10(context) * 2,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius:
            BorderRadius.circular(AppDimensionsUpdated.height10(context) * 2.6),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimensionsUpdated.width10(context) * 30.7,
            height: AppDimensionsUpdated.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensionsUpdated.width10(context) * 4.0,
              top: AppDimensionsUpdated.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensionsUpdated.width10(context) * 3.5,
                  height: AppDimensionsUpdated.height10(context) * 3.5,
                  margin: EdgeInsets.only(
                      right: AppDimensionsUpdated.height10(context) * 0.7),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/session_stored.webp'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: AppDimensionsUpdated.width10(context) * 23.6,
                  child: Text(
                    status == 'deleted'
                        ? 'Practice deleted'
                        : status == 'inactive'
                            ? 'Practice inactive'
                            :
                    status == 'update'
                                ? 'Practice session edited':
                    status == 'active'
                        ?"Practice active"
                                : 'Practice session ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensionsUpdated.font10(context) * 2,
                        color: const Color(0xff437296)),
                  ),
                )
              ],
            ),
          ),
          Container(
            //width: AppDimensionsUpdated.width10(context) * 31.5,
            height: AppDimensionsUpdated.height10(context) * 16.3,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(
              top: AppDimensionsUpdated.height10(context) * 1.9,
              left: AppDimensionsUpdated.height10(context) * 1.5,
              right: AppDimensionsUpdated.height10(context) * 1.5,
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: AppDimensionsUpdated.height10(context) * 0.5,
                    blurRadius: AppDimensionsUpdated.height10(context) * 0.7,
                    offset: const Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(
                    AppDimensionsUpdated.height10(context) * 2.0),
                gradient: status == 'deleted'
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff828282), Color(0xff828282)])
                    : const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFD9B4B4), Color(0xFFF5EDED)])),
            child: Stack(children: [
              Align(
                alignment:status != null?const Alignment(-1.85, 0): const Alignment(-2.3, 0),
                child: Container(
                  width: AppDimensionsUpdated.width10(context) * 22.6,
                  height: AppDimensionsUpdated.height10(context) * 24.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(goalImages(image1.toString())),
                          fit: BoxFit.cover)),
                  child: Align(
                      alignment: const Alignment(0.3, 0.2),
                      child: SizedBox(
                        width: AppDimensionsUpdated.width10(context) * 10.5,
                        height: AppDimensionsUpdated.height10(context) * 4.8,
                        //changed font family due to client's request
                        child: Text(
                          orangeText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              height:
                              AppDimensionsUpdated.height10(context) * 0.15,
                              fontSize:
                              AppDimensionsUpdated.font10(context) * 2,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff5B74A6)),
                        ),
                      )),
                ),
              ),
              Align(
                alignment:  status != null?const Alignment(0.205, 0):const Alignment(-0.175, 0),
                child: Container(
                  width: AppDimensionsUpdated.width10(context) * 11.6,
                  height: AppDimensionsUpdated.height10(context) * 11.6,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                        image: AssetImage(practiceImages(image2.toString())),
                        fit: BoxFit.contain,
                        opacity: status == 'deleted'
                            ? 0.5
                            : status == 'inactive'
                                ? 0.3
                                : 1,
                      )),
                  child: Center(
                    child: Text(
                      greenText,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: AppDimensionsUpdated.font10(context) * 1.6,
                        height: AppDimensionsUpdated.height10(context) * 0.12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffFBFBFB),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.96, 0),
                child: SizedBox(
                  width: AppDimensionsUpdated.width10(context) * 8.2,
                  //height: AppDimensionsUpdated.height10(context) * 4.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppDimensionsUpdated.height10(context) * 8.2,
                        height: AppDimensionsUpdated.height10(context) * 2.0,
                        child: Text(
                          status == 'deleted' || status =='inactive' || status == 'active'
                              ? ""
                                  : 'Scheduled',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.6,
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffFA8552)),
                        ),
                      ),
                      Container(
                        //width: AppDimensionsUpdated.height10(context) * 6.5,
                        height: AppDimensionsUpdated.height10(context) * 1.9,
                        alignment: Alignment.topCenter,
                        child: Text(
                          status == 'deleted'
                              ? ''
                              : status == 'inactive'
                                  ? ''
                                  : scheduleTime,
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.8,
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.12,
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
