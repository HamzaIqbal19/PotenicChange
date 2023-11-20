// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_type.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/fading.dart';
import '../../../utils/app_dimensions.dart';
import '../capture_inpirations_goals.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
TextEditingController link = TextEditingController();
TextEditingController statement = TextEditingController();
TextEditingController hastags = TextEditingController();
TextEditingController title = TextEditingController();

class video_info extends StatefulWidget {
  final bool link_state;
  const video_info({super.key, required this.link_state});

  @override
  State<video_info> createState() => _video_infoState();
}

class _video_infoState extends State<video_info> {
  List selectedGoals = [];
  List<String> tagList = [];
  List<String> stringTagList = [];
  bool bt_enable = true;
  String? imageLink;

  void getImageLink() async {
    final SharedPreferences prefs = await _prefs;

    var imageLinked = prefs.getString('ImageLink');

    setState(() {
      imageLink = imageLinked;
    });

    if (prefs.getString('ImageLink').toString().isNotEmpty) {
      link.text = imageLink!;
    }
  }

  void getInspiration() async {
    final SharedPreferences prefs = await _prefs;
    final encodedGoals = prefs.getString('selected_goals_inspiration');
    if (encodedGoals != null) {
      List decodedGoals = List.from(json.decode(encodedGoals));
      setState(() {
        selectedGoals = decodedGoals;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getInspiration();
    getImageLink();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: const Color(0xffC4C4C4),
              elevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: AppDimensions.height10(context) * 5.1,
              flexibleSpace: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.height10(context) * 1.5),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5).withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            AppDimensions.height10(context) * 1.0),
                        topRight: Radius.circular(
                            AppDimensions.height10(context) * 1.0))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedScaleButton(
                        onTap: () async {
                          final SharedPreferences prefs = await _prefs;
                          var remove = prefs.remove('ImageLink');
                          link.clear();
                          statement.clear();
                          hastags.clear();
                          title.clear();
                          Navigator.push(
                              context,
                              FadePageRouteReverse(
                                  page: const inspiration_type()));
                        },
                        child: Center(
                          child: Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.6,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff007AFF)),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: AppDimensions.width10(context) * 28.5,
                          child: Center(
                            child: Text(
                              'Create inspiration video link',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff282828)),
                            ),
                          ),
                        ),
                      ),
                      ValueListenableBuilder<TextEditingValue>(
                          valueListenable: title,
                          builder: (context, value, child) {
                            return ValueListenableBuilder<TextEditingValue>(
                                valueListenable: link,
                                builder: (context, value, child) {
                                  return ValueListenableBuilder<
                                          TextEditingValue>(
                                      valueListenable: statement,
                                      builder: (context, value, child) {
                                        return GestureDetector(
                                          onTap: () async {
                                            if (link.text
                                                    .toString()
                                                    .isNotEmpty &&
                                                statement.text
                                                    .toString()
                                                    .isNotEmpty &&
                                                title.text.isNotEmpty) {
                                              if (bt_enable == true) {
                                                setState(() {
                                                  bt_enable = false;
                                                });
                                              }
                                              InspirationApi()
                                                  .addInspiration(
                                                      3,
                                                      null,
                                                      title.text.toString(),
                                                      tagList,
                                                      '',
                                                      link.text.toString(),
                                                      true,
                                                      statement.text.toString(),
                                                      selectedGoals)
                                                  .then((response) async {
                                                if (response.length != 0) {
                                                  setState(() {
                                                    bt_enable = true;
                                                  });
                                                  link.clear();
                                                  statement.clear();
                                                  selectedGoals.clear();
                                                  tagList.clear();
                                                  title.clear();
                                                  final SharedPreferences
                                                      prefs = await _prefs;
                                                  var remove =
                                                      prefs.remove('ImageLink');
                                                  prefs.remove(
                                                      'inspiration_saved_route');
                                                  statement.clear();
                                                  hastags.clear();
                                                  Navigator.push(
                                                      context,
                                                      FadePageRoute(
                                                          page:
                                                              const updatedLandingPage(
                                                                  delete: false,
                                                                  is_Updated:
                                                                      false)));
                                                }
                                              });
                                            }

                                            final SharedPreferences prefs =
                                                await _prefs;
                                            prefs.remove(
                                                'inspiration_saved_route');
                                          },
                                          child: Container(
                                            // height:
                                            //     AppDimensions.height10(context) * 2.2,
                                            // width:
                                            //     AppDimensions.height10(context) * 6.1,
                                            child: bt_enable == false
                                                ? Center(
                                                    child: SpinKitThreeBounce(
                                                      color: const Color(
                                                          0xff007AFF),
                                                      // delay: Duration(milliseconds: 0),
                                                      size: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.6,
                                                    ),
                                                  )
                                                : Center(
                                                    child: Text(
                                                      'Create',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.6,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: link.text
                                                                      .toString()
                                                                      .isNotEmpty &&
                                                                  title.text
                                                                      .isNotEmpty &&
                                                                  statement.text
                                                                      .toString()
                                                                      .isNotEmpty
                                                              ? const Color(
                                                                  0xff007AFF)
                                                              : const Color(
                                                                      0xff007AFF)
                                                                  .withOpacity(
                                                                      0.5)),
                                                    ),
                                                  ),
                                          ),
                                        );
                                      });
                                });
                          })
                    ]),
              ),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: AppDimensions.height10(context) * 2.1,
                      width: AppDimensions.width10(context) * 30.5,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.0,
                          right: AppDimensions.width10(context) * 8.9,
                          top: AppDimensions.height10(context) * 3.9),
                      child: Text(
                        'Title',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.5,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      // height: AppDimensions.height10(context) * 2.4,

                      //width: AppDimensions.width10(context) * 30.5,
                      margin: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 0.6,
                      ),
                      child: TextFormField(
                        controller: title,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.7,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff282828)),
                        decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.fromLTRB(
                                AppDimensions.height10(context) * 1.5,
                                0,
                                AppDimensions.height10(context) * 4,
                                0),
                            hintText: 'Give your inspiration a title',
                            hintStyle: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.7,
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
                      width: AppDimensions.width10(context) * 30.5,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.0,
                          right: AppDimensions.width10(context) * 8.9,
                          top: AppDimensions.height10(context) * 3.2),
                      child: Text(
                        'Video Destination Link',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.5,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: AppDimensions.height10(context) * 2.4,
                          width: AppDimensions.width10(context) * 30.5,
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.5,
                            right: AppDimensions.width10(context) * 1.0,
                            //top: AppDimensions.height10(context) * 1.0
                          ),
                          child: TextFormField(
                            onEditingComplete: () {
                              setState(() {
                                // link_state = true;
                              });
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: link,
                            maxLines: null,
                            minLines: null,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.7,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff282828)),
                            decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                    AppDimensions.height10(context) * 0.9,
                                    AppDimensions.height10(context) * 0,
                                    0,
                                    0),
                                hintText: 'Add a link',
                                hintStyle: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.7,
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
                        SizedBox(width: AppDimensions.width10(context) * 2),
                        SizedBox(
                          // width: AppDimensions.width10(context) * 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedScaleButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: link_set(
                                        route: 'video',
                                        link: link.text,
                                      )));
                                },
                                child: Container(
                                  width: AppDimensions.width10(context) * 2.5,
                                  height: AppDimensions.height10(context) * 2.5,
                                  // margin: EdgeInsets.only(
                                  //     right: AppDimensions.width10(context) * 0.8),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: AppDimensions.height10(context) * 2,
                                  ),
                                ),
                              ),
                              link.text.isNotEmpty
                                  ? AnimatedScaleButton(
                                      onTap: () {
                                        link.clear();
                                      },
                                      child: Container(
                                        width: AppDimensions.width10(context) *
                                            2.5,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.5,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                0.85),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                          size:
                                              AppDimensions.height10(context) *
                                                  1.8,
                                          // size: AppDimensions.height10(context) * 1,
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: AppDimensions.height10(context) * 2.1,
                      width: AppDimensions.width10(context) * 30.5,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.0,
                          right: AppDimensions.width10(context) * 8.9,
                          top: AppDimensions.height10(context) * 3.9),
                      child: Text(
                        'Why is it inspirational to you',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.5,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                      ),
                    ),
                    Container(
                      // height: AppDimensions.height10(context) * 2.4,
                      // width: AppDimensions.width10(context) * 30.5,
                      margin: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 0.6,
                        // right: AppDimensions.width10(context) * 10.0,
                        // top: AppDimensions.height10(context) * 1.0
                      ),
                      child: TextField(
                        controller: statement,
                        maxLines: null,
                        minLines: null,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.7,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff282828)),
                        decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.fromLTRB(
                                AppDimensions.height10(context) * 1.5,
                                0,
                                AppDimensions.height10(context) * 4,
                                0),
                            hintText: 'Say more about this inspiration ',
                            hintStyle: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.7,
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
                      width: AppDimensions.width10(context) * 30.5,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.0,
                          right: AppDimensions.width10(context) * 8.9,
                          top: AppDimensions.height10(context) * 3.9),
                      child: Text(
                        'Tags (optional)',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.5,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                      ),
                    ),
                    Container(
                      //height: AppDimensions.height10(context) * 2.4,
                      //width: AppDimensions.width10(context) * 30.5,
                      margin: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 0.6,

                        //top: AppDimensions.height10(context) * 1.0
                      ),
                      child: TextField(
                          controller: hastags,
                          maxLines: null,
                          onTap: () {
                            if (hastags.text.isEmpty) {
                              hastags.text = '#';
                            }
                            hastags.selection = TextSelection.fromPosition(
                              TextPosition(offset: hastags.text.length),
                            );
                          },
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (text) {
                            List<String> words = text.split(' ');

                            List<String> tags = words
                                .where((word) => word.startsWith('#'))
                                .toList();

                            List<String> finalResult = tags
                                .map((tag) => '"${tag.replaceAll('#', '')}"')
                                .toList();

                            tagList.clear();

                            tagList.addAll(finalResult.toSet());
                          },
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.7,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff282828)),
                          decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.fromLTRB(
                                  AppDimensions.height10(context) * 1.5,
                                  0,
                                  AppDimensions.height10(context) * 4,
                                  0),
                              hintText: 'Add #hashtag',
                              hintStyle: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.7,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff828282)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                          inputFormatters: [
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                              if (newValue.text.isNotEmpty &&
                                  !newValue.text.startsWith('#')) {
                                return TextEditingValue(
                                  text: '#${newValue.text}',
                                  selection: TextSelection.collapsed(
                                      offset: newValue.text.length + 1),
                                );
                              }
                              return newValue;
                            }),
                          ]),
                    ),
                    Container(
                      height: AppDimensions.height10(context) * 2.1,
                      width: AppDimensions.width10(context) * 30.5,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.0,
                          right: AppDimensions.width10(context) * 8.9,
                          bottom: AppDimensions.height10(context) * 0.5,
                          top: AppDimensions.height10(context) * 3.9),
                      child: Text(
                        'Attached goals',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.5,
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
                              update: false,
                              data_saved: true,
                              route: 'video_create',
                              context: false,
                              note: true,
                            )));
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 6.0,
                        width: AppDimensions.width10(context) * 37.5,
                        margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.0,
                          right: AppDimensions.width10(context) * 1.9,
                        ),
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
                                  left: AppDimensions.height10(context) * 1.99),
                              child: Text(
                                '${selectedGoals.length} impacted goals',
                                style: TextStyle(
                                  color: const Color(0xFF646464),
                                  fontSize: AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    right:
                                        AppDimensions.width10(context) * 2.391),
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      color: const Color(0xFF437296),
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      decorationThickness:
                                          AppDimensions.height10(context) * 0.2,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.4),
                                ))
                          ],
                        ),
                      ),
                    ),
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? SizedBox(
                            height: AppDimensions.height10(context) * 4,
                          )
                        : SizedBox(
                            height: AppDimensions.height10(context) * 8,
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
