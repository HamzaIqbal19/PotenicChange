import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/capture_inpirations_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import '../../utils/app_dimensions.dart';

class view_details extends StatefulWidget {
  const view_details({
    super.key,
  });

  @override
  State<view_details> createState() => _view_detailsState();
}

class _view_detailsState extends State<view_details> {
  var inspirationDetails;
  List tags = [];
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
      if (response.length != 0) {
        setState(() {
          inspirationDetails = response;
        });

        if (inspirationDetails['inspiration']['hashTags'].length != 0) {
          for (int i = 0;
              i < inspirationDetails['inspiration']['hashTags'].length;
              i++) {
            tags.add('#${inspirationDetails['inspiration']['hashTags'][i]}');
          }
        }
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        right: false,
        left: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'assets/images/Back.webp',
                     // width: AppDimensions.width10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.8,
                      fit: BoxFit.contain,
                    )),
              )),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_inpiration_purple.webp'),
                    colorFilter: ColorFilter.mode(
                        Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                    fit: BoxFit.cover)),
            child: Loading == false
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: inspirationDetails['inspiration']
                                        ['inspirationId'] ==
                                    3
                                ? const AssetImage('assets/images/video_image.webp')
                                : const AssetImage(
                                    'assets/images/bg_inpiration_purple.webp'),
                            colorFilter: const ColorFilter.mode(
                                Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: [
                        if (inspirationDetails['inspiration']['inspirationId'] ==
                            1) ...[
                          Container(
                            width: double.infinity,
                            //color: Colors.amber,
                            child: Container(
                              width: AppDimensions.width10(context) * 34.7,
                              height: AppDimensions.height10(context) * 36.188,
                              margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 12.0,

                                left: AppDimensions.width10(context) * 3.4,
                                right: AppDimensions.width10(context) * 3.4,
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          inspirationDetails['inspiration']['file']
                                              .toString()),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ] else if (inspirationDetails['inspiration']
                                ['inspirationId'] ==
                            4) ...[
                          Container(
                            width: double.infinity,
                            // color: Colors.amber,
                            child: Container(
                              width: AppDimensions.width10(context) * 37.7,
                              height: AppDimensions.height10(context) * 24.7,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 11.50,

                                left: AppDimensions.width10(context) * 1.8,
                                right: AppDimensions.width10(context) * 1.8,
                              ),
                              decoration: const BoxDecoration(
                                  //  color: Colors.amber,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/distraction content.webp'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ] else if (inspirationDetails['inspiration']
                                ['inspirationId'] ==
                            3) ...[
                          Container(
                            alignment: Alignment.center,
                            //IT'S HEIGHT IS SET SO BACKGROUND DOES'NT BECOME VISIBLE
                            // width: AppDimensions.width10(context) * 41.4,
                            // margin: EdgeInsets.only(bottom: AppDimensions.height10(context) * 20.0),
                            height: AppDimensions.height10(context) * 44.5,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/video_image.webp'),
                                    fit: BoxFit.cover)),
                            child: Center(
                              child: SizedBox(
                                width: AppDimensions.width10(context) * 8.6,
                                height: AppDimensions.height10(context) * 8.6,
                                child:
                                    Image.asset('assets/images/play_button.webp'),
                              ),
                            ),
                          ),
                        ] else if (inspirationDetails['inspiration']
                                ['inspirationId'] ==
                            2) ...[
                          Container(
                            // width: AppDimensions.width10(context) * 34.7,
                            height: AppDimensions.height10(context) * 52.5,

                            decoration: const BoxDecoration(
                              gradient: RadialGradient(
                                  colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)]),
                            ),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(

                                  left: AppDimensions.width10(context) * 5,
                                  right: AppDimensions.width10(context) * 5,
                                  // bottom: AppDimensions.height10(context) * 3
                                ),
                                child: Text(
                                  inspirationDetails['inspiration']['description'],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height:
                                          AppDimensions.height10(context) * 0.15,
                                      fontSize: AppDimensions.font10(context) * 2.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  )
                : const Center(
                    child: SpinKitFadingCircle(
                      color: Color(0xFFB1B8FF),
                      size: 80,
                    ),
                  ),
          ),
          extendBody: true,
          bottomNavigationBar: Loading == false
              ? BottomAppBar(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                      //should change according to screen
                      height: inspirationDetails['inspiration']['inspirationId'] ==
                              1
                          ? AppDimensions.height10(context) * 38.465
                          : inspirationDetails['inspiration']['inspirationId'] == 2
                              ? AppDimensions.height10(context) * 52.465
                              : AppDimensions.height10(context) * 48.465,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                AppDimensions.height10(context) * 4.0),
                            topRight: Radius.circular(
                                AppDimensions.height10(context) * 4.0)),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        //reverse: true,
                        child: Column(
                          children: [
                            inspirationDetails['inspiration']['title']
                                    .toString()
                                    .isNotEmpty
                                ? Container(
                                    height: AppDimensions.height10(context) * 2.1,
                                    width: AppDimensions.width10(context) * 30.5,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context) * 3.6,
                                        right:
                                            AppDimensions.height10(context) * 8.9,
                                        top: AppDimensions.height10(context) * 3.4),
                                    child: Text(
                                      'Title',
                                      style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff828282),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Container(
                                // height: AppDimensions.height10(context) * 2.4,
                                // width: AppDimensions.width10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                // color: Colors.amber,
                                margin: EdgeInsets.only(

                                    left: AppDimensions.width10(context) * 3.6,
                                    right: AppDimensions.width10(context) * 9.0,
                                    top: AppDimensions.height10(context) * 0.3),
                                child: Column(
                                  children: [
                                    Text(
                                      inspirationDetails['inspiration']['title'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.font10(context) * 1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                            inspirationDetails['inspiration']['inspirationId'] !=
                                        2 &&
                                    inspirationDetails['inspiration']
                                            ['destinationLink']
                                        .toString()
                                        .isNotEmpty
                                ? Column(
                                    children: [
                                      if (inspirationDetails['inspiration']
                                              ['inspirationId'] ==
                                          3) ...[
                                        AnimatedScaleButton(
                                          onTap: () async {
                                            String url =
                                                inspirationDetails['inspiration']
                                                    ['destinationLink'];
                                            if (!url.startsWith("https://")) {
                                              url = "https://$url";
                                            }
                                            FlutterWebBrowser.openWebPage(
                                              url: url,
                                              customTabsOptions:
                                                  const CustomTabsOptions(
                                                colorScheme:
                                                    CustomTabsColorScheme.dark,
                                                shareState: CustomTabsShareState.on,
                                                instantAppsEnabled: true,
                                                showTitle: true,
                                                urlBarHidingEnabled: true,
                                              ),
                                              safariVCOptions:
                                                  const SafariViewControllerOptions(
                                                barCollapsingEnabled: true,
                                                preferredBarTintColor: Colors.green,
                                                preferredControlTintColor:
                                                    Colors.amber,
                                                dismissButtonStyle:
                                                    SafariViewControllerDismissButtonStyle
                                                        .close,
                                                modalPresentationCapturesStatusBarAppearance:
                                                    true,
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height:
                                                AppDimensions.height10(context) *
                                                    3.0,
                                            width: AppDimensions.width10(context) *
                                                25.3,
                                            margin: EdgeInsets.only(
                                                right: AppDimensions.height10(
                                                        context) *
                                                    10.0,
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: const Color(0xFF282828)),
                                                borderRadius: BorderRadius.circular(
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0)),
                                            child: Center(
                                              child: Text(
                                                'Listen from this website',
                                                style: TextStyle(
                                                    fontSize: AppDimensions.font10(
                                                            context) *
                                                        1.8,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(0xFF646464)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ] else if (inspirationDetails['inspiration']
                                              ['inspirationId'] ==
                                          2) ...[
                                        Container(),
                                      ] else ...[
                                        AnimatedScaleButton(
                                          onTap: () async {
                                            String url =
                                                inspirationDetails['inspiration']
                                                    ['destinationLink'];
                                            if (!url.startsWith("https://")) {
                                              url = "https://$url";
                                            }

                                            FlutterWebBrowser.openWebPage(
                                              url: url,
                                              customTabsOptions:
                                                  const CustomTabsOptions(
                                                colorScheme:
                                                    CustomTabsColorScheme.dark,
                                                shareState: CustomTabsShareState.on,
                                                instantAppsEnabled: true,
                                                showTitle: true,
                                                urlBarHidingEnabled: true,
                                              ),
                                              safariVCOptions:
                                                  const SafariViewControllerOptions(
                                                barCollapsingEnabled: true,
                                                preferredBarTintColor: Colors.green,
                                                preferredControlTintColor:
                                                    Colors.amber,
                                                dismissButtonStyle:
                                                    SafariViewControllerDismissButtonStyle
                                                        .close,
                                                modalPresentationCapturesStatusBarAppearance:
                                                    true,
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height:
                                                AppDimensions.height10(context) *
                                                    3.0,
                                            width: AppDimensions.width10(context) *
                                                15.0,
                                            margin: EdgeInsets.only(
                                                right: AppDimensions.height10(
                                                        context) *
                                                    21.0,
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: const Color(0xFF282828)),
                                                borderRadius: BorderRadius.circular(
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0)),
                                            child: Center(
                                              child: Text(
                                                'Visit website',
                                                style: TextStyle(
                                                    fontSize: AppDimensions.font10(
                                                            context) *
                                                        1.8,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(0xFF646464)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ],
                                  )
                                : Container(),
                            Container(
                                // height: AppDimensions.height10(context) * 2.1,
                                // width: AppDimensions.width10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(

                                    left: AppDimensions.width10(context) * 3.6,
                                    right: AppDimensions.width10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 2.0),
                                child: Column(
                                  children: [
                                    if (inspirationDetails['inspiration']
                                            ['inspirationId'] ==
                                        1) ...[
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) * 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                                    ] else if (inspirationDetails['inspiration']
                                            ['inspirationId'] ==
                                        3) ...[
                                      Text(
                                        'Why is it inspirational to you',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) * 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                                    ] else if (inspirationDetails['inspiration']
                                            ['inspirationId'] ==
                                        4) ...[
                                      Text(
                                        'What it means to me',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) * 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                                    ] else if (inspirationDetails['inspiration']
                                            ['inspirationId'] ==
                                        2) ...[
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) * 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                                    ]
                                  ],
                                )),
                            Container(
                                // height: AppDimensions.height10(context) * 2.4,
                                // width: AppDimensions.width10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(

                                    left: AppDimensions.width10(context) * 3.6,
                                    right: AppDimensions.width10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 0.2),
                                child: Column(
                                  children: [
                                    Text(
                                      inspirationDetails['inspiration']
                                          ['description'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.font10(context) * 1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                            inspirationDetails['inspiration']['inspirationId'] == 4
                                ? Container(
                                    // height: AppDimensions.height10(context) * 2.1,
                                    // width: AppDimensions.width10(context) * 30.5,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context) * 3.6,
                                        right:
                                            AppDimensions.height10(context) * 8.9,
                                        top: AppDimensions.height10(context) * 2.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Content Author',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.font10(context) *
                                                      1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff828282)),
                                        ),
                                      ],
                                    ))
                                : Container(),
                            inspirationDetails['inspiration']['inspirationId'] == 4
                                ? Container(
                                    // height: AppDimensions.height10(context) * 2.4,
                                    // width: AppDimensions.width10(context) * 30.5,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context) * 3.6,
                                        right:
                                            AppDimensions.height10(context) * 8.9,
                                        top: AppDimensions.height10(context) * 0.2),
                                    child: Column(
                                      children: [
                                        Text(
                                          inspirationDetails['inspiration']
                                              ['author'],
                                          style: TextStyle(
                                              height: 1.5,
                                              color: const Color(0xFF282828),
                                              fontSize:
                                                  AppDimensions.font10(context) *
                                                      1.6,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ))
                                : Container(),
                            inspirationDetails['inspiration']['hashTags'].length !=
                                    0
                                ? Container(
                                    height: AppDimensions.height10(context) * 2.1,
                                    width: AppDimensions.width10(context) * 30.5,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context) * 3.6,
                                        right:
                                            AppDimensions.height10(context) * 8.9,
                                        top: AppDimensions.height10(context) * 2.0),
                                    child: Text(
                                      'Tags',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) * 1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff828282)),
                                    ),
                                  )
                                : Container(),
                            inspirationDetails['inspiration']['hashTags'].length !=
                                    0
                                ? Container(
                                    // height: AppDimensions.height10(context) * 2.4,
                                    // width: AppDimensions.width10(context) * 30.5,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context) * 3.6,
                                        right:
                                            AppDimensions.height10(context) * 8.9,
                                        top: AppDimensions.height10(context) * 0.2),
                                    child: Text(
                                      tags
                                          .toString()
                                          .replaceAll('[', '')
                                          .replaceAll(']', '')
                                          .replaceAll('"', ''),
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.font10(context) * 1.6,
                                          fontWeight: FontWeight.w500),
                                    ))
                                : Container(),
                            Container(
                              height: AppDimensions.height10(context) * 2.1,
                              width: AppDimensions.width10(context) * 30.5,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 3.6,
                                  bottom: AppDimensions.height10(context) * 0.5,
                                  right: AppDimensions.width10(context) * 8.9,
                                  top: AppDimensions.height10(context) * 2.0),
                              child: Text(
                                'Attached goals',
                                style: TextStyle(
                                    fontSize: AppDimensions.font10(context) * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff828282)),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const inspiraton_goals(
                                      update: true,
                                      data_saved: true,
                                      context: false,
                                      note: false,
                                      route: 'details',
                                    )));
                              },
                              child: Container(
                                height: AppDimensions.height10(context) * 6.0,
                                width: AppDimensions.width10(context) * 37.5,
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10(context) * 1.0,

                                    left: AppDimensions.width10(context) * 2.2,
                                    right: AppDimensions.width10(context) * 1.7,
                                    top: AppDimensions.height10(context) * 0.5),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFBFBFB),
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 2.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: AppDimensions.width10(context) * 23.9,
                                      height: AppDimensions.height10(context) * 2.2,
                                      margin: EdgeInsets.only(
                                        left:
                                            AppDimensions.height10(context) * 1.99,
                                      ),
                                      child: Text(
                                        '${inspirationDetails['inspiration']['userGoalId'].length} impacted goals',
                                        style: TextStyle(
                                          color: const Color(0xFF646464),
                                          fontSize:
                                              AppDimensions.font10(context) * 1.8,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: AppDimensions.width10(context) *
                                                2.391),
                                        child: Text(
                                          'View',
                                          style: TextStyle(
                                              color: const Color(0xFF437296),
                                              fontWeight: FontWeight.w700,
                                              decoration: TextDecoration.underline,
                                              decorationThickness:
                                                  AppDimensions.height10(context) *
                                                      0.2,
                                              fontSize:
                                                  AppDimensions.font10(context) *
                                                      1.4),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
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
