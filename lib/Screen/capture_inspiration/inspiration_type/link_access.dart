import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_dimensions.dart';
import '../capture_inpirations_goals.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class link_info extends StatefulWidget {
  const link_info({super.key});

  @override
  State<link_info> createState() => _link_infoState();
}

TextEditingController link = TextEditingController();
TextEditingController statement = TextEditingController();
TextEditingController author = TextEditingController();
TextEditingController hastags = TextEditingController();

class _link_infoState extends State<link_info> {
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
            //height: AppDimensions.height10(context) * 84.8,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(children: [
                Container(
                  // width: AppDimensions.height10(context) * 41.1,
                  height: AppDimensions.height10(context) * 5.1,
                  //margin: EdgeInsets.only(top: AppDimensions.height10(context) * 5.4),
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
                              right: AppDimensions.height10(context) * 4.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              link.clear();
                              statement.clear();
                              author.clear();
                              hastags.clear();
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
                            width: AppDimensions.height10(context) * 24.8,
                            child: Center(
                              child: Text(
                                'Create inspiration content link',
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
                            print('LINK----------------');
                            print(link.text.toString());
                            InspirationApi()
                                .addInspiration(
                                    4,
                                    author.text.toString(),
                                    " ",
                                    tagList,
                                    link.text.toString(),
                                    true,
                                    statement.text.toString(),
                                    selectedGoals)
                                .then((response) {
                              if (response.length != 0) {
                                print('----------------');
                                statement.clear();
                                author.clear();
                                hastags.clear();
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const note_info(
                                            note_saved: true, type_switch: 2)));

                                print(response);
                              }

                              // return null;
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 2.1,
                          width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 2.0,
                              right: AppDimensions.height10(context) * 8.9,
                              top: AppDimensions.height10(context) * 3.2),
                          child: Text(
                            'Content Destination Link',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.5,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff828282)),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: AppDimensions.height10(context) * 30.5,
                              margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.5,
                                right: AppDimensions.height10(context) * 5.0,
                                //top: AppDimensions.height10(context) * 1.0
                              ),
                              child: TextFormField(
                                controller: link,
                                scrollPadding: EdgeInsets.zero,
                                maxLines: null,
                                onEditingComplete: () {
                                  setState(() {
                                    link_state = true;
                                  });
                                },
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.7,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff282828)),
                                decoration: InputDecoration(
                                    isCollapsed: true,
                                    contentPadding: EdgeInsets.fromLTRB(
                                        AppDimensions.height10(context) * 0.9,
                                        0,
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
                            link_state
                                ? Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => link_editer()));
                                        },
                                        child: Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.5,
                                          height:
                                              AppDimensions.height10(context) *
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
                                      Container(
                                        width: AppDimensions.height10(context) *
                                            3.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.0,
                                        margin: EdgeInsets.only(
                                            right: AppDimensions.height10(
                                                    context) *
                                                2.0),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                          // size: AppDimensions.height10(context) * 1,
                                        ),
                                      )
                                    ],
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => link_editer()));
                                    },
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 3.0,
                                      height:
                                          AppDimensions.height10(context) * 3.0,
                                      // margin: EdgeInsets.only(
                                      //     left: AppDimensions.height10(context) * 3.0),
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
                          //height: AppDimensions.height10(context) * 2.4,
                          //width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 0.6,
                            //right: AppDimensions.height10(context) * 10.0,
                          ),
                          child: TextField(
                            controller: statement,
                            maxLines: null,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.7,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff282828)),
                            decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                    AppDimensions.height10(context) * 1.6,
                                    AppDimensions.height10(context) * 0.4,
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
                            'Content Author',
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
                            left: AppDimensions.height10(context) * 0.6,
                            // right: AppDimensions.height10(context) * 1.0,
                          ),
                          child: TextField(
                            controller: author,
                            textAlignVertical: TextAlignVertical.center,
                            maxLines: null,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.7,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff282828)),
                            decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                    AppDimensions.height10(context) * 1.6,
                                    AppDimensions.height10(context) * 0.4,
                                    AppDimensions.height10(context) * 4,
                                    0),
                                hintText: 'Who created the content',
                                hintStyle: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.7,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
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
                          width: AppDimensions.height10(context) * 30.5,
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 0.6,
                          ),
                          child: TextFormField(
                            onChanged: (text) {
                              List<String> words = text.split(' ');

                              List<String> tags = words
                                  .where((word) => word.startsWith('#'))
                                  .toList();

                              tagList.clear();

                              tagList.addAll(tags.toSet());

                              print(tagList);
                            },
                            controller: hastags,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 80, 33, 33)),
                            decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                    AppDimensions.height10(context) * 1.6,
                                    AppDimensions.height10(context) * 0,
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
                                  route: 'note_link',
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
