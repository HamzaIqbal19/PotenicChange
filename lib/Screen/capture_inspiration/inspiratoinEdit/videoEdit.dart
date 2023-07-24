import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';

import '../../../Widgets/fading.dart';
import '../../../utils/app_dimensions.dart';
import '../capture_inpirations_goals.dart';

class videoEdit extends StatefulWidget {
  final bool note;
  final bool context;
  const videoEdit({
    super.key,
    required this.note,
    required this.context,
  });

  @override
  State<videoEdit> createState() => video_EditState();
}

class video_EditState extends State<videoEdit> {
  var inspirationDetails;
  TextEditingController link = TextEditingController();
  TextEditingController file = TextEditingController();
  TextEditingController statement = TextEditingController();
  TextEditingController hastags = TextEditingController();
  TextEditingController title = TextEditingController();
  List<String> tagList = [];

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
        link.text = inspirationDetails['inspiration']['destinationLink'];
        title.text = inspirationDetails['inspiration']['title'];
        file.text = inspirationDetails['inspiration']['file'];
        statement.text = inspirationDetails['inspiration']['description'];
        hastags.text = inspirationDetails['inspiration']['hashTags']
            .toString()
            .replaceAll('[', '')
            .replaceAll(']', '');
        loadData();

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
                            onTap: () {
                              Navigator.pop(context);
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
                                    widget.note
                                        ? 'Create note inspiration'
                                        : widget.context
                                            ? 'Create inspiration content link'
                                            : 'Create inspiration video link',
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
                            showAnimatedDialog(
                                animationType: DialogTransitionType.fadeScale,
                                curve: Curves.easeInOut,
                                duration: Duration(seconds: 1),
                                context: context,
                                builder: (BuildContext context) => SizedBox(
                                      width: AppDimensions.height10(context) *
                                          27.0,
                                      height: AppDimensions.height10(context) *
                                          18.2,
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
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.9,
                                              right:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.6,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Save changes?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
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
                                            "Are you sure you want to save your\nupdates?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              fontFamily: 'laila',
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
                                                  onPressed: () async {
                                                    InspirationApi()
                                                        .updateInspiration(
                                                            title.text
                                                                .toString(),
                                                            tagList,
                                                            link.text
                                                                .toString(),
                                                            statement.text
                                                                .toString(),
                                                            file.text
                                                                .toString())
                                                        .then((response) {
                                                      if (response == true) {
                                                        Navigator.push(
                                                            context,
                                                            FadePageRoute(
                                                                page:
                                                                    inspiration_landing(
                                                              is_Updated: true,
                                                            )));
                                                      }
                                                    });
                                                  },
                                                  child: Text(
                                                    'Yes',
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
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Cancel',
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
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.height10(context) * 4.3,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 4.9),
                            child: Text(
                              'Save',
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
                                  Text(
                                    widget.note
                                        ? "Title"
                                        : widget.context
                                            ? 'Content Destination Link'
                                            : 'Video Destination Link',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.5,
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
                                  width: AppDimensions.height10(context) * 30.5,
                                  //color: Colors.amber,
                                  margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 0.6,
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          controller:
                                              widget.note ? title : link,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff282828)),
                                          decoration: InputDecoration(
                                              isCollapsed: true,
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
                                              enabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent))),
                                        ),
                                      ])),
                              Container(
                                height: AppDimensions.height10(context) * 2.1,
                                width: AppDimensions.height10(context) * 30.5,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.0,
                                    // right: AppDimensions.height10(context) * 8.9,
                                    top: AppDimensions.height10(context) * 3.9),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'What it means to me',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
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

                                width: AppDimensions.height10(context) * 30.5,
                                // color: Colors.amber,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.6,
                                  // right: widget.note_saved
                                  //     ? AppDimensions.height10(context) * 8.9
                                  //     : AppDimensions.height10(context) * 10.0,
                                  // top: widget.note_saved
                                  //     ? AppDimensions.height10(context) * 0
                                  //     : AppDimensions.height10(context) * 1.0
                                ),
                                child: SizedBox(
                                  width: AppDimensions.height10(context) * 37.5,
                                  child: TextFormField(
                                    controller: statement,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff282828)),
                                    decoration: InputDecoration(
                                        isCollapsed: true,
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
                                            fontSize: AppDimensions.height10(
                                                    context) *
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
                                          AppDimensions.height10(context) * 2.1,
                                      width: AppDimensions.height10(context) *
                                          30.5,
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  2.0,
                                          right:
                                              AppDimensions.height10(context) *
                                                  8.9,
                                          top: AppDimensions.height10(context) *
                                              3.9),
                                      child: Text(
                                        'Content Author',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff828282)),
                                      ),
                                    )
                                  : Container(),
                              widget.context
                                  ? Container(
                                      width: AppDimensions.height10(context) *
                                          30.5,
                                      margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            0.6,
                                      ),
                                      child: TextFormField(
                                        controller: file,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff282828)),
                                        decoration: InputDecoration(
                                            isCollapsed: true,
                                            contentPadding: EdgeInsets.fromLTRB(
                                                AppDimensions.height10(context) *
                                                    1.6,
                                                AppDimensions.height10(context) *
                                                    0.4,
                                                0,
                                                0),
                                            hintText: 'Author name',
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
                                    )
                                  : Container(),
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
                                width: AppDimensions.height10(context) * 30.5,
                                margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.6,
                                ),
                                child: TextFormField(
                                  controller: hastags,
                                  onChanged: (text) {
                                    List<String> words = text.split(' ');

                                    List<String> tags = words
                                        .where((word) => word.startsWith('#'))
                                        .toList();

                                    tagList.clear();

                                    tagList.addAll(tags.toSet());

                                    print(tagList);
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const inspiration_landing(
                                        is_Updated: false,
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
                                        child: GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              '00 impacted goals',
                                              style: TextStyle(
                                                color: const Color(0xFF646464),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
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
