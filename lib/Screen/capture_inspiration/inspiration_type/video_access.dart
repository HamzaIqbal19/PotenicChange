// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_type.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/fading.dart';
import '../../../utils/app_dimensions.dart';
import '../capture_inpirations_goals.dart';
import 'note_access.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
TextEditingController link = TextEditingController();
TextEditingController statement = TextEditingController();
TextEditingController hastags = TextEditingController();

class video_info extends StatefulWidget {
  final bool link_state;
  const video_info({super.key, required this.link_state});

  @override
  State<video_info> createState() => _video_infoState();
}

class _video_infoState extends State<video_info> {
  List selectedGoals = [];
  List<String> tagList = [];
  String? imageLink;

  void getImageLink() async {
    final SharedPreferences prefs = await _prefs;

    var imageLinked = prefs.getString('ImageLink');

    setState(() {
      imageLink = imageLinked;
    });
    print('---------------==============================$imageLink');

    link.text = imageLink!;
  }

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
    getImageLink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffC4C4C4),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: const Color(0xffC4C4C4),
          child: Container(
            //height: AppDimensions.height10(context) * 84.8,
            child: SingleChildScrollView(
              //reverse: true,
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
                              final SharedPreferences prefs = await _prefs;
                              var remove = prefs.remove('ImageLink');
                              link.clear();
                              statement.clear();
                              hastags.clear();
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const inspiration_type()));
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
                          child: Container(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.height10(context) * 22.9,
                            child: Center(
                              child: Text(
                                'Create inspiration video link',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.7,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff282828)),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            InspirationApi()
                                .addInspiration(
                                    3,
                                    " ",
                                    " ",
                                    tagList,
                                    link.text.toString(),
                                    true,
                                    statement.text.toString(),
                                    selectedGoals)
                                .then((response) async {
                              if (response.length != 0) {
                                print('----------------');
                                link.clear();
                                final SharedPreferences prefs = await _prefs;
                                var remove = prefs.remove('ImageLink');
                                statement.clear();
                                hastags.clear();
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const updatedLandingPage(
                                            delete: false, is_Updated: true)));
                                print(response);
                              }
                            });
                          },
                          child: Container(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.height10(context) * 4.3,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 4.0),
                            child: Text(
                              'Create',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff007AFF)),
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
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 2.1,
                          width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 2.0,
                              right: AppDimensions.height10(context) * 8.9,
                              top: AppDimensions.height10(context) * 3.2),
                          child: Text(
                            'Video Destination Link',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.5,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff828282)),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              // height: AppDimensions.height10(context) * 2.4,
                              width: AppDimensions.height10(context) * 30.5,
                              margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.5,
                                right: AppDimensions.height10(context) * 1.0,
                                //top: AppDimensions.height10(context) * 1.0
                              ),
                              child: TextFormField(
                                onEditingComplete: () {
                                  setState(() {
                                    // link_state = true;
                                  });
                                },
                                controller: link,
                                maxLines: null,
                                minLines: null,
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff282828)),
                                decoration: InputDecoration(
                                    isCollapsed: true,
                                    contentPadding: EdgeInsets.fromLTRB(
                                        AppDimensions.height10(context) * 1.4,
                                        AppDimensions.height10(context) * 0,
                                        0,
                                        0),
                                    hintText: 'Add a link',
                                    hintStyle: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff828282)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent))),
                              ),
                            ),
                            widget.link_state
                                ? SizedBox(
                                    // width: AppDimensions.height10(context) * 7,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AnimatedScaleButton(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: const link_set(
                                                  route: 'video',
                                                )));
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                2.5,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.5,
                                            // margin: EdgeInsets.only(
                                            //     right: AppDimensions.height10(context) * 0.8),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: AppDimensions.height10(
                                                      context) *
                                                  2,
                                            ),
                                          ),
                                        ),
                                        AnimatedScaleButton(
                                          onTap: () {
                                            link.clear();
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                2.5,
                                            height: AppDimensions.height10(
                                                    context) *
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
                                              size: AppDimensions.height10(
                                                      context) *
                                                  1.8,
                                              // size: AppDimensions.height10(context) * 1,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : AnimatedScaleButton(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const link_set(
                                            route: 'video',
                                          )));
                                    },
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 2.5,
                                      height:
                                          AppDimensions.height10(context) * 2.5,
                                      // margin: EdgeInsets.only(
                                      //     right: AppDimensions.height10(context) * 0.8),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size:
                                            AppDimensions.height10(context) * 2,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 2.1,
                          width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 2.0,
                              right: AppDimensions.height10(context) * 8.9,
                              top: AppDimensions.height10(context) * 3.9),
                          child: Text(
                            'Why is it inspirational to you',
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
                            left: AppDimensions.height10(context) * 1.6,
                            // right: AppDimensions.height10(context) * 10.0,
                            // top: AppDimensions.height10(context) * 1.0
                          ),
                          child: TextField(
                            controller: statement,
                            maxLines: null,
                            minLines: null,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.7,
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
                            'Tags',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.5,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff828282)),
                          ),
                        ),
                        Container(
                          //height: AppDimensions.height10(context) * 2.4,
                          //width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.6,

                            //top: AppDimensions.height10(context) * 1.0
                          ),
                          child: TextField(
                            controller: hastags,
                            maxLines: null,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (text) {
                              List<String> words = text.split(' ');

                              List<String> tags = words
                                  .where((word) => word.startsWith('#'))
                                  .toList();

                              tagList.clear();

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
                                    AppDimensions.height10(context) * 1.5,
                                    0,
                                    AppDimensions.height10(context) * 4,
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
                                  route: 'video_create',
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
              ]),
            ),
          )),
    );
  }
}
