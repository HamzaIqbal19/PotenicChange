import 'package:flutter/material.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class RecordedComponent extends StatefulWidget {
  String recordedText;
  String orangeText;
  String beforeText;
  String afterText;
  final orangeImage;
  final greenImage;
  RecordedComponent(
      {super.key,
      required this.recordedText,
      required this.orangeText,
      required this.beforeText,
      required this.afterText,
      required this.orangeImage,
      required this.greenImage});

  @override
  State<RecordedComponent> createState() => _RecordedComponentState();
}

class _RecordedComponentState extends State<RecordedComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 38.4,
      height: AppDimensions.height10(context) * 43.9,
      margin: EdgeInsets.only(
        top: AppDimensions.height10(context) * 2.0,
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
              right: AppDimensions.width10(context) * 4.9,
              top: AppDimensions.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 3.58,
                  height: AppDimensions.height10(context) * 3.58,
                  margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 0.8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/session_stored.webp'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 23.6,
                  height: AppDimensions.height10(context) * 2.2,
                  child: Text(
                    widget.recordedText,
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
            height: AppDimensions.height10(context) * 18.3,
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
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 2.0),
                image: const DecorationImage(
                    image: AssetImage('assets/images/timeline_1.webp'),
                    fit: BoxFit.cover)),
            child: Stack(children: [
              Align(
                alignment: const Alignment(-3, 0),
                child: Container(
                  width: AppDimensions.width10(context) * 26.8,
                  height: AppDimensions.height10(context) * 26.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.orangeImage),
                          fit: BoxFit.cover)),
                  child: Container(
                    width: AppDimensions.width10(context) * 15.8,
                    height: AppDimensions.height10(context) * 4.8,
                    alignment: const Alignment(0.3, -0.1),
                    child: Text(
                      widget.orangeText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.0,
                          //  height: AppDimensions.height10(context) * 0.12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff5B74A6)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.3, 0),
                child: Container(
                  width: AppDimensions.width10(context) * 13.8,
                  height: AppDimensions.height10(context) * 13.8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(widget.greenImage),
                          fit: BoxFit.contain)),
                ),
              )
            ]),
          ),
          Container(
            width: AppDimensions.width10(context) * 33.7,
            height: AppDimensions.height10(context) * 4.1,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: AppDimensions.width10(context) * 16.7,
                  height: AppDimensions.height10(context) * 1.7,
                  alignment: Alignment.centerLeft,
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontFamily: 'laila',
                              fontSize: AppDimensions.font10(context) * 1.4,
                              height: AppDimensions.height10(context) * 0.12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff5B74A6)),
                          children: const [
                        TextSpan(text: 'How did you feel '),
                        TextSpan(
                            text: 'before:',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ))
                      ])),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 33.7,
                  height: AppDimensions.height10(context) * 2.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.width10(context) * 16.7,
                        height: AppDimensions.height10(context) * 1.7,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.7),
                        child: Text(
                          '“${widget.beforeText}”',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.4,
                              height: AppDimensions.height10(context) * 0.12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff5B74A6)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 2.0,
                        height: AppDimensions.height10(context) * 2.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF718FB1)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: AppDimensions.height10(context) * 1.0,
          ),
          SizedBox(
            width: AppDimensions.width10(context) * 34.4,
            child: Divider(
              height: AppDimensions.height10(context) * 0.1,
              color: const Color(0xFFE0E0E0),
            ),
          ),
          SizedBox(
            height: AppDimensions.height10(context) * 1.0,
          ),
          SizedBox(
            width: AppDimensions.width10(context) * 33.7,
            height: AppDimensions.height10(context) * 4.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: AppDimensions.width10(context) * 16.7,
                  height: AppDimensions.height10(context) * 1.7,
                  alignment: Alignment.centerLeft,
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontFamily: 'laila',
                              fontSize: AppDimensions.font10(context) * 1.4,
                              height: AppDimensions.height10(context) * 0.12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff5B74A6)),
                          children: const [
                        TextSpan(text: 'How did you feel '),
                        TextSpan(
                            text: 'after:',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ))
                      ])),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 33.7,
                  height: AppDimensions.height10(context) * 2.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.width10(context) * 16.7,
                        height: AppDimensions.height10(context) * 1.7,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.7),
                        child: Text(
                          '“${widget.afterText}”',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.4,
                              height: AppDimensions.height10(context) * 0.12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFD6F32)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 2.0,
                        height: AppDimensions.height10(context) * 2.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFFD6F32)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: const Alignment(-0.8685, 0),
            child: Container(
              width: AppDimensions.width10(context) * 3.5,
              height: AppDimensions.height10(context) * 3.5,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 1.6),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/session.webp'),
                      fit: BoxFit.contain)),
            ),
          ),
        ],
      ),
    );
  }
}
