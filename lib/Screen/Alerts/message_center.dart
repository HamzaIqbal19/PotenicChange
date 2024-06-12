import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Screen/Alerts/widgets/checkBox.dart';
import 'package:potenic_app/Screen/Alerts/widgets/messageComponent.dart';
import 'package:potenic_app/Screen/Alerts/widgets/noMessages.dart';

import '../../utils/app_dimensions.dart';

class message_center extends StatefulWidget {
  const message_center({super.key});

  @override
  State<message_center> createState() => _message_centerState();
}

class _message_centerState extends State<message_center> {
  bool options = false;
  bool delete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        leadingWidth: AppDimensions.width10(context) * 9.1,
        leading: options
            ? Center(
                child: Container(
                  margin: EdgeInsets.only(
                      left: AppDimensions.width10(context) * 1.6),
                  // color: Colors.amber,
                  child: SizedBox(
                    width: AppDimensions.width10(context) * 7.5,
                    height: AppDimensions.height10(context) * 2.4,

                    // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.6),
                    child: Text(
                      'Delete All',
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 1.6,
                          height: AppDimensions.height10(context) * 0.16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: const Color(0xFFFBFBFB)),
                    ),
                  ),
                ),
              )
            : Container(),
        actions: [
          Center(
            child:
            // options
            //     ? GestureDetector(
            //         onTap: () {
            //           if (options == true) {
            //             setState(() {
            //               options = false;
            //             });
            //           }
            //         },
            //         child: SizedBox(
            //           width: AppDimensions.width10(context) * 5.8,
            //           height: AppDimensions.height10(context) * 2.4,
            //           child: Text(
            //             'Cancel',
            //             style: TextStyle(
            //                 fontSize: AppDimensions.font10(context) * 1.6,
            //                 height: AppDimensions.height10(context) * 0.16,
            //                 fontWeight: FontWeight.w500,
            //                 decoration: TextDecoration.underline,
            //                 // decorationThickness: 3,
            //                 color: const Color(0xFFFBFBFB)),
            //           ),
            //         ),
            //       )
            //     :
            IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'assets/images/Close.webp',
                      //width: AppDimensions.width10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.6,
                      fit: BoxFit.contain,
                    )),
          ),
        ],

      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: AppDimensions.height10(context) * 9.2,
              ),
              Container(
                width: AppDimensions.width10(context) * 7.6,
                height: AppDimensions.height10(context) * 7.6,
                padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.height10(context) * 0.85,
                    horizontal: AppDimensions.width10(context) * 1.162),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFFFFF),
                ),
                child: Image.asset(
                  'assets/images/Vector Smart Object_1.webp',
                  width: AppDimensions.width10(context) * 5.275,
                  height: AppDimensions.height10(context) * 5.991,
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 32.9,
                height: AppDimensions.height10(context) * 3.6,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 1.9),
                child: Center(
                  child: Text(
                    'Message centre',
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 2.8,
                        fontFamily: 'laila',
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 28.4,
                height: AppDimensions.height10(context) * 2.2,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Center(
                  child: Text(
                    'All your notifications in one place',
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.8,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Laila',
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: AppDimensionsUpdated.width10(context)*1.5,),
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                return Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    messages(context,"Title", "dasznksndnasndkasnxnkjdnasxnasnkxnsknxsxnnx",false,(){}),
                    Positioned(
                      top:22,
                      right: 27,
                      child: checkBox(context, true),
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
      // bottomNavigationBar: delete
      //     ? Container(
      //         width: AppDimensions.width10(context) * 38.259,
      //         height: AppDimensions.height10(context) * 9.707,
      //         margin: EdgeInsets.only(
      //             bottom: AppDimensions.height10(context) * 2.093,
      //             left: AppDimensions.width10(context) * 1.6,
      //             right: AppDimensions.width10(context) * 1.6),
      //         decoration: BoxDecoration(
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.grey.withOpacity(0.4),
      //                 spreadRadius: AppDimensions.height10(context) * 0.5,
      //                 blurRadius: AppDimensions.height10(context) * 0.7,
      //                 offset: const Offset(2, 3),
      //               )
      //             ],
      //             borderRadius: BorderRadius.circular(
      //                 AppDimensions.height10(context) * 2.0),
      //             gradient: const LinearGradient(
      //                 begin: Alignment.topCenter,
      //                 end: Alignment.bottomCenter,
      //                 colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Container(
      //               margin: EdgeInsets.only(
      //                   left: AppDimensions.width10(context) * 1.261),
      //               width: AppDimensions.width10(context) * 4.437,
      //               height: AppDimensions.height10(context) * 4.437,
      //               decoration: const BoxDecoration(
      //                   image: DecorationImage(
      //                       image:
      //                           AssetImage('assets/images/circle_tick.webp'))),
      //             ),
      //             Container(
      //               width: AppDimensions.width10(context) * 6.9,
      //               height: AppDimensions.height10(context) * 3.6,
      //               margin: EdgeInsets.only(
      //                   left: AppDimensions.width10(context) * 1.232),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   SizedBox(
      //                     width: AppDimensions.width10(context) * 4.6,
      //                     height: AppDimensions.height10(context) * 1.4,
      //                     //   color: Colors.amber,
      //                     child: Text(
      //                       'Deleted',
      //                       style: TextStyle(
      //                           fontSize: AppDimensions.font10(context) * 1.3,
      //                           fontWeight: FontWeight.w500,
      //                           color: const Color(0xFFFFFFFF)),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     width: AppDimensions.width10(context) * 6.9,
      //                     height: AppDimensions.height10(context) * 2.2,
      //                     child: Text(
      //                       'Alerts',
      //                       style: TextStyle(
      //                           fontSize: AppDimensions.font10(context) * 1.8,
      //                           fontWeight: FontWeight.w500,
      //                           color: const Color(0xFFFFFFFF)),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Container(
      //               width: AppDimensions.width10(context) * 8.1,
      //               height: AppDimensions.height10(context) * 6.0,
      //               margin: EdgeInsets.only(
      //                   left: AppDimensions.width10(context) * 15.1),
      //               decoration: BoxDecoration(
      //                 border:
      //                     Border.all(color: const Color(0xFFFFFFFF), width: 1),
      //                 borderRadius: BorderRadius.circular(
      //                     AppDimensions.height10(context) * 2.0),
      //               ),
      //               child: Center(
      //                 child: Text(
      //                   'Undo',
      //                   style: TextStyle(
      //                       fontSize: AppDimensions.font10(context) * 1.8,
      //                       fontWeight: FontWeight.w500,
      //                       color: const Color(0xFFFFFFFF)),
      //                 ),
      //               ),
      //             )
      //           ],
      //         ),
      //       )
      //     : Container(
      //         width: AppDimensions.width10(context) * 29.0,
      //         height: options
      //             ? AppDimensions.height10(context) * 7.0
      //             : AppDimensions.height10(context) * 5.0,
      //         margin: options
      //             ? const EdgeInsets.all(0)
      //             : EdgeInsets.only(
      //                 top: AppDimensions.height10(context) * 0.1,
      //                 right: AppDimensions.width10(context) * 6.2,
      //                 left: AppDimensions.width10(context) * 6.2,
      //                 bottom: AppDimensions.height10(context) * 2.2),
      //         decoration: BoxDecoration(
      //             boxShadow: [
      //               options
      //                   ? BoxShadow(
      //                       color: const Color(0xFF000000).withOpacity(0.25),
      //                       spreadRadius: AppDimensions.height10(context) * 0.5,
      //                       blurRadius: AppDimensions.height10(context) * 0.7,
      //                       offset: const Offset(2, 3),
      //                     )
      //                   : const BoxShadow()
      //             ],
      //             borderRadius: BorderRadius.circular(options
      //                 ? AppDimensions.height10(context) * 0
      //                 : AppDimensions.height10(context) * 5.0),
      //             color: const Color(0xFFF5F5F5)),
      //         child: GestureDetector(
      //           onTap: () {
      //             setState(() {
      //               options = true;
      //             });
      //           },
      //           child: options
      //               ? Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     GestureDetector(
      //                       onTap: () => showAnimatedDialog(
      //                           animationType: DialogTransitionType.fadeScale,
      //                           curve: Curves.easeInOut,
      //                           duration: Duration(seconds: 1),
      //                           context: context,
      //                           builder: (BuildContext context) => SizedBox(
      //                                 width:
      //                                     AppDimensions.width10(context) * 27.0,
      //                                 height: AppDimensions.height10(context) *
      //                                     21.4,
      //                                 child: AlertDialog(
      //                                   shape: RoundedRectangleBorder(
      //                                       borderRadius: BorderRadius.circular(
      //                                           AppDimensions.height10(
      //                                                   context) *
      //                                               1.4)),
      //                                   contentPadding: EdgeInsets.zero,
      //                                   actionsPadding: EdgeInsets.zero,
      //                                   titlePadding: EdgeInsets.zero,
      //                                   title: Container(
      //                                       margin: EdgeInsets.only(
      //                                           top: AppDimensions.height10(context) *
      //                                               1.9,
      //                                           right: AppDimensions.width10(context) *
      //                                               1.6,
      //                                           left: AppDimensions.width10(context) *
      //                                               1.6,
      //                                           bottom:
      //                                               AppDimensions.height10(context) *
      //                                                   1.2),
      //                                       height:
      //                                           AppDimensions.height10(context) *
      //                                               4.4,
      //                                       width: AppDimensions.width10(context) *
      //                                           23.8,
      //                                       child: RichText(
      //                                           textAlign: TextAlign.center,
      //                                           text: TextSpan(
      //                                               style: TextStyle(
      //                                                   fontFamily: 'laila',
      //                                                   height:
      //                                                       AppDimensions.height10(context) *
      //                                                           0.15,
      //                                                   fontSize: AppDimensions.font10(context) * 1.6,
      //                                                   fontWeight: FontWeight.w400,
      //                                                   color: const Color(0xFF000000)),
      //                                               children: const [
      //                                                 TextSpan(
      //                                                     text:
      //                                                         'Are you sure you want\nto'),
      //                                                 TextSpan(
      //                                                   text: ' delete ',
      //                                                   style: TextStyle(
      //                                                       fontWeight:
      //                                                           FontWeight
      //                                                               .w700),
      //                                                 ),
      //                                                 TextSpan(
      //                                                     text: 'this alert?')
      //                                               ]))),
      //                                   content: Container(
      //                                     margin: EdgeInsets.only(
      //                                         bottom:
      //                                             AppDimensions.height10(
      //                                                     context) *
      //                                                 1.5,
      //                                         left: AppDimensions.height10(
      //                                                 context) *
      //                                             1.6,
      //                                         right: AppDimensions.height10(
      //                                                 context) *
      //                                             1.6),
      //                                     height:
      //                                         AppDimensions.height10(context) *
      //                                             3.2,
      //                                     width:
      //                                         AppDimensions.width10(context) *
      //                                             23.8,
      //                                     child: Text(
      //                                       "By clicking 'Yes' you confirm that this\nalert will be deleted. ",
      //                                       textAlign: TextAlign.center,
      //                                       style: TextStyle(
      //                                         color: const Color(0XFF000000),
      //                                         // letterSpacing:
      //                                         //     AppDimensions.height10(context) * 0.1,
      //                                         fontSize: AppDimensions.font10(
      //                                                 context) *
      //                                             1.3,
      //                                         fontWeight: FontWeight.w400,
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   actions: <Widget>[
      //                                     Column(
      //                                       children: [
      //                                         SizedBox(
      //                                           height: AppDimensions.height10(
      //                                                   context) *
      //                                               0.1,
      //                                           child: Divider(
      //                                             color: const Color(0XFF3C3C43)
      //                                                 .withOpacity(0.29),
      //                                           ),
      //                                         ),
      //                                         Container(
      //                                           height: AppDimensions.height10(
      //                                                   context) *
      //                                               4.2,
      //                                           width: double.infinity,
      //                                           color: const Color(0xFF007AFF),
      //                                           child: TextButton(
      //                                             onPressed: () {
      //                                               Navigator.pop(context);
      //                                             },
      //                                             child: Text(
      //                                               'No',
      //                                               style: TextStyle(
      //                                                   color: const Color(
      //                                                       0xFFFFFFFF),
      //                                                   fontSize: AppDimensions
      //                                                           .font10(
      //                                                               context) *
      //                                                       1.7,
      //                                                   fontFamily: "Laila",
      //                                                   fontWeight:
      //                                                       FontWeight.w400),
      //                                             ),
      //                                           ),
      //                                         ),
      //                                         SizedBox(
      //                                           height: AppDimensions.height10(
      //                                                   context) *
      //                                               0.1,
      //                                           child: Divider(
      //                                             color: const Color(0XFF3C3C43)
      //                                                 .withOpacity(0.29),
      //                                           ),
      //                                         ),
      //                                         SizedBox(
      //                                           height: AppDimensions.height10(
      //                                                   context) *
      //                                               4.4,
      //                                           width: double.infinity,
      //                                           child: TextButton(
      //                                             onPressed: () {
      //                                               setState(() {
      //                                                 delete = true;
      //                                                 options = false;
      //                                               });
      //                                               Navigator.pop(context);
      //                                             },
      //                                             child: Text(
      //                                               'Yes',
      //                                               style: TextStyle(
      //                                                   fontSize: AppDimensions
      //                                                           .font10(
      //                                                               context) *
      //                                                       1.7,
      //                                                   fontFamily: "Laila",
      //                                                   fontWeight:
      //                                                       FontWeight.w400,
      //                                                   color: const Color(
      //                                                       0xFF007AFF)),
      //                                             ),
      //                                           ),
      //                                         ),
      //                                         SizedBox(
      //                                           height: AppDimensions.height10(
      //                                                   context) *
      //                                               0.1,
      //                                           child: Divider(
      //                                             color: const Color(0XFF3C3C43)
      //                                                 .withOpacity(0.29),
      //                                           ),
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ],
      //                                 ),
      //                               )),
      //                       child: Container(
      //                         width: AppDimensions.width10(context) * 10.1,
      //                         height: AppDimensions.height10(context) * 5.0,
      //                         margin: EdgeInsets.only(
      //                             left: AppDimensions.width10(context) * 2.0),
      //                         decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.circular(
      //                                 AppDimensions.height10(context) * 5.0),
      //                             gradient: const LinearGradient(colors: [
      //                               Color(0xFFFCC10D),
      //                               Color(0xFFFDA210)
      //                             ])),
      //                         child: Center(
      //                           child: Text('Delete ',
      //                               style: TextStyle(
      //                                 fontSize:
      //                                     AppDimensions.font10(context) * 1.6,
      //                                 fontWeight: FontWeight.w600,
      //                                 color: const Color(0xFFFFFFFF),
      //                               )),
      //                         ),
      //                       ),
      //                     ),
      //                     Container(
      //                       width: AppDimensions.width10(context) * 7.7,
      //                       height: AppDimensions.height10(context) * 2.1,
      //                       margin: EdgeInsets.only(
      //                           right: AppDimensions.width10(context) * 2.0),
      //                       child: Center(
      //                         child: Text('10 selected',
      //                             style: TextStyle(
      //                               fontSize:
      //                                   AppDimensions.font10(context) * 1.4,
      //                               fontWeight: FontWeight.w400,
      //                               color: const Color(0xFFFA9934),
      //                             )),
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               : Center(
      //                   child: Text(
      //                     'Options',
      //                     style: TextStyle(
      //                         fontSize: AppDimensions.font10(context) * 1.6,
      //                         fontWeight: FontWeight.w600,
      //                         color: const Color(0xFFFA9934)),
      //                   ),
      //                 ),
      //         ),
      //       ),
      extendBody: true,
    );
  }
}
