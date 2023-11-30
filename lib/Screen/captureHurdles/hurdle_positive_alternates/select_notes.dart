import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../utils/app_dimensions.dart';

class select_note extends StatefulWidget {
  const select_note({super.key});

  @override
  State<select_note> createState() => _select_noteState();
}

class _select_noteState extends State<select_note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                //  width: AppDimensions.width10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.contain,
                )),
          ),
          centerTitle: true,
          title: SizedBox(
            width: AppDimensions.width10(context) * 17.0,
            height: AppDimensions.height10(context) * 4.8,
            child: GradientText(
              'Hurdle‘s positive\nalternatives',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.font10(context) * 2.0,
                fontWeight: FontWeight.w600,
              ),
              colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
            ),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.webp',
                   // width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.contain,
                  )),
            )
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/practicebackground.webp'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppDimensions.width10(context) * 13.339,
              height: AppDimensions.height10(context) * 16.674,
              margin:
                  EdgeInsets.only(right: AppDimensions.width10(context) * 1.4),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/Video_Subtract.webp'))),
              child: Container(
                margin: EdgeInsets.all(AppDimensions.height10(context) * 0.758),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5)),
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: Colors.white,
                    radius:
                        Radius.circular(AppDimensions.height10(context) * 1.5),
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.width10(context) * 3.032,
                            height: AppDimensions.height10(context) * 3.032,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 0.68),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/note_icon.webp'))),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 1.0),
                            child: Text(
                              'Record your\nown notes here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Container(
              width: AppDimensions.width10(context) * 36.0,
              height: AppDimensions.height10(context) * 6.0,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 8.026),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                  color: Colors.white),
              child: Container(
                margin: EdgeInsets.only(
                    left: AppDimensions.width10(context) * 2.0,
                    right: AppDimensions.width10(context) * 2.0),
                height: AppDimensions.height10(context) * 2.2,
                width: AppDimensions.width10(context) * 30.5,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Content URL',
                        hintStyle: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.8,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff828282)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
              ),
            ),
            Container(
                height: AppDimensions.height10(context) * 5.0,
                width: AppDimensions.width10(context) * 25.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFCC10D),
                      Color(0xffFDA210),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 5.0),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 1.6,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ))),
          ],
        ),
      ),
    );
  }
}
