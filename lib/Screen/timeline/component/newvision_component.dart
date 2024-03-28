import 'package:flutter/material.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class NewVisionComponent extends StatefulWidget {
  final image1;
  final image2;
  String mainText;
  String subText;
  String levelText;
  String quoteText;
  NewVisionComponent(
      {super.key,
      required this.mainText,
      required this.subText,
      required this.image1,
      required this.image2,
      required this.levelText,
      required this.quoteText});

  @override
  State<NewVisionComponent> createState() => _NewVisionComponentState();
}

class _NewVisionComponentState extends State<NewVisionComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 38.4,
      height: AppDimensions.height10(context) * 62.7,
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
            width: AppDimensions.width10(context) * 20.5,
            height: AppDimensions.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensions.width10(context) * 14.8,
              top: AppDimensions.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 3.5,
                  height: AppDimensions.height10(context) * 3.5,
                  margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 0.8),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/menu_goals_b.webp'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 16.1,
                  height: AppDimensions.height10(context) * 2.2,
                  child: Text(
                    'New Vision Score!',
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
            width: AppDimensions.width10(context) * 35.4,
            height: AppDimensions.height10(context) * 53.2,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.5),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/timeline_4.webp')),
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 2.0),
                image: const DecorationImage(
                    image: AssetImage('assets/images/bg_stars.webp')),
              ),
              child: Column(
                children: [
                  Container(
                    width: AppDimensions.width10(context) * 26.6,
                    height: AppDimensions.height10(context) * 3.4,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.2),
                    child: Text(
                      'New progress level',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppDimensions.font10(context) * 2.8,
                          color: const Color(0xff437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 31.1,
                    height: AppDimensions.height10(context) * 42.2,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.9),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const Alignment(0, 1),
                          child: Container(
                            width: AppDimensions.width10(context) * 31.1,
                            height: AppDimensions.height10(context) * 29.6,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFF9DCC0).withOpacity(0),
                                    const Color(0xFFFF7975)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: AppDimensions.height10(context) * 25.8,
                                height: AppDimensions.height10(context) * 5.866,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 2.856,
                                    top: AppDimensions.height10(context) * 1.1),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: AppDimensions.width10(context) *
                                            2.13,
                                        height:
                                            AppDimensions.height10(context) *
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
                                        width: AppDimensions.width10(context) *
                                            25.5,
                                        height:
                                            AppDimensions.height10(context) *
                                                5.366,

                                        ///color: Colors.amber,
                                        child: Center(
                                          child: Text(
                                            widget.quoteText,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
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
                            width: AppDimensions.width10(context) * 26.8,
                            height: AppDimensions.height10(context) * 26.8,
                            padding: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 6.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(widget.image1),
                                    fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                Container(
                                  width: AppDimensions.height10(context) * 17.1,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          7.3),
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.mainText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 2.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                ),
                                Container(
                                  // width:
                                  //     AppDimensions.height10(context) * 20.9,
                                  height:
                                      AppDimensions.height10(context) * 3.63,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.2),
                                  alignment: Alignment.center,
                                  child: Text(widget.subText,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.6,
                                          height:
                                              AppDimensions.height10(context) *
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
                            width: AppDimensions.width10(context) * 15.3,
                            height: AppDimensions.height10(context) * 15.3,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(widget.image2),
                                    fit: BoxFit.contain)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  width: AppDimensions.height10(context) * 2.6,
                                  height: AppDimensions.height10(context) * 0.8,
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
                                          3.5),
                                  child: Center(
                                    child: Text(
                                      'LEVEL',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  0.8,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF464646)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 5.1,
                                  height:
                                      AppDimensions.height10(context) * 2.805,
                                  // color: Colors.amber,
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
                                          1.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          '${widget.levelText}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.8,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF646464)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.7),
                                        child: Text(
                                          '/5',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              letterSpacing:
                                                  AppDimensions.height10(
                                                          context) *
                                                      -0.1,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
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
