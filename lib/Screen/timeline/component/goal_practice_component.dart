import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/timeline/component/imageComponent.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class GoalPracticeComponent extends StatefulWidget {
  final image1;
  final image2;
  String mainText;
  String subText;
  String smallText;
  final status;

  GoalPracticeComponent(
      {super.key,
      required this.image1,
      required this.image2,
      required this.mainText,
      required this.smallText,
      required this.subText,
      required this.status}) {}

  @override
  State<GoalPracticeComponent> createState() => _GoalPracticeComponentState();
}

class _GoalPracticeComponentState extends State<GoalPracticeComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensionsUpdated.height10(context) * 49.1,
      margin: EdgeInsets.only(
          top: AppDimensionsUpdated.height10(context) * 2.0,
          right: AppDimensionsUpdated.height10(context) * 1.5,
          left: AppDimensionsUpdated.height10(context) * 1.5),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius:
            BorderRadius.circular(AppDimensionsUpdated.height10(context) * 2.0),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimensionsUpdated.width10(context) * 29.6,
            height: AppDimensionsUpdated.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensionsUpdated.width10(context) * 5.5,
              top: AppDimensionsUpdated.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensionsUpdated.width10(context) * 3.55,
                  height: AppDimensionsUpdated.height10(context) * 3.5,
                  margin: EdgeInsets.only(
                      right: AppDimensionsUpdated.height10(context) * 0.8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/menu_goals_b.webp'),
                  )),
                ),
                SizedBox(
                  width: AppDimensionsUpdated.width10(context) * 22.5,
                  height: AppDimensionsUpdated.height10(context) * 2.2,
                  child: Text(
                    widget.status == 'deleted'
                        ? 'Goal & Practice deleted'
                        : widget.status == 'inactive'
                            ? 'Goal & Practice scheduled'
                            : widget.status == 'update' ||
                                    widget.status == 'practiceUpdate'
                                ? 'Goal & Practice edited'
                                : widget.status == "Created"
                                    ? 'New Goal Created'
                                    : 'Goal & Practice scheduled',
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
            //width: AppDimensionsUpdated.width10(context) * 32.5,
            height: AppDimensionsUpdated.height10(context) * 39.6,
            margin: EdgeInsets.only(
                right: AppDimensionsUpdated.height10(context) * 1.5,
                left: AppDimensionsUpdated.height10(context) * 1.5,
                top: AppDimensionsUpdated.height10(context) * 1.5),
            decoration: widget.status == 'deleted'
                ? BoxDecoration(
                    boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius:
                              AppDimensionsUpdated.height10(context) * 0.5,
                          blurRadius:
                              AppDimensionsUpdated.height10(context) * 0.7,
                          offset: const Offset(0, 3),
                        )
                      ],
                    borderRadius: BorderRadius.circular(
                        AppDimensionsUpdated.height10(context) * 2.0),
                    color: const Color(0xff828282))
                : widget.status == 'inactive'
                    ? BoxDecoration(
                        boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius:
                                  AppDimensionsUpdated.height10(context) * 0.5,
                              blurRadius:
                                  AppDimensionsUpdated.height10(context) * 0.7,
                              offset: const Offset(0, 3),
                            )
                          ],
                        borderRadius: BorderRadius.circular(
                            AppDimensionsUpdated.height10(context) * 2.0),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/timeline_1.webp'),
                            fit: BoxFit.cover))
                    : BoxDecoration(
                        boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius:
                                  AppDimensionsUpdated.height10(context) * 0.5,
                              blurRadius:
                                  AppDimensionsUpdated.height10(context) * 0.7,
                              offset: const Offset(0, 3),
                            )
                          ],
                        borderRadius: BorderRadius.circular(
                            AppDimensionsUpdated.height10(context) * 2.0),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/timeline_1.webp'),
                            fit: BoxFit.cover)),
            child: Column(
              children: [
                Container(
                  height: AppDimensionsUpdated.height10(context) * 3.4,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 3.2),
                  child: Center(
                    child: Text(
                      widget.status == 'deleted'
                          ? 'Goal deleted'
                          : widget.status == 'inactive'
                              ? 'Schedule stopped'
                              : widget.status == 'update' ||
                                      widget.status == 'practiceUpdate'
                                  ? 'Information updated'
                                  : widget.status == 'Created'
                                      ? "New Goal Created"
                                      : 'New schedule started',
                      style: TextStyle(
                          fontSize: AppDimensionsUpdated.font10(context) * 2.2,
                          height: AppDimensionsUpdated.height10(context) * 0.12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffFBFBFB)),
                    ),
                  ),
                ),
                Container(
                  width: AppDimensionsUpdated.width10(context) * 25.8,
                  height: AppDimensionsUpdated.height10(context) * 25.8,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 1.9),
                  child: Stack(
                    children: [
                      Container(
                        width: AppDimensionsUpdated.width10(context) * 25.8,
                        height: AppDimensionsUpdated.height10(context) * 25.8,
                        padding: EdgeInsets.only(
                            bottom:
                                AppDimensionsUpdated.height10(context) * 6.0),
                        decoration: BoxDecoration(
                            image: widget.status == 'inactive'
                                ? DecorationImage(
                                    image: AssetImage(
                                        goalImages(widget.image1.toString())),
                                    opacity: 0.45,
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: AssetImage(
                                        goalImages(widget.image1.toString())),
                                    fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppDimensionsUpdated.height10(context) *
                                          2.5),
                              child: Text(
                                widget.mainText,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            1.8,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.12,
                                    fontWeight: FontWeight.w600,
                                    color: widget.status == 'inactive'
                                        ? const Color(0xff5B74A6)
                                            .withOpacity(0.4)
                                        : const Color(0xff5B74A6)),
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 20.9,
                              margin: const EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppDimensionsUpdated.height10(context) *
                                          2),
                              alignment: Alignment.center,
                              child: Text(
                                '“${widget.subText}”',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            1.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.15,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                    color: widget.status == 'deleted'
                                        ? const Color(0xff5B74A6)
                                            .withOpacity(0.4)
                                        : widget.status == 'inactive'
                                            ? const Color(0xff5B74A6)
                                                .withOpacity(0.4)
                                            : const Color(0xff5B74A6)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      widget.status == 'Created' ||
                              widget.status == 'deleted' ||
                              widget.status == 'update'
                          ? Container()
                          : Align(
                              alignment: const Alignment(0, 1.3),
                              child: Container(
                                width: AppDimensionsUpdated.width10(context) *
                                    12.8,
                                height: AppDimensionsUpdated.height10(context) *
                                    12.8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    image: widget.status == 'deleted'
                                        ? DecorationImage(
                                            image: AssetImage(practiceImages(
                                                widget.image2.toString())),
                                            opacity: 0.45,
                                            fit: BoxFit.cover)
                                        : widget.status == 'inactive'
                                            ? DecorationImage(
                                                image: AssetImage(
                                                    practiceImages(widget.image2
                                                        .toString())),
                                                opacity: 0.45,
                                                fit: BoxFit.cover)
                                            : DecorationImage(
                                                image: AssetImage(
                                                    practiceImages(widget.image2
                                                        .toString())),
                                                fit: BoxFit.cover)),
                                child: Center(
                                  child: Text(
                                    widget.smallText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) *
                                              1.6,
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          0.12,
                                      fontWeight: FontWeight.w500,
                                      color: widget.status == 'deleted'
                                          ? const Color(0xffFBFBFB)
                                              .withOpacity(0.4)
                                          : widget.status == 'inactive'
                                              ? const Color(0xffFBFBFB)
                                                  .withOpacity(0.4)
                                              : const Color(0xffFBFBFB),
                                    ),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
