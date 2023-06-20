import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/app_dimensions.dart';

class community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('BottomSheet'),
        onPressed: () {
          community_sheet(context);
        },
      ),
    );
  }
}

void community_sheet(context) {
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
          width: AppDimensions.height10(context) * 41.4,
          height: AppDimensions.height10(context) * 65.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.height10(context) * 2.0)),
              color: const Color(0xFFF5F5F5)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // alignment: AlignmentDirectional.topCenter,
              //  mainAxisAlignment: MainAxisAlignment.start,
              //  crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  //color: Colors.amber,
                  // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                  alignment: const Alignment(1, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: AppDimensions.height10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.5,
                          right: AppDimensions.height10(context) * 1.5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Close_blue.png'))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9,
                      bottom: AppDimensions.height10(context) * 1.9),
                  child: Image.asset(
                    'assets/images/potenic__icon.png',
                    width: AppDimensions.height10(context) * 8.202,
                    height: AppDimensions.height10(context) * 11.2,
                  ),
                ),
                Container(
                    width: AppDimensions.height10(context) * 28.6,
                    height: AppDimensions.height10(context) * 8.6,
                    // color: Colors.amber,
                    alignment: Alignment.topCenter,
                    //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                    child: Column(
                      children: [
                        Text(
                          'Community',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 3.0,
                              fontWeight: FontWeight.w700,
                              height: AppDimensions.height10(context) * 0.15,
                              color: const Color(0xFF437296)),
                        ),
                        Container(
                          // padding: EdgeInsets.only(
                          //     bottom: AppDimensions.height10(context) * 1.0),
                          child: Text(
                            ' coming soon...',
                            style: TextStyle(
                                height: AppDimensions.height10(context) * 0.15,
                                fontSize: AppDimensions.height10(context) * 2.2,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF437296)),
                          ),
                        )
                      ],
                    )),
                Container(
                  width: AppDimensions.height10(context) * 35.4,
                  height: AppDimensions.height10(context) * 18.5,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.1),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: 'laila',
                            height: AppDimensions.height10(context) * 0.15,
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF437296)),
                        children: [
                          const TextSpan(
                              text:
                                  'App community is coming in future releases to\ntake the experience to another level. If you have\na real life story that you would like to share to\ninspire others and make an impact, please\ncontact us :) \n\nMeanwhile, we invite you to join '),
                          TextSpan(
                              text:
                                  'our\ncommunity of personal development\nenthusiasts and action takers here.',
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
                                      AppDimensions.height10(context) * 0.1))
                        ]),
                  ),
                ),
                Align(
                  // alignment: Alignment(0, 1),
                  child: Container(
                    width: AppDimensions.height10(context) * 35.5,
                    height: AppDimensions.height10(context) * 91.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.5,
                        bottom: AppDimensions.height10(context) * 6.2),
                    decoration: const BoxDecoration(
                        // color: Colors.amber,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Community promo 1.png'))),
                  ),
                )
              ],
            ),
          )),
    ),
  );
}


//  Center(
//                       child: RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                               style: TextStyle(
//                                   fontSize: AppDimensions.height10(context) * 2.2,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xFF437296)),
//                               children: [
//                                 TextSpan(
//                                     text: 'Community\n',
//                                     style: TextStyle(
//                                       //height: 1.5,
//                                       fontSize: AppDimensions.height10(context) * 3.0,
//                                       fontWeight: FontWeight.w700,
//                                     )),
//                                 TextSpan(text: 'coming soon...')
//                               ])),
//                     )