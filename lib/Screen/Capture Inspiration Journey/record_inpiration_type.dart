import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/constants/videothumbnail.dart';

import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/deleteanimatedDialog.dart';
import 'package:potenic_app/Widgets/menu_buttons.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import 'inpiration_landing.dart';
import 'inpiration_motivation.dart';
import 'inpiration_veiw_detail.dart';
import 'inspiratoinEdit/photoEdit.dart';
import 'inspiratoinEdit/videoEdit.dart';

class record_inspiration extends StatefulWidget {
  const record_inspiration({
    super.key,
  });

  @override
  State<record_inspiration> createState() => _record_inspirationState();
}

class _record_inspirationState extends State<record_inspiration> {
  var inspirationDetails;
  bool Loading = true;
  List allgoalsSelected = [];

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchInspiration() {
    InspirationApi().getInspirationById().then((response) {
      if (response.length != 0) {
        setState(() {
          inspirationDetails = response;
          print("isnpiration details $inspirationDetails");
        });
        loadData();

        return response;
      }

      // return null;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchInspiration();
    allgoalsSelected.add(-1);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context,
            FadePageRouteReverse(
                page: const inspiration_landing(
              is_Updated: false,
            )));
        return Future.value(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        FadePageRouteReverse(
                            page:
                                const inspiration_landing(is_Updated: false)));
                  },
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    //width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.8,
                    fit: BoxFit.contain,
                  )),
            )
          ],
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_inpiration_purple.webp'),
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                  fit: BoxFit.cover)),
          child: Loading == false
              ? Column(
                  children: [
                    Container(
                      width: AppDimensions.width10(context) * 5.5,
                      height: AppDimensions.height10(context) * 2.5,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 4.8),
                      child: Center(
                        child: Text(
                          'Menu',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 2.00,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    Container(
                      // width: AppDimensions.width10(context) * 16.7,
                      //height: AppDimensions.height10(context) * 21.2,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 4.3,
                      ),
                      child: Column(
                        children: [
                          Column(children: [
                            inspirationDetails['inspiration']['inspirationId'] ==
                                    2
                                ? Container(
                                    width:
                                        AppDimensions.width10(context) * 16.7,
                                    height:
                                        AppDimensions.height10(context) * 16.7,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: const RadialGradient(colors: [
                                          Color(0xFFE9A594),
                                          Color(0xFFEEBEB2)
                                        ])),
                                    child: Center(
                                        child: Text(
                                      inspirationDetails['inspiration']
                                          ['description'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'laila',
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFFFFFFF)),
                                    )),
                                  )
                                : inspirationDetails['inspiration']
                                            ['inspirationId'] ==
                                        4
                                    ? Container(
                                        width: AppDimensions.width10(context) *
                                            16.7,
                                        height:
                                            AppDimensions.height10(context) *
                                                16.7,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: const LinearGradient(
                                              end: Alignment(0.73, 0),
                                              begin: Alignment(-1, 1),
                                              colors: [
                                                Color(0xFF673636),
                                                Color(0xFFF8C3B5),
                                              ]),
                                        ),
                                        child: Center(
                                            child: Text(
                                          inspirationDetails['inspiration']
                                              ['description'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'laila',
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    : inspirationDetails['inspiration']
                                                ['inspirationId'] ==
                                            3
                                        ? Container(
                                            width: AppDimensions.width10(context) *
                                                16.7,
                                            height: AppDimensions.height10(context) *
                                                16.7,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                // gradient: inspirationDetails['inspiration']
                                                //             ['inspirationId'] ==
                                                //         2
                                                //     ? const RadialGradient(
                                                //         colors: [
                                                //             Color(0xFFE9A594),
                                                //             Color(0xFFEEBEB2)
                                                //           ])
                                                //     : const LinearGradient(
                                                //         end: Alignment(0.73, 0),
                                                //         begin: Alignment(-1, 1),
                                                //         colors: [
                                                //             Color(0xFF673636),
                                                //             Color(0xFFF8C3B5),
                                                //           ]),
                                                image: DecorationImage(
                                                    image: inspirationDetails['inspiration']['inspirationId'] ==
                                                            3
                                                        ? Videothumbnail().extractThumbnailUrl(inspirationDetails['inspiration']['destinationLink']) ==
                                                                ''
                                                            ? const AssetImage('assets/images/video.webp')
                                                                as ImageProvider
                                                            : NetworkImage(
                                                                Videothumbnail()
                                                                        .extractThumbnailUrl(inspirationDetails['inspiration']['destinationLink'])
                                                                    as String)
                                                        : const AssetImage('')
                                                            as ImageProvider,
                                                    fit: BoxFit.cover)),
                                            child: inspirationDetails['inspiration']['inspirationId'] == 3
                                                ? Videothumbnail().extractThumbnailUrl(inspirationDetails['inspiration']['destinationLink']) == ''
                                                    ? Container()
                                                    : SizedBox(
                                                        width:
                                                            10, // Set the desired width
                                                        height:
                                                            10, // Set the desired height
                                                        child: Image.asset(
                                                          'assets/images/videoicon.png',
                                                          // fit: BoxFit
                                                          //     ., // Ensures the image fits within the box
                                                        ),
                                                      )
                                                // : Container(
                                                //     decoration: BoxDecoration(
                                                //         image: DecorationImage(
                                                //             image: AssetImage(
                                                //                 'assets/images/videoicon.png',))),
                                                //   )
                                                : Container())
                                        : inspirationDetails['inspiration']['inspirationId'] == 1
                                            ? Container(
                                                width: AppDimensions.width10(
                                                        context) *
                                                    16.7,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    16.7,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              18),
                                                  child: FadeInImage(
                                                    placeholder: const AssetImage(
                                                        'assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                                                    image: NetworkImage(
                                                        inspirationDetails[
                                                                    'inspiration']
                                                                ['file']
                                                            .toString()),
                                                    fit: BoxFit.cover,
                                                    placeholderFit:
                                                        BoxFit.contain,
                                                  ),
                                                ),
                                              )
                                            : Container(),

                            // Container(
                            //   width: AppDimensions.width10(context) * 16.7,
                            //   height: AppDimensions.height10(context) * 16.7,
                            //   decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       gradient: inspirationDetails['inspiration']
                            //                   ['inspirationId'] ==
                            //               2
                            //           ? const RadialGradient(
                            //               colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)])
                            //           : const LinearGradient(
                            //               end: Alignment(0.73, 0),
                            //               begin: Alignment(-1, 1),
                            //               colors: [
                            //                   Color(0xFF673636),
                            //                   Color(0xFFF8C3B5),
                            //                 ]),
                            //       image: DecorationImage(
                            //           image: inspirationDetails['inspiration']
                            //                       ['inspirationId'] ==
                            //                   3
                            //               ? Videothumbnail().extractThumbnailUrl(inspirationDetails['inspiration']
                            //                           ['destinationLink']) ==
                            //                       ''
                            //                   ? const AssetImage('assets/images/video.webp')
                            //                       as ImageProvider
                            //                   : NetworkImage(Videothumbnail()
                            //                       .extractThumbnailUrl(
                            //                           inspirationDetails['inspiration']
                            //                               ['destinationLink']))
                            //               : const AssetImage('') as ImageProvider,
                            //           fit: BoxFit.cover)),
                            //   child: inspirationDetails['inspiration']
                            //                   ['inspirationId'] ==
                            //               2 ||
                            //           inspirationDetails['inspiration']
                            //                   ['inspirationId'] ==
                            //               4
                            //       ? Container(
                            //           padding: EdgeInsets.symmetric(
                            //               horizontal:
                            //                   AppDimensions.height10(context) *
                            //                       2),
                            //           height:
                            //               AppDimensions.height10(context) * 6.3,
                            //           child: Center(
                            //               child: Text(
                            //             inspirationDetails['inspiration']
                            //                 ['description'],
                            //             overflow: TextOverflow.ellipsis,
                            //             maxLines: 3,
                            //             textAlign: TextAlign.center,
                            //             style: TextStyle(
                            //                 fontFamily: 'laila',
                            //                 fontSize:
                            //                     AppDimensions.font10(context) *
                            //                         1.4,
                            //                 fontWeight: FontWeight.w400,
                            //                 color: const Color(0xFFFFFFFF)),
                            //           )),
                            //         )
                            //       : inspirationDetails['inspiration']
                            //                   ['inspirationId'] ==
                            //               1
                            //           ? ClipRRect(
                            //               borderRadius: BorderRadius.circular(
                            //                   AppDimensions.height10(context) *
                            //                       18),
                            //               child: FadeInImage(
                            //                 placeholder: const AssetImage(
                            //                     'assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                            //                 image: NetworkImage(
                            //                     inspirationDetails[
                            //                             'inspiration']['file']
                            //                         .toString()),
                            //                 fit: BoxFit.cover,
                            //                 placeholderFit: BoxFit.contain,
                            //               ),
                            //             )
                            //           : Container(),
                            // ),
                            Container(
                              width: AppDimensions.width10(context) * 16.7,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.5,
                                  bottom:
                                      AppDimensions.height10(context) * 0.2),
                              child: Center(
                                  child: Text(
                                inspirationDetails['inspiration']
                                            ['inspirationId'] ==
                                        1
                                    ? 'Image'
                                    : inspirationDetails['inspiration']
                                                ['inspirationId'] ==
                                            2
                                        ? 'Note'
                                        : inspirationDetails['inspiration']
                                                    ['inspirationId'] ==
                                                3
                                            ? "Video"
                                            : 'Content',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.4,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF)),
                              )),
                            ),

                            SizedBox(
                              width: AppDimensions.width10(context) * 12.7,
                              //height: AppDimensions.height10(context) * 3.0,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    inspirationDetails['inspiration']['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.14,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.8,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFFFFFFF)),
                                  )),
                            )
                          ])
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 32.0,
                      height: AppDimensions.height10(context) * 2.9,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.9),
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
                      //height: AppDimensions.height10(context) * 28.5,
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
                                FadePageRoute(page: const view_details()),
                              );
                            },
                            child: const ButtonFields(
                                fieldText: 'View Details',
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
                          AnimatedScaleButton(
                            onTap: () {
                              if (inspirationDetails['inspiration']
                                      ['inspirationId'] ==
                                  1) {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const photo_Edit(
                                      updateData: false,
                                    )));
                              } else if (inspirationDetails['inspiration']
                                      ['inspirationId'] ==
                                  2) {
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const videoEdit(
                                    updateData: false,
                                    note: true,
                                    context: false,
                                  )),
                                );
                              } else if (inspirationDetails['inspiration']
                                      ['inspirationId'] ==
                                  4) {
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const videoEdit(
                                    updateData: false,
                                    note: false,
                                    context: true,
                                  )),
                                );
                              } else if (inspirationDetails['inspiration']
                                      ['inspirationId'] ==
                                  3) {
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const videoEdit(
                                    updateData: false,
                                    note: false,
                                    context: false,
                                  )),
                                );
                              }
                            },
                            child: const ButtonFields(
                                fieldText: 'Edit Details',
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
                                    right:
                                        AppDimensions.height10(context) * 0.5,
                                  ),
                                  child: const Icon(
                                    Icons.share,
                                    color: Color(0xff646464),
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 2.4,
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
                              ],
                            ),
                          ),
                          DeleteAnimatedDialog(
                            content:
                                "By clicking 'Yes' you confirm that this\ninspiration will be deleted permanently. ",
                            text1: 'Are you sure you want\nto',
                            boldText: ' delete ',
                            text2: 'this inspiration?',
                            TextButton1: 'No',
                            ontap1: () {
                              Navigator.pop(context);
                            },
                            TextButton2: 'Yes',
                            ontap2: () {
                              InspirationApi()
                                  .deleteUserInspiraton()
                                  .then((response) {
                                if (response == true) {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: inspiration_motivation(
                                        goal_delete: true,
                                        inspirationName:
                                            inspirationDetails['inspiration']
                                                ['title'],
                                      )));
                                }
                              });
                            },
                            child: Container(
                              width: AppDimensions.width10(context) * 38.4,
                              height: AppDimensions.height10(context) * 6.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width:
                                          AppDimensions.height10(context) * 0.1,
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
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    margin: EdgeInsets.only(
                                      right:
                                          AppDimensions.height10(context) * 0.5,
                                    ),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Color(0XFFFFFFFF),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 2.4,
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
                          //               width: AppDimensions.width10(context) *
                          //                   27.0,
                          //               height:
                          //                   AppDimensions.height10(context) *
                          //                       21.4,
                          //               child: AlertDialog(
                          //                 shape: RoundedRectangleBorder(
                          //                     borderRadius:
                          //                         BorderRadius.circular(
                          //                             AppDimensions.height10(
                          //                                     context) *
                          //                                 1.4)),
                          //                 contentPadding: EdgeInsets.zero,
                          //                 actionsPadding: EdgeInsets.zero,
                          //                 titlePadding: EdgeInsets.zero,
                          //                 title: Container(
                          //                     margin: EdgeInsets.only(
                          //                         top: AppDimensions.height10(context) *
                          //                             1.9,
                          //                         right:
                          //                             AppDimensions.width10(context) *
                          //                                 1.6,
                          //                         left: AppDimensions.width10(context) *
                          //                             1.6,
                          //                         bottom:
                          //                             AppDimensions.height10(context) *
                          //                                 0.2),
                          //                     height:
                          //                         AppDimensions.height10(context) *
                          //                             4.4,
                          //                     width:
                          //                         AppDimensions.height10(context) *
                          //                             23.8,
                          //                     child: RichText(
                          //                         textAlign: TextAlign.center,
                          //                         text: TextSpan(
                          //                             style: TextStyle(
                          //                                 fontFamily: 'laila',
                          //                                 fontSize:
                          //                                     AppDimensions.height10(context) *
                          //                                         1.6,
                          //                                 height: AppDimensions.height10(context) * 0.15,
                          //                                 fontWeight: FontWeight.w400,
                          //                                 color: const Color(0xFF000000)),
                          //                             children: const [
                          //                               TextSpan(
                          //                                   text:
                          //                                       'Are you sure you want\nto'),
                          //                               TextSpan(
                          //                                 text: ' delete ',
                          //                                 style: TextStyle(
                          //                                     fontWeight:
                          //                                         FontWeight
                          //                                             .w700),
                          //                               ),
                          //                               TextSpan(
                          //                                   text:
                          //                                       'this inspiration?')
                          //                             ]))),
                          //                 content: Container(
                          //                   margin: EdgeInsets.only(
                          //                       bottom: AppDimensions.height10(
                          //                               context) *
                          //                           1.5,
                          //                       left: AppDimensions.height10(
                          //                               context) *
                          //                           1.6,
                          //                       right: AppDimensions.height10(
                          //                               context) *
                          //                           1.6),
                          //                   height: AppDimensions.height10(
                          //                           context) *
                          //                       3.4,
                          //                   width:
                          //                       AppDimensions.width10(context) *
                          //                           23.8,
                          //                   child: Text(
                          //                     "By clicking 'Yes' you confirm that this\ninspiration will be deleted permanently. ",
                          //                     textAlign: TextAlign.center,
                          //                     style: TextStyle(
                          //                       color: const Color(0xFF000000),
                          //                       fontSize: AppDimensions.font10(
                          //                               context) *
                          //                           1.3,
                          //                       fontWeight: FontWeight.w400,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 actions: <Widget>[
                          //                   Column(
                          //                     children: [
                          //                       SizedBox(
                          //                         height:
                          //                             AppDimensions.height10(
                          //                                     context) *
                          //                                 0.1,
                          //                         child: Divider(
                          //                           color:
                          //                               const Color(0XFF3C3C43)
                          //                                   .withOpacity(0.29),
                          //                         ),
                          //                       ),
                          //                       Container(
                          //                         height:
                          //                             AppDimensions.height10(
                          //                                     context) *
                          //                                 4.2,
                          //                         width: double.infinity,
                          //                         color:
                          //                             const Color(0xFF007AFF),
                          //                         child: TextButton(
                          //                           onPressed: () {
                          //                             Navigator.pop(context);
                          //                           },
                          //                           child: Text(
                          //                             'No',
                          //                             style: TextStyle(
                          //                                 color: const Color(
                          //                                     0xFFFFFFFF),
                          //                                 fontSize: AppDimensions
                          //                                         .font10(
                          //                                             context) *
                          //                                     1.7,
                          //                                 fontFamily: "Laila",
                          //                                 fontWeight:
                          //                                     FontWeight.w400),
                          //                           ),
                          //                         ),
                          //                       ),
                          //                       SizedBox(
                          //                         height:
                          //                             AppDimensions.height10(
                          //                                     context) *
                          //                                 0.1,
                          //                         child: Divider(
                          //                           color:
                          //                               const Color(0XFF3C3C43)
                          //                                   .withOpacity(0.29),
                          //                         ),
                          //                       ),
                          //                       SizedBox(
                          //                         height:
                          //                             AppDimensions.height10(
                          //                                     context) *
                          //                                 4.4,
                          //                         width: double.infinity,
                          //                         child: TextButton(
                          //                           onPressed: () {
                          //                             InspirationApi()
                          //                                 .deleteUserInspiraton()
                          //                                 .then((response) {
                          //                               if (response == true) {
                          //                                 Navigator.push(
                          //                                     context,
                          //                                     FadePageRoute(
                          //                                         page:
                          //                                             inspiration_motivation(
                          //                                       goal_delete:
                          //                                           true,
                          //                                       inspirationName:
                          //                                           inspirationDetails[
                          //                                                   'inspiration']
                          //                                               [
                          //                                               'title'],
                          //                                     )));
                          //                               }
                          //                             });
                          //                           },
                          //                           child: Text(
                          //                             'Yes',
                          //                             style: TextStyle(
                          //                                 fontSize: AppDimensions
                          //                                         .font10(
                          //                                             context) *
                          //                                     1.7,
                          //                                 fontFamily: "Laila",
                          //                                 fontWeight:
                          //                                     FontWeight.w400,
                          //                                 color: const Color(
                          //                                     0xFF007AFF)),
                          //                           ),
                          //                         ),
                          //                       ),
                          //                       SizedBox(
                          //                         height:
                          //                             AppDimensions.height10(
                          //                                     context) *
                          //                                 0.1,
                          //                         child: Divider(
                          //                           color:
                          //                               const Color(0XFF3C3C43)
                          //                                   .withOpacity(0.29),
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ],
                          //               ),
                          //             ));
                          //   },
                          //   child: Container(
                          //     width: AppDimensions.width10(context) * 38.4,
                          //     height: AppDimensions.height10(context) * 6.0,
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             width:
                          //                 AppDimensions.height10(context) * 0.1,
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
                          //           height:
                          //               AppDimensions.height10(context) * 2.4,
                          //           margin: EdgeInsets.only(
                          //             right:
                          //                 AppDimensions.height10(context) * 0.5,
                          //           ),
                          //           child: const Icon(
                          //             Icons.delete,
                          //             color: Color(0XFFFFFFFF),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height:
                          //               AppDimensions.height10(context) * 2.4,
                          //           child: Center(
                          //               child: Text(
                          //             'Delete',
                          //             style: TextStyle(
                          //                 fontSize: UpdatedDimensions.font10(
                          //                         context) *
                          //                     2,
                          //                 fontWeight: FontWeight.w500,
                          //                 color: const Color(0xffffffff)),
                          //           )),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ),
      ),
    );
  }
}
