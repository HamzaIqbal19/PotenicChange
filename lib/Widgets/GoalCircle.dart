import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class GoalCircle extends StatefulWidget {
  const GoalCircle(
      {super.key,
      this.selectedItemIndexesOuter,
      this.premium,
      this.index1,
      this.options,
      this.disable,
      this.onTap});
  final selectedItemIndexesOuter;
  final premium;

  final index1;
  final options;
  final disable;
  final onTap;

  @override
  State<GoalCircle> createState() => _GoalCircleState();
}

class _GoalCircleState extends State<GoalCircle> {
  @override
  Widget build(BuildContext context) {
    return AnimatedScaleButton(
      onTap: widget.onTap,
      child: Container(
        width: AppDimensionsUpdated.width10(context) * 16.5,
        height: AppDimensionsUpdated.width10(context) * 16.5,
        margin: EdgeInsets.only(right: AppDimensions.width10(context) * 1.5),
        child: Stack(children: [
          Container(
            padding: EdgeInsets.all(AppDimensions.height10(context) * 1.5),
            width: AppDimensionsUpdated.width10(context) * 15.1,
            height: AppDimensionsUpdated.width10(context) * 15.1,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: widget.premium == false
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0XFFF5F5F5), Color(0XFFF5F5F5)])
                    : widget.selectedItemIndexesOuter != widget.index1
                        ? const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0XFFF5F5F5), Color(0XFFF5F5F5)])
                        : const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0XFFFA9E71), Color(0xFFF9B87E)]),
                border: Border.all(
                    width: AppDimensions.height10(context) * 0.3,
                    color: widget.premium == false
                        ? const Color(0xFFEE8F70)
                        : widget.selectedItemIndexesOuter != widget.index1
                            ? const Color(0xFFEE8F70)
                            : const Color(0xFFFFFFFF))),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.index1 + 1}',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 3.1,
                      fontWeight: FontWeight.w500,
                      color: widget.premium == false
                          ? const Color(0xFFFA9934)
                          : widget.selectedItemIndexesOuter != widget.index1
                              ? const Color(0xFFFA9934)
                              : const Color(0xFFFFFFFF)),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 7,
                  child: Text(
                    widget.options[widget.index1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.6,
                        fontWeight: FontWeight.w400,
                        color: widget.premium == false
                            ? const Color(0xFFFA9934)
                            : widget.selectedItemIndexesOuter != widget.index1
                                ? const Color(0xFFFA9934)
                                : const Color(0xFFFFFFFF)),
                  ),
                )
              ],
            ),
          ),
          widget.premium == false
              ? Container()
              : widget.selectedItemIndexesOuter != widget.index1
                  ? Container()
                  : Align(
                      alignment: const Alignment(0, 0.8),
                      widthFactor: 3.35,
                      child: Container(
                        width: AppDimensions.width10(context) * 5,
                        height: AppDimensions.height10(context) * 5,
                        padding: EdgeInsets.all(
                            AppDimensions.height10(context) * 0.2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: AppDimensions.height10(context) * 0.1,
                                color: const Color(0xFFFFFFFF))),
                        child: Container(
                          width: AppDimensions.width10(context) * 3.4,
                          height: AppDimensions.height10(context) * 3.4,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: AppDimensions.width10(context) * 0.1,
                                  color: const Color(0xFFFFFFFF)),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/circle_tick.webp'))),
                        ),
                      ),
                    )
        ]),
      ),
    );
  }
}
