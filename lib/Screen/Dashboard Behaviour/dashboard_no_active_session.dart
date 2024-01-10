// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';

// import '../../Widgets/bottom_navigation.dart';
// import '../../utils/app_dimensions.dart';

// class no_active_session extends StatelessWidget {
//   const no_active_session({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:
//             AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
//           Row(
//             children: [
//               IconButton(
//                   onPressed: () {},
//                   icon: Image.asset(
//                     'assets/images/Asset 10 2.webp',
//                     // height: 40,
//                     // width: 40,
//                     fit: BoxFit.contain,
//                   )),
//               IconButton(
//                   onPressed: () {},
//                   icon: Image.asset(
//                     'assets/images/Add goal.webp',
//                     height: AppDimensions.height10(context) * 2.0,
//                     width: AppDimensions.width10(context) * 2.1,
//                   )),
//               IconButton(
//                   onPressed: () {},
//                   icon: Image.asset(
//                     'assets/images/calendar_month_black_24dp 1.webp',
//                     height: AppDimensions.height10(context) * 2.4,
//                     width: AppDimensions.width10(context) * 2.4,
//                   )),
//             ],
//           )
//         ]),
//         extendBodyBehindAppBar: true,
//         extendBody: true,
//         bottomNavigationBar: Navigation_Bar(
//           bg_colored: true,
//           membership: true,
//           cancel: false,
//           trial: false,
//         ),
//         body: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/Mask Group.webp'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             width: double.infinity,
//             height: AppDimensions.height10(context) * 78.2,
//             child: SizedBox(
//                 width: double.infinity,
//                 height: AppDimensions.height10(context) * 19.2,
//                 child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Column(children: [
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: SizedBox(
//                           height: AppDimensions.height10(context) * 19.2,
//                           width: AppDimensions.width10(context) * 45.7,
//                           child: Stack(
//                             children: [
//                               Align(
//                                 alignment: Alignment(-1, 1),
//                                 child: Container(
//                                   height: AppDimensions.height10(context) * 7.9,
//                                   width: AppDimensions.width10(context) * 7.9,
//                                   margin: EdgeInsets.only(
//                                       top: AppDimensions.height10(context) *
//                                           8.4),
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                           width: 3, color: Colors.white),
//                                       color: Colors.transparent),
//                                   child: Container(
//                                       margin: EdgeInsets.only(
//                                           top: AppDimensions.height10(context) *
//                                               1.152),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           const Text(
//                                             'MON',
//                                             style: TextStyle(
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: Colors.white),
//                                           ),
//                                           const Text(
//                                             '02.06',
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                           Container(
//                                             height: 27,
//                                             width: 27,
//                                             margin: const EdgeInsets.only(
//                                                 top: 3.32),
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               border: Border.all(
//                                                   width: 1,
//                                                   color: Colors.white),
//                                             ),
//                                             child: Container(
//                                                 width: 17,
//                                                 height: 15,
//                                                 margin: const EdgeInsets.only(
//                                                     top: 3.32),
//                                                 // margin: const EdgeInsets.only(left: 1),
//                                                 child: const Center(
//                                                   child: Text(
//                                                     '0/2',
//                                                     style: TextStyle(
//                                                         fontSize: 10,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         color: Colors.white),
//                                                   ),
//                                                 )),
//                                           )
//                                         ],
//                                       )),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment(0, 0),
//                                 child: Container(
//                                   width: 83,
//                                   height: 83,
//                                   //  margin: EdgeInsets.only(right: 121, left: 121),
//                                   padding: EdgeInsets.all(4),
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                           width: 1, color: Colors.white),
//                                       color: Colors.transparent),
//                                   child: Container(
//                                     height: 79,
//                                     width: 79,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                             width: 3, color: Colors.white),
//                                         color: Colors.transparent),
//                                     child: Stack(children: [
//                                       Align(
//                                         alignment: Alignment(0, 0),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             const Text(
//                                               'TUE',
//                                               style: TextStyle(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.white),
//                                             ),
//                                             const Text(
//                                               '02.07',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.w400),
//                                             ),
//                                             Container(
//                                                 height: 25,
//                                                 width: 25,
//                                                 margin: const EdgeInsets.only(
//                                                     top: 3.32),
//                                                 decoration: const BoxDecoration(
//                                                   shape: BoxShape.circle,
//                                                 ),
//                                                 child: DottedBorder(
//                                                   borderType: BorderType.Circle,
//                                                   color: Colors.white,
//                                                   child: const Center(
//                                                     child: Text(
//                                                       '0/0',
//                                                       style: TextStyle(
//                                                           fontSize: 10,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: Colors.white),
//                                                     ),
//                                                   ),
//                                                 )),
//                                           ],
//                                         ),
//                                       ),
//                                     ]),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment(1, 1),
//                                 child: Container(
//                                     height: 79,
//                                     width: 79,
//                                     margin: const EdgeInsets.only(
//                                       top: 84,
//                                     ),
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                             width: 3, color: Colors.white),
//                                         color: Colors.transparent),
//                                     child: Container(
//                                         margin:
//                                             const EdgeInsets.only(top: 11.52),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             const Text(
//                                               'MON',
//                                               style: TextStyle(
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.white),
//                                             ),
//                                             const Text(
//                                               '03.07',
//                                               style: TextStyle(
//                                                   color: Colors.white),
//                                             ),
//                                             Container(
//                                               height: 27,
//                                               width: 27,
//                                               margin: const EdgeInsets.only(
//                                                   top: 3.32),
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 border: Border.all(
//                                                     width: 1,
//                                                     color: Colors.white),
//                                               ),
//                                               child: Container(
//                                                   width: 17,
//                                                   height: 15,
//                                                   margin: const EdgeInsets.only(
//                                                       top: 3.32),
//                                                   // margin: const EdgeInsets.only(left: 1),
//                                                   child: const Center(
//                                                     child: Text(
//                                                       '0/2',
//                                                       style: TextStyle(
//                                                           fontSize: 10,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: Colors.white),
//                                                     ),
//                                                   )),
//                                             )
//                                           ],
//                                         ))),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         // width: 343,
//                         // height: 49,
//                         margin: EdgeInsets.only(
//                             top: AppDimensions.height10(context) * 14.9,
//                             bottom: AppDimensions.height10(context) * 2.2),
//                         child: Center(
//                           child: Text(
//                             'All your practices are\ninactive',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: AppDimensions.font10(context) * 3.0,
//                                 fontWeight: FontWeight.w700,
//                                 fontFamily: 'Laila'),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         // width: 269,
//                         // height: 58,
//                         margin: EdgeInsets.only(
//                             top: AppDimensions.height10(context) * 3.2),
//                         child: Center(
//                           child: Text(
//                             "You don’t have any active or\nplanned practices. Please view\nyour current goals to manage\nand update your practices.",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: 'Laila',
//                                 fontSize: AppDimensions.font10(context) * 1.8,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                       Container(
//                           height: AppDimensions.height10(context) * 5.0,
//                           width: AppDimensions.width10(context) * 24.3,
//                           margin: EdgeInsets.only(
//                               top: AppDimensions.height10(context) * 4.6),
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 colors: [
//                                   Color(0xffFCC10D),
//                                   Color(0xffFDA210),
//                                 ]),
//                             borderRadius: BorderRadius.circular(
//                                 AppDimensions.height10(context) * 5.0),
//                           ),
//                           child: TextButton(
//                             onPressed: () {},
//                             child: Text(
//                               'View all goals',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: AppDimensions.font10(context) * 1.6,
//                                   fontWeight: FontWeight.w600,
//                                   fontFamily: 'poppins'),
//                             ),
//                           ))
//                     ])))));
//   }
// }
