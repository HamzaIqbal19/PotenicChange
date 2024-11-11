import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_summary.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/splash_hurdles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/deleteanimatedDialog.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/menu_buttons.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../Practice Creation Journey/PracticeName.dart';

class hurdle_menu extends StatefulWidget {
  const hurdle_menu({super.key});

  @override
  State<hurdle_menu> createState() => _hurdle_menuState();
}

class _hurdle_menuState extends State<hurdle_menu> {
  var hurdlesSummary;
  bool loading = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void checkHurdle() async {
    Hurdles().checkUserHurdles().then((response) {
      if (response == true) {
        Navigator.push(
          context,
          FadePageRouteReverse(page: const landing_hurdles()),
        );

        return response;
      } else if (response == false) {
        Navigator.push(
            context, FadePageRouteReverse(page: const hurdles_splash()));
      }
    }).catchError((error) {});
  }

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesSummary = response['hurdle'];
        });
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {});
  }

  @override
  void initState() {
    super.initState();
    _fetchHurdleSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.5),
          child: Text(
            'Menu',
            style: TextStyle(
                fontSize: AppDimensions.font10(context) * 2.0,
                fontWeight: FontWeight.w600,
                color: const Color(0xfffbfbfb)),
          ),
        ),
        centerTitle: true,
        leading: Center(
          child: Buttons().backButton(
            context,
            () {
              Navigator.pop(context);
            },
          ),
          //  IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: Image.asset(
          //       'assets/images/Back.webp',
          //       //width: AppDimensions.width10(context) * 3.0,
          //       height: AppDimensions.height10(context) * 3.0,
          //       fit: BoxFit.contain,
          //     )),
        ),
        actions: [
          Center(
            child: Buttons().closeButton(
              context,
              () {
                Navigator.pop(context);
              },
            ),
            // IconButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: Image.asset(
            //       'assets/images/Close.webp',
            //       //  width: AppDimensions.width10(context) * 2.6,
            //       height: AppDimensions.height10(context) * 2.6,
            //       fit: BoxFit.contain,
            //     )),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/practicebackground.webp'),
          fit: BoxFit.cover,
        )),
        child: loading == false
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppDimensions.height10(context) * 11.255,
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 19.62,
                    height: AppDimensions.height10(context) * 19.33,
                    padding:
                        EdgeInsets.all(AppDimensions.width10(context) * 2.3),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/black_hole.webp'))),
                    child: Padding(
                      padding:
                          EdgeInsets.all(AppDimensions.height10(context) * 1.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            // width: AppDimensions.width10(context) * 7.1,
                            // height: AppDimensions.height10(context) * 1.9,
                            child: Text(
                              capitalizeFirstLetter(
                                  hurdlesSummary['hurdleName']),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xFFFBFBFB),
                                  fontSize: AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            // width: AppDimensions.width10(context) * 7.471,
                            // height: AppDimensions.height10(context) * 4.38,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.773),
                            child: Text(
                              capitalizeFirstLetter(
                                  hurdlesSummary['triggerStatment']),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xFFFBFBFB),
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 7.313,
                  ),
                  SizedBox(
                    width: AppDimensions.width10(context) * 32.0,
                    height: AppDimensions.height10(context) * 3.0,
                    // margin:
                    //     EdgeInsets.only(top: AppDimensions.height10(context) * 7.313),
                    child: Center(
                        child: Text(
                      'What do you want to do?',
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 38.4,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.4,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedScaleButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const summary_hurdles(
                                delete_hurdle: true,
                              )),
                            );
                          },
                          child: const ButtonFields(
                              fieldText: 'View/Edit Details',
                              iconVisible: true,
                              textColor: 0xff646464,
                              fieldText2: '',
                              textColor2: 0xffEA1B1,
                              fieldText3: '',
                              fieldText4: '',
                              premium: true),
                        ),
                        SizedBox(
                          height: UpdatedDimensions.height10(context),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 17.0,
                          height: AppDimensions.height10(context) * 0.5,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: Colors.white),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 38.4,
                          height: AppDimensions.height10(context) * 6.0,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.width10(context) * 2.4,
                                height: AppDimensions.height10(context) * 2.4,
                                margin: EdgeInsets.only(
                                  right: AppDimensions.width10(context) * 0.5,
                                ),
                                child: const Icon(
                                  Icons.share,
                                  color: Color(0xff646464),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 0.7),
                                child: SizedBox(
                                  child: Center(
                                      child: Text(
                                    'Share',
                                    style: TextStyle(
                                        fontSize:
                                            UpdatedDimensions.font10(context) *
                                                2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF646464)),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),

                        DeleteAnimatedDialog(
                          content:
                              "By clicking 'Yes' you confirm that this\nhurdle will be deleted permanently. ",
                          text1: 'Are you sure you want\nto',
                          boldText: ' delete ',
                          text2: 'this hurdle?',
                          TextButton1: 'No',
                          ontap1: () {
                            Navigator.pop(context);
                          },
                          TextButton2: 'Yes',
                          ontap2: () {
                            Hurdles()
                                .deleteUserHurdle(hurdlesSummary['id'])
                                .then((response) {
                              if (response == true) {
                                checkHurdle();

                                // Navigator.push(
                                //     context,
                                //     FadePageRoute(
                                //         page:
                                //             const landing_hurdles()));
                              }
                            });
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 38.4,
                            height: AppDimensions.height10(context) * 6.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.1,
                                    color: const Color(0xFFFFFFFF)),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: const Color(0xff464646)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.width10(context) * 2.4,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                    right:
                                        AppDimensions.height10(context) * 0.5,
                                  ),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Color(0XFFFFFFFF),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.7),
                                  child: SizedBox(
                                    child: Center(
                                        child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          fontSize: UpdatedDimensions.font10(
                                                  context) *
                                              2,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xffffffff)),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // AnimatedScaleButton(
                        //   onTap: () {
                        //     return showAnimatedDialog(
                        //         animationType: DialogTransitionType.fadeScale,
                        //         curve: Curves.easeInOut,
                        //         duration: const Duration(seconds: 1),
                        //         context: context,
                        //         builder: (BuildContext context) => SizedBox(
                        //           width:
                        //           AppDimensions.width10(context) * 27.0,
                        //           height: AppDimensions.height10(context) *
                        //               21.4,
                        //           child: AlertDialog(
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(
                        //                     AppDimensions.height10(
                        //                         context) *
                        //                         1.4)),
                        //             contentPadding: EdgeInsets.zero,
                        //             actionsPadding: EdgeInsets.zero,
                        //             titlePadding: EdgeInsets.zero,
                        //             title: Container(
                        //                 margin: EdgeInsets.only(
                        //                     top: AppDimensions.height10(context) *
                        //                         1.9,
                        //                     right: AppDimensions.width10(context) *
                        //                         1.6,
                        //                     left: AppDimensions.width10(context) *
                        //                         1.6,
                        //                     bottom:
                        //                     AppDimensions.height10(context) *
                        //                         0.2),
                        //                 height:
                        //                 AppDimensions.height10(context) *
                        //                     4.4,
                        //                 width: AppDimensions.width10(context) *
                        //                     23.8,
                        //                 child: RichText(
                        //                     textAlign: TextAlign.center,
                        //                     text: TextSpan(
                        //                         style: TextStyle(
                        //                             fontFamily: 'laila',
                        //                             height:
                        //                             AppDimensions.height10(context) *
                        //                                 0.15,
                        //                             fontSize: AppDimensions.font10(context) * 1.6,
                        //                             fontWeight: FontWeight.w400,
                        //                             color: const Color(0xFF000000)),
                        //                         children: const [
                        //                           TextSpan(
                        //                               text:
                        //                               'Are you sure you want\nto'),
                        //                           TextSpan(
                        //                             text: ' delete ',
                        //                             style: TextStyle(
                        //                                 fontWeight:
                        //                                 FontWeight
                        //                                     .w700),
                        //                           ),
                        //                           TextSpan(
                        //                               text: 'this hurdle?')
                        //                         ]))),
                        //             content: Container(
                        //               margin: EdgeInsets.only(
                        //                   bottom:
                        //                   AppDimensions.height10(
                        //                       context) *
                        //                       1.5,
                        //                   left: AppDimensions.height10(
                        //                       context) *
                        //                       1.6,
                        //                   right: AppDimensions.height10(
                        //                       context) *
                        //                       1.6),
                        //               height:
                        //               AppDimensions.height10(context) *
                        //                   3.4,
                        //               width:
                        //               AppDimensions.width10(context) *
                        //                   23.8,
                        //               child: Text(
                        //                 "By clicking 'Yes' you confirm that this\nhurdle will be deleted permanently. ",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   color: const Color(0xFF000000),
                        //                   fontSize: AppDimensions.font10(
                        //                       context) *
                        //                       1.3,
                        //                   fontWeight: FontWeight.w400,
                        //                 ),
                        //               ),
                        //             ),
                        //             actions: <Widget>[
                        //               Column(
                        //                 children: [
                        //                   SizedBox(
                        //                     height: AppDimensions.height10(
                        //                         context) *
                        //                         0.1,
                        //                     child: Divider(
                        //                       color: const Color(0XFF3C3C43)
                        //                           .withOpacity(0.29),
                        //                     ),
                        //                   ),
                        //                   Container(
                        //                     height: AppDimensions.height10(
                        //                         context) *
                        //                         4.2,
                        //                     width: double.infinity,
                        //                     color: const Color(0xFF007AFF),
                        //                     child: TextButton(
                        //                       onPressed: () {
                        //                         Navigator.pop(context);
                        //                       },
                        //                       child: Text(
                        //                         'No',
                        //                         style: TextStyle(
                        //                             color: const Color(
                        //                                 0xFFFFFFFF),
                        //                             fontSize: AppDimensions
                        //                                 .font10(
                        //                                 context) *
                        //                                 1.7,
                        //                             fontFamily: "Laila",
                        //                             fontWeight:
                        //                             FontWeight.w400),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     height: AppDimensions.height10(
                        //                         context) *
                        //                         0.1,
                        //                     child: Divider(
                        //                       color: const Color(0XFF3C3C43)
                        //                           .withOpacity(0.29),
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     height: AppDimensions.height10(
                        //                         context) *
                        //                         4.4,
                        //                     width: double.infinity,
                        //                     child: TextButton(
                        //                       onPressed: () {
                        //                         Hurdles()
                        //                             .deleteUserHurdle(
                        //                             hurdlesSummary[
                        //                             'id'])
                        //                             .then((response) {
                        //                           if (response == true) {
                        //                             checkHurdle();

                        //                             // Navigator.push(
                        //                             //     context,
                        //                             //     FadePageRoute(
                        //                             //         page:
                        //                             //             const landing_hurdles()));
                        //                           }
                        //                         });
                        //                       },
                        //                       child: Text(
                        //                         'Yes',
                        //                         style: TextStyle(
                        //                             fontSize: AppDimensions
                        //                                 .font10(
                        //                                 context) *
                        //                                 1.7,
                        //                             fontFamily: "Laila",
                        //                             fontWeight:
                        //                             FontWeight.w400,
                        //                             color: const Color(
                        //                                 0xFF007AFF)),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     height: AppDimensions.height10(
                        //                         context) *
                        //                         0.1,
                        //                     child: Divider(
                        //                       color: const Color(0XFF3C3C43)
                        //                           .withOpacity(0.29),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ));
                        //   },
                        //   child:
                        // Container(
                        //     width: AppDimensions.width10(context) * 38.4,
                        //     height: AppDimensions.height10(context) * 6.0,
                        //     decoration: BoxDecoration(
                        //         border: Border.all(
                        //             width: AppDimensions.width10(context) * 0.1,
                        //             color: const Color(0xFFFFFFFF)),
                        //         borderRadius: BorderRadius.circular(
                        //             AppDimensions.height10(context) * 2.0),
                        //         color: const Color(0xff464646)),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Container(
                        //           width: AppDimensions.width10(context) * 2.4,
                        //           height: AppDimensions.height10(context) * 2.4,
                        //           margin: EdgeInsets.only(
                        //             right:
                        //             AppDimensions.height10(context) * 0.5,
                        //           ),
                        //           child: const Icon(
                        //             Icons.delete,
                        //             color: Color(0XFFFFFFFF),
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           child: Center(
                        //               child: Text(
                        //                 'Delete',
                        //                 style: TextStyle(
                        //                     fontSize:
                        //                     UpdatedDimensions.font10(context) * 2,
                        //                     fontWeight: FontWeight.w500,
                        //                     color: const Color(0xffffffff)),
                        //               )),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              )
            : const Center(
                child: SpinKitFadingCircle(
                  color: Color(0xFFB1B8FF),
                  size: 80,
                ),
              ),
      ),
    );
  }
}
