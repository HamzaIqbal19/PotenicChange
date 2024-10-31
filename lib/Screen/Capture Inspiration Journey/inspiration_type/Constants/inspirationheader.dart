// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:potenic_app/API/InpirationApi.dart';
// import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_landing.dart';
// import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_type.dart';
// import 'package:potenic_app/Widgets/animatedButton.dart';
// import 'package:potenic_app/Widgets/fading.dart';
// import 'package:potenic_app/utils/app_dimensions.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class InspirationHeader extends StatefulWidget implements PreferredSizeWidget {
//   final TextEditingController link;
//   final TextEditingController statement;
//   final TextEditingController hastags;
//   final TextEditingController author;
//   final TextEditingController title;
//   bool btEnable;
//   final List<String>? tagList;
//   final List? selectedGoals;
//   final formKey;
//   final context;
//   final String text;

//   InspirationHeader(
//       {super.key,
//       required this.link,
//       required this.statement,
//       required this.hastags,
//       required this.author,
//       required this.title,
//       this.tagList,
//       this.selectedGoals,
//       this.formKey,
//       required this.btEnable,
//       this.context,
//       required this.text});

//   @override
//   State<InspirationHeader> createState() => _InspirationHeaderState();

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize =>
//       Size.fromHeight(AppDimensions.height10(context) * 5.1);
// }

// class _InspirationHeaderState extends State<InspirationHeader> {
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         elevation: 0,
//         backgroundColor: const Color(0xFFC4C4C4),
//         automaticallyImplyLeading: false,
//         toolbarHeight: AppDimensions.height10(context) * 5.1,
//         flexibleSpace: Container(
//           padding: EdgeInsets.symmetric(
//               horizontal: AppDimensions.width10(context) * 1.5),
//           decoration: BoxDecoration(
//               color: const Color(0xffF5F5F5).withOpacity(0.8),
//               borderRadius: BorderRadius.only(
//                   topLeft:
//                       Radius.circular(AppDimensions.height10(context) * 1.0),
//                   topRight:
//                       Radius.circular(AppDimensions.height10(context) * 1.0))),
//           child:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//             AnimatedScaleButton(
//               onTap: () async {
//                 widget.link.clear();
//                 widget.statement.clear();
//                 widget.hastags.clear();
//                 widget.author?.clear();
//                 widget.title.clear();
//                 widget.tagList?.clear();
//                 Navigator.push(
//                     context, FadePageRoute(page: const inspiration_type()));
//                 final SharedPreferences prefs = await _prefs;
//                 await prefs.remove('ImageLink');
//               },
//               child: Center(
//                 child: Text(
//                   'Back',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: AppDimensions.font10(context) * 1.6,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xff007AFF)),
//                 ),
//               ),
//             ),
//             Center(
//               child: SizedBox(
//                 //height: AppDimensions.height10(context) * 2.2,
//                 width: AppDimensions.width10(context) * 28.5,
//                 child: Center(
//                   child: Text(
//                     widget.text.toString(),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: AppDimensions.font10(context) * 1.8,
//                         fontWeight: FontWeight.w700,
//                         color: const Color(0xff282828)),
//                   ),
//                 ),
//               ),
//             ),
//             ValueListenableBuilder<TextEditingValue>(
//                 valueListenable: widget.title,
//                 builder: (context, value, child) {
//                   return ValueListenableBuilder<TextEditingValue>(
//                       valueListenable: widget.statement,
//                       builder: (context, value, child) {
//                         return ValueListenableBuilder<TextEditingValue>(
//                             valueListenable: widget.link,
//                             builder: (context, value, child) {
//                               return AnimatedScaleButton(
//                                 onTap: () async {
//                                   if (widget.formKey.currentState!.validate()) {
//                                     if (widget.btEnable == true) {
//                                       setState(() {
//                                         widget.btEnable = false;
//                                       });
//                                     }
//                                     InspirationApi()
//                                         .addInspiration(
//                                             4,
//                                             null,
//                                             widget.title.text.toString().isEmpty
//                                                 ? " "
//                                                 : widget.title.text.toString(),
//                                             widget.tagList!.isEmpty
//                                                 ? []
//                                                 : widget.tagList,
//                                             widget.author.text
//                                                     .toString()
//                                                     .isEmpty
//                                                 ? " "
//                                                 : widget.author.text.toString(),
//                                             widget.link.text.toString().isEmpty
//                                                 ? " "
//                                                 : widget.link.text.toString(),
//                                             true,
//                                             widget.statement.text
//                                                     .toString()
//                                                     .isEmpty
//                                                 ? " "
//                                                 : widget.statement.text
//                                                     .toString(),
//                                             widget.selectedGoals)
//                                         .then((response) async {
//                                       if (response.length != 0) {
//                                         widget.statement.clear();
//                                         widget.author.clear();
//                                         widget.hastags.clear();
//                                         widget.link.clear();
//                                         widget.title.clear();
//                                         widget.selectedGoals!.clear();

//                                         widget.tagList?.clear();

//                                         Navigator.push(
//                                             context,
//                                             FadePageRoute(
//                                                 page: const updatedLandingPage(
//                                                     delete: false,
//                                                     is_Updated: false)));

//                                         final SharedPreferences prefs =
//                                             await _prefs;
//                                         await prefs.remove('ImageLink');
//                                         prefs.remove('inspiration_saved_route');
//                                       }

//                                       // return null;
//                                     });

//                                     // final SharedPreferences prefs =
//                                     //     await _prefs;
//                                     // prefs.remove('inspiration_saved_route');
//                                   }
//                                   // if (link.text.isNotEmpty &&
//                                   //     statement
//                                   //         .text.isNotEmpty &&
//                                   //     title.text.isNotEmpty) {

//                                   // }
//                                 },
//                                 child: Container(
//                                   // height:
//                                   //     AppDimensions.height10(
//                                   //             context) *
//                                   //         2.2,
//                                   // width: AppDimensions.height10(
//                                   //         context) *
//                                   //     6.1,
//                                   // margin: EdgeInsets.only(
//                                   //     left: AppDimensions
//                                   //             .height10(
//                                   //                 context) *
//                                   //         4.0),
//                                   child: widget.btEnable == false
//                                       ? Center(
//                                           child: SpinKitThreeBounce(
//                                             color: const Color(0xff007AFF),
//                                             // delay: Duration(milliseconds: 0),
//                                             size: AppDimensions.height10(
//                                                     context) *
//                                                 1.5,
//                                           ),
//                                         )
//                                       : Center(
//                                           child: Text(
//                                             'Create',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                                 fontSize: AppDimensions.font10(
//                                                         context) *
//                                                     1.6,
//                                                 fontWeight: FontWeight.w400,
//                                                 color: widget.statement.text
//                                                             .toString()
//                                                             .isNotEmpty &&
//                                                         widget.title.text
//                                                             .isNotEmpty
//                                                     ? const Color(0xff007AFF)
//                                                     : const Color(0xff007AFF)
//                                                         .withOpacity(0.5)),
//                                           ),
//                                         ),
//                                 ),
//                               );
//                             });
//                       });
//                 })
//           ]),
//         ));
//   }
// }
