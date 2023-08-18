import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_motivation.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_veiw_detail.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/link_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/video_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiratoinEdit/photoEdit.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiratoinEdit/videoEdit.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

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
      print('Res=====================');
      if (response.length != 0) {
        setState(() {
          inspirationDetails = response;
        });
        loadData();
        print(inspirationDetails['inspiration']['title']);

        return response;
      }

      // return null;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchInspiration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      FadePageRoute(
                          page: const inspiration_landing(is_Updated: false)));
                },
                icon: Image.asset(
                  'assets/images/Close.webp',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
                )),
          )
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        // title: Container(
        //   width: AppDimensions.height10(context) * 5.5,
        //   height: AppDimensions.height10(context) * 2.4,
        //   child: Center(
        //     child: Text(
        //       'Menu',
        //       style: TextStyle(
        //           fontSize: AppDimensions.height10(context) * 2.00,
        //           fontWeight: FontWeight.w600,
        //           color: Color(0xFFFFFFFF)),
        //     ),
        //   ),
        // ),
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
                    width: AppDimensions.height10(context) * 5.5,
                    height: AppDimensions.height10(context) * 2.5,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 4.8),
                    child: Center(
                      child: Text(
                        'Menu',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.00,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                  Container(
                    // width: AppDimensions.height10(context) * 16.7,
                    //height: AppDimensions.height10(context) * 21.2,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 4.3,
                    ),
                    child: Column(
                      children: [
                        Column(children: [
                          Container(
                            width: AppDimensions.height10(context) * 16.7,
                            height: AppDimensions.height10(context) * 16.7,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: inspirationDetails['inspiration']
                                            ['inspirationId'] ==
                                        2
                                    ? const RadialGradient(
                                        colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)])
                                    : const RadialGradient(
                                        colors: [Color(0xFFD9D9D9), Color(0xFFD9D9D9)]),
                                image: inspirationDetails['inspiration']
                                            ['inspirationId'] ==
                                        1
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            inspirationDetails['inspiration']['file']
                                                .toString()),
                                        fit: BoxFit.cover)
                                    : DecorationImage(
                                        image: AssetImage(inspirationDetails['inspiration']
                                                    ['inspirationId'] ==
                                                4
                                            ? 'assets/images/distraction content.webp'
                                            : inspirationDetails['inspiration']['inspirationId'] == 3
                                                ? 'assets/images/video_play.webp'
                                                : ''),
                                        fit: BoxFit.cover)),
                            child: inspirationDetails['inspiration']
                                        ['inspirationId'] ==
                                    2
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppDimensions.height10(context) *
                                                2),
                                    height:
                                        AppDimensions.height10(context) * 6.3,
                                    child: Center(
                                        child: Text(
                                      inspirationDetails['inspiration']
                                          ['description'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFFFFFFF)),
                                    )),
                                  )
                                : Container(),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 16.7,
                            height: AppDimensions.height10(context) * 1.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.5,
                                bottom: AppDimensions.height10(context) * 0.2),
                            child: Center(
                                child: Text(
                              inspirationDetails['inspiration']['title'],
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            )),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 12.7,
                            //height: AppDimensions.height10(context) * 3.0,
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  inspirationDetails['inspiration']
                                      ['description'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: AppDimensions.height10(context) *
                                          0.14,
                                      fontSize:
                                          AppDimensions.height10(context) * 1.2,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFFFFFFF)),
                                )),
                          )
                        ])
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 32.0,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.9),
                    child: Center(
                        child: Text(
                      'What do you want to do?',
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 28.5,
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
                              FadePageRoute(page: const veiw_details()),
                            );
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 36.0,
                            height: AppDimensions.height10(context) * 6.0,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 1.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: AppDimensions.height10(context) * 23.9,
                                  height: AppDimensions.height10(context) * 2.2,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.99),
                                  child: Text(
                                    'View details',
                                    style: TextStyle(
                                      color: const Color(0xFF646464),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10(context) *
                                            2.391),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.webp',
                                        color: const Color(0xFF646464),
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            if (inspirationDetails['inspiration']
                                    ['inspirationId'] ==
                                1) {
                              Navigator.push(
                                context,
                                FadePageRoute(page: const photo_Edit()),
                              );
                            } else if (inspirationDetails['inspiration']
                                    ['inspirationId'] ==
                                2) {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const videoEdit(
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
                                  note: false,
                                  context: false,
                                )),
                              );
                            }
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 36.0,
                            height: AppDimensions.height10(context) * 6.0,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 1.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: AppDimensions.height10(context) * 23.9,
                                  height: AppDimensions.height10(context) * 2.2,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.99),
                                  child: Text(
                                    'Edit details',
                                    style: TextStyle(
                                      color: const Color(0xFF646464),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10(context) *
                                            2.391),
                                    child: Image.asset(
                                      'assets/images/BTN Back.webp',
                                      color: const Color(0xFF646464),
                                      //width: AppDimensions.height10(context) * 2.6,
                                      //height: AppDimensions.height10(context) * 2.6,
                                      fit: BoxFit.cover,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 17.0,
                          height: AppDimensions.height10(context) * 0.5,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: Colors.white),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 36.0,
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
                                width: AppDimensions.height10(context) * 2.4,
                                height: AppDimensions.height10(context) * 2.4,
                                margin: EdgeInsets.only(
                                  right: AppDimensions.height10(context) * 0.5,
                                ),
                                child: const Icon(
                                  Icons.share,
                                  color: Color(0xff646464),
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.height10(context) * 5.0,
                                height: AppDimensions.height10(context) * 2.2,
                                child: Center(
                                    child: Text(
                                  'Share',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF646464)),
                                )),
                              ),
                            ],
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            return showAnimatedDialog(
                                animationType: DialogTransitionType.fadeScale,
                                curve: Curves.easeInOut,
                                duration: const Duration(seconds: 1),
                                context: context,
                                builder: (BuildContext context) => SizedBox(
                                      width: AppDimensions.height10(context) *
                                          27.0,
                                      height: AppDimensions.height10(context) *
                                          21.4,
                                      child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10(
                                                        context) *
                                                    1.4)),
                                        contentPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(context) *
                                                    1.9,
                                                right: AppDimensions.height10(context) *
                                                    1.6,
                                                left: AppDimensions.height10(context) *
                                                    1.6,
                                                bottom:
                                                    AppDimensions.height10(context) *
                                                        0.2),
                                            height:
                                                AppDimensions.height10(context) *
                                                    4.4,
                                            width: AppDimensions.height10(context) *
                                                23.8,
                                            child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    style: TextStyle(
                                                        fontSize:
                                                            AppDimensions.height10(context) *
                                                                1.7,
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
                                                          text:
                                                              'this inspiration?')
                                                    ]))),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.5,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              right: AppDimensions.height10(
                                                      context) *
                                                  1.6),
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "By clicking 'Yes' you confirm that this\ninspiration will be deleted permanently. ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(0xFF000000),
                                              fontSize: AppDimensions.height10(
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
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
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
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {
                                                    InspirationApi()
                                                        .deleteUserInspiraton()
                                                        .then((response) {
                                                      if (response == true) {
                                                        Navigator.push(
                                                            context,
                                                            FadePageRoute(
                                                                page:
                                                                    const inspiration_motivation(
                                                              goal_delete: true,
                                                            )));
                                                      }
                                                    });
                                                  },
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
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
                                                height: AppDimensions.height10(
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
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 36.0,
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
                                  width: AppDimensions.height10(context) * 2.4,
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
                                SizedBox(
                                  width: AppDimensions.height10(context) * 5.3,
                                  height: AppDimensions.height10(context) * 2.2,
                                  child: Center(
                                      child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xffffffff)),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 17.0,
                    height: AppDimensions.height10(context) * 0.5,
                    //alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 17.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: const Color(0xFFFFFFFF).withOpacity(0.3)),
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
    );
  }
}
