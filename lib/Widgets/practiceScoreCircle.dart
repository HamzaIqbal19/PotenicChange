import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class PracticeScoreCircle extends StatefulWidget {
  const PracticeScoreCircle(
      {super.key, this.onTap, this.selectedIndex, this.index1, this.question});
  final onTap;
  final selectedIndex;
  final index1;
  final question;

  @override
  State<PracticeScoreCircle> createState() => _PracticeScoreCircleState();
}

class _PracticeScoreCircleState extends State<PracticeScoreCircle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedScaleButton(
          onTap: widget.onTap,
          //  () {
          //   setState(() {
          //     if (saved != true) {
          //       selectedItemIndex = selectedItemIndex == index1 ? -1 : index1;
          //     }
          //   });
          // },
          child: Container(
            width: AppDimensionsUpdated.width10(context) * 16.5,
            height: AppDimensionsUpdated.width10(context) * 16.5,
            margin:
                EdgeInsets.only(right: AppDimensions.height10(context) * 1.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: widget.selectedIndex != widget.index1
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFA88CA5), Color(0xFFBF9BA7)])
                  : const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0XFFFFFFFF), Color(0xFFFFFFFF)]),
            ),
            child: Center(
              child: Container(
                width: AppDimensionsUpdated.width10(context) * 15.1,
                height: AppDimensionsUpdated.width10(context) * 15.1,
                padding: EdgeInsets.all(AppDimensions.height10(context) * 1.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: widget.selectedIndex == widget.index1
                      ? const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFA88CA5), Color(0xFFBF9BA7)])
                      : const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0XFFFFFFFF), Color(0xFFFFFFFF)]),
                  // border: Border.all(
                  //     width: AppDimensions.width10(context) * 0.3,
                  //     color: const Color(0xFF8C648A))
                ),
                child: Column(
                  // mainAxisAlignment:
                  //     MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1),
                      child: Text(
                        "${widget.index1 + 1}",
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 3.2,
                            fontWeight: FontWeight.w500,
                            color: widget.selectedIndex != widget.index1
                                ? const Color(0xFF8C648A)
                                : const Color(0xFFFBFBFB)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 0.8),
                      child: Text(
                        widget.question[widget.index1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.6,
                            fontWeight: FontWeight.w400,
                            color: widget.selectedIndex != widget.index1
                                ? const Color(0xFF8C648A)
                                : const Color(0xFFFBFBFB)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        widget.selectedIndex == widget.index1
            ? Align(
                alignment: const Alignment(0.3, 0.93),
                widthFactor: 3.35,
                child: Container(
                  width: AppDimensions.width10(context) * 5,
                  height: AppDimensions.width10(context) * 5,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: AppDimensions.height10(context) * 0.1,
                          color: const Color(0xFFFFFFFF)),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/Tick.webp'))),
                ),
              )
            : Container()
      ],
    );
  }
}
