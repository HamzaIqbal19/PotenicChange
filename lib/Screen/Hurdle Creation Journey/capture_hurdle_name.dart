// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:potenic_app/API/Hurdles.dart';
// import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdle_statement.dart';
// import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_landing_screen.dart';
// import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/widgets/hurdleTextfield.dart';
// import 'package:potenic_app/Widgets/alertbox.dart';
// import 'package:potenic_app/Widgets/animatedButton.dart';
// import 'package:potenic_app/Widgets/fading.dart';
// import 'package:potenic_app/utils/app_dimensions.dart';
// import 'package:potenic_app/utils/app_texts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';
// import 'capture_hurdle_select_hurdle.dart';
// import 'splash_hurdles.dart';

// final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

// class hurdle_name extends StatefulWidget {
//   final bool update;
//   const hurdle_name({super.key, required this.update});

//   @override
//   State<hurdle_name> createState() => _hurdle_nameState();
// }

// class _hurdle_nameState extends State<hurdle_name>
//     with TickerProviderStateMixin {
// //  bool buttonState = false;
//   var hurdleName;
//   TextEditingController controller = TextEditingController();
//   var hurdlesSummary;
//   var hurdlesList;
//   int? hurdleCat;
//   bool loading = true;

//   Future<Timer> loadData() async {
//     return Timer(const Duration(seconds: 1), onDoneLoading);
//   }

//   void onDoneLoading() {
//     setState(() {
//       loading = false;
//     });
//   }

//   void checkHurdle() async {
//     Hurdles().checkUserHurdles().then((response) {
//       if (response == true) {
//         Navigator.push(
//           context,
//           FadePageRouteReverse(page: const landing_hurdles()),
//         );

//         return response;
//       } else if (response == false) {
//         Navigator.push(
//             context, FadePageRouteReverse(page: const hurdles_splash()));
//       }
//     }).catchError((error) {});
//   }

//   void _fetchHurdleSummary() async {
//     Hurdles().getHurdleById().then((response) {
//       if (response.length != 0) {
//         setState(() {
//           controller.text = response['hurdle']['hurdleName'];
//           hurdleCat = response['hurdle']['hurdleId'];
//         });
//         loadData();
//         return response;
//       } else {
//         return response.statusCode;
//       }
//     }).catchError((error) {});
//   }

//   void _fetchHurdle() async {
//     Hurdles().getAllHurdles().then((response) {
//       if (response.length != 0) {
//         setState(() {
//           hurdlesList = response['hurdle'];
//         });
//         _fetchHurdleSummary();
//         return response;
//       } else {
//         return response.statusCode;
//       }
//     }).catchError((error) {});
//   }

//   void _getHurdleName() async {
//     final SharedPreferences prefs = await _prefs;
//     setState(() {
//       hurdleName = prefs.getString('hurdleName').toString().isEmpty
//           ? ""
//           : prefs.getString('hurdleName');
//     });
//   }

//   void _getName() async {
//     final SharedPreferences prefs = await _prefs;
//     var name;
//     setState(() {
//       name = prefs.getString('NameHurdle').toString().isEmpty
//           ? ''
//           : prefs.getString('NameHurdle');
//     });
//     if (name != '' && name != null) {
//       controller.text = name;
//     }
//   }

//   late AnimationController _controller;
//   late Animation _animation;

//   FocusNode _focusNode = FocusNode();

//   @override
//   void dispose() {
//     _controller.dispose();
//     _focusNode.dispose();

//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getName();
//     _controller =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 300));
//     _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
//       ..addListener(() {
//         setState(() {});
//       });

//     _focusNode.addListener(() {
//       if (_focusNode.hasFocus) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     });
//     if (widget.update == false) {
//       _getHurdleName();
//       setState(() {
//         loading = false;
//       });
//     } else {
//       _fetchHurdle();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         widget.update
//             ? Navigator.pop(context)
//             : Navigator.pushReplacement(
//                 context,
//                 FadePageRouteReverse(
//                     page: const select_hurdle(
//                   update: false,
//                 )));
//         return Future.value(false);
//       },
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           appBar: AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               automaticallyImplyLeading: false,
//               leading: widget.update
//                   ? Container()
//                   : Center(
//                       child: IconButton(
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 FadePageRouteReverse(
//                                     page: const select_hurdle(
//                                   update: false,
//                                 )));
//                           },
//                           icon: Image.asset(
//                             'assets/images/Back.webp',
//                             //width: AppDimensions.width10(context) * 3.0,
//                             height: AppDimensions.height10(context) * 3.0,
//                             fit: BoxFit.contain,
//                           )),
//                     ),
//               centerTitle: true,
//               title: SizedBox(
//                 width: AppDimensions.width10(context) * 19.0,
//                 // height: AppDimensions.height10(context) * 2.8,
//                 child: Row(
//                   children: [
//                     GradientText(
//                       AppText().captureHurdle3,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Laila',
//                         fontSize: AppDimensions.font10(context) * 2.2,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
//                     ),
//                     GradientText(
//                       '/5',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Laila',
//                         fontSize: AppDimensions.font10(context) * 2.2,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
//                     ),
//                   ],
//                 ),
//               ),
//               actions: [
//                 Center(
//                   child: IconButton(
//                       onPressed: () {
//                         widget.update
//                             ? Navigator.pop(context)
//                             : AlertBox().alertDialog(context, "hurlde?",
//                                 () async {
//                                 checkHurdle();
//                                 final SharedPreferences prefs = await _prefs;
//                                 await prefs.remove('HurdleRoute');
//                                 await prefs.remove('hurdleName');
//                                 await prefs.remove('NameHurdle');
//                                 await prefs.remove('hurdleStatement');
//                                 await prefs.remove('hurdleId');
//                                 await prefs.remove('selected_goals');
//                                 await prefs.remove("hurdle_selected");
//                               });

//                         // showAnimatedDialog(
//                         //     animationType: DialogTransitionType.fadeScale,
//                         //     curve: Curves.easeInOut,
//                         //     duration: const Duration(seconds: 1),
//                         //     context: context,
//                         //     builder: (BuildContext context) => SizedBox(
//                         //           width: AppDimensions.width10(context) * 27.0,
//                         //           height:
//                         //               AppDimensions.height10(context) * 24.0,
//                         //           child: AlertDialog(
//                         //             shape: RoundedRectangleBorder(
//                         //                 borderRadius: BorderRadius.circular(
//                         //                     AppDimensions.height10(context) *
//                         //                         1.4)),
//                         //             contentPadding: EdgeInsets.zero,
//                         //             actionsPadding: EdgeInsets.zero,
//                         //             titlePadding: EdgeInsets.zero,
//                         //             title: Container(
//                         //               margin: const EdgeInsets.only(
//                         //                   top: 19,
//                         //                   right: 16,
//                         //                   left: 16,
//                         //                   bottom: 2),
//                         //               height:
//                         //                   AppDimensions.height10(context) * 2.2,
//                         //               width:
//                         //                   AppDimensions.width10(context) * 23.8,
//                         //               child: const Text(
//                         //                 "Exit hurdle?",
//                         //                 textAlign: TextAlign.center,
//                         //                 style: TextStyle(
//                         //                   fontSize: 17,
//                         //                   fontWeight: FontWeight.w400,
//                         //                 ),
//                         //               ),
//                         //             ),
//                         //             content: Container(
//                         //               margin: const EdgeInsets.only(
//                         //                   bottom: 19, left: 16, right: 16),
//                         //               height:
//                         //                   AppDimensions.height10(context) * 1.6,
//                         //               width: 238,
//                         //               child: const Text(
//                         //                 "Please select from the options below",
//                         //                 textAlign: TextAlign.center,
//                         //                 style: TextStyle(
//                         //                   fontSize: 13,
//                         //                   fontWeight: FontWeight.w400,
//                         //                 ),
//                         //               ),
//                         //             ),
//                         //             actions: <Widget>[
//                         //               Column(
//                         //                 children: [
//                         //                   // SizedBox(
//                         //                   //   height: AppDimensions.height10(
//                         //                   //           context) *
//                         //                   //       0.1,
//                         //                   //   child: Divider(
//                         //                   //     color: const Color(0XFF3C3C43)
//                         //                   //         .withOpacity(0.29),
//                         //                   //   ),
//                         //                   // ),
//                         //                   // SizedBox(
//                         //                   //   height: 42,
//                         //                   //   width: double.infinity,
//                         //                   //   child: TextButton(
//                         //                   //     onPressed: () async {
//                         //                   //       checkHurdle();
//                         //                   //       final SharedPreferences
//                         //                   //           prefs = await _prefs;
//                         //                   //       await prefs.setString(
//                         //                   //           'HurdleRoute', 'Name');
//                         //                   //
//                         //                   //       await prefs.setString(
//                         //                   //           'NameHurdle',
//                         //                   //           controller.text
//                         //                   //               .toString());
//                         //                   //     },
//                         //                   //     child: const Text(
//                         //                   //       'Exit & save progress',
//                         //                   //       style: TextStyle(
//                         //                   //           color:
//                         //                   //               Color(0xFF007AFF),
//                         //                   //           fontSize: 17,
//                         //                   //           fontFamily: "Laila",
//                         //                   //           fontWeight:
//                         //                   //               FontWeight.w400),
//                         //                   //     ),
//                         //                   //   ),
//                         //                   // ),
//                         //                   SizedBox(
//                         //                     height: AppDimensions.height10(
//                         //                             context) *
//                         //                         0.1,
//                         //                     child: Divider(
//                         //                       color: const Color(0XFF3C3C43)
//                         //                           .withOpacity(0.29),
//                         //                     ),
//                         //                   ),
//                         //                   SizedBox(
//                         //                     height: 44,
//                         //                     width: double.infinity,
//                         //                     child: TextButton(
//                         //                       onPressed: () async {
//                         //                         checkHurdle();
//                         //                         final SharedPreferences prefs =
//                         //                             await _prefs;
//                         //                         await prefs
//                         //                             .remove('HurdleRoute');
//                         //                         await prefs
//                         //                             .remove('hurdleName');
//                         //                         await prefs
//                         //                             .remove('NameHurdle');
//                         //                         await prefs
//                         //                             .remove('hurdleStatement');
//                         //                         await prefs.remove('hurdleId');
//                         //                         await prefs
//                         //                             .remove('selected_goals');
//                         //                         await prefs
//                         //                             .remove("hurdle_selected");
//                         //                       },
//                         //                       child: const Text(
//                         //                         'Exit & delete progress',
//                         //                         style: TextStyle(
//                         //                             fontSize: 17,
//                         //                             fontFamily: "Laila",
//                         //                             fontWeight: FontWeight.w400,
//                         //                             color: Color(0xFF007AFF)),
//                         //                       ),
//                         //                     ),
//                         //                   ),
//                         //                   SizedBox(
//                         //                     height: AppDimensions.height10(
//                         //                             context) *
//                         //                         0.1,
//                         //                     child: Divider(
//                         //                       color: const Color(0XFF3C3C43)
//                         //                           .withOpacity(0.29),
//                         //                     ),
//                         //                   ),
//                         //                   Container(
//                         //                     height: 42,
//                         //                     width: double.infinity,
//                         //                     margin: EdgeInsets.only(
//                         //                         bottom: AppDimensions.height10(
//                         //                                 context) *
//                         //                             1.0),
//                         //                     child: TextButton(
//                         //                       onPressed: () {
//                         //                         Navigator.pop(context);
//                         //                       },
//                         //                       child: const Text(
//                         //                         'Cancel exit',
//                         //                         style: TextStyle(
//                         //                             color: Color(0xFF007AFF),
//                         //                             fontSize: 17,
//                         //                             fontFamily: "Laila",
//                         //                             fontWeight:
//                         //                                 FontWeight.w400),
//                         //                       ),
//                         //                     ),
//                         //                   ),
//                         //                 ],
//                         //               ),
//                         //             ],
//                         //           ),
//                         //         ));
//                       },
//                       icon: Image.asset(
//                         'assets/images/Close.webp',
//                         // width: AppDimensions.width10(context) * 2.6,
//                         height: AppDimensions.height10(context) * 2.6,
//                         fit: BoxFit.contain,
//                       )),
//                 )
//               ]),
//           extendBodyBehindAppBar: true,
//           body: Stack(children: [
//             Container(
//               width: double.infinity,
//               height: double.infinity,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image:
//                           AssetImage('assets/images/practicebackground.webp'),
//                       fit: BoxFit.cover)),
//               child: loading == false
//                   ? SingleChildScrollView(
//                       //    reverse: true,
//                       physics: const ClampingScrollPhysics(),
//                       child: Column(
//                           //  mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             MediaQuery.of(context).viewInsets.bottom == 0
//                                 ? SizedBox(
//                                     height:
//                                         AppDimensions.height10(context) * 18.0,
//                                   )
//                                 : SizedBox(
//                                     height:
//                                         AppDimensions.height10(context) * 11.0,
//                                   ),
//                             SizedBox(
//                               width: AppDimensions.width10(context) * 34.3,

//                               ///    height: AppDimensions.height10(context) * 9.3,
//                               child: GradientText(
//                                 AppText().captureHurdle3Body,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontFamily: 'Laila',
//                                   fontSize: AppDimensions.font10(context) * 2.8,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                                 colors: const [
//                                   Color(0xffFA9934),
//                                   Color(0xffEDD15E)
//                                 ],
//                               ),
//                             ),
//                             MediaQuery.of(context).viewInsets.bottom == 0
//                                 ? SizedBox(
//                                     height:
//                                         AppDimensions.height10(context) * 6.877,
//                                   )
//                                 : SizedBox(
//                                     height:
//                                         AppDimensions.height10(context) * 3.177,
//                                   ),
//                             Container(
//                               width: AppDimensions.width10(context) * 13.9,
//                               height: AppDimensions.height10(context) * 13.9,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal:
//                                       AppDimensions.height10(context) * 0.5),
//                               decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   image: DecorationImage(
//                                       image: AssetImage(
//                                           'assets/images/black_hole.webp'))),
//                               child: Center(
//                                 child: Text(
//                                   widget.update
//                                       ? hurdlesList[hurdleCat]['hurdleName']
//                                           .toString()
//                                       : hurdleName.toString(),
//                                   maxLines: 2,
//                                   textAlign: TextAlign.center,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize:
//                                           AppDimensions.font10(context) * 2,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                             MediaQuery.of(context).viewInsets.bottom == 0
//                                 ? SizedBox(
//                                     height:
//                                         AppDimensions.height10(context) * 5.9,
//                                   )
//                                 : SizedBox(
//                                     height:
//                                         AppDimensions.height10(context) * 4.1,
//                                   ),

//                             HurdleTextField(
//                               Focus: _focusNode,
//                               text: 'Enter Name',
//                               hintText: 'Enter Name',
//                               charCount: '80',
//                               charlength: 80,
//                               controller: controller,
//                               hintTextColor: const Color(0xff828282),
//                             ),

//                             // Column(
//                             //   children: [
//                             //     Container(
//                             //         width:
//                             //             AppDimensions.width10(context) * 36.0,
//                             //         //height: AppDimensions.height10(context) * 8.0,
//                             //         decoration: BoxDecoration(
//                             //             borderRadius: BorderRadius.circular(
//                             //                 AppDimensions.height10(context) *
//                             //                     2.0),
//                             //             color: Colors.white),
//                             //         child: Column(
//                             //           //                  mainAxisAlignment: MainAxisAlignment.center,
//                             //           children: [
//                             //             Align(
//                             //               alignment: Alignment.centerLeft,
//                             //               child: Container(
//                             //                 width:
//                             //                     AppDimensions.width10(context) *
//                             //                         8.0,
//                             //                 height: AppDimensions.height10(
//                             //                         context) *
//                             //                     2.0,
//                             //                 margin: EdgeInsets.only(
//                             //                     left: MediaQuery.of(context)
//                             //                                 .size
//                             //                                 .height <
//                             //                             690
//                             //                         ? AppDimensions.width10(
//                             //                                 context) *
//                             //                             1.0
//                             //                         : AppDimensions.width10(
//                             //                                 context) *
//                             //                             1.5,
//                             //                     // right: AppDimensions.width10(
//                             //                     //         context) *
//                             //                     //     25.0,
//                             //                     top: AppDimensions.height10(
//                             //                             context) *
//                             //                         1.3),
//                             //                 child: Center(
//                             //                   child: Text(
//                             //                     'Enter Name',
//                             //                     style: TextStyle(
//                             //                         fontSize:
//                             //                             AppDimensions.font10(
//                             //                                     context) *
//                             //                                 1.3,
//                             //                         fontWeight:
//                             //                             FontWeight.w500),
//                             //                   ),
//                             //                 ),
//                             //               ),
//                             //             ),
//                             //             Container(
//                             //               margin: EdgeInsets.only(
//                             //                 left: AppDimensions.height10(
//                             //                         context) *
//                             //                     2.1,
//                             //               ),
//                             //               // height:
//                             //               //     AppDimensions.height10(context) * 4.4,
//                             //               //width:   AppDimensions.height10(context)(context)* 30.5,
//                             //               child: Center(
//                             //                 child: TextFormField(
//                             //                   maxLength: 80,
//                             //                   textCapitalization:
//                             //                       TextCapitalization.sentences,
//                             //                   controller: controller,
//                             //                   textAlignVertical:
//                             //                       TextAlignVertical.top,
//                             //                   maxLines: null,
//                             //                   onTap: () {
//                             //                     // setState(() {
//                             //                     //   margin_state = false;
//                             //                     // });
//                             //                   },
//                             //                   scrollPadding: EdgeInsets.zero,
//                             //                   onChanged: (value) {
//                             //                     setState(() {
//                             //                       buttonState = true;
//                             //                     });
//                             //                   },
//                             //                   style: TextStyle(
//                             //                       fontFamily: 'Laila',
//                             //                       decoration: TextDecoration
//                             //                           .none,
//                             //                       decorationThickness: 0,
//                             //                       height:
//                             //                           AppDimensions.height10(
//                             //                                   context) *
//                             //                               0.15,
//                             //                       fontSize:
//                             //                           AppDimensions.font10(
//                             //                                   context) *
//                             //                               2.4,
//                             //                       fontWeight: FontWeight.w600,
//                             //                       color:
//                             //                           const Color(0xffB353C9)),
//                             //                   decoration: InputDecoration(
//                             //                       isCollapsed: true,
//                             //                       // counterText: "",
//                             //                       // counterStyle: TextStyle(
//                             //                       //   height: double.minPositive,
//                             //                       // ),
//                             //                       contentPadding:
//                             //                           EdgeInsets.only(
//                             //                         right:
//                             //                             AppDimensions.width10(
//                             //                                 context),
//                             //                       ),
//                             //                       hintText: 'Enter Name',
//                             //                       hintStyle: TextStyle(
//                             //                           fontFamily: 'Laila',
//                             //                           fontSize:
//                             //                               AppDimensions.font10(
//                             //                                       context) *
//                             //                                   2.4,
//                             //                           fontWeight:
//                             //                               FontWeight.w600,
//                             //                           color: const Color(
//                             //                               0xff828282)),
//                             //                       focusedBorder:
//                             //                           const OutlineInputBorder(
//                             //                               borderSide: BorderSide(
//                             //                                   color: Colors
//                             //                                       .transparent)),
//                             //                       enabledBorder:
//                             //                           const OutlineInputBorder(
//                             //                               borderSide: BorderSide(
//                             //                                   color: Colors
//                             //                                       .transparent))),
//                             //                 ),
//                             //               ),
//                             //             ),
//                             //           ],
//                             //         )),
//                             //     Container(
//                             //       width: AppDimensions.width10(context) * 12.3,
//                             //       height: AppDimensions.height10(context) * 2.0,
//                             //       margin: EdgeInsets.only(
//                             //           left:
//                             //               AppDimensions.width10(context) * 3.1,
//                             //           right:
//                             //               AppDimensions.width10(context) * 26.0,
//                             //           top: AppDimensions.height10(context) *
//                             //               1.0),
//                             //       child: Row(
//                             //         children: [
//                             //           Text(
//                             //             'Character count: ',
//                             //             textAlign: TextAlign.center,
//                             //             style: TextStyle(
//                             //                 fontSize:
//                             //                     AppDimensions.font10(context) *
//                             //                         1.3,
//                             //                 fontWeight: FontWeight.w400,
//                             //                 color: Colors.white),
//                             //           ),
//                             //           Text(
//                             //             '80',
//                             //             textAlign: TextAlign.center,
//                             //             style: TextStyle(
//                             //                 fontSize:
//                             //                     AppDimensions.font10(context) *
//                             //                         1.3,
//                             //                 fontWeight: FontWeight.w700,
//                             //                 color: Colors.white),
//                             //           ),
//                             //         ],
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),

//                             MediaQuery.of(context).viewInsets.bottom == 0
//                                 ? SizedBox(
//                                     height:
//                                         AppDimensions.height10(context) * 22,
//                                   )
//                                 : SizedBox(
//                                     height:
//                                         AppDimensions.height10(context) * 2.0),
//                             ValueListenableBuilder<TextEditingValue>(
//                                 valueListenable: controller,
//                                 builder: (context, value, child) {
//                                   return AnimatedScaleButton(
//                                     onTap: () async {
//                                       if (widget.update == true &&
//                                           controller.text.isNotEmpty) {
//                                         Hurdles().updateHurdle('hurdleName',
//                                             controller.text.toString());
//                                         Navigator.push(
//                                             context,
//                                             FadePageRoute(
//                                                 page: hurdle_statement(
//                                               update: widget.update,
//                                             )));
//                                       } else {
//                                         final SharedPreferences prefs =
//                                             await _prefs;
//                                         await prefs.setString('NameHurdle',
//                                             controller.text.toString());
//                                         if (controller.text.isNotEmpty) {
//                                           Navigator.push(
//                                               context,
//                                               FadePageRoute(
//                                                   page: hurdle_statement(
//                                                 update: widget.update,
//                                               )));
//                                         }
//                                       }
//                                     },
//                                     child: Container(
//                                         width: AppDimensions.width10(context) *
//                                             31.3,
//                                         height:
//                                             AppDimensions.height10(context) *
//                                                 5.2,
//                                         margin: EdgeInsets.only(
//                                             bottom: MediaQuery.of(context)
//                                                         .viewInsets
//                                                         .bottom ==
//                                                     0
//                                                 ? AppDimensions.height10(
//                                                         context) *
//                                                     2.6
//                                                 : AppDimensions.height10(
//                                                         context) *
//                                                     1.0),
//                                         decoration: BoxDecoration(
//                                           gradient: controller.text.isNotEmpty
//                                               ? const LinearGradient(
//                                                   begin: Alignment.topCenter,
//                                                   end: Alignment.bottomCenter,
//                                                   colors: [
//                                                     Color(0xffFCC10D),
//                                                     Color(0xffFDA210),
//                                                   ],
//                                                 )
//                                               : LinearGradient(
//                                                   begin: Alignment.topCenter,
//                                                   end: Alignment.bottomCenter,
//                                                   colors: [
//                                                     const Color(0xff282828)
//                                                         .withOpacity(0.5),
//                                                     const Color(0xff282828)
//                                                         .withOpacity(0.5),
//                                                   ],
//                                                 ),
//                                           borderRadius: BorderRadius.circular(
//                                               AppDimensions.height10(context) *
//                                                   5.0),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             widget.update
//                                                 ? AppText().updateSumm
//                                                 : AppText().nextButton,
//                                             style: TextStyle(
//                                                 color: controller
//                                                         .text.isNotEmpty
//                                                     ? const Color(0xFFFFFFFF)
//                                                     : const Color(0xFFFFFFFF)
//                                                         .withOpacity(0.7),
//                                                 fontSize:
//                                                     UpdatedDimensions.font10(
//                                                             context) *
//                                                         2,
//                                                 fontWeight: FontWeight.w600,
//                                                 fontFamily: 'Laila'),
//                                           ),
//                                         )),
//                                   );
//                                 }),
//                             // MediaQuery.of(context).viewInsets.bottom == 0
//                             //     ? Container(
//                             //         width:
//                             //             AppDimensions.width10(context) * 17.0,
//                             //         height:
//                             //             AppDimensions.height10(context) * 0.5,
//                             //         margin: EdgeInsets.only(
//                             //             bottom:
//                             //                 AppDimensions.height10(context) *
//                             //                     1.0),
//                             //         decoration: BoxDecoration(
//                             //             borderRadius: BorderRadius.circular(
//                             //                 AppDimensions.height10(context) *
//                             //                     2.0),
//                             //             color: const Color(0xFFFFFFFF)
//                             //                 .withOpacity(0.3)),
//                             //       )
//                             //     : SizedBox(
//                             //         height: AppDimensions.height10(context) * 0,
//                             //       ),
//                             Padding(
//                                 padding: EdgeInsets.only(
//                                     bottom: MediaQuery.of(context)
//                                         .viewInsets
//                                         .bottom))
//                           ]),
//                     )
//                   : const Center(
//                       child: SpinKitFadingCircle(
//                         color: Color(0xFFB1B8FF),
//                         size: 80,
//                       ),
//                     ),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdle_statement.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/widgets/hurdleTextfield.dart';
import 'package:potenic_app/Widgets/alertbox.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'capture_hurdle_select_hurdle.dart';
import 'splash_hurdles.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class hurdle_name extends StatefulWidget {
  final bool update;
  const hurdle_name({super.key, required this.update});

  @override
  State<hurdle_name> createState() => _hurdle_nameState();
}

class _hurdle_nameState extends State<hurdle_name>
    with TickerProviderStateMixin {
  bool buttonState = false;
  var hurdleName;
  TextEditingController controller = TextEditingController();
  var hurdlesSummary;
  var hurdlesList;
  int? hurdleCat;
  bool loading = true;
  bool isKeyboardVisible = false;
  var name;
  late StreamSubscription<bool> keyboardSubscription;

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
          controller.text = response['hurdle']['hurdleName'];
          hurdleCat = response['hurdle']['hurdleId'];
          name = response['hurdle']['hurdle']['hurdleName'];
        });
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {});
  }

  void _fetchHurdle() async {
    Hurdles().getAllHurdles().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesList = response['hurdle'];
        });
        _fetchHurdleSummary();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {});
  }

  void _getHurdleName() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      hurdleName = prefs.getString('hurdleName').toString().isEmpty
          ? ""
          : prefs.getString('hurdleName');
    });
  }

  void _getName() async {
    final SharedPreferences prefs = await _prefs;
    var name;
    setState(() {
      name = prefs.getString('NameHurdle').toString().isEmpty
          ? ''
          : prefs.getString('NameHurdle');
    });
    if (name != '' && name != null) {
      controller.text = name;
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _getName();
  //   if (widget.update == false) {
  //     _getHurdleName();
  //     setState(() {
  //       loading = false;
  //     });
  //   } else {
  //     _fetchHurdle();
  //   }
  // }
  // Future<bool> _onWillPop() async {
  //   if (_focusNode.hasFocus) {
  //     setState(() {
  //       FocusScope.of(context).unfocus();
  //     }); // Unfocus the TextField if it has focus
  //     return false; // Prevent default back navigation
  //   }
  //   return true; // Allow back navigation if TextField is unfocused
  // }

  late AnimationController _controller;

  late Animation<Offset> _offsetAnimation;

  final FocusNode _focusNode = FocusNode();
  late Animation<double> _heightAnimation;
  bool hideWidgets = true;
  late AnimationController othercontrollers;
  late Animation<Offset> otherwidgets;

  @override
  void initState() {
    othercontrollers =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
        } else if (status == AnimationStatus.reverse) {
          hideWidgets = true;
        }
      });

    otherwidgets = Tween<Offset>(
      begin: const Offset(0, 0), // initial position
      end: const Offset(0, -4), // target offset for moving upward
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0), // initial position
      end: const Offset(0, -1.2), // target offset for moving upward
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _heightAnimation = Tween<double>(
      begin: 0.0,
      end: 190.0, // Target height in pixels when expanded
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // othercontrollers =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    // otherwidgets = Tween<Offset>(
    //   begin: const Offset(0, 0), // initial position
    //   end: const Offset(0, -4), // target offset for moving upward
    // ).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // ));

    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus) {
    //     _controller.forward(); // Animate upward when focused
    //     hideWidgets = false;
    //   } else {
    //     _controller.reverse(); // Animate back down when unfocused
    //     hideWidgets = true;
    //   }
    // });

    keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        isKeyboardVisible = visible;
        if (isKeyboardVisible == false) {
          _animateReverse();
        }
      });
    });

    _getName();
    if (widget.update == false) {
      _getHurdleName();
      setState(() {
        loading = false;
      });
    } else {
      _fetchHurdle();
    }
    super.initState();
    // });
  }

  // funct() {
  //   MediaQuery.of(context).viewInsets.bottom != 0
  //       ? Tween<Offset>(
  //           begin: const Offset(0, 0), // initial position
  //           end: const Offset(0, -0.5), // target offset for moving upward
  //         ).animate(CurvedAnimation(
  //           parent: _controller,
  //           curve: Curves.easeOut,
  //         ))
  //       : Tween<Offset>(
  //           begin: const Offset(0, 0), // initial position
  //           end: const Offset(0, 0), // target offset for moving upward
  //         ).animate(CurvedAnimation(
  //           parent: _controller,
  //           curve: Curves.easeOut,
  //         ));
  // }

  @override
  void dispose() {
    _controller.dispose();
    othercontrollers.dispose();

    _focusNode.dispose();
    controller.dispose;
    super.dispose();
  }

  // _animateForwardAndReverse() async {
  //   _controller.forward();
  //   hideWidgets = false;
  //   await Future.delayed(Duration(milliseconds: 180), () {
  //     FocusScope.of(context).requestFocus(_focusNode);
  //   });
  // }

  // void _animateReverse() {
  //   setState(() {
  //     _controller.reverse();
  //     hideWidgets = true;
  //     // _focusNode.unfocus();
  //   });
  // }
  void _animateForwardAndReverse() {
    _controller.forward();
  }

  void _animateReverse() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        widget.update
            ? Navigator.pop(context)
            : Navigator.pushReplacement(
                context,
                FadePageRouteReverse(
                    page: const select_hurdle(
                  update: false,
                )));
        return Future.value(false);
      },
      child: GestureDetector(
        // onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: widget.update
                  ? Container()
                  : Center(
                      child: Buttons().backButton(
                        context,
                        () {
                          Navigator.pushReplacement(
                              context,
                              FadePageRouteReverse(
                                  page: const select_hurdle(
                                update: false,
                              )));
                        },
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //       Navigator.pushReplacement(
                      //           context,
                      //           FadePageRouteReverse(
                      //               page: const select_hurdle(
                      //             update: false,
                      //           )));
                      //     },
                      //     icon: Image.asset(
                      //       'assets/images/Back.webp',
                      //       //width: AppDimensions.width10(context) * 3.0,
                      //       height: AppDimensions.height10(context) * 3.0,
                      //       fit: BoxFit.contain,
                      //     )),
                    ),
              centerTitle: true,
              title: SizedBox(
                width: AppDimensions.width10(context) * 19.0,
                height: AppDimensions.height10(context) * 2.8,
                child: Row(
                  children: [
                    GradientText(
                      AppText().captureHurdle3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Laila',
                        fontSize: AppDimensions.font10(context) * 2.2,
                        fontWeight: FontWeight.w600,
                      ),
                      colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                    ),
                    GradientText(
                      '/5',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Laila',
                        fontSize: AppDimensions.font10(context) * 2.2,
                        fontWeight: FontWeight.w400,
                      ),
                      colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                    ),
                  ],
                ),
              ),
              actions: [
                Center(
                  child: Buttons().closeButton(context, () {
                    widget.update
                        ? Navigator.pop(context)
                        : AlertBox().alertDialog(context, "hurlde?", () async {
                            checkHurdle();
                            final SharedPreferences prefs = await _prefs;
                            await prefs.remove('HurdleRoute');
                            await prefs.remove('hurdleName');
                            await prefs.remove('NameHurdle');
                            await prefs.remove('hurdleStatement');
                            await prefs.remove('hurdleId');
                            await prefs.remove('selected_goals');
                            await prefs.remove("hurdle_selected");
                          });
                  }),
                  // IconButton(
                  //     onPressed: () {
                  //       widget.update
                  //           ? Navigator.pop(context)
                  //           : AlertBox().alertDialog(context, "hurlde?",
                  //               () async {
                  //               checkHurdle();
                  //               final SharedPreferences prefs = await _prefs;
                  //               await prefs.remove('HurdleRoute');
                  //               await prefs.remove('hurdleName');
                  //               await prefs.remove('NameHurdle');
                  //               await prefs.remove('hurdleStatement');
                  //               await prefs.remove('hurdleId');
                  //               await prefs.remove('selected_goals');
                  //               await prefs.remove("hurdle_selected");
                  //             });
                  //       // showAnimatedDialog(
                  //       //     animationType: DialogTransitionType.fadeScale,
                  //       //     curve: Curves.easeInOut,
                  //       //     duration: const Duration(seconds: 1),
                  //       //     context: context,
                  //       //     builder: (BuildContext context) => SizedBox(
                  //       //           width:
                  //       //               AppDimensions.width10(context) * 27.0,
                  //       //           height: AppDimensions.height10(context) *
                  //       //               24.0,
                  //       //           child: AlertDialog(
                  //       //             shape: RoundedRectangleBorder(
                  //       //                 borderRadius: BorderRadius.circular(
                  //       //                     AppDimensions.height10(
                  //       //                             context) *
                  //       //                         1.4)),
                  //       //             contentPadding: EdgeInsets.zero,
                  //       //             actionsPadding: EdgeInsets.zero,
                  //       //             titlePadding: EdgeInsets.zero,
                  //       //             title: Container(
                  //       //               margin: const EdgeInsets.only(
                  //       //                   top: 19,
                  //       //                   right: 16,
                  //       //                   left: 16,
                  //       //                   bottom: 2),
                  //       //               height:
                  //       //                   AppDimensions.height10(context) *
                  //       //                       2.2,
                  //       //               width:
                  //       //                   AppDimensions.width10(context) *
                  //       //                       23.8,
                  //       //               child: const Text(
                  //       //                 "Exit hurdle?",
                  //       //                 textAlign: TextAlign.center,
                  //       //                 style: TextStyle(
                  //       //                   fontSize: 17,
                  //       //                   fontWeight: FontWeight.w400,
                  //       //                 ),
                  //       //               ),
                  //       //             ),
                  //       //             content: Container(
                  //       //               margin: const EdgeInsets.only(
                  //       //                   bottom: 19, left: 16, right: 16),
                  //       //               height:
                  //       //                   AppDimensions.height10(context) *
                  //       //                       1.6,
                  //       //               width: 238,
                  //       //               child: const Text(
                  //       //                 "Please select from the options below",
                  //       //                 textAlign: TextAlign.center,
                  //       //                 style: TextStyle(
                  //       //                   fontSize: 13,
                  //       //                   fontWeight: FontWeight.w400,
                  //       //                 ),
                  //       //               ),
                  //       //             ),
                  //       //             actions: <Widget>[
                  //       //               Column(
                  //       //                 children: [
                  //       //                   // SizedBox(
                  //       //                   //   height: AppDimensions.height10(
                  //       //                   //           context) *
                  //       //                   //       0.1,
                  //       //                   //   child: Divider(
                  //       //                   //     color: const Color(0XFF3C3C43)
                  //       //                   //         .withOpacity(0.29),
                  //       //                   //   ),
                  //       //                   // ),
                  //       //                   // SizedBox(
                  //       //                   //   height: 42,
                  //       //                   //   width: double.infinity,
                  //       //                   //   child: TextButton(
                  //       //                   //     onPressed: () async {
                  //       //                   //       checkHurdle();
                  //       //                   //       final SharedPreferences
                  //       //                   //           prefs = await _prefs;
                  //       //                   //       await prefs.setString(
                  //       //                   //           'HurdleRoute', 'Name');
                  //       //                   //
                  //       //                   //       await prefs.setString(
                  //       //                   //           'NameHurdle',
                  //       //                   //           controller.text
                  //       //                   //               .toString());
                  //       //                   //     },
                  //       //                   //     child: const Text(
                  //       //                   //       'Exit & save progress',
                  //       //                   //       style: TextStyle(
                  //       //                   //           color:
                  //       //                   //               Color(0xFF007AFF),
                  //       //                   //           fontSize: 17,
                  //       //                   //           fontFamily: "Laila",
                  //       //                   //           fontWeight:
                  //       //                   //               FontWeight.w400),
                  //       //                   //     ),
                  //       //                   //   ),
                  //       //                   // ),
                  //       //                   SizedBox(
                  //       //                     height: AppDimensions.height10(
                  //       //                             context) *
                  //       //                         0.1,
                  //       //                     child: Divider(
                  //       //                       color: const Color(0XFF3C3C43)
                  //       //                           .withOpacity(0.29),
                  //       //                     ),
                  //       //                   ),
                  //       //                   SizedBox(
                  //       //                     height: 44,
                  //       //                     width: double.infinity,
                  //       //                     child: TextButton(
                  //       //                       onPressed: () async {
                  //       //                         checkHurdle();
                  //       //                         final SharedPreferences
                  //       //                             prefs = await _prefs;
                  //       //                         await prefs
                  //       //                             .remove('HurdleRoute');
                  //       //                         await prefs
                  //       //                             .remove('hurdleName');
                  //       //                         await prefs
                  //       //                             .remove('NameHurdle');
                  //       //                         await prefs.remove(
                  //       //                             'hurdleStatement');
                  //       //                         await prefs
                  //       //                             .remove('hurdleId');
                  //       //                         await prefs.remove(
                  //       //                             'selected_goals');
                  //       //                         await prefs.remove(
                  //       //                             "hurdle_selected");
                  //       //                       },
                  //       //                       child: const Text(
                  //       //                         'Exit & delete progress',
                  //       //                         style: TextStyle(
                  //       //                             fontSize: 17,
                  //       //                             fontFamily: "Laila",
                  //       //                             fontWeight:
                  //       //                                 FontWeight.w400,
                  //       //                             color:
                  //       //                                 Color(0xFF007AFF)),
                  //       //                       ),
                  //       //                     ),
                  //       //                   ),
                  //       //                   SizedBox(
                  //       //                     height: AppDimensions.height10(
                  //       //                             context) *
                  //       //                         0.1,
                  //       //                     child: Divider(
                  //       //                       color: const Color(0XFF3C3C43)
                  //       //                           .withOpacity(0.29),
                  //       //                     ),
                  //       //                   ),
                  //       //                   Container(
                  //       //                     height: 42,
                  //       //                     width: double.infinity,
                  //       //                     margin: EdgeInsets.only(
                  //       //                         bottom:
                  //       //                             AppDimensions.height10(
                  //       //                                     context) *
                  //       //                                 1.0),
                  //       //                     child: TextButton(
                  //       //                       onPressed: () {
                  //       //                         Navigator.pop(context);
                  //       //                       },
                  //       //                       child: const Text(
                  //       //                         'Cancel exit',
                  //       //                         style: TextStyle(
                  //       //                             color:
                  //       //                                 Color(0xFF007AFF),
                  //       //                             fontSize: 17,
                  //       //                             fontFamily: "Laila",
                  //       //                             fontWeight:
                  //       //                                 FontWeight.w400),
                  //       //                       ),
                  //       //                     ),
                  //       //                   ),
                  //       //                 ],
                  //       //               ),
                  //       //             ],
                  //       //           ),
                  //       //         ));
                  //     },
                  //     icon: Image.asset(
                  //       'assets/images/Close.webp',
                  //       // width: AppDimensions.width10(context) * 2.6,
                  //       height: AppDimensions.height10(context) * 2.6,
                  //       fit: BoxFit.contain,
                  //     )),
                )
              ]),
          extendBodyBehindAppBar: true,
          // body: InkWell(
          //   onTap: () {
          //     _animateReverse();
          //     // FocusScope.of(context).unfocus();
          //     _focusNode.unfocus();
          //   },
          //   child: Stack(
          //     children: [
          //       Container(
          //         width: double.infinity,
          //         height: double.infinity,
          //         decoration: const BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage(
          //                     'assets/images/practicebackground.webp'),
          //                 fit: BoxFit.cover)),
          //         child: loading == false
          //             ? SingleChildScrollView(
          //                 physics: const ClampingScrollPhysics(),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     SizedBox(
          //                         height: hideWidgets
          //                             ? AppDimensions.height10(context) * 17
          //                             : AppDimensions.height10(context) * 32),
          //                     hideWidgets
          //                         ? AnimatedSwitcher(
          //                             switchInCurve: Curves.easeIn,
          //                             switchOutCurve: Curves.easeInOut,
          //                             duration:
          //                                 const Duration(milliseconds: 500),
          //                             child: SizedBox(
          //                               // width:
          //                               //     AppDimensions.width10(context) * 34.3,
          //                               // height: AppDimensions.height10(context) * 7.3,
          //                               child: GradientText(
          //                                 AppText().captureHurdle3Body,
          //                                 textAlign: TextAlign.center,
          //                                 style: TextStyle(
          //                                   fontFamily: 'Laila',
          //                                   fontSize:
          //                                       AppDimensions.font10(context) *
          //                                           2.8,
          //                                   fontWeight: FontWeight.w700,
          //                                 ),
          //                                 colors: const [
          //                                   Color(0xffFA9934),
          //                                   Color(0xffEDD15E)
          //                                 ],
          //                               ),
          //                             ),
          //                           )
          //                         : const SizedBox(),
          //                     SizedBox(
          //                       height: AppDimensions.height10(context) * 7.877,
          //                     ),
          //                     hideWidgets
          //                         ? AnimatedSwitcher(
          //                             switchInCurve: Curves.easeIn,
          //                             switchOutCurve: Curves.easeInOut,
          //                             duration:
          //                                 const Duration(milliseconds: 500),
          //                             child: Container(
          //                               width: AppDimensions.width10(context) *
          //                                   13.9,
          //                               height:
          //                                   AppDimensions.height10(context) *
          //                                       13.9,
          //                               padding: EdgeInsets.symmetric(
          //                                   horizontal: AppDimensions.height10(
          //                                           context) *
          //                                       1.5),
          //                               decoration: const BoxDecoration(
          //                                   shape: BoxShape.circle,
          //                                   image: DecorationImage(
          //                                       image: AssetImage(
          //                                           'assets/images/black_hole.webp'))),
          //                               child: Center(
          //                                 child: Text(
          //                                   widget.update
          //                                       ? hurdlesList[hurdleCat]
          //                                               ['hurdleName']
          //                                           .toString()
          //                                       : hurdleName.toString(),
          //                                   maxLines: 2,
          //                                   textAlign: TextAlign.center,
          //                                   overflow: TextOverflow.ellipsis,
          //                                   style: TextStyle(
          //                                       color: Colors.white,
          //                                       fontSize: AppDimensions.font10(
          //                                               context) *
          //                                           2,
          //                                       fontWeight: FontWeight.w500),
          //                                 ),
          //                               ),
          //                             ),
          //                           )
          //                         : SizedBox(),
          //                     SizedBox(
          //                       height: AppDimensions.height10(context) * 5.9,
          //                     ),
          //                     SlideTransition(
          //                       position: _offsetAnimation,
          //                       child: HurdleTextField(
          //                         animation: _heightAnimation,
          //                         hide: hideWidgets,
          //                         onTap: () {
          //                           _animateForwardAndReverse();
          //                         },
          //                         Focus: _focusNode,
          //                         text: 'Enter Name',
          //                         hintText: 'Enter Name',
          //                         charCount: '80',
          //                         charlength: 80,
          //                         controller: controller,
          //                         hintTextColor: const Color(0xff828282),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: AppDimensions.height10(context) * 22,
          //                     ),
          //                     ValueListenableBuilder<TextEditingValue>(
          //                       valueListenable: controller,
          //                       builder: (context, value, child) {
          //                         return hideWidgets
          //                             ? AnimatedScaleButton(
          //                                 onTap: () async {
          //                                   if (widget.update == true &&
          //                                       controller.text.isNotEmpty) {
          //                                     Hurdles().updateHurdle(
          //                                         'hurdleName',
          //                                         controller.text.toString());
          //                                     Navigator.push(
          //                                         context,
          //                                         FadePageRoute(
          //                                             page: hurdle_statement(
          //                                           update: widget.update,
          //                                         )));
          //                                   } else {
          //                                     final SharedPreferences prefs =
          //                                         await _prefs;
          //                                     await prefs.setString(
          //                                         'NameHurdle',
          //                                         controller.text.toString());
          //                                     if (controller.text.isNotEmpty) {
          //                                       Navigator.push(
          //                                           context,
          //                                           FadePageRoute(
          //                                               page: hurdle_statement(
          //                                             update: widget.update,
          //                                           )));
          //                                     }
          //                                   }
          //                                 },
          //                                 child: Container(
          //                                   width:
          //                                       AppDimensions.width10(context) *
          //                                           31.3,
          //                                   height: AppDimensions.height10(
          //                                           context) *
          //                                       5.2,
          //                                   margin: EdgeInsets.only(
          //                                       bottom: MediaQuery.of(context)
          //                                                   .viewInsets
          //                                                   .bottom ==
          //                                               0
          //                                           ? AppDimensions.height10(
          //                                                   context) *
          //                                               2.6
          //                                           : AppDimensions.height10(
          //                                                   context) *
          //                                               1.0),
          //                                   decoration: BoxDecoration(
          //                                     gradient: controller
          //                                             .text.isNotEmpty
          //                                         ? const LinearGradient(
          //                                             begin:
          //                                                 Alignment.topCenter,
          //                                             end: Alignment
          //                                                 .bottomCenter,
          //                                             colors: [
          //                                               Color(0xffFCC10D),
          //                                               Color(0xffFDA210),
          //                                             ],
          //                                           )
          //                                         : LinearGradient(
          //                                             begin:
          //                                                 Alignment.topCenter,
          //                                             end: Alignment
          //                                                 .bottomCenter,
          //                                             colors: [
          //                                               const Color(0xff282828)
          //                                                   .withOpacity(0.5),
          //                                               const Color(0xff282828)
          //                                                   .withOpacity(0.5),
          //                                             ],
          //                                           ),
          //                                     borderRadius:
          //                                         BorderRadius.circular(
          //                                             AppDimensions.height10(
          //                                                     context) *
          //                                                 5.0),
          //                                   ),
          //                                   child: Center(
          //                                     child: Text(
          //                                       widget.update
          //                                           ? AppText().updateSumm
          //                                           : AppText().nextButton,
          //                                       style: TextStyle(
          //                                         color: controller
          //                                                 .text.isNotEmpty
          //                                             ? const Color(0xFFFFFFFF)
          //                                             : const Color(0xFFFFFFFF)
          //                                                 .withOpacity(0.7),
          //                                         fontSize:
          //                                             UpdatedDimensions.font10(
          //                                                     context) *
          //                                                 2,
          //                                         fontWeight: FontWeight.w600,
          //                                         fontFamily: 'Laila',
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                               )
          //                             : SizedBox();
          //                       },
          //                     ),
          //                   ],
          //                 ),
          //               )
          //             : const Center(
          //                 child: SpinKitFadingCircle(
          //                   color: Color(0xFFB1B8FF),
          //                   size: 80,
          //                 ),
          //               ),
          //       )
          //     ],
          //   ),
          // ),

          body: InkWell(
            splashColor: Colors.transparent,
            onTap: () async {
              if (isKeyboardVisible == true) {
                print("iskeybaord $isKeyboardVisible");
                _focusNode.unfocus();
                await Future.delayed(Duration(milliseconds: 200));
                _animateReverse();
              } else {
                print("iskrybeaes $isKeyboardVisible");
              }
            },
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/practicebackground.webp'),
                        fit: BoxFit.cover)),
                child: loading == false
                    ? SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // MediaQuery.of(context).viewInsets.bottom == 0
                              //     ? SizedBox(
                              //         height: AppDimensions.height10(context) *
                              //             18.0,
                              //       )
                              //     : SizedBox(
                              //         height: AppDimensions.height10(context) *
                              //             11.0,
                              //       ),
                              SizedBox(
                                height: hideWidgets
                                    ? AppDimensions.height10(context) * 17
                                    : AppDimensions.height10(context) * 32,
                              ),
                              // SizedBox(
                              //     height: hideWidgets
                              //         ? AppDimensions.height10(context) * 18.0
                              //         : AppDimensions.height10(context) * 30.0),
                              // MediaQuery.of(context).viewInsets.bottom > 0
                              //     ? SizedBox(
                              //         height:
                              //             AppDimensions.height10(context) * 11.0,
                              //       )
                              //     : SizedBox(
                              //         height:
                              //             AppDimensions.height10(context) * 18.0,
                              //
                              //   ),
                              hideWidgets
                                  ? SlideTransition(
                                      position: otherwidgets,
                                      child: SizedBox(
                                        width: AppDimensions.width10(context) *
                                            34.3,
                                        // height: AppDimensions.height10(context) * 7.3,
                                        child: GradientText(
                                          AppText().captureHurdle3Body,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Laila',
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    2.8,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          colors: const [
                                            Color(0xffFA9934),
                                            Color(0xffEDD15E)
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              // MediaQuery.of(context).viewInsets.bottom == 0
                              //     ? SizedBox(
                              //         height: AppDimensions.height10(context) *
                              //             3.877,
                              //       )
                              //     : SizedBox(
                              //         height: AppDimensions.height10(context) *
                              //             3.177,
                              //       ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 7.877,
                              ),
                              // MediaQuery.of(context).viewInsets.bottom == 0
                              // SizedBox(
                              //     height: hideWidgets
                              //         ? AppDimensions.height10(context) * 3.877
                              //         : null),
                              hideWidgets
                                  ? SlideTransition(
                                      position: otherwidgets,
                                      child: Container(
                                        width: AppDimensions.width10(context) *
                                            16.5,
                                        height:
                                            AppDimensions.height10(context) *
                                                16.5,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppDimensions.height10(
                                                    context) *
                                                1.5),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/black_hole.webp'))),
                                        child: Center(
                                          child: Text(
                                            widget.update
                                                ? name
                                                : hurdleName.toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    2,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              // MediaQuery.of(context).viewInsets.bottom == 0
                              //     ? SizedBox(
                              //         height:
                              //             AppDimensions.height10(context) * 5.9,
                              //       )
                              //     : SizedBox(
                              //         height:
                              //             AppDimensions.height10(context) * 4.1,
                              //       ),
                              SizedBox(
                                  height:
                                      AppDimensions.height10(context) * 6.608),
                              // SizedBox(
                              //     height: hideWidgets
                              //         ? AppDimensions.height10(context) * 6.608
                              //         : null),

                              SlideTransition(
                                position: _offsetAnimation,
                                child: HurdleTextField(
                                  onEditingComplete: () async {
                                    _focusNode.unfocus();
                                    await Future.delayed(
                                        Duration(milliseconds: 200));
                                    _animateReverse();
                                  },
                                  animation: _heightAnimation,
                                  hide: hideWidgets,
                                  onTap: () async {
                                    setState(() {
                                      hideWidgets = false;
                                    });

                                    _animateForwardAndReverse();
                                  },
                                  Focus: _focusNode,
                                  text: 'Enter Name',
                                  hintText: 'Enter Name',
                                  charCount: '80',
                                  charlength: 80,
                                  controller: controller,
                                  hintTextColor: const Color(0xff828282),
                                ),
                              ),
                              // MediaQuery.of(context).viewInsets.bottom == 0
                              //     ? SizedBox(
                              //         height: AppDimensions.height10(context) *
                              //             24.5,
                              //       )
                              //     : SizedBox(
                              //         height:
                              //             AppDimensions.height10(context) * 3.0,
                              //       ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 18.5,
                              ),
                              // // SizedBox(
                              //     height: hideWidgets
                              //         ? AppDimensions.height10(context) * 20
                              //         : null),
                              ValueListenableBuilder<TextEditingValue>(
                                valueListenable: controller,
                                builder: (context, value, child) {
                                  return hideWidgets
                                      ? AnimatedScaleButton(
                                          onTap: () async {
                                            if (widget.update == true &&
                                                controller.text.isNotEmpty) {
                                              Hurdles().updateHurdle(
                                                  'hurdleName',
                                                  controller.text.toString());
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page: hurdle_statement(
                                                    update: widget.update,
                                                  )));
                                            } else {
                                              final SharedPreferences prefs =
                                                  await _prefs;
                                              await prefs.setString(
                                                  'NameHurdle',
                                                  controller.text.toString());
                                              if (controller.text.isNotEmpty) {
                                                Navigator.push(
                                                    context,
                                                    FadePageRoute(
                                                        page: hurdle_statement(
                                                      update: widget.update,
                                                    )));
                                              }
                                            }
                                          },
                                          child: Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    31.3,
                                            height: AppDimensions.height10(
                                                    context) *
                                                5.2,
                                            margin: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom ==
                                                        0
                                                    ? AppDimensions.height10(
                                                            context) *
                                                        2.6
                                                    : AppDimensions.height10(
                                                            context) *
                                                        1.0),
                                            decoration: BoxDecoration(
                                              gradient: controller
                                                      .text.isNotEmpty
                                                  ? const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color(0xffFCC10D),
                                                        Color(0xffFDA210),
                                                      ],
                                                    )
                                                  : LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        const Color(0xff282828)
                                                            .withOpacity(0.5),
                                                        const Color(0xff282828)
                                                            .withOpacity(0.5),
                                                      ],
                                                    ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppDimensions.height10(
                                                              context) *
                                                          5.0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                widget.update
                                                    ? AppText().updateSumm
                                                    : AppText().nextButton,
                                                style: TextStyle(
                                                  color: controller
                                                          .text.isNotEmpty
                                                      ? const Color(0xFFFFFFFF)
                                                      : const Color(0xFFFFFFFF)
                                                          .withOpacity(0.7),
                                                  fontSize:
                                                      UpdatedDimensions.font10(
                                                              context) *
                                                          2,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Laila',
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox();
                                },
                              ),
                            ]),
                      )
                    : const Center(
                        child: SpinKitFadingCircle(
                          color: Color(0xFFB1B8FF),
                          size: 80,
                        ),
                      ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}


   // ValueListenableBuilder<TextEditingValue>(
                              //     valueListenable: controller,
                              //     builder: (context, value, child) {
                              //       return AnimatedScaleButton(
                              //         onTap: () async {
                              //           if (widget.update == true &&
                              //               controller.text.isNotEmpty) {
                              //             Hurdles().updateHurdle('hurdleName',
                              //                 controller.text.toString());
                              //             Navigator.push(
                              //                 context,
                              //                 FadePageRoute(
                              //                     page: hurdle_statement(
                              //                   update: widget.update,
                              //                 )));
                              //           } else {
                              //             final SharedPreferences prefs =
                              //                 await _prefs;
                              //             await prefs.setString('NameHurdle',
                              //                 controller.text.toString());
                              //             if (controller.text.isNotEmpty) {
                              //               Navigator.push(
                              //                   context,
                              //                   FadePageRoute(
                              //                       page: hurdle_statement(
                              //                     update: widget.update,
                              //                   )));
                              //             }
                              //           }
                              //         },
                              //         child: Container(
                              //             width: AppDimensions.width10(context) *
                              //                 31.3,
                              //             height:
                              //                 AppDimensions.height10(context) *
                              //                     5.2,
                              //             margin: EdgeInsets.only(
                              //                 bottom: MediaQuery.of(context)
                              //                             .viewInsets
                              //                             .bottom ==
                              //                         0
                              //                     ? AppDimensions.height10(
                              //                             context) *
                              //                         2.6
                              //                     : AppDimensions.height10(
                              //                             context) *
                              //                         1.0),
                              //             decoration: BoxDecoration(
                              //               gradient: controller.text.isNotEmpty
                              //                   ? const LinearGradient(
                              //                       begin: Alignment.topCenter,
                              //                       end: Alignment.bottomCenter,
                              //                       colors: [
                              //                         Color(0xffFCC10D),
                              //                         Color(0xffFDA210),
                              //                       ],
                              //                     )
                              //                   : LinearGradient(
                              //                       begin: Alignment.topCenter,
                              //                       end: Alignment.bottomCenter,
                              //                       colors: [
                              //                         const Color(0xff282828)
                              //                             .withOpacity(0.5),
                              //                         const Color(0xff282828)
                              //                             .withOpacity(0.5),
                              //                       ],
                              //                     ),
                              //               borderRadius: BorderRadius.circular(
                              //                   AppDimensions.height10(context) *
                              //                       5.0),
                              //             ),
                              //             child: Center(
                              //               child: Text(
                              //                 widget.update
                              //                     ? AppText().updateSumm
                              //                     : AppText().nextButton,
                              //                 style: TextStyle(
                              //                     color: controller
                              //                             .text.isNotEmpty
                              //                         ? const Color(0xFFFFFFFF)
                              //                         : const Color(0xFFFFFFFF)
                              //                             .withOpacity(0.7),
                              //                     fontSize:
                              //                         UpdatedDimensions.font10(
                              //                                 context) *
                              //                             2,
                              //                     fontWeight: FontWeight.w600,
                              //                     fontFamily: 'Laila'),
                              //               ),
                              //             )),
                              //       );
                              //     }),
                              // MediaQuery.of(context).viewInsets.bottom == 0
                              //     ? Container(
                              //         width:
                              //             AppDimensions.width10(context) * 17.0,
                              //         height:
                              //             AppDimensions.height10(context) * 0.5,
                              //         margin: EdgeInsets.only(
                              //             bottom:
                              //                 AppDimensions.height10(context) *
                              //                     1.0),
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(
                              //                 AppDimensions.height10(context) *
                              //                     2.0),
                              //             color: const Color(0xFFFFFFFF)
                              //                 .withOpacity(0.3)),
                              //       )
                              //     : SizedBox(
                              //         height: AppDimensions.height10(context) * 0,
                              //       ),
                              // Padding(
                              //     padding: EdgeInsets.only(
                              //         bottom: MediaQuery.of(context)
                              //             .viewInsets
                              //             .bottom))












  // Column(
                              //   children: [
                              //     Container(
                              //         width:
                              //             AppDimensions.width10(context) * 36.0,
                              //         //height: AppDimensions.height10(context) * 8.0,
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(
                              //                 AppDimensions.height10(context) *
                              //                     2.0),
                              //             color: Colors.white),
                              //         child: Column(
                              //           //                  mainAxisAlignment: MainAxisAlignment.center,
                              //           children: [
                              //             Align(
                              //               alignment: Alignment.centerLeft,
                              //               child: Container(
                              //                 width:
                              //                     AppDimensions.width10(context) *
                              //                         8.0,
                              //                 height: AppDimensions.height10(
                              //                         context) *
                              //                     2.0,
                              //                 margin: EdgeInsets.only(
                              //                     left: MediaQuery.of(context)
                              //                                 .size
                              //                                 .height <
                              //                             690
                              //                         ? AppDimensions.width10(
                              //                                 context) *
                              //                             1.0
                              //                         : AppDimensions.width10(
                              //                                 context) *
                              //                             1.5,
                              //                     // right: AppDimensions.width10(
                              //                     //         context) *
                              //                     //     25.0,
                              //                     top: AppDimensions.height10(
                              //                             context) *
                              //                         1.3),
                              //                 child: Center(
                              //                   child: Text(
                              //                     'Enter Name',
                              //                     style: TextStyle(
                              //                         fontSize:
                              //                             AppDimensions.font10(
                              //                                     context) *
                              //                                 1.3,
                              //                         fontWeight:
                              //                             FontWeight.w500),
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //             Container(
                              //               margin: EdgeInsets.only(
                              //                 left: AppDimensions.height10(
                              //                         context) *
                              //                     2.1,
                              //               ),
                              //               // height:
                              //               //     AppDimensions.height10(context) * 4.4,
                              //               //width:   AppDimensions.height10(context)(context)* 30.5,
                              //               child: Center(
                              //                 child: TextFormField(
                              //                   maxLength: 80,
                              //                   textCapitalization:
                              //                       TextCapitalization.sentences,
                              //                   controller: controller,
                              //                   textAlignVertical:
                              //                       TextAlignVertical.top,
                              //                   maxLines: null,
                              //                   onTap: () {
                              //                     // setState(() {
                              //                     //   margin_state = false;
                              //                     // });
                              //                   },
                              //                   scrollPadding: EdgeInsets.zero,
                              //                   onChanged: (value) {
                              //                     setState(() {
                              //                       buttonState = true;
                              //                     });
                              //                   },
                              //                   style: TextStyle(
                              //                       fontFamily: 'Laila',
                              //                       decoration: TextDecoration
                              //                           .none,
                              //                       decorationThickness: 0,
                              //                       height:
                              //                           AppDimensions.height10(
                              //                                   context) *
                              //                               0.15,
                              //                       fontSize:
                              //                           AppDimensions.font10(
                              //                                   context) *
                              //                               2.4,
                              //                       fontWeight: FontWeight.w600,
                              //                       color:
                              //                           const Color(0xffB353C9)),
                              //                   decoration: InputDecoration(
                              //                       isCollapsed: true,
                              //                       // counterText: "",
                              //                       // counterStyle: TextStyle(
                              //                       //   height: double.minPositive,
                              //                       // ),
                              //                       contentPadding:
                              //                           EdgeInsets.only(
                              //                         right:
                              //                             AppDimensions.width10(
                              //                                 context),
                              //                       ),
                              //                       hintText: 'Enter Name',
                              //                       hintStyle: TextStyle(
                              //                           fontFamily: 'Laila',
                              //                           fontSize:
                              //                               AppDimensions.font10(
                              //                                       context) *
                              //                                   2.4,
                              //                           fontWeight:
                              //                               FontWeight.w600,
                              //                           color: const Color(
                              //                               0xff828282)),
                              //                       focusedBorder:
                              //                           const OutlineInputBorder(
                              //                               borderSide: BorderSide(
                              //                                   color: Colors
                              //                                       .transparent)),
                              //                       enabledBorder:
                              //                           const OutlineInputBorder(
                              //                               borderSide: BorderSide(
                              //                                   color: Colors
                              //                                       .transparent))),
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         )),
                              //     Container(
                              //       width: AppDimensions.width10(context) * 12.3,
                              //       height: AppDimensions.height10(context) * 2.0,
                              //       margin: EdgeInsets.only(
                              //           left:
                              //               AppDimensions.width10(context) * 3.1,
                              //           right:
                              //               AppDimensions.width10(context) * 26.0,
                              //           top: AppDimensions.height10(context) *
                              //               1.0),
                              //       child: Row(
                              //         children: [
                              //           Text(
                              //             'Character count: ',
                              //             textAlign: TextAlign.center,
                              //             style: TextStyle(
                              //                 fontSize:
                              //                     AppDimensions.font10(context) *
                              //                         1.3,
                              //                 fontWeight: FontWeight.w400,
                              //                 color: Colors.white),
                              //           ),
                              //           Text(
                              //             '80',
                              //             textAlign: TextAlign.center,
                              //             style: TextStyle(
                              //                 fontSize:
                              //                     AppDimensions.font10(context) *
                              //                         1.3,
                              //                 fontWeight: FontWeight.w700,
                              //                 color: Colors.white),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),

                          