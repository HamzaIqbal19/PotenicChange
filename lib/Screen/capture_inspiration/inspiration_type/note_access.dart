import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_type.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/fading.dart';
import '../../../utils/app_dimensions.dart';
import '../capture_inpirations_goals.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class note_info extends StatefulWidget {
  final int type_switch;
  final bool note_saved;

  const note_info(
      {super.key, required this.note_saved, required this.type_switch});

  @override
  State<note_info> createState() => _note_infoState();
}

class _note_infoState extends State<note_info> {
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
        print("1212312312321321");
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
    bool link_state = false;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffC4C4C4),
      ),
      bottomNavigationBar: BottomAppBar(
          color: const Color(0xffC4C4C4),
          shape: const CircularNotchedRectangle(),
          child: Container(
            //  height: AppDimensions.height10(context) * 84.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Container(
                  // width: AppDimensions.height10(context) * 41.1,
                  height: AppDimensions.height10(context) * 5.1,
                  // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 5.4),
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5).withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              AppDimensions.height10(context) * 1.0),
                          topRight: Radius.circular(
                              AppDimensions.height10(context) * 1.0))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 2.2,
                          width: AppDimensions.height10(context) * 3.3,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10(context) * 4.9),
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const inspiration_type()));
                              final SharedPreferences prefs = await _prefs;
                              var remove = prefs.remove('ImageLink');
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff007AFF)),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.height10(context) * 23.1,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Create',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff282828)),
                                  ),
                                  if (widget.type_switch == 1) ...[
                                    Text(
                                      ' note inspiration',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff282828)),
                                    ),
                                  ] else if (widget.type_switch == 2) ...[
                                    Text(
                                      ' inspiration content link',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff282828)),
                                    )
                                  ] else if (widget.type_switch == 3) ...[
                                    Text(
                                      ' inspiration video link',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff282828)),
                                    )
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () async {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const updatedLandingPage(
                                        delete: false, is_Updated: false)));
                            Navigator.push(context,
                                FadePageRoute(page: const inspiration_type()));
                            final SharedPreferences prefs = await _prefs;
                            var remove = prefs.remove('ImageLink');
                          },
                          child: Container(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.height10(context) * 4.3,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 4.9),
                            child: Text(
                              'Create',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: widget.note_saved
                                      ? const Color(0xff007AFF)
                                      : const Color(0xff007AFF)
                                          .withOpacity(0.4)),
                            ),
                          ),
                        )
                      ]),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: AppDimensions.height10(context) * 79.7,
                    width: double.infinity,
                    color: Colors.white,
                    child: Loading == false
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 3.2),
                                child: Column(children: [
                                  if (widget.type_switch == 3) ...[
                                    Text(
                                      'Video Destination Link',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff828282)),
                                    ),
                                  ] else if (widget.type_switch == 2) ...[
                                    Text(
                                      'Content Destination Link',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff828282)),
                                    ),
                                  ] else ...[
                                    Text(
                                      'Title',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff828282)),
                                    ),
                                  ],
                                ]),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                // height: widget.note_saved
                                //     ? AppDimensions.height10(context) * 4.8
                                //     : AppDimensions.height10(context) * 2.4,
                                width: widget.note_saved
                                    ? AppDimensions.height10(context) * 37.5
                                    : AppDimensions.height10(context) * 30.5,
                                //color: Colors.amber,
                                margin: EdgeInsets.only(
                                  left: widget.note_saved
                                      ? AppDimensions.height10(context) * 2.0
                                      : AppDimensions.height10(context) * 0,
                                  right: widget.note_saved
                                      ? AppDimensions.height10(context) * 1.9
                                      : AppDimensions.height10(context) * 10.0,
                                  // top: widget.note_saved
                                  //     ? AppDimensions.height10(context) * 0
                                  //     : AppDimensions.height10(context) * 1.0
                                ),
                                child: widget.note_saved
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (widget.type_switch == 1) ...[
                                            Text(
                                              inspirationDetails['inspiration']
                                                  ['title'],
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF464646)),
                                            ),
                                          ] else if (widget.type_switch ==
                                              2) ...[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  inspirationDetails[
                                                          'inspiration']
                                                      ['destinationLink'],
                                                  style: TextStyle(
                                                      height: 1.5,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.7,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFF464646)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.45),
                                                  child: Container(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.5,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.5,
                                                    margin: EdgeInsets.only(
                                                        left: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.0),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black,
                                                    ),
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                      size: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ] else if (widget.type_switch ==
                                              3) ...[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  inspirationDetails[
                                                          'inspiration']
                                                      ['destinationLink'],
                                                  style: TextStyle(
                                                      height: 1.5,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.7,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFF464646)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.45),
                                                  child: Container(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.5,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.5,
                                                    margin: EdgeInsets.only(
                                                        left: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.0),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black,
                                                    ),
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                      size: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ]
                                        ],
                                      )
                                    : TextField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.7,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff282828)),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                AppDimensions.height10(context) *
                                                    1.5,
                                                AppDimensions.height10(context) *
                                                    0.4,
                                                AppDimensions.height10(context) *
                                                    0.2,
                                                0),
                                            hintText:
                                                'Give your inspiration a title',
                                            hintStyle: TextStyle(
                                                fontSize: AppDimensions.height10(
                                                        context) *
                                                    1.7,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff828282)),
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent))),
                                      ),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    // right: AppDimensions.height10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 3.9),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (widget.type_switch == 1) ...[
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                                    ] else if (widget.type_switch == 2) ...[
                                      Text(
                                        'Why is it inspirational to you',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                                    ] else if (widget.type_switch == 3) ...[
                                      Text(
                                        'What it means to me',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                              Container(
                                // height: widget.note_saved
                                //     ? AppDimensions.height10(context) * 39.0
                                //     : AppDimensions.height10(context) * 2.4,

                                width: AppDimensions.height10(context) * 30.5,
                                // color: Colors.amber,
                                margin: EdgeInsets.only(
                                  left: widget.note_saved
                                      ? AppDimensions.height10(context) * 2.0
                                      : AppDimensions.height10(context) * 0,
                                  // right: widget.note_saved
                                  //     ? AppDimensions.height10(context) * 8.9
                                  //     : AppDimensions.height10(context) * 10.0,
                                  // top: widget.note_saved
                                  //     ? AppDimensions.height10(context) * 0
                                  //     : AppDimensions.height10(context) * 1.0
                                ),
                                child: widget.note_saved
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (widget.type_switch == 1) ...[
                                            Text(
                                              inspirationDetails['inspiration']
                                                  ['description'],
                                              // textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF464646)),
                                            ),
                                          ] else if (widget.type_switch ==
                                              2) ...[
                                            Text(
                                              inspirationDetails['inspiration']
                                                  ['description'],
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF464646)),
                                            ),
                                          ] else if (widget.type_switch ==
                                              3) ...[
                                            Text(
                                              inspirationDetails['inspiration']
                                                  ['description'],
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF464646)),
                                            ),
                                          ]
                                        ],
                                      )
                                    : SizedBox(
                                        height: widget.note_saved
                                            ? AppDimensions.height10(context) *
                                                39.0
                                            : AppDimensions.height10(context) *
                                                2.4,
                                        width: AppDimensions.height10(context) *
                                            37.5,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff282828)),
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.fromLTRB(
                                                  AppDimensions.height10(context) *
                                                      1.5,
                                                  AppDimensions.height10(context) *
                                                      0.4,
                                                  0,
                                                  0),
                                              hintText:
                                                  'Say more about this inspiration ',
                                              hintStyle: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff828282)),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent)),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.transparent))),
                                        ),
                                      ),
                              ),
                              if (widget.type_switch == 2) ...[
                                Container(
                                  height: AppDimensions.height10(context) * 2.1,
                                  width: AppDimensions.height10(context) * 30.5,
                                  margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.height10(context) * 2.0,
                                      right:
                                          AppDimensions.height10(context) * 8.9,
                                      top: AppDimensions.height10(context) *
                                          3.0),
                                  child: Text(
                                    'Content Author',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.5,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff828282)),
                                  ),
                                )
                              ] else ...[
                                Container()
                              ],
                              if (widget.type_switch == 2) ...[
                                Container(
                                  height: AppDimensions.height10(context) * 2.4,
                                  width: AppDimensions.height10(context) * 30.5,
                                  //  color: Colors.grey,
                                  margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 8.9,
                                  ),
                                  child: Text(
                                    inspirationDetails['inspiration']['file'],
                                    style: TextStyle(
                                        color: const Color(0xFF282828),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                              Container(
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 3.9),
                                child: Text(
                                  'Tags',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.4,
                                width: AppDimensions.height10(context) * 30.5,
                                margin: EdgeInsets.only(
                                    left: widget.note_saved
                                        ? AppDimensions.height10(context) * 2.0
                                        : AppDimensions.height10(context) * 0,
                                    right: widget.note_saved
                                        ? AppDimensions.height10(context) * 8.9
                                        : AppDimensions.height10(context) *
                                            10.0,
                                    top: widget.note_saved
                                        ? AppDimensions.height10(context) * 0
                                        : AppDimensions.height10(context) *
                                            1.0),
                                child: widget.note_saved
                                    ? Text(
                                        inspirationDetails['inspiration']
                                                ['hashTags']
                                            .toString()
                                            .replaceAll('[', '')
                                            .replaceAll(']', ''),
                                        style: TextStyle(
                                            color: const Color(0xFF282828),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.7,
                                            fontWeight: FontWeight.w500),
                                      )
                                    : TextField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff282828)),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                AppDimensions.height10(context) *
                                                    1.6,
                                                AppDimensions.height10(context) *
                                                    0.4,
                                                0,
                                                0),
                                            hintText: 'Add #hashtag',
                                            hintStyle: TextStyle(
                                                fontSize: AppDimensions.height10(
                                                        context) *
                                                    1.7,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff828282)),
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent))),
                                      ),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 3.9),
                                child: Text(
                                  'Attached goals',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ),
                              AnimatedScaleButton(
                                onTap: () {
                                  widget.note_saved
                                      ? Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const inspiration_landing(
                                            is_Updated: false,
                                          )))
                                      : Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const inspiraton_goals(
                                            data_saved: false,
                                            route: 'note_create',
                                            context: false,
                                            note: false,
                                          )));
                                },
                                child: Container(
                                  height: AppDimensions.height10(context) * 6.0,
                                  width: AppDimensions.height10(context) * 37.5,
                                  margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    right:
                                        AppDimensions.height10(context) * 1.9,
                                    // bottom: AppDimensions.height10(context) * 1.0
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFF464646)),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: AppDimensions.height10(context) *
                                            23.9,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                1.99),
                                        child: Text(
                                          '${inspirationDetails['inspiration']['userGoalId'].length} impacted goals',
                                          style: TextStyle(
                                            color: const Color(0xFF646464),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.8,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.39,
                                          margin: EdgeInsets.only(
                                              right: AppDimensions.height10(
                                                      context) *
                                                  2.391),
                                          child: Image.asset(
                                            'assets/images/BTN Back.webp',
                                            //width: AppDimensions.height10(context) * 2.6,
                                            //height: AppDimensions.height10(context) * 2.6,
                                            color: const Color(0xFF646464),
                                            fit: BoxFit.cover,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom ==
                                        0
                                    ? AppDimensions.height10(context) * 5
                                    : AppDimensions.height10(context) * 23.0,
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
                )
              ]),
            ),
          )),
    );
  }
}

TextEditingController title = TextEditingController();
TextEditingController statement = TextEditingController();
TextEditingController hastags = TextEditingController();

class noteSaved extends StatefulWidget {
  const noteSaved({super.key});

  @override
  State<noteSaved> createState() => _noteSavedState();
}

class _noteSavedState extends State<noteSaved> {
  List selectedGoals = [];
  List<String> tagList = [];

  void getInspiration() async {
    final SharedPreferences prefs = await _prefs;
    final encodedGoals = prefs.getString('selected_goals_inspiration');
    if (encodedGoals != null) {
      List decodedGoals = List.from(json.decode(encodedGoals));
      setState(() {
        selectedGoals = decodedGoals;
      });
      print('SelectedGoals==============================$selectedGoals');
    }
  }

  @override
  void initState() {
    super.initState();
    getInspiration();
  }

  @override
  Widget build(BuildContext context) {
    bool link_state = false;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffC4C4C4),
      ),
      bottomNavigationBar: BottomAppBar(
          color: const Color(0xffC4C4C4),
          shape: const CircularNotchedRectangle(),
          child: Container(
            //  height: AppDimensions.height10(context) * 84.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: true,
              child: Column(children: [
                Container(
                  // width: AppDimensions.height10(context) * 41.1,
                  height: AppDimensions.height10(context) * 5.1,
                  // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 5.4),
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5).withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              AppDimensions.height10(context) * 1.0),
                          topRight: Radius.circular(
                              AppDimensions.height10(context) * 1.0))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 2.2,
                          width: AppDimensions.height10(context) * 3.3,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10(context) * 4.9),
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const inspiration_type()));
                              title.clear();
                              tagList.clear();
                              hastags.clear();
                              statement.clear();
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const inspiration_type()));
                              final SharedPreferences prefs = await _prefs;
                              var remove = prefs.remove('ImageLink');
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff007AFF)),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.height10(context) * 23.1,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Create note inspiration',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff282828)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            if (title.text.toString().isNotEmpty &&
                                statement.text.toString().isNotEmpty) {
                              InspirationApi()
                                  .addInspiration(
                                      2,
                                      " ",
                                      title.text.toString(),
                                      tagList,
                                      " ",
                                      true,
                                      statement.text.toString(),
                                      selectedGoals)
                                  .then((response) async {
                                if (response.length != 0) {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const updatedLandingPage(
                                              delete: false,
                                              is_Updated: false)));
                                  print('----------------');
                                  title.clear();
                                  tagList.clear();
                                  hastags.clear();
                                  statement.clear();
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const updatedLandingPage(
                                        delete: false,
                                        is_Updated: true,
                                      )));
                                  final SharedPreferences prefs = await _prefs;
                                  var remove = prefs.remove('ImageLink');

                                  print(response);
                                }

                                // return null;
                              });
                            }
                          },
                          child: Container(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.height10(context) * 4.3,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 4.9),
                            child: Text(
                              'Create',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: title.text.toString().isNotEmpty &&
                                          statement.text.toString().isNotEmpty
                                      ? const Color(0xff007AFF)
                                      : const Color(0xff007AFF)
                                          .withOpacity(0.5)),
                            ),
                          ),
                        )
                      ]),
                ),
                Container(
                  height: AppDimensions.height10(context) * 79.7,
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 2.1,
                          width: AppDimensions.height10(context) * 30.5,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 2.0,
                              right: AppDimensions.height10(context) * 8.9,
                              top: AppDimensions.height10(context) * 3.2),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ]),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          // height: AppDimensions.height10(context) * 2.4,
                          //width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 0.6,
                          ),
                          child: TextFormField(
                            controller: title,
                            textAlignVertical: TextAlignVertical.center,
                            maxLines: null,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.7,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff282828)),
                            decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                    AppDimensions.height10(context) * 1.5,
                                    AppDimensions.height10(context) * 0.4,
                                    AppDimensions.height10(context) * 4,
                                    0),
                                hintText: 'Give your inspiration a title',
                                hintStyle: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff828282)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 2.1,
                          width: AppDimensions.height10(context) * 30.5,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 2.0,
                              top: AppDimensions.height10(context) * 3.9),
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.5,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff828282)),
                          ),
                        ),
                        Container(
                          //width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 2.0,
                          ),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.top,
                            controller: statement,
                            maxLines: null,
                            minLines: null,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.7,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff282828)),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    right: AppDimensions.height10(context) * 4),
                                isCollapsed: true,
                                hintText: 'Say more about this inspiration ',
                                hintStyle: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff828282)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 2.1,
                          width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 2.0,
                              right: AppDimensions.height10(context) * 8.9,
                              top: AppDimensions.height10(context) * 3.9),
                          child: Text(
                            'Tags (optional)',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.5,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff828282)),
                          ),
                        ),
                        Container(
                          // height: AppDimensions.height10(context) * 2.4,
                          // width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 0.6,
                            right: AppDimensions.height10(context) * 10.0,
                            // top: AppDimensions.height10(context) * 1.0
                          ),
                          child: TextFormField(
                            controller: hastags,
                            maxLines: null,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (text) {
                              List<String> words = text.split(' ');

                              // Filter the words to find the ones that start with '#'
                              List<String> tags = words
                                  .where((word) => word.startsWith('#'))
                                  .toList();

                              // Add the unique tags to the tagsList
                              tagList.clear();

                              // Add the unique tags to the tagsList
                              tagList.addAll(tags.toSet());

                              print(tagList);
                            },
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.7,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff282828)),
                            decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                    AppDimensions.height10(context) * 1.6,
                                    AppDimensions.height10(context) * 0.4,
                                    0,
                                    0),
                                hintText: 'Add #hashtag',
                                hintStyle: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff828282)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 2.1,
                          width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 2.0,
                              right: AppDimensions.height10(context) * 8.9,
                              top: AppDimensions.height10(context) * 3.9),
                          child: Text(
                            'Attached goals',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.5,
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
                                  data_saved: false,
                                  route: 'note_saved',
                                  context: false,
                                  note: false,
                                )));
                          },
                          child: Container(
                            height: AppDimensions.height10(context) * 6.0,
                            width: AppDimensions.height10(context) * 37.5,
                            margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 2.0,
                              right: AppDimensions.height10(context) * 1.9,
                              // bottom: AppDimensions.height10(context) * 1.0
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xFF464646)),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0)),
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
                                    '${selectedGoals.length} impacted goals',
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
                                      //width: AppDimensions.height10(context) * 2.6,
                                      //height: AppDimensions.height10(context) * 2.6,
                                      color: const Color(0xFF646464),
                                      fit: BoxFit.cover,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).viewInsets.bottom == 0
                //       ? AppDimensions.height10(context) * 0
                //       : AppDimensions.height10(context) * 23.0,
                // )
              ]),
            ),
          )),
    );
  }
}
