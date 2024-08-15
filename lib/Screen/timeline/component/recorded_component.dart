import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/timeline/component/imageComponent.dart';
import 'package:potenic_app/Screen/timeline/component/practiceProgressText.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class RecordedComponent extends StatefulWidget {
  String recordedText;
  String goalName;
  String beforeText;
  String afterText;
  String pracName;
  String scheduleTime;
  bool past;
  final orangeImage;
  final greenImage;
  final status;
  final missedGreenImage;
  RecordedComponent(
      {super.key,
      required this.recordedText,
      required this.scheduleTime,
      required this.past,
      required this.goalName,
      required this.pracName,
      required this.beforeText,
      required this.afterText,
      required this.orangeImage,
      required this.greenImage,
      required this.status,
      required this.missedGreenImage});

  @override
  State<RecordedComponent> createState() => _RecordedComponentState();
}

class _RecordedComponentState extends State<RecordedComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.status != 'Not Started' && widget.status != 'missed'
          ? AppDimensionsUpdated.height10(context) * 43.9
          : AppDimensionsUpdated.height10(context) * 25.4,
      margin: EdgeInsets.only(
          top: AppDimensionsUpdated.height10(context) * 2.0,
          right: AppDimensionsUpdated.height10(context) * 1.5,
          left: AppDimensionsUpdated.height10(context) * 1.5),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius:
            BorderRadius.circular(AppDimensionsUpdated.height10(context) * 2.6),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimensionsUpdated.width10(context) * 32.7,
            height: AppDimensionsUpdated.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensionsUpdated.width10(context) * 2.8,
              top: AppDimensionsUpdated.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensionsUpdated.width10(context) * 3.58,
                  height: AppDimensionsUpdated.height10(context) * 3.58,
                  margin: EdgeInsets.only(
                      right: AppDimensionsUpdated.height10(context) * 0.8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/session_stored.webp'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                    width: AppDimensionsUpdated.width10(context) * 27.6,
                    height: AppDimensionsUpdated.height10(context) * 2.2,
                    child: RichText(
                        text: TextSpan(
                            text: 'Practice session',
                            style: TextStyle(
                                fontFamily: 'laila',
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.8,
                                color: const Color(0xff437296)),
                            children: [
                          TextSpan(
                            text: widget.status == 'Not Started'
                                ? ' "Scheduled"'
                                : widget.status == 'missed'
                                    ? ' "Missed"'
                                    : ' "Recorded"',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.8,
                                fontFamily: 'Laila',
                                color: widget.status == 'Not Started'
                                    ? const Color(0xff437296):
                                    widget.status == 'missed'?Colors.red
                                    : const Color(0xff156F6D)),
                          )
                        ])))
              ],
            ),
          ),
          Container(
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
                image: const DecorationImage(
                    image: AssetImage('assets/images/timeline_1.webp'),
                    fit: BoxFit.cover)),
            child: Stack(children: [
              Align(
                alignment: widget.past
                    ? const Alignment(-1.65, 0)
                    : const Alignment(-1.85, 0),
                child: Container(
                  width: AppDimensionsUpdated.width10(context) * 22.6,
                  height: AppDimensionsUpdated.height10(context) * 24.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              goalImages(widget.orangeImage.toString())),
                          fit: BoxFit.cover)),
                  child: Align(
                      alignment: const Alignment(0.42, 0),
                      child: SizedBox(
                        width: AppDimensionsUpdated.width10(context) * 10.5,
                        height: AppDimensionsUpdated.height10(context) * 4.8,
                        //changed font family due to client's request
                        child: Text(
                          widget.goalName,
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
                alignment: widget.past
                    ? const Alignment(0.205, 0)
                    : const Alignment(-0.105, 0),
                child: Container(
                  width: AppDimensionsUpdated.width10(context) * 11.6,
                  height: AppDimensionsUpdated.height10(context) * 11.6,
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: widget.status == 'Not Started'
                        ? Border.all(color: Colors.white, width: 1)
                        : Border.all(color: Colors.transparent, width: 1),
                    image: widget.status == 'missed'
                        ? DecorationImage(
                            image: AssetImage(practiceImagesMissed(
                                widget.greenImage.toString())),
                            fit: BoxFit.contain)
                        : widget.status == 'Not Started'
                            ? DecorationImage(
                                image: AssetImage(practiceImages(
                                    widget.greenImage.toString())),
                                fit: BoxFit.contain)
                            : DecorationImage(
                                image: AssetImage(practiceImagesCompleted(
                                    widget.greenImage.toString())),
                                fit: BoxFit.contain),
                  ),
                  child: Center(
                    child: Text(
                      widget.pracName,
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
              widget.past != true
                  ? Align(
                      alignment: const Alignment(0.9, 0),
                      child: SizedBox(
                        width: AppDimensionsUpdated.width10(context) * 8.2,
                        height: AppDimensionsUpdated.height10(context) * 4.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width:
                                  AppDimensionsUpdated.height10(context) * 8.2,
                              height:
                                  AppDimensionsUpdated.height10(context) * 2.0,
                              child: Text(
                                'Scheduled',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            1.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffFA8552)),
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.height10(context) * 6.5,
                              height:
                                  AppDimensionsUpdated.height10(context) * 1.9,
                              alignment: Alignment.topCenter,
                              child: Text(
                                widget.scheduleTime,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            1.6,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xffFBFBFB)),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container()
            ]),
          ),
          (widget.status != 'Not Started' && widget.status != 'missed')
              ? Column(
                  children: [
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 33.7,
                      height: AppDimensionsUpdated.height10(context) * 4.1,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 16.7,
                            height:
                                AppDimensionsUpdated.height10(context) * 1.7,
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'laila',
                                        fontSize: AppDimensionsUpdated.font10(
                                                context) *
                                            1.4,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            0.12,
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
                            width: AppDimensionsUpdated.width10(context) * 33.7,
                            height:
                                AppDimensionsUpdated.height10(context) * 2.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppDimensionsUpdated.width10(context) *
                                      16.7,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          1.7,
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          0.7),
                                  child: Text(
                                    practiceProgressBeforeText(
                                        widget.beforeText),
                                    style: TextStyle(
                                        fontSize: AppDimensionsUpdated.font10(
                                                context) *
                                            1.4,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            0.12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(practiceBeforeColor(
                                            widget.beforeText.toString()))),
                                  ),
                                ),
                                Container(
                                  width:
                                      AppDimensionsUpdated.height10(context) *
                                          2.0,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          2.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(practiceBeforeColor(
                                          widget.beforeText.toString()))),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppDimensionsUpdated.height10(context) * 1.0,
                    ),
                    SizedBox(
                      width: AppDimensionsUpdated.width10(context) * 34.4,
                      child: Divider(
                        height: AppDimensionsUpdated.height10(context) * 0.1,
                        color: const Color(0xFFE0E0E0),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensionsUpdated.height10(context) * 1.0,
                    ),
                    SizedBox(
                      width: AppDimensionsUpdated.width10(context) * 33.7,
                      height: AppDimensionsUpdated.height10(context) * 4.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 16.7,
                            height:
                                AppDimensionsUpdated.height10(context) * 1.7,
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'laila',
                                        fontSize: AppDimensionsUpdated.font10(
                                                context) *
                                            1.4,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            0.12,
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
                            width: AppDimensionsUpdated.width10(context) * 33.7,
                            height:
                                AppDimensionsUpdated.height10(context) * 2.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppDimensionsUpdated.width10(context) *
                                      16.7,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          1.7,
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          0.7),
                                  child: Text(
                                    practiceProgressAfterText(widget.afterText),
                                    style: TextStyle(
                                        fontSize: AppDimensionsUpdated.font10(
                                                context) *
                                            1.4,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            0.12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(practiceBeforeColor(
                                            widget.beforeText.toString()))),
                                  ),
                                ),
                                Container(
                                  width:
                                      AppDimensionsUpdated.height10(context) *
                                          2.0,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          2.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(practiceBeforeColor(
                                          widget.beforeText.toString()))),
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
                        width: AppDimensionsUpdated.width10(context) * 3.5,
                        height: AppDimensionsUpdated.height10(context) * 3.5,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 1.6),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/session.webp'),
                                fit: BoxFit.contain)),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
