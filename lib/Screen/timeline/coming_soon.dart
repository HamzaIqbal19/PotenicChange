import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/app_dimensions.dart';

class timeline_soon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('BottomSheet'),
        onPressed: () {
          timeline_sheet(context);
        },
      ),
    );
  }
}

void timeline_sheet(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.width10(context) * 41.4,
          height: AppDimensions.height10(context) * 85.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.height10(context) * 2.0)),
              color: const Color(0xFFF5F5F5)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.9,
                    bottom: AppDimensions.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.width10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 36.4,
                height: AppDimensions.height10(context) * 3.6,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'Timeline ‘Coming soon’',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 3.0,
                      letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 35.2,
                height: AppDimensions.height10(context) * 10.8,
                // color: Colors.grey,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 1.1),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                          fontFamily: 'laila',
                          fontSize: AppDimensions.font10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF437296)),
                      children: [
                        const TextSpan(
                            text:
                                'Your Timeline journey experience is being built behind\nthe scenes. We will notify you when it’s released.\n\nIn the meantime, '),
                        TextSpan(
                            text: 'join our community',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = "https://potenic.com/community/";
                                if (await canLaunchUrlString(url)) {
                                  await launchUrlString(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationThickness:
                                    AppDimensions.height10(context) * 0.1)),
                        const TextSpan(
                            text: ' to get updates\non further releases.')
                      ]),
                ),
              ),
              Align(
                // alignment: Alignment(0, 1),
                child: Container(
                  width: AppDimensions.width10(context) * 33.4,
                  height: AppDimensions.height10(context) * 43.8,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.5,
                      bottom: AppDimensions.height10(context) * 3.9),
                  decoration: const BoxDecoration(
                      // color: Colors.amber,
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/00 My Timeline 1.webp'))),
                ),
              )
            ],
          )),
    ),
  );
}


//  Center(
//                       child: RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                               style: TextStyle(
//                                   fontSize: AppDimensions.font10(context) * 2.2,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xFF437296)),
//                               children: [
//                                 TextSpan(
//                                     text: 'Community\n',
//                                     style: TextStyle(
//                                       //height: 1.5,
//                                       fontSize: AppDimensions.font10(context) * 3.0,
//                                       fontWeight: FontWeight.w700,
//                                     )),
//                                 TextSpan(text: 'coming soon...')
//                               ])),
//                     )