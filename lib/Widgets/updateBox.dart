import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class updateBox extends StatefulWidget {
  final String headText;
  final String bodyText;
  final String functionText;
  final VoidCallback onTap1;
  final VoidCallback FadeFunction;
  final bool edit;
  const updateBox(
      {super.key,
        required this.headText,
        required this.bodyText,
        required this.onTap1,
        required this.functionText,
        required this.edit,
        required this.FadeFunction});

  @override
  State<updateBox> createState() => _updateBoxState();
}

class _updateBoxState extends State<updateBox> {
  bool showContainer = false;
  double swipeOffset = 0.0;
  Timer? _timer;

  void startTimer() {
    _timer = Timer(const Duration(seconds: 3), () {
      widget.FadeFunction;
      setState(() {
        showContainer = false;
      });
    });
  }

  void stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel(); // Cancel the timer if it's active
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    setState(() {
      showContainer = true;
    });
  }

  @override
  void dispose() {
    stopTimer(); // Make sure to cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          swipeOffset += details.delta.dx;
        });

        if (swipeOffset.abs() >= MediaQuery.of(context).size.width / 3.0) {
          setState(() {
            showContainer = false;
          });
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity: showContainer ? 1.0 : 0.0,
        child: Transform.translate(
          offset: Offset(swipeOffset, 0.0),
          child: Container(
            width: AppDimensions.width10(context) * 38.259,
            height: AppDimensions.height10(context) * 9.707,
            margin:
            EdgeInsets.only(top: AppDimensions.height10(context) * 12.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 2.0),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: AppDimensions.width10(context) * 1.261),
                  width: AppDimensions.width10(context) * 4.437,
                  height: AppDimensions.height10(context) * 4.437,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/circle_tick.webp'))),
                ),
                Container(
                  //width: AppDimensions.width10(context) * 6.9,
                  //height: AppDimensions.height10(context) * 4.0,
                  margin: EdgeInsets.only(
                      left: AppDimensions.width10(context) * 1.232),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        //width: AppDimensions.width10(context) * 4.6,
                        //height: AppDimensions.height10(context) * 1.6,
                        //   color: Colors.amber,
                        child: Text(
                          widget.headText,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.3,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.width10(context) * 16.9,
                        //height: AppDimensions.height10(context) * 2.2,
                        child: Text(
                          widget.bodyText,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.8,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedScaleButton(
                  onTap: widget.onTap1,
                  child: widget.edit
                      ? Container(
                      height: AppDimensions.height10(context) * 2.4,
                      width: AppDimensions.width10(context) * 2.4,
                      margin: EdgeInsets.only(
                          left: AppDimensions.width10(context) * 8),
                      padding: EdgeInsets.all(
                          AppDimensions.height10(context) * 0.4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border:
                          Border.all(width: 1, color: Colors.white)),
                      child: const ImageIcon(
                        AssetImage('assets/images/edit_icon.webp'),
                        color: Colors.white,
                      ))
                      : Container(
                    width: AppDimensions.width10(context) * 8.0,
                    height: AppDimensions.height10(context) * 6.0,
                    margin: EdgeInsets.only(
                        left: AppDimensions.width10(context) * 5,
                        right: AppDimensions.width10(context) * 1.03),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFFFFFFFF), width: 1),
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 2.0),
                    ),
                    child: Center(
                      child: Text(
                        widget.functionText,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.8,
                            fontWeight: FontWeight.w500,
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
    );
  }
}
