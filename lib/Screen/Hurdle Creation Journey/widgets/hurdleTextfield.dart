import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class HurdleTextField extends StatefulWidget {
  HurdleTextField({
    super.key,
    required this.text,
    required this.hintText,
    required this.charCount,
    required this.charlength,
    this.controller,
    required this.hintTextColor,
    this.Focus,
    this.onTap,
    required this.hide,
    this.animation,
    this.onEditingComplete,
  });
  final String text;
  final String hintText;
  final String charCount;
  final int charlength;
  final controller;
  final Color hintTextColor;
  final Focus;
  final bool hide;
  final Function()? onTap;
  void Function()? onEditingComplete;
  final Animation<double>? animation;

  @override
  State<HurdleTextField> createState() => _HurdleTextFieldState();
}

class _HurdleTextFieldState extends State<HurdleTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: widget.animation!,
          builder: (context, child) => Container(
              width: AppDimensions.width10(context) * 36.0,
              height: widget.hide ? null : widget.animation!.value,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                  color: Colors.white),
              child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      // width: AppDimensions.width10(context) * 8.0,
                      height: AppDimensions.height10(context) * 2.0,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height < 690
                              ? AppDimensions.width10(context) * 1.6
                              : AppDimensions.width10(context) * 2.1,
                          // right: AppDimensions.width10(
                          //         context) *
                          //     25.0,
                          top: AppDimensions.height10(context) * 1.3),
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.3,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: AppDimensions.height10(context) * 2.1,
                    ),
                    // height:
                    //     AppDimensions.height10(context) * 4.4,
                    //width:   AppDimensions.height10(context)(context)* 30.5,
                    child: Center(
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        onEditingComplete: widget.onEditingComplete,
                        maxLines: widget.hide ? null : 4,
                        focusNode: widget.Focus,
                        maxLength: widget.charlength,
                        textCapitalization: TextCapitalization.sentences,
                        controller: widget.controller,
                        textAlignVertical: TextAlignVertical.top,
                        onTap: widget.onTap,
                        scrollPadding: EdgeInsets.zero,
                        onChanged: (value) {
                          setState(() {});
                        },
                        style: TextStyle(
                            fontFamily: 'Laila',
                            decoration: TextDecoration.none,
                            decorationThickness: 0,
                            height: AppDimensions.height10(context) * 0.15,
                            fontSize: AppDimensions.font10(context) * 2.4,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffB353C9)),
                        decoration: InputDecoration(
                            isCollapsed: true,
                            // counterText: "",
                            // counterStyle: TextStyle(
                            //   height: double.minPositive,
                            // ),
                            contentPadding: EdgeInsets.only(
                              right: AppDimensions.width10(context),
                            ),
                            hintText: widget.hintText,
                            hintStyle: TextStyle(
                                fontFamily: 'Laila',
                                fontSize: AppDimensions.font10(context) * 2.4,
                                fontWeight: FontWeight.w600,
                                color: widget.hintTextColor),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Container(
          width: AppDimensions.width10(context) * 15,
          height: AppDimensions.height10(context) * 2.0,
          margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 3.1,
              right: AppDimensions.width10(context) * 25.0,
              top: AppDimensions.height10(context) * 1.0),
          child: Row(
            children: [
              Text(
                'Character count: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.font10(context) * 1.3,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                widget.charCount,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.font10(context) * 1.3,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
