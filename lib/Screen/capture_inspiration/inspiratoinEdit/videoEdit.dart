import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/capture_inpirations_goals.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Screen/capture_inspiration/record_inpiration_type.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/fading.dart';
import '../../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class videoEdit extends StatefulWidget {
  final bool note;
  final bool context;
  final bool updateData;
  const videoEdit({
    super.key,
    required this.note,
    required this.context,
    required this.updateData,
  });

  @override
  State<videoEdit> createState() => video_EditState();
}

TextEditingController link = TextEditingController();
TextEditingController statement = TextEditingController();
TextEditingController hastags = TextEditingController();
TextEditingController title = TextEditingController();
TextEditingController author = TextEditingController();
List<String> tagList = [];
List<String> hashList = [];

class video_EditState extends State<videoEdit> {
  var inspirationDetails;

  clear() {
    link.clear();
    statement.clear();
    hastags.clear();
    title.clear();
    author.clear();
    tagList.clear();
    hashList.clear();
  }

  bool loading = true;
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void _fetchInspiration() {
    InspirationApi().getInspirationById().then((response) {
      if (response.length != 0) {
        setState(() {
          inspirationDetails = response;
        });
        if (widget.updateData == true) {
          setState(() {
            loading = false;
          });
        } else {
          link.text = inspirationDetails['inspiration']['destinationLink']
                  .toString()
                  .isEmpty
              ? ''
              : inspirationDetails['inspiration']['destinationLink'];
          title.text =
              inspirationDetails['inspiration']['title'].toString().isEmpty
                  ? ''
                  : inspirationDetails['inspiration']['title'];
          author.text =
              inspirationDetails['inspiration']['author'].toString().isEmpty
                  ? ''
                  : inspirationDetails['inspiration']['author'];
          statement.text = inspirationDetails['inspiration']['description']
                  .toString()
                  .isEmpty
              ? ''
              : inspirationDetails['inspiration']['description'];

          if (inspirationDetails['inspiration']['hashTags'].length != 0) {
            for (int i = 0;
                i < inspirationDetails['inspiration']['hashTags'].length;
                i++) {
              hashList
                  .add('#${inspirationDetails['inspiration']['hashTags'][i]}');
            }
          }
          hastags.text =
              inspirationDetails['inspiration']['hashTags'].length != 0
                  ? hashList
                      .toString()
                      .replaceAll('[', '')
                      .replaceAll(']', '')
                      .replaceAll('"', '')
                  : '';
          // if(inspirationDetails['inspiration']['hashTags'].length !=0){

          // }

          loadData();
          if (inspirationDetails['inspiration']['hashTags'].length != 0) {
            for (int i = 0;
                i < inspirationDetails['inspiration']['hashTags'].length;
                i++) {
              tagList
                  .add('"${inspirationDetails['inspiration']['hashTags'][i]}"');
            }
          }
        }
        getImageLink();
        getInspiration();

        return response;
      }

      // return null;
    });
  }

  List selectedGoals = [];

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
    String? imageLink;
    setState(() {
      imageLink = imageLinked;
    });

    if (prefs.getString('ImageLink').toString().isNotEmpty) {
      link.text = imageLink!;
    }
  }

  Future<void> removePrefs() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove('ImageLink');
    await prefs.remove('selected_goals_inspiration');
  }

  @override
  void initState() {
    super.initState();

    _fetchInspiration();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        removePrefs();
        clear();
        return Future.value(true);
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              extendBodyBehindAppBar: false,
              extendBody: false,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: const Color(0xffC4C4C4),
                toolbarHeight: AppDimensions.height10(context) * 5.1,
                flexibleSpace: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.width10(context) * 1.5),
                  margin: EdgeInsets.zero,
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
                          onTap: () {
                            Navigator.push(
                                context,
                                FadePageRouteReverse(
                                    page: const record_inspiration()));
                            removePrefs();
                            clear();
                          },
                          child: Center(
                            child: Text(
                              'Cancel',
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
                            // height: AppDimensions.height10(context) * 2.2,
                            // width: AppDimensions.width10(context) * 28.5,
                            child: Center(
                              child: Text(
                                widget.note
                                    ? 'Edit note inspiration'
                                    : widget.context
                                        ? 'Edit inspiration content link'
                                        : 'Edit inspiration video link',
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
                              return ValueListenableBuilder<TextEditingValue>(
                                  valueListenable: statement,
                                  builder: (context, value, child) {
                                    return AnimatedScaleButton(
                                      onTap: () {
                                        if (title.text.isNotEmpty &&
                                            statement.text.isNotEmpty) {
                                          showAnimatedDialog(
                                              animationType:
                                                  DialogTransitionType
                                                      .fadeScale,
                                              curve: Curves.easeInOut,
                                              duration:
                                                  const Duration(seconds: 1),
                                              context: context,
                                              builder:
                                                  (BuildContext context) =>
                                                      SizedBox(
                                                        width: AppDimensions
                                                                .width10(
                                                                    context) *
                                                            27.0,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            18.2,
                                                        child: AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      AppDimensions.height10(
                                                                              context) *
                                                                          1.4)),
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          actionsPadding:
                                                              EdgeInsets.zero,
                                                          titlePadding:
                                                              EdgeInsets.zero,
                                                          title: Container(
                                                            margin: EdgeInsets.only(
                                                                top: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.9,
                                                                right: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.6,
                                                                left: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.6,
                                                                bottom: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.2),
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.2,
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                23.8,
                                                            child: Text(
                                                              "Save changes?",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .font10(
                                                                            context) *
                                                                    1.7,
                                                                fontFamily:
                                                                    'laila',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                          content: Container(
                                                            margin: EdgeInsets.only(
                                                                bottom: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.5,
                                                                left: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.6,
                                                                right: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.6),
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                3.4,
                                                            width: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                23.8,
                                                            child: Text(
                                                              "Are you sure you want to save your\nupdates?",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .font10(
                                                                            context) *
                                                                    1.3,
                                                                fontFamily:
                                                                    'laila',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      0.1,
                                                                  child:
                                                                      Divider(
                                                                    color: const Color(
                                                                            0XFF3C3C43)
                                                                        .withOpacity(
                                                                            0.29),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      4.2,
                                                                  width: double
                                                                      .infinity,
                                                                  color: const Color(
                                                                      0xFF007AFF),
                                                                  child:
                                                                      TextButton(
                                                                    onPressed:
                                                                        () async {
                                                                      InspirationApi()
                                                                          .updateInspiration(
                                                                              title.text.toString(),
                                                                              tagList,
                                                                              inspirationDetails['inspiration']['inspirationId'] != 2
                                                                                  ? link.text.isEmpty
                                                                                      ? ''
                                                                                      : link.text.toString()
                                                                                  : '',
                                                                              statement.text.toString(),
                                                                              selectedGoals.length == 0 ? inspirationDetails['inspiration']['userGoalId'] : selectedGoals,
                                                                              author.text.isEmpty ? '' : author.text)
                                                                          .then((response) {
                                                                        if (response ==
                                                                            true) {
                                                                          Navigator.push(
                                                                              context,
                                                                              FadePageRoute(page: const updatedLandingPage(delete: false, is_Updated: true)));
                                                                          removePrefs();
                                                                          clear();
                                                                        }
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                      'Yes',
                                                                      style: TextStyle(
                                                                          color: const Color(
                                                                              0xFFFFFFFF),
                                                                          fontSize: AppDimensions.font10(context) *
                                                                              1.7,
                                                                          fontFamily:
                                                                              "Laila",
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      0.1,
                                                                  child:
                                                                      Divider(
                                                                    color: const Color(
                                                                            0XFF3C3C43)
                                                                        .withOpacity(
                                                                            0.29),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      4.4,
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Text(
                                                                      'Cancel',
                                                                      style: TextStyle(
                                                                          fontSize: AppDimensions.font10(context) *
                                                                              1.7,
                                                                          fontFamily:
                                                                              "Laila",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              const Color(0xFF007AFF)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      0.1,
                                                                  child:
                                                                      Divider(
                                                                    color: const Color(
                                                                            0XFF3C3C43)
                                                                        .withOpacity(
                                                                            0.29),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ));
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          'Save',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w400,
                                              color: title.text
                                                          .toString()
                                                          .isNotEmpty &&
                                                      statement.text
                                                          .toString()
                                                          .isNotEmpty
                                                  ? const Color(0xff007AFF)
                                                  : const Color(0xff007AFF)
                                                      .withOpacity(0.5)),
                                        ),
                                      ),
                                    );
                                  });
                            })
                      ]),
                ),
              ),
              body: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: loading == false
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: AppDimensions.height10(context) * 2.3,
                              width: AppDimensions.width10(context) * 30.5,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 2.0,
                                  right: AppDimensions.width10(context) * 8.9,
                                  top: AppDimensions.height10(context) * 1.8),
                              child: Column(children: [
                                Text(
                                  "Title",
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ]),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                // height: widget.note_saved
                                //     ? AppDimensions.height10(context) * 4.8
                                //     : AppDimensions.height10(context) * 2.4,
                                // width: AppDimensions.width10(context) * 30.5,
                                //color: Colors.amber,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 0.6,
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        controller: title,
                                        maxLines: null,
                                        scrollPadding: EdgeInsets.zero,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.7,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff282828)),
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            contentPadding: EdgeInsets.fromLTRB(
                                                AppDimensions.height10(context) *
                                                    1.5,
                                                0,
                                                AppDimensions.height10(context) *
                                                    4,
                                                0),
                                            hintText:
                                                'Give your inspiration a title',
                                            hintStyle: TextStyle(
                                                fontSize:
                                                    AppDimensions.font10(context) *
                                                        1.7,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff828282)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent))),
                                      ),
                                    ])),
                            inspirationDetails['inspiration']
                                        ['inspirationId'] !=
                                    2
                                ? Container(
                                    height:
                                        AppDimensions.height10(context) * 2.3,
                                    width:
                                        AppDimensions.width10(context) * 30.5,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.0,
                                        right: AppDimensions.height10(context) *
                                            8.9,
                                        top: AppDimensions.height10(context) *
                                            3.2),
                                    child: Column(children: [
                                      Text(
                                        widget.context
                                            ? 'Content Destination Link'
                                            : 'Video Destination Link',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.5,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                                    ]),
                                  )
                                : Container(),
                            inspirationDetails['inspiration']
                                        ['inspirationId'] !=
                                    2
                                ? Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: AppDimensions.width10(context) *
                                            30.5,
                                        margin: EdgeInsets.only(
                                          left: AppDimensions.width10(context) *
                                              0.6,
                                        ),
                                        child: TextField(
                                          controller: link,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          maxLines: null,
                                          scrollPadding: EdgeInsets.zero,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.7,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff282828)),
                                          decoration: InputDecoration(
                                              isCollapsed: true,
                                              contentPadding: EdgeInsets.fromLTRB(
                                                  AppDimensions.height10(context) *
                                                      1.5,
                                                  0,
                                                  AppDimensions.height10(context) *
                                                      0.2,
                                                  0),
                                              hintText: 'Add link',
                                              hintStyle: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff828282)),
                                              focusedBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent)),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent))),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          AnimatedScaleButton(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page: link_set(
                                                    route: inspirationDetails[
                                                                    'inspiration']
                                                                [
                                                                'inspirationId'] ==
                                                            3
                                                        ? 'video_edit'
                                                        : 'content_edit',
                                                    link: link.text,
                                                  )));
                                            },
                                            child: Container(
                                              width: AppDimensions.width10(
                                                      context) *
                                                  2.5,
                                              margin: EdgeInsets.only(
                                                  left: AppDimensions.height10(
                                                          context) *
                                                      1.15),
                                              height: AppDimensions.height10(
                                                      context) *
                                                  2.5,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                // image: DecorationImage(image: AssetImage()),
                                                color: Colors.black,
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: AppDimensions.height10(
                                                          context) *
                                                      1.8,
                                                ),
                                              ),

                                              // margin: EdgeInsets.only(
                                              //     right: AppDimensions.width10(context) * 0.8),
                                              // decoration: BoxDecoration(

                                              //     image: DecorationImage(
                                              //         image: AssetImage(
                                              //             'assets/images/ic_add_circle_black.webp'),
                                              //         fit: BoxFit.cover)),
                                            ),
                                          ),
                                          AnimatedScaleButton(
                                            onTap: () {
                                              link.clear();
                                            },
                                            child: Container(
                                              width: AppDimensions.width10(
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
                                                // image: DecorationImage(image: AssetImage()),
                                                color: Colors.black,
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                  size: AppDimensions.height10(
                                                          context) *
                                                      1.8,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                : Container(),
                            Container(
                              height: AppDimensions.height10(context) * 2.3,
                              width: AppDimensions.width10(context) * 30.5,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 2.0,
                                  // right: AppDimensions.width10(context) * 8.9,
                                  top: AppDimensions.height10(context) * 3.9),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'What it means to me',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff828282)),
                                    ),
                                  ]),
                            ),
                            Container(
                              // height: widget.note_saved
                              //     ? AppDimensions.height10(context) * 39.0
                              //     : AppDimensions.height10(context) * 2.4,

                              // width: AppDimensions.width10(context) * 30.5,
                              // color: Colors.amber,
                              margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 0.6,
                                // right: widget.note_saved
                                //     ? AppDimensions.height10(context) * 8.9
                                //     : AppDimensions.height10(context) * 10.0,
                                // top: widget.note_saved
                                //     ? AppDimensions.height10(context) * 0
                                //     : AppDimensions.height10(context) * 1.0
                              ),
                              child: SizedBox(
                                // width: AppDimensions.width10(context) * 37.5,
                                child: TextFormField(
                                  controller: statement,
                                  maxLines: null,
                                  scrollPadding: EdgeInsets.zero,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff282828)),
                                  decoration: InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          AppDimensions.height10(context) * 1.5,
                                          0,
                                          AppDimensions.height10(context) * 4,
                                          0),
                                      hintText:
                                          'Say more about this inspiration ',
                                      hintStyle: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
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
                            ),
                            widget.context
                                ? Container(
                                    height:
                                        AppDimensions.height10(context) * 2.2,
                                    width:
                                        AppDimensions.width10(context) * 30.5,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.0,
                                        right: AppDimensions.height10(context) *
                                            8.9,
                                        top: AppDimensions.height10(context) *
                                            3.9),
                                    child: Text(
                                      'Content Author (optional)',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff828282)),
                                    ),
                                  )
                                : Container(),
                            widget.context
                                ? Container(
                                    // width: AppDimensions.width10(context) *
                                    //     30.5,
                                    margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.width10(context) * 0.6,
                                    ),
                                    child: TextFormField(
                                      controller: author,
                                      maxLines: null,
                                      scrollPadding: EdgeInsets.zero,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff282828)),
                                      decoration: InputDecoration(
                                          isCollapsed: true,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              AppDimensions.height10(context) *
                                                  1.5,
                                              0,
                                              AppDimensions.height10(context) *
                                                  4,
                                              0),
                                          hintText: 'Author name',
                                          hintStyle: TextStyle(
                                              fontSize: AppDimensions.font10(
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
                                  )
                                : Container(),
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
                                    fontSize:
                                        AppDimensions.font10(context) * 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff828282)),
                              ),
                            ),
                            Container(
                              // width: AppDimensions.width10(context) * 30.5,
                              margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 0.6,
                              ),
                              child: TextFormField(
                                  controller: hastags,
                                  maxLines: null,
                                  scrollPadding: EdgeInsets.zero,
                                  onChanged: (text) {
                                    List<String> words = text.split(' ');

                                    List<String> tags = words
                                        .where((word) => word.startsWith('#'))
                                        .toList();

                                    List<String> finalResult = tags
                                        .map((tag) =>
                                            '"${tag.replaceAll('#', '')}"')
                                        .toList();
                                    tagList.clear();

                                    tagList.addAll(finalResult.toSet());
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff282828)),
                                  onTap: () {
                                    if (hastags.text.isEmpty) {
                                      hastags.text = '#';
                                    }
                                    hastags.selection =
                                        TextSelection.fromPosition(
                                      TextPosition(offset: hastags.text.length),
                                    );
                                  },
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
                                              AppDimensions.font10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff828282)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
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
                              height: AppDimensions.height10(context) * 2.2,
                              width: AppDimensions.width10(context) * 30.5,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 2.0,
                                  bottom: AppDimensions.height10(context) * 0.5,
                                  right: AppDimensions.width10(context) * 8.9,
                                  top: AppDimensions.height10(context) * 3.9),
                              child: Text(
                                'Attached goals',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff828282)),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: inspiraton_goals(
                                      update: true,
                                      data_saved: false,
                                      route: 'note_saved_video',
                                      context: widget.context,
                                      note: widget.note,
                                    )));
                              },
                              child: Container(
                                height: AppDimensions.height10(context) * 6.0,
                                width: AppDimensions.width10(context) * 37.5,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 2.0,
                                  right: AppDimensions.width10(context) * 1.9,
                                  // bottom: AppDimensions.height10(context) * 1.0
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFBFBFB),
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 2.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 23.9,
                                      height:
                                          AppDimensions.height10(context) * 2.2,
                                      margin: EdgeInsets.only(
                                          left: AppDimensions.width10(context) *
                                              1.99),
                                      child: Text(
                                        selectedGoals.length == 0
                                            ? '${inspirationDetails['inspiration']['userGoalId'].length} impacted goals'
                                            : '${selectedGoals.length} impacted goals',
                                        style: TextStyle(
                                          color: const Color(0xFF646464),
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: AppDimensions.height10(
                                                    context) *
                                                2.391),
                                        child: Text(
                                          'View',
                                          style: TextStyle(
                                              color: const Color(0xFF437296),
                                              fontWeight: FontWeight.w700,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness:
                                                  AppDimensions.height10(
                                                          context) *
                                                      0.2,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).viewInsets.bottom == 0
                                      ? AppDimensions.height10(context) * 4
                                      : AppDimensions.height10(context) * 8.0,
                            )
                          ],
                        ))
                    : const Center(
                        child: SpinKitFadingCircle(
                          color: Color(0xFFB1B8FF),
                          size: 80,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
