import 'package:flutter/material.dart';

import '../utils/app_dimensions.dart';

class multiple_circle extends StatelessWidget {
  const multiple_circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey,
      child: const Center(
          child: align_circles(
        asset_1: 'assets/images/oraange_sun.png',
        s_circle_text: 'Meditation',
        asset_2: 'assets/images/Ellipse 158.png',
        head_text: 'Control my anger',
        body_text: '“I am someone who is in\n control of my anger”',
        body_text_color: 0xff1A481C,
        head_text_color: 0xff1A481C,
        body_text_size: 16,
        head_text_size: 22,
        enable_icon: false,
        is_right: true,
        s_circle_text_col: 0xffffffff,
      )),
    );
  }
}

class align_circles extends StatelessWidget {
  final String asset_1;
  final String asset_2;
  final String head_text;
  final String body_text;
  final double body_text_size;
  final int body_text_color;
  final double head_text_size;
  final int head_text_color;

  final bool enable_icon;
  final bool is_right;

  final String s_circle_text;
  final int s_circle_text_col;

  const align_circles(
      {super.key,
      required this.asset_1,
      required this.s_circle_text,
      required this.asset_2,
      required this.head_text,
      required this.body_text,
      required this.enable_icon,
      required this.is_right,
      required this.body_text_size,
      required this.body_text_color,
      required this.head_text_size,
      required this.head_text_color,
      required this.s_circle_text_col});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.height10 * 26.8,
      height: AppDimensions.height10 * 30.2,
      // color: Colors.blue,
      // margin: const EdgeInsets.only(top: 29, bottom: 12, right: 45),
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: AppDimensions.height10 * 26.8,
            height: AppDimensions.height10 * 26.8,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(asset_1), fit: BoxFit.cover)),
            child: Stack(
              children: [
                Align(
                    alignment: const Alignment(0, -0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10 * 0),
                          width: AppDimensions.height10 * 19.9,
                          child: Text(
                            head_text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: head_text_size,
                                fontWeight: FontWeight.w600,
                                color: Color(head_text_color)),
                          ),
                        ),
                      ],
                    )),
                Align(
                  alignment: const Alignment(0, -0.17),
                  child: Text(body_text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: body_text_size,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: Color(body_text_color))),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment:
              is_right ? const Alignment(0.5, 1) : const Alignment(-0.5, 1),
          child: Container(
            height: AppDimensions.height10 * 13.8,
            width: AppDimensions.height10 * 13.8,
            decoration: BoxDecoration(
                //color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage(asset_2), fit: BoxFit.contain)),
            child: Stack(children: [
              Center(
                  child: Text(
                s_circle_text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(s_circle_text_col),
                    fontSize: AppDimensions.height10 * 1.8,
                    fontWeight: FontWeight.w500),
              )),
              Container(
                child: enable_icon
                    ? Align(
                        alignment: const Alignment(0, 1.25),
                        child: Container(
                            height: AppDimensions.height10 * 2.9,
                            width: AppDimensions.height10 * 2.9,
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff52855E)),
                            child: const ImageIcon(
                              AssetImage('assets/images/tick_icon.png'),
                              color: Color(0xffFFFFFF),
                            )))
                    : Container(),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
