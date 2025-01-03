import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/Widgets/linkscreen.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_landing.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_type.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/Constants/addlink.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/Constants/attachedgoals.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/Constants/inspirationheader.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/Constants/textfields.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_dimensions.dart';
import '../capture_inpirations_goals.dart';

class link_info extends StatefulWidget {
  final bool link_state;
  const link_info({super.key, required this.link_state});

  @override
  State<link_info> createState() => _link_infoState();
}

class _link_infoState extends State<link_info> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController link = TextEditingController();
  TextEditingController statement = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController hastags = TextEditingController();
  TextEditingController title = TextEditingController();
  List selectedGoals = [];
  List<String> tagList = [];
  String? imageLink;
  bool btEnable = true;
  final formKey = GlobalKey<FormState>();

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

  @override
  void initState() {
    super.initState();
    getInspiration();
    getImageLink();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool link_state = false;
    return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Container(
          color: Colors.white,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: AppDimensions.height10(context) * 2.1,
                            width: AppDimensions.width10(context) * 30.5,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 2.0,
                                right: AppDimensions.width10(context) * 8.9,
                                top: AppDimensions.height10(context) * 3.9),
                            child: Text(
                              'Title',
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            // height: AppDimensions.height10(context) * 2.4,

                            //width: AppDimensions.width10(context) * 30.5,
                            margin: EdgeInsets.only(
                              left: AppDimensions.width10(context) * 0.6,
                            ),
                            child: InspirationTextFields().titleCustomTextField(
                              controller: title,
                              context: context,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Title is Empty";
                                }
                              },
                            ),

                            // TextFormField(
                            //   controller: title,
                            //   textCapitalization: TextCapitalization.sentences,
                            //   maxLines: null,
                            //   textAlignVertical: TextAlignVertical.top,
                            //   style: TextStyle(
                            //       fontSize: AppDimensions.font10(context) * 1.8,
                            //       fontWeight: FontWeight.w500,
                            //       color: const Color(0xff282828)),
                            //   decoration: InputDecoration(
                            //       isCollapsed: true,
                            //       contentPadding: EdgeInsets.fromLTRB(
                            //           AppDimensions.height10(context) * 1.5,
                            //           0,
                            //           AppDimensions.height10(context) * 4,
                            //           0),
                            //       hintText: 'Give your inspiration a title',
                            //       hintStyle: TextStyle(
                            //           fontSize:
                            //               AppDimensions.font10(context) * 1.7,
                            //           fontWeight: FontWeight.w500,
                            //           color: const Color(0xff828282)),
                            //       focusedBorder: const OutlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.transparent)),
                            //       enabledBorder: const OutlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.transparent))),
                            // ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 2.1,
                            width: AppDimensions.width10(context) * 30.5,
                            margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 2.0,
                                right: AppDimensions.width10(context) * 8.9,
                                top: AppDimensions.height10(context) * 3.2),
                            child: Text(
                              'Content Destination Link',
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: AppDimensions.width10(context) * 30.5,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 0.6,
                                  right: AppDimensions.width10(context) * 1.0,
                                  //top: AppDimensions.height10(context) * 1.0
                                ),
                                child:
                                    InspirationTextFields().linkCustomTextField(
                                        controller: link,
                                        context: context,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Link is Empty";
                                          }
                                        },
                                        onEditing: () {
                                          setState(() {
                                            // link_state = true;
                                          });
                                        },
                                        onchange: (value) {
                                          setState(() {});
                                        }),

                                // TextFormField(
                                //   controller: link,
                                //   scrollPadding: EdgeInsets.zero,
                                //   textCapitalization:
                                //       TextCapitalization.sentences,
                                //   maxLines: null,
                                //   onEditingComplete: () {
                                //     setState(() {
                                //       // link_state = true;
                                //     });
                                //   },
                                //   onChanged: (value) {
                                //     setState(() {});
                                //   },
                                //   textAlignVertical: TextAlignVertical.center,
                                //   style: TextStyle(
                                //       fontSize:
                                //           AppDimensions.font10(context) * 1.8,
                                //       fontWeight: FontWeight.w500,
                                //       color: const Color(0xff282828)),
                                //   decoration: InputDecoration(
                                //       isCollapsed: true,
                                //       contentPadding: EdgeInsets.fromLTRB(
                                //           AppDimensions.height10(context) * 0.9,
                                //           0,
                                //           0,
                                //           0),
                                //       hintText: 'Add a link',
                                //       hintStyle: TextStyle(
                                //           fontSize:
                                //               AppDimensions.font10(context) *
                                //                   1.8,
                                //           fontWeight: FontWeight.w500,
                                //           color: const Color(0xff828282)),
                                //       focusedBorder: const OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               color: Colors.transparent)),
                                //       enabledBorder: const OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               color: Colors.transparent))),
                                // ),
                              ),
                              SizedBox(
                                  width: AppDimensions.width10(context) * 2),
                              SizedBox(
                                // width: AppDimensions.width10(context) * 7,
                                child: Addlink(
                                    link: link,
                                    onpress: () async {
                                      setState(() {});
                                      final String? result =
                                          await Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page: link_set(
                                                route: 'link',
                                                link: link.text,
                                              )));
                                      setState(() {
                                        link.text = result!;
                                      });
                                    }),
                                //  Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     AnimatedScaleButton(
                                //       onTap: () {
                                //         Navigator.push(
                                //             context,
                                //             FadePageRoute(
                                //                 page: link_set(
                                //               route: 'link',
                                //               link: link.text,
                                //             )));
                                //       },
                                //       child: Container(
                                //         width: AppDimensions.width10(context) *
                                //             2.5,
                                //         height:
                                //             AppDimensions.height10(context) *
                                //                 2.5,
                                //         // margin: EdgeInsets.only(
                                //         //     right: AppDimensions.width10(context) * 0.8),
                                //         decoration: const BoxDecoration(
                                //           shape: BoxShape.circle,
                                //           color: Colors.black,
                                //         ),
                                //         child: Icon(
                                //           Icons.add,
                                //           color: Colors.white,
                                //           size:
                                //               AppDimensions.height10(context) *
                                //                   2,
                                //         ),
                                //       ),
                                //     ),
                                //     link.text.isNotEmpty
                                //         ? AnimatedScaleButton(
                                //             onTap: () {
                                //               link.clear();
                                //             },
                                //             child: Container(
                                //               width: AppDimensions.width10(
                                //                       context) *
                                //                   2.5,
                                //               height: AppDimensions.height10(
                                //                       context) *
                                //                   2.5,
                                //               margin: EdgeInsets.only(
                                //                   left: AppDimensions.height10(
                                //                           context) *
                                //                       0.85),
                                //               decoration: const BoxDecoration(
                                //                 shape: BoxShape.circle,
                                //                 color: Colors.black,
                                //               ),
                                //               child: Icon(
                                //                 Icons.delete,
                                //                 color: Colors.white,
                                //                 size: AppDimensions.height10(
                                //                         context) *
                                //                     1.8,
                                //                 // size: AppDimensions.height10(context) * 1,
                                //               ),
                                //             ),
                                //           )
                                //         : Container()
                                //   ],
                                // ),
                              )
                            ],
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.width10(context) * 30.5,
                            margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 2.0,
                                right: AppDimensions.width10(context) * 8.9,
                                top: AppDimensions.height10(context) * 3.9),
                            child: Text(
                              'Why is it inspirational to you',
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ),
                          Container(
                              //height: AppDimensions.height10(context) * 2.4,
                              //width: AppDimensions.width10(context) * 30.5,
                              margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 0.6,
                                //right: AppDimensions.width10(context) * 10.0,
                              ),
                              child:
                                  InspirationTextFields() //inspiartion TEXT FORM FIELD ////////////////
                                      .inspirationCustomTextField(
                                          controller: statement,
                                          maxlength: 250,
                                          context: context)

                              // TextField(
                              //   controller: statement,
                              //   maxLines: null,
                              //   textAlignVertical: TextAlignVertical.center,
                              //   maxLength: 10000,
                              //   style: TextStyle(
                              //       fontSize: AppDimensions.font10(context) * 1.8,
                              //       fontWeight: FontWeight.w500,
                              //       color: const Color(0xff282828)),
                              //   decoration: InputDecoration(
                              //       isCollapsed: true,
                              //       contentPadding: EdgeInsets.fromLTRB(
                              //           AppDimensions.height10(context) * 1.6,
                              //           AppDimensions.height10(context) * 0.4,
                              //           AppDimensions.height10(context) * 4,
                              //           0),
                              //       hintText: 'Say more about this inspiration ',
                              //       hintStyle: TextStyle(
                              //           fontSize:
                              //               AppDimensions.font10(context) * 1.8,
                              //           fontWeight: FontWeight.w500,
                              //           color: const Color(0xff828282)),
                              //       focusedBorder: const OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.transparent)),
                              //       enabledBorder: const OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.transparent))),
                              // ),

                              ),
                          Container(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.width10(context) * 30.5,
                            margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 2.0,
                                right: AppDimensions.width10(context) * 8.9,
                                top: AppDimensions.height10(context) * 1.9),
                            child: Text(
                              'Content Author (optional)',
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ),
                          Container(
                            //height: AppDimensions.height10(context) * 2.4,
                            //width: AppDimensions.width10(context) * 30.5,
                            margin: EdgeInsets.only(
                              left: AppDimensions.width10(context) * 0.6,
                              // right: AppDimensions.width10(context) * 1.0,
                            ),
                            child: TextField(
                              controller: author,
                              textAlignVertical: TextAlignVertical.center,
                              maxLines: null,
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.8,
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
                                          AppDimensions.font10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: const Color(0xff828282)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent))),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.width10(context) * 30.5,
                            margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 2.0,
                                right: AppDimensions.width10(context) * 8.9,
                                top: AppDimensions.height10(context) * 3.9),
                            child: Text(
                              'Tags (optional)',
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ),
                          Container(
                              //height: AppDimensions.height10(context) * 2.4,
                              //width: AppDimensions.width10(context) * 30.5,
                              margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 0.6,
                              ),
                              child: InspirationTextFields()
                                  .tagsCustomTextField(
                                      tagList: tagList,
                                      controller: hastags,
                                      context: context)

                              // TextFormField(
                              //     maxLines: null,
                              //     scrollPadding: EdgeInsets.zero,
                              //     textCapitalization:
                              //         TextCapitalization.sentences,
                              //     onChanged: (text) {
                              //       // Split the text by space to detect hashtags on the same line
                              //       List<String> spacewords = text.split(RegExp(
                              //           r'(\s+)')); // Handle spaces, tabs, and newlines
                              //       List<String> words = text
                              //           .split('\n'); // Split by new lines

                              //       // Detect hashtags from spacewords (this will detect multiple hashtags on the same line)
                              //       List<String> tags = spacewords
                              //           .where((word) =>
                              //               word.startsWith('#') &&
                              //               word.length > 1)
                              //           .toList();

                              //       // Prepend # to any word that doesn't have it
                              //       for (int i = 0; i < words.length; i++) {
                              //         // Split each line by space to check each word
                              //         List<String> lineWords =
                              //             words[i].split(' ');

                              //         for (int j = 0;
                              //             j < lineWords.length;
                              //             j++) {
                              //           // Add hashtag only if it's a word and not already starting with #
                              //           if (lineWords[j].isNotEmpty &&
                              //               !lineWords[j].startsWith('#')) {
                              //             lineWords[j] = '#' + lineWords[j];
                              //           }
                              //         }

                              //         // Rejoin words in the line with space and update
                              //         words[i] = lineWords.join(' ');
                              //       }

                              //       // Update the text in the field only if there's a change
                              //       String updatedText = words.join('\n');
                              //       if (updatedText != text) {
                              //         hastags.value = hastags.value.copyWith(
                              //           text: updatedText,
                              //           selection: TextSelection.fromPosition(
                              //             TextPosition(
                              //                 offset: updatedText
                              //                     .length), // Maintain cursor position
                              //           ),
                              //         );
                              //       }

                              //       // Detect hashtags again from updated words
                              //       tags = spacewords
                              //           .where((word) =>
                              //               word.startsWith('#') &&
                              //               word.length > 1)
                              //           .toList();

                              //       // Prepare the final list of hashtags without the # prefix
                              //       List<String> finalResult = tags
                              //           .map((tag) =>
                              //               '"${tag.replaceAll('#', '')}"')
                              //           .toList();

                              //       // Clear the previous list and add unique tags
                              //       tagList.clear();
                              //       tagList.addAll(finalResult.toSet());
                              //     },
                              //     onTap: () {
                              //       if (hastags.text.isEmpty) {
                              //         hastags.text = '#';
                              //       }

                              //       hastags.selection =
                              //           TextSelection.fromPosition(
                              //         TextPosition(
                              //             offset: hastags.text.length),
                              //       );
                              //     },
                              //     controller: hastags,
                              //     textAlignVertical: TextAlignVertical.center,
                              //     style: TextStyle(
                              //         fontSize:
                              //             AppDimensions.font10(context) * 1.8,
                              //         fontWeight: FontWeight.w500,
                              //         color: const Color.fromARGB(
                              //             255, 80, 33, 33)),
                              //     decoration: InputDecoration(
                              //         isCollapsed: true,
                              //         contentPadding: EdgeInsets.fromLTRB(
                              //             AppDimensions.height10(context) *
                              //                 1.6,
                              //             AppDimensions.height10(context) *
                              //                 0.4,
                              //             AppDimensions.height10(context) * 4,
                              //             0),
                              //         hintText: 'Add #hashtag',
                              //         hintStyle: TextStyle(
                              //             fontSize: AppDimensions.font10(context) *
                              //                 1.8,
                              //             fontWeight: FontWeight.w500,
                              //             color: const Color(0xff828282)),
                              //         focusedBorder: const OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //                 color: Colors.transparent)),
                              //         enabledBorder: const OutlineInputBorder(
                              //             borderSide: BorderSide(color: Colors.transparent))),
                              //     inputFormatters: [
                              //   TextInputFormatter.withFunction(
                              //       (oldValue, newValue) {
                              //     if (newValue.text.isNotEmpty &&
                              //         !newValue.text.startsWith('#')) {
                              //       return TextEditingValue(
                              //         text: '#${newValue.text}',
                              //         selection: TextSelection.collapsed(
                              //             offset: newValue.text.length + 1),
                              //       );
                              //     }
                              //     return newValue;
                              //   }),
                              // ]),

                              ),
                          AttachedGoals().customAttachContainer(context),
                          AttachedGoals()
                              .customAttachedWidget(context, selectedGoals, () {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const inspiraton_goals(
                                  update: false,
                                  data_saved: true,
                                  context: false,
                                  note: false,
                                  route: 'note_link',
                                )));
                          }),

                          // Container(
                          //   height: AppDimensions.height10(context) * 2.2,
                          //   width: AppDimensions.width10(context) * 30.5,
                          //   margin: EdgeInsets.only(
                          //       left: AppDimensions.width10(context) * 2.0,
                          //       right: AppDimensions.width10(context) * 8.9,
                          //       bottom: AppDimensions.height10(context) * 0.5,
                          //       top: AppDimensions.height10(context) * 3.9),
                          //   child: Text(
                          //     'Attached goals',
                          //     style: TextStyle(
                          //         fontSize: AppDimensions.font10(context) * 1.6,
                          //         fontWeight: FontWeight.w400,
                          //         color: const Color(0xff828282)),
                          //   ),
                          // ),
                          // AnimatedScaleButton(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         FadePageRoute(
                          //             page: const inspiraton_goals(
                          //           update: false,
                          //           data_saved: true,
                          //           context: false,
                          //           note: false,
                          //           route: 'note_link',
                          //         )));
                          //   },
                          //   child: Container(
                          //     height: AppDimensions.height10(context) * 6.0,
                          //     width: AppDimensions.width10(context) * 37.5,
                          //     margin: EdgeInsets.only(
                          //       left: AppDimensions.width10(context) * 2.0,
                          //       right: AppDimensions.width10(context) * 1.9,
                          //     ),
                          //     decoration: BoxDecoration(
                          //         color: const Color(0xFFFBFBFB),
                          //         borderRadius: BorderRadius.circular(
                          //             AppDimensions.height10(context) * 2.0)),
                          //     child: Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Container(
                          //           width:
                          //               AppDimensions.width10(context) * 23.9,
                          //           margin: EdgeInsets.only(
                          //               left: AppDimensions.height10(context) *
                          //                   1.99),
                          //           child: Text(
                          //             '${selectedGoals.length} impacted goals',
                          //             style: TextStyle(
                          //               color: const Color(0xFF646464),
                          //               fontSize:
                          //                   AppDimensions.font10(context) * 1.9,
                          //               fontWeight: FontWeight.w500,
                          //             ),
                          //           ),
                          //         ),
                          //         Container(
                          //             margin: EdgeInsets.only(
                          //                 right:
                          //                     AppDimensions.width10(context) *
                          //                         2.391),
                          //             child: Text(
                          //               'View',
                          //               style: TextStyle(
                          //                   color: const Color(0xFF437296),
                          //                   fontWeight: FontWeight.w700,
                          //                   decoration:
                          //                       TextDecoration.underline,
                          //                   decorationThickness:
                          //                       AppDimensions.height10(
                          //                               context) *
                          //                           0.2,
                          //                   fontSize: UpdatedDimensions.font10(
                          //                           context) *
                          //                       1.6),
                          //             ))
                          //       ],
                          //     ),
                          //   ),
                          // ),

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
                // appBar: InspirationHeader(
                //   link: link,
                //   statement: statement,
                //   hastags: hastags,
                //   context: context,
                //   author: author,
                //   title: title,
                //   formKey: formKey,
                //   tagList: tagList,
                //   selectedGoals: selectedGoals,
                //   btEnable: btEnable,
                //   text: 'Create inspiration content link',
                // ),

                appBar: AppBar(
                    elevation: 0,
                    backgroundColor: const Color(0xFFC4C4C4),
                    automaticallyImplyLeading: false,
                    toolbarHeight: AppDimensions.height10(context) * 5.1,
                    flexibleSpace: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.width10(context) * 1.5),
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
                                link.clear();
                                statement.clear();
                                hastags.clear();
                                author.clear();
                                title.clear();
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const inspiration_type()));
                                final SharedPreferences prefs = await _prefs;
                                await prefs.remove('ImageLink');
                              },
                              child: Center(
                                child: Text(
                                  'Back',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff007AFF)),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                //height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.width10(context) * 28.5,
                                child: Center(
                                  child: Text(
                                    'Create inspiration content link',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.8,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff282828)),
                                  ),
                                ),
                              ),
                            ),
                            ValueListenableBuilder<TextEditingValue>(
                                valueListenable: title,
                                builder: (context, value, child) {
                                  return ValueListenableBuilder<
                                          TextEditingValue>(
                                      valueListenable: statement,
                                      builder: (context, value, child) {
                                        return ValueListenableBuilder<
                                                TextEditingValue>(
                                            valueListenable: link,
                                            builder: (context, value, child) {
                                              return AnimatedScaleButton(
                                                onTap: () async {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    if (btEnable == true) {
                                                      setState(() {
                                                        btEnable = false;
                                                      });
                                                    }
                                                    InspirationApi()
                                                        .addInspiration(
                                                            4,
                                                            null,
                                                            title.text
                                                                    .toString()
                                                                    .isEmpty
                                                                ? " "
                                                                : title.text
                                                                    .trim()
                                                                    .toString(),
                                                            tagList.isEmpty
                                                                ? []
                                                                : tagList,
                                                            author.text
                                                                    .toString()
                                                                    .isEmpty
                                                                ? " "
                                                                : author.text
                                                                    .trim()
                                                                    .toString(),
                                                            link.text
                                                                    .toString()
                                                                    .isEmpty
                                                                ? " "
                                                                : link.text
                                                                    .toString()
                                                                    .trim(),
                                                            true,
                                                            statement.text
                                                                    .toString()
                                                                    .isEmpty
                                                                ? " "
                                                                : statement.text
                                                                    .toString()
                                                                    .trim(),
                                                            selectedGoals)
                                                        .then((response) async {
                                                      if (response.length !=
                                                          0) {
                                                        statement.clear();
                                                        author.clear();
                                                        hastags.clear();
                                                        link.clear();
                                                        title.clear();
                                                        Navigator.push(
                                                            context,
                                                            FadePageRoute(
                                                                page: const inspiration_landing(
                                                                    is_Updated:
                                                                        false)));
                                                        final SharedPreferences
                                                            prefs =
                                                            await _prefs;
                                                        await prefs.remove(
                                                            'ImageLink');
                                                        prefs.remove(
                                                            'inspiration_saved_route');
                                                      }

                                                      // return null;
                                                    });

                                                    final SharedPreferences
                                                        prefs = await _prefs;
                                                    prefs.remove(
                                                        'inspiration_saved_route');
                                                  }
                                                  // if (link.text.isNotEmpty &&
                                                  //     statement
                                                  //         .text.isNotEmpty &&
                                                  //     title.text.isNotEmpty) {

                                                  // }
                                                },
                                                child: Container(
                                                  // height:
                                                  //     AppDimensions.height10(
                                                  //             context) *
                                                  //         2.2,
                                                  // width: AppDimensions.height10(
                                                  //         context) *
                                                  //     6.1,
                                                  // margin: EdgeInsets.only(
                                                  //     left: AppDimensions
                                                  //             .height10(
                                                  //                 context) *
                                                  //         4.0),
                                                  child: btEnable == false
                                                      ? Center(
                                                          child:
                                                              SpinKitThreeBounce(
                                                            color: const Color(
                                                                0xff007AFF),
                                                            // delay: Duration(milliseconds: 0),
                                                            size: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.5,
                                                          ),
                                                        )
                                                      : Center(
                                                          child: Text(
                                                            'Create',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .font10(
                                                                            context) *
                                                                    1.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xff007AFF)),
                                                          ),
                                                        ),
                                                ),
                                              );
                                            });
                                      });
                                })
                          ]),
                    )),
              ),
            ),
          ),
        ));
  }
}
