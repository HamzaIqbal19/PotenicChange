import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/timeline/component/imageComponent.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class NewVisionComponent extends StatefulWidget {
  final image1;
  final image2;
  String mainText;
  String subText;
  String levelText;

  NewVisionComponent({
    super.key,
    required this.mainText,
    required this.subText,
    required this.image1,
    required this.image2,
    required this.levelText,
  });

  @override
  State<NewVisionComponent> createState() => _NewVisionComponentState();
}

class _NewVisionComponentState extends State<NewVisionComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensionsUpdated.width10(context) * 33.5,
      height: AppDimensionsUpdated.height10(context) * 61.2,
      margin: EdgeInsets.only(
        top: AppDimensionsUpdated.height10(context) * 2.0,
        right: AppDimensionsUpdated.height10(context) * 2.0,
        left: AppDimensionsUpdated.height10(context) * 2.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius:
            BorderRadius.circular(AppDimensionsUpdated.height10(context) * 2.6),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimensionsUpdated.width10(context) * 20.5,
            height: AppDimensionsUpdated.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensionsUpdated.width10(context) * 12.8,
              top: AppDimensionsUpdated.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensionsUpdated.width10(context) * 3.5,
                  height: AppDimensionsUpdated.height10(context) * 3.5,
                  margin: EdgeInsets.only(
                      right: AppDimensionsUpdated.height10(context) * 0.8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/menu_goals_b.webp'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: AppDimensionsUpdated.width10(context) * 16.1,
                  height: AppDimensionsUpdated.height10(context) * 2.2,
                  child: Text(
                    'New Vision Score',
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
            width: AppDimensionsUpdated.width10(context) * 32.5,
            height: AppDimensionsUpdated.height10(context) * 52.7,
            margin: EdgeInsets.only(
                top: AppDimensionsUpdated.height10(context) * 1.5),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/timeline_4.webp'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(context) * 2.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensionsUpdated.height10(context) * 2.0),
                image: const DecorationImage(
                    image: AssetImage('assets/images/bg_stars.webp'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'New progress level',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimensionsUpdated.font10(context) * 2.2,
                          color: const Color(0xff437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensionsUpdated.width10(context) * 31.1,
                    height: AppDimensionsUpdated.height10(context) * 40.2,
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 1.9),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const Alignment(0, 1),
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 28.5,
                            height:
                                AppDimensionsUpdated.height10(context) * 29.6,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFF9DCC0).withOpacity(0),
                                    const Color(0xFFFF7975)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(
                                  AppDimensionsUpdated.height10(context) * 2.0),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: AppDimensionsUpdated.height10(context) *
                                    25.8,
                                height: AppDimensionsUpdated.height10(context) *
                                    5.866,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensionsUpdated.height10(context) *
                                            2.856,
                                    top:
                                        AppDimensionsUpdated.height10(context) *
                                            1.1),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: AppDimensionsUpdated.width10(
                                                context) *
                                            2.13,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            1.8,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/colon.webp'),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const Alignment(0.7, 0),
                                      child: SizedBox(
                                        width: AppDimensionsUpdated.width10(
                                                context) *
                                            25.5,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            5.366,

                                        ///color: Colors.amber,
                                        child: Center(
                                          child: Text(
                                            goalLevelMessages(widget.levelText),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensionsUpdated.font10(
                                                            context) *
                                                        1.8,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, -1),
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 25.8,
                            height:
                                AppDimensionsUpdated.height10(context) * 25.8,
                            padding: EdgeInsets.only(
                                bottom: AppDimensionsUpdated.height10(context) *
                                    6.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        goalImages(widget.image1.toString())),
                                    fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      AppDimensionsUpdated.height10(context) *
                                          17.1,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          2.4,
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          7.3),
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.mainText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppDimensionsUpdated.font10(
                                                context) *
                                            1.8,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            0.12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                ),
                                Container(
                                  // width:
                                  //     AppDimensionsUpdated.height10(context) * 20.9,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          3.63,
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          0.2),
                                  alignment: Alignment.center,
                                  child: Text('"${widget.subText}"',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensionsUpdated.font10(
                                                      context) *
                                                  1.4,
                                          height: AppDimensionsUpdated.height10(
                                                  context) *
                                              0.15,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.italic,
                                          color: const Color(0xff5B74A6))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0.2),
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 15.3,
                            height:
                                AppDimensionsUpdated.height10(context) * 15.3,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        goalLevel(widget.levelText.toString())),
                                    fit: BoxFit.contain)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  width:
                                      AppDimensionsUpdated.height10(context) *
                                          2.6,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          1.2,
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensionsUpdated.height10(
                                              context) *
                                          3.5),
                                  child: Center(
                                    child: Text(
                                      'LEVEL',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: AppDimensionsUpdated.font10(
                                                  context) *
                                              0.8,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF464646)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      AppDimensionsUpdated.height10(context) *
                                          5.1,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          2.805,
                                  // color: Colors.amber,
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          0.8,
                                      bottom: AppDimensionsUpdated.height10(
                                              context) *
                                          1.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          widget.levelText,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      2,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF646464)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: AppDimensionsUpdated.height10(
                                                    context) *
                                                0.7),
                                        child: Text(
                                          '/5',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              letterSpacing:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      -0.1,
                                              fontSize:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      1.7,
                                              fontWeight: FontWeight.w300,
                                              color: const Color(0xFF828282)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
