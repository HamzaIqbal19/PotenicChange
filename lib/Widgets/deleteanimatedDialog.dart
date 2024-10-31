import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_motivation.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class DeleteAnimatedDialog extends StatefulWidget {
  const DeleteAnimatedDialog(
      {super.key,
      required this.content,
      required this.text1,
      required this.boldText,
      required this.text2,
      required this.TextButton1,
      required this.TextButton2,
      this.ontap1,
      this.ontap2,
      required this.child});

  final String content;
  final String text1;
  final String boldText;
  final String text2;
  final String TextButton1;
  final String TextButton2;
  final void Function()? ontap1;
  final void Function()? ontap2;
  final Widget child;

  @override
  State<DeleteAnimatedDialog> createState() => _DeleteAnimatedDialogState();
}

class _DeleteAnimatedDialogState extends State<DeleteAnimatedDialog> {
  get inspirationDetails => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedScaleButton(
      onTap: () {
        return showAnimatedDialog(
            animationType: DialogTransitionType.fadeScale,
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            context: context,
            builder: (BuildContext context) => SizedBox(
                  width: AppDimensions.width10(context) * 27.0,
                  height: AppDimensions.height10(context) * 21.4,
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 1.4)),
                    contentPadding: EdgeInsets.zero,
                    actionsPadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.zero,
                    title: Container(
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.9,
                            right: AppDimensions.width10(context) * 1.6,
                            left: AppDimensions.width10(context) * 1.6,
                            bottom: AppDimensions.height10(context) * 0.2),
                        height: AppDimensions.height10(context) * 4.4,
                        width: AppDimensions.height10(context) * 23.8,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontFamily: 'laila',
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    height:
                                        AppDimensions.height10(context) * 0.15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000)),
                                children: [
                                  TextSpan(
                                      text: widget
                                          .text1), //'Are you sure you want\nto'
                                  TextSpan(
                                    text: widget.boldText, //' delete '
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(text: widget.text2)

                                  /// 'this inspiration?'
                                ]))),
                    content: Container(
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) * 1.5,
                          left: AppDimensions.height10(context) * 1.6,
                          right: AppDimensions.height10(context) * 1.6),
                      height: AppDimensions.height10(context) * 3.4,
                      width: AppDimensions.width10(context) * 23.8,
                      child: Text(
                        widget.content,
                        // "By clicking 'Yes' you confirm that this\ninspiration will be deleted permanently. ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF000000),
                          fontSize: AppDimensions.font10(context) * 1.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      Column(
                        children: [
                          SizedBox(
                            height: AppDimensions.height10(context) * 0.1,
                            child: Divider(
                              color: const Color(0XFF3C3C43).withOpacity(0.29),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 4.2,
                            width: double.infinity,
                            color: const Color(0xFF007AFF),
                            child: TextButton(
                              onPressed: widget.ontap1, //() {
                              //   Navigator.pop(context);
                              // },
                              child: Text(
                                widget.TextButton1, // 'No',
                                style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.7,
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 0.1,
                            child: Divider(
                              color: const Color(0XFF3C3C43).withOpacity(0.29),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 4.4,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: widget.ontap2,
                              child: Text(
                                widget.TextButton2,
                                // 'Yes',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.7,
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF007AFF)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 0.1,
                            child: Divider(
                              color: const Color(0XFF3C3C43).withOpacity(0.29),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
      },
      child: widget.child,
    );
  }
}
