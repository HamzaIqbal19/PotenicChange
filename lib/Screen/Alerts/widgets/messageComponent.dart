
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';


messages(BuildContext context,title, body,visible, final VoidCallback onTap, int index){
  return Container(
    height: UpdatedDimensions
        .height10(
        context) *
        16.7,
    width: UpdatedDimensions
        .width10(
        context) *
        35.335,
    margin: EdgeInsets.only(top: UpdatedDimensions.height10(context)*0.5),
    decoration:
    const BoxDecoration(
        image:
        DecorationImage(
          image: AssetImage(
            'assets/images/Component 2.webp',
          ),
          fit: BoxFit.contain,
        )),
    child: Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 10, left: 7),
        child: Text(index<2? "New*":"", style: const TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w500),),
      ),

      Align(
        alignment:
        const Alignment(
            0.97, 0),
        child: Image.asset(
          "assets/images/Vector Smart Object.webp",
          height: UpdatedDimensions
              .height10(
              context) *
              9.296,
          width: UpdatedDimensions
              .width10(
              context) *
              4.16,
        ),
      ),
      Container(
        margin:
        EdgeInsets.only(
          top: UpdatedDimensions
              .height10(
              context) *
              2.7,
       left: UpdatedDimensions.width10(
              context) *
              2.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: UpdatedDimensions
                  .width10(
                  context) *
                  28.0,

              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                TextStyle(
                  fontSize:
                  UpdatedDimensions.font10(context) *
                      2,
                  fontWeight:
                  FontWeight
                      .w600,
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
              width: UpdatedDimensions
                  .width10(
                  context) *
                  5.245,
              height: UpdatedDimensions
                  .width10(
                  context) *
                  1.3,


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
              width: UpdatedDimensions
                  .width10(
                  context) *
                  26.7,
              height: UpdatedDimensions.height10(context) * 5.3,
              margin: EdgeInsets.only(

                  bottom: UpdatedDimensions.height10(
                      context) *
                      1.2),
              child:
              Text(
                body,
                // textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize:
                    UpdatedDimensions.font10(context) *
                        1.8,
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

alertBox(context, final VoidCallback tap1,){
  return showAnimatedDialog(
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
      context: context,
      builder: (BuildContext context) => SizedBox(
        width:
        AppDimensionsUpdated.width10(context) * 27.0,
        height: AppDimensionsUpdated.height10(context) *
            21.4,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(
                      context) *
                      1.4)),
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
              margin: EdgeInsets.only(
                  top: AppDimensionsUpdated.height10(context) *
                      1.9,
                  right: AppDimensionsUpdated.width10(context) *
                      1.6,
                  left: AppDimensionsUpdated.width10(context) *
                      1.6,
                  bottom:
                  AppDimensionsUpdated.height10(context) *
                      1.2),
              height:
              AppDimensionsUpdated.height10(context) *
                  4.4,
              width: AppDimensionsUpdated.width10(context) *
                  23.8,
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                          fontFamily: 'laila',
                          height:
                          AppDimensionsUpdated.height10(context) *
                              0.15,
                          fontSize: AppDimensionsUpdated.font10(context) * 1.6,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000)),
                      children: const [
                        TextSpan(
                            text:
                            'Are you sure you want\nto'),
                        TextSpan(
                          text: ' delete ',
                          style: TextStyle(
                              fontWeight:
                              FontWeight
                                  .w700),
                        ),
                        TextSpan(
                            text: 'this alert?')
                      ]))),
          content: Container(
            margin: EdgeInsets.only(
                bottom:
                AppDimensionsUpdated.height10(
                    context) *
                    1.5,
                left: AppDimensionsUpdated.height10(
                    context) *
                    1.6,
                right: AppDimensionsUpdated.height10(
                    context) *
                    1.6),
            height:
            AppDimensionsUpdated.height10(context) *
                3.2,
            width:
            AppDimensionsUpdated.width10(context) *
                23.8,
            child: Text(
              "By clicking 'Yes' you confirm that this\nalert will be deleted. ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0XFF000000),
                // letterSpacing:
                //     AppDimensionsUpdated.height10(context) * 0.1,
                fontSize: AppDimensionsUpdated.font10(
                    context) *
                    1.3,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: AppDimensionsUpdated.height10(
                      context) *
                      0.1,
                  child: Divider(
                    color: const Color(0XFF3C3C43)
                        .withOpacity(0.29),
                  ),
                ),
                Container(
                  height: AppDimensionsUpdated.height10(
                      context) *
                      4.2,
                  width: double.infinity,
                  color: const Color(0xFF007AFF),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                          color: const Color(
                              0xFFFFFFFF),
                          fontSize: AppDimensions
                              .font10(
                              context) *
                              1.7,
                          fontFamily: "Laila",
                          fontWeight:
                          FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensionsUpdated.height10(
                      context) *
                      0.1,
                  child: Divider(
                    color: const Color(0XFF3C3C43)
                        .withOpacity(0.29),
                  ),
                ),
                SizedBox(
                  height: AppDimensionsUpdated.height10(
                      context) *
                      4.4,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: tap1,
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: AppDimensions
                              .font10(
                              context) *
                              1.7,
                          fontFamily: "Laila",
                          fontWeight:
                          FontWeight.w400,
                          color: const Color(
                              0xFF007AFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensionsUpdated.height10(
                      context) *
                      0.1,
                  child: Divider(
                    color: const Color(0XFF3C3C43)
                        .withOpacity(0.29),
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
}
