import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/app_dimensions.dart';

class veiw_details extends StatefulWidget {
  const veiw_details({
    super.key,
  });

  @override
  State<veiw_details> createState() => _veiw_detailsState();
}

class _veiw_detailsState extends State<veiw_details> {
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

        print(inspirationDetails['inspiration']['title']);
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
    return Scaffold(
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
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
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
                                4
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
                          width: AppDimensions.height10(context) * 34.7,
                          height: AppDimensions.height10(context) * 36.188,
                          margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 12.0,
                            left: AppDimensions.height10(context) * 3.4,
                            right: AppDimensions.height10(context) * 3.4,
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(File(
                                      inspirationDetails['inspiration']
                                          ['file'])),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ] else if (inspirationDetails['inspiration']
                            ['inspirationId'] ==
                        2) ...[
                      Container(
                        width: double.infinity,
                        // color: Colors.amber,
                        child: Container(
                          width: AppDimensions.height10(context) * 37.7,
                          height: AppDimensions.height10(context) * 24.7,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 11.50,
                            left: AppDimensions.height10(context) * 1.8,
                            right: AppDimensions.height10(context) * 1.8,
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
                        // width: AppDimensions.height10(context) * 41.4,
                        // margin: EdgeInsets.only(bottom: AppDimensions.height10(context) * 20.0),
                        height: AppDimensions.height10(context) * 44.5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/video_image.webp'),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: SizedBox(
                            width: AppDimensions.height10(context) * 8.6,
                            height: AppDimensions.height10(context) * 8.6,
                            child:
                                Image.asset('assets/images/play_button.webp'),
                          ),
                        ),
                      ),
                    ] else if (inspirationDetails['inspiration']
                            ['inspirationId'] ==
                        4) ...[
                      Container(
                        // width: AppDimensions.height10(context) * 34.7,
                        height: AppDimensions.height10(context) * 52.5,

                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                              colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)]),
                        ),
                        child: Center(
                          child: Text(
                            inspirationDetails['inspiration']['description'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: AppDimensions.height10(context) * 0.15,
                                fontSize: AppDimensions.height10(context) * 2.4,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFFFFFF)),
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
                    child: Container(
                      // height: widget.type_switch == 3
                      //     ? AppDimensions.height10(context) * 70.2
                      //     : widget.type_switch == 1
                      //         ? AppDimensions.height10(context) * 38.465
                      //         : AppDimensions.height10(context) * 60.2,
                      child: Column(
                        children: [
                          Container(
                            height: AppDimensions.height10(context) * 2.1,
                            width: AppDimensions.height10(context) * 30.5,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 3.6,
                                right: AppDimensions.height10(context) * 8.9,
                                top: AppDimensions.height10(context) * 3.4),
                            child: Text(
                              'Title',
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff828282),
                              ),
                            ),
                          ),
                          Container(
                              // height: AppDimensions.height10(context) * 2.4,
                              // width: AppDimensions.height10(context) * 30.5,
                              alignment: Alignment.centerLeft,
                              // color: Colors.amber,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 3.6,
                                  right: AppDimensions.height10(context) * 9.0,
                                  top: AppDimensions.height10(context) * 0.3),
                              child: Column(
                                children: [
                                  if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      1) ...[
                                    Text(
                                      inspirationDetails['inspiration']
                                          ['title'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ] else if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      2) ...[
                                    Text(
                                      inspirationDetails['inspiration']
                                          ['title'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ] else if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      4) ...[
                                    Text(
                                      inspirationDetails['inspiration']
                                          ['title'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ] else if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      3) ...[
                                    Text(
                                      inspirationDetails['inspiration']
                                          ['title'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ]
                                ],
                              )),
                          Column(
                            children: [
                              if (inspirationDetails['inspiration']
                                      ['inspirationId'] ==
                                  3) ...[
                                AnimatedScaleButton(
                                  onTap: () async {
                                    var url = inspirationDetails['inspiration']
                                        ['destinationLink'];
                                    if (await canLaunchUrlString(url)) {
                                      await launchUrlString(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 3.0,
                                    width:
                                        AppDimensions.height10(context) * 25.3,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10(context) *
                                            10.0,
                                        top: AppDimensions.height10(context) *
                                            1.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFF282828)),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0)),
                                    child: Center(
                                      child: Text(
                                        'Listen from this website',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
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
                                  4) ...[
                                Container(),
                              ] else ...[
                                AnimatedScaleButton(
                                  onTap: () async {
                                    var url = inspirationDetails['inspiration']
                                        ['destinationLink'];
                                    if (await canLaunchUrlString(url)) {
                                      await launchUrlString(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 3.0,
                                    width:
                                        AppDimensions.height10(context) * 15.0,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10(context) *
                                            21.0,
                                        top: AppDimensions.height10(context) *
                                            1.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFF282828)),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0)),
                                    child: Center(
                                      child: Text(
                                        'Visit website',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
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
                          ),
                          Container(
                              // height: AppDimensions.height10(context) * 2.1,
                              // width: AppDimensions.height10(context) * 30.5,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 3.6,
                                  right: AppDimensions.height10(context) * 8.9,
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
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff828282)),
                                    ),
                                  ] else if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      2) ...[
                                    Text(
                                      'Why is it inspirational to you',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
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
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff828282)),
                                    ),
                                  ] else if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      3) ...[
                                    Text(
                                      'Description',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff828282)),
                                    ),
                                  ]
                                ],
                              )),
                          Container(
                              // height: AppDimensions.height10(context) * 2.4,
                              // width: AppDimensions.height10(context) * 30.5,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 3.6,
                                  right: AppDimensions.height10(context) * 8.9,
                                  top: AppDimensions.height10(context) * 0.2),
                              child: Column(
                                children: [
                                  if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      1) ...[
                                    Text(
                                      inspirationDetails['inspiration']
                                          ['description'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ] else if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      2) ...[
                                    Text(
                                      inspirationDetails['inspiration']
                                          ['description'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ] else if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      3) ...[
                                    Text(
                                      inspirationDetails['inspiration']
                                          ['description'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ] else if (inspirationDetails['inspiration']
                                          ['inspirationId'] ==
                                      4) ...[
                                    Text(
                                      inspirationDetails['inspiration']
                                          ['description'],
                                      style: TextStyle(
                                          height: 1.5,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ]
                                ],
                              )),
                          Container(
                            height: AppDimensions.height10(context) * 2.1,
                            width: AppDimensions.height10(context) * 30.5,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 3.6,
                                right: AppDimensions.height10(context) * 8.9,
                                top: AppDimensions.height10(context) * 2.0),
                            child: Text(
                              'Tags',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ),
                          Container(
                              // height: AppDimensions.height10(context) * 2.4,
                              // width: AppDimensions.height10(context) * 30.5,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 3.6,
                                  right: AppDimensions.height10(context) * 8.9,
                                  top: AppDimensions.height10(context) * 0.2),
                              child: Text(
                                inspirationDetails['inspiration']['hashTags']
                                    .toString()
                                    .replaceAll('[', '')
                                    .replaceAll(']', ''),
                                style: TextStyle(
                                    height: 1.5,
                                    color: const Color(0xFF282828),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500),
                              )),
                          Container(
                            height: AppDimensions.height10(context) * 2.1,
                            width: AppDimensions.height10(context) * 30.5,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 3.6,
                                right: AppDimensions.height10(context) * 8.9,
                                top: AppDimensions.height10(context) * 2.0),
                            child: Text(
                              'Attached goals',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: AppDimensions.height10(context) * 6.0,
                              width: AppDimensions.height10(context) * 37.5,
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10(context) * 1.0,
                                  left: AppDimensions.height10(context) * 2.2,
                                  right: AppDimensions.height10(context) * 1.7,
                                  top: AppDimensions.height10(context) * 0.5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: const Color(0xFF464646)),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 23.9,
                                    height:
                                        AppDimensions.height10(context) * 2.2,
                                    margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.99,
                                    ),
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          '${inspirationDetails['inspiration']['userGoalId'].length} impacted goals',
                                          style: TextStyle(
                                            color: const Color(0xFF646464),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.8,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ),
                                  Container(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  2.391),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.webp',
                                          //width: AppDimensions.height10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          color: const Color(0xFF646464),
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          : const Center(
              child: SpinKitFadingCircle(
                color: Color(0xFFB1B8FF),
                size: 80,
              ),
            ),
    );
  }
}
