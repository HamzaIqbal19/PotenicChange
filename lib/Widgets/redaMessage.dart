

import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

reda(BuildContext context,  visible){
  return Container(
        height: AppDimensions
            .height10(
            context) *
            14.432,
        width: AppDimensions
            .width10(
            context) *
            36.335,
        margin: EdgeInsets.only(top: AppDimensions.height10(context)*1),
        decoration:
        const BoxDecoration(
            image:
            DecorationImage(
              image: AssetImage(
                'assets/images/Component 1.webp',
              ),
              fit: BoxFit.cover,
            )),
    child: Stack(children: [
      visible? Align(
        alignment:
        const Alignment(
            -0.930,
            -1.42),
        child:
        AnimatedScaleButton(
          onTap: () {
            // Navigator.push(
            //     context,
            //     FadePageRoute(
            //         page: const message_center()));
          },
          child:
          Image.asset(
            "assets/images/Group.webp",
            height: AppDimensions
                .height10(
                context) *
                5.0,
            width: AppDimensions
                .width10(
                context) *
                5.0,
          ),
        ),
      ):Container(),
      Align(
        alignment:
        const Alignment(
            0.93, 0),
        child: Image.asset(
          "assets/images/Vector Smart Object.webp",
          height: AppDimensions
              .height10(
              context) *
              9.296,
          width: AppDimensions
              .width10(
              context) *
              4.16,
        ),
      ),
      Container(
        margin:
        EdgeInsets.only(
          top: AppDimensions
              .height10(
              context) *
              2.1,
        ),
        child: Column(
          children: [
            Container(
              width: AppDimensions
                  .width10(
                  context) *
                  28.0,
              height: AppDimensions
                  .width10(
                  context) *
                  2.3,
              alignment:
              const Alignment(
                  -0.65,
                  0),
              child: Text(
                "Hi, it's Reda here",
                style:
                TextStyle(
                  fontSize:
                  AppDimensions.font10(context) *
                      1.6,
                  fontWeight:
                  FontWeight
                      .w700,
                  color: const Color
                      .fromRGBO(
                      91,
                      116,
                      166,
                      1),
                ),
              ),
            ),
            Container(
              width: AppDimensions
                  .width10(
                  context) *
                  5.245,
              height: AppDimensions
                  .width10(
                  context) *
                  1.3,
              margin: EdgeInsets.only(
                  right: AppDimensions.height10(
                      context) *
                      17.5),
              child:
              const Divider(
                thickness:
                1,
                color: Color
                    .fromRGBO(
                    91,
                    116,
                    166,
                    1),
              ),
            ),
            Container(
              width: AppDimensions
                  .width10(
                  context) *
                  26.7,
              // height: AppDimensions.height10(context) * 5.3,
              margin: EdgeInsets.only(
                  left: AppDimensions.width10(
                      context) *
                      3.4,
                  bottom: AppDimensions.height10(
                      context) *
                      1.2),
              child: Text(
                "You have an extra 20% chance of\nsuccess if you have a support buddy.\nHave you got one?",
                // textAlign: TextAlign.left,

                style: TextStyle(
                    fontSize:
                    AppDimensions.font10(context) *
                        1.4,
                    fontWeight:
                    FontWeight
                        .w400,
                    color: const Color
                        .fromRGBO(
                        91,
                        116,
                        166,
                        1)),
              ),
            )
          ],
        ),
      ),
    ]),
  );
}