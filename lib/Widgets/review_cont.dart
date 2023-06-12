import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReview.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_constants.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../Screen/ReviewPractice/Activateyourstar.dart';
// import 'package:flutter_ui/pages/goalsetting/bottom_sheet.dart';
// import 'package:potenic_app/utils/backDecor.dart';
// import 'package:potenic_app/utils/icons.dart';

class reviewbox extends StatefulWidget {
  const reviewbox({super.key});

  @override
  State<reviewbox> createState() => _reviewboxState();
}

class _reviewboxState extends State<reviewbox> {
  bool visibility1 = true;
  bool visibility2 = true;
  bool bt_enable = true;
  bool unSaved = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
              width: AppDimensions.height10(context) * 38.2,
              //height: AppDimensions.height10(context) * 52.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.white,
                      width: AppDimensions.height10(context) * 0.2),
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppDimensions.height10(context) * 1.8))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    // height: AppDimensions.height10(context) * 52.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: AppDimensions.height10(context) * 2.4,
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 12.5,
                            width: AppDimensions.height10(context) * 36.0,
                            padding: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1,
                                bottom: 1,
                                left: AppDimensions.height10(context) * 2,
                                right: AppDimensions.height10(context) * 2.0),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFE9A594),
                                      Color(0xFFEEBEB2)
                                    ]),
                                // color: Colors.white,

                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  //width: AppDimensions.height10(context) * 32.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          width:
                                              AppDimensions.height10(context) *
                                                  27,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  0.6),
                                          child: Text('Reason 1',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Laila",
                                                color: const Color(0xFFFFFFFF),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.2,
                                              ))),
                                      Container()
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 0.9,
                                ),
                                Container(
                                    height:
                                        AppDimensions.height10(context) * 6.3,
                                    width:
                                        AppDimensions.height10(context) * 32.0,
                                    child: CupertinoTextField(
                                      onTap: () {
                                        setState(() {
                                          bt_enable = false;
                                        });
                                      },
                                      placeholder:
                                          'I want to achieve this goal to be in control\nof my anger and to regain control of my\nlife.',
                                      placeholderStyle: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFFFFFFFF)),
                                      //controller: ,
                                      maxLines: 4,

                                      style: TextStyle(
                                          //  height: AppDimensions.height10(context) * 0.15,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Laila",
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.14,
                                          color: const Color(0xFFFFFFFF)),
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 2.0,
                                right: AppDimensions.height10(context) * 23.6),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    "Character count:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF464646),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.3,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "200",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF464646),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 4.0,
                            height: AppDimensions.height10(context) * 0.3,
                            color: const Color(0xFF282828).withOpacity(0.2),
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.4),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 2.0,
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 12.5,
                            width: AppDimensions.height10(context) * 36.0,
                            child: Stack(
                              children: [
                                const inner_text(
                                  head_text: "Reason 2",
                                  body_text:
                                      'I want to be closer and respect my wife\nand children.',
                                  delete_enable: false,
                                ),
                                Align(
                                  alignment: const Alignment(0.9, -0.85),
                                  child: GestureDetector(
                                    onTap: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          Container(
                                        width: AppDimensions.height10(context) *
                                            27.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                18.2,
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4)),
                                          actionsPadding:
                                              const EdgeInsets.all(0.0),
                                          contentPadding:
                                              const EdgeInsets.all(0.0),
                                          titlePadding:
                                              const EdgeInsets.all(0.0),
                                          title: Container(
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.9,
                                                right: AppDimensions.height10(
                                                        context) *
                                                    1.6,
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.6,
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    0),
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.2,
                                            width: AppDimensions.height10(
                                                    context) *
                                                23.8,
                                            child: Text(
                                              "Delete",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "Laila",
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.7,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          content: Container(
                                            // color:Colors.red,
                                            margin: EdgeInsets.only(
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    1.9,
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.6,
                                                right: AppDimensions.height10(
                                                        context) *
                                                    1.6),
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.2,
                                            width: AppDimensions.height10(
                                                    context) *
                                                23.8,
                                            child: Text(
                                              "Are you sure you want to delete this \n item?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.3,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            Column(
                                              children: [
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.4,
                                                  width: double.infinity,
                                                  color: const Color.fromRGBO(
                                                      0, 122, 255, 1),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'No',
                                                      style: TextStyle(
                                                          color: Colors.white,
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
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.4,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      27.0,
                                                  child: TextButton(
                                                    onPressed: () {},
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
                                                        color: const Color
                                                                .fromRGBO(
                                                            0, 122, 255, 1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      height:
                                          AppDimensions.height10(context) * 2.1,
                                      width:
                                          AppDimensions.height10(context) * 2.1,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  1.0),
                                      //margin: EdgeInsets.only(bottom: AppDimensions.height10(context)*1.0),
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10(context) *
                                              0.3),
                                      // color: Colors.blue,
                                      child:
                                          Image.asset("assets/images/bin.png"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 2.0,
                                right: AppDimensions.height10(context) * 23.6),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    "Character count:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF464646),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.3,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "200",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF464646),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          visibility2
                              ? Container(
                                  width: AppDimensions.height10(context) * 4.0,
                                  height: AppDimensions.height10(context) * 0.3,
                                  color:
                                      const Color(0xFF282828).withOpacity(0.2),
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.4),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimensions.height10(context) * 2.0,
                          ),
                          visibility2
                              ? SizedBox(
                                  height:
                                      AppDimensions.height10(context) * 12.5,
                                  width: AppDimensions.height10(context) * 36.0,
                                  child: Stack(
                                    children: [
                                      const inner_text(
                                        head_text: 'Reason 3',
                                        body_text:
                                            'I don’t want my anger to hold me back\nfrom enjoying life.',
                                        delete_enable: false,
                                      ),
                                      Align(
                                        alignment: const Alignment(0.9, -0.85),
                                        child: GestureDetector(
                                          onTap: () => showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  27.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  18.2,
                                              child: AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.4)),
                                                actionsPadding:
                                                    const EdgeInsets.all(0.0),
                                                contentPadding:
                                                    const EdgeInsets.all(0.0),
                                                titlePadding:
                                                    const EdgeInsets.all(0.0),
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
                                                          0),
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.2,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      23.8,
                                                  child: Text(
                                                    "Delete",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: "Laila",
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.7,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                content: Container(
                                                  // color:Colors.red,
                                                  margin: EdgeInsets.only(
                                                      bottom: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.9,
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.6,
                                                      right: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.6),
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          3.2,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      23.8,
                                                  child: Text(
                                                    "Are you sure you want to delete this \n item?",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.3,
                                                      fontFamily: "Laila",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.4,
                                                        width: double.infinity,
                                                        color: const Color
                                                                .fromRGBO(
                                                            0, 122, 255, 1),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'No',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.7,
                                                                fontFamily:
                                                                    "Laila",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.4,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            27.0,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              visibility2 =
                                                                  false;
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                          child: Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.7,
                                                              fontFamily:
                                                                  "Laila",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  0,
                                                                  122,
                                                                  255,
                                                                  1),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.1,
                                            width: AppDimensions.height10(
                                                    context) *
                                                2.1,
                                            margin: EdgeInsets.only(
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    1.0),
                                            //margin: EdgeInsets.only(bottom: AppDimensions.height10(context)*1.0),
                                            padding: EdgeInsets.all(
                                                AppDimensions.height10(
                                                        context) *
                                                    0.3),
                                            // color: Colors.blue,
                                            child: Image.asset(
                                                "assets/images/bin.png"),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                          visibility2
                              ? Container(
                                  padding: EdgeInsets.only(
                                      left:
                                          AppDimensions.height10(context) * 2.0,
                                      right: AppDimensions.height10(context) *
                                          23.6),
                                  child: Row(
                                    children: [
                                      Center(
                                        child: Text(
                                          "Character count:",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF464646),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.3,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "200",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF464646),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 0,
            bottom: 5,
            left: 0,
            right: 0,
            child: Align(
              //alignment: Alignment.bottomCenter,
              alignment: const Alignment(0.01, 1.155),
              //heightFactor: 0.5,
              child: Container(
                height: AppDimensions.height10(context) * 4.7,
                width: AppDimensions.height10(context) * 4.7,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFC4C4C4)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 4, left: 4, right: 4, bottom: 4),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          //increment();
                          // print(times);
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/images/Addgoal.png',
                          height: AppDimensions.height10(context) * 4.7,
                          width: AppDimensions.height10(context) * 4.7,
                        ),
                      )),
                ),
              ),
            ),
          )
        ]),
        unSaved
            ? Container(
                //margin: EdgeInsets.only(top: AppDimensions.height10(context) * 3.7),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).viewInsets.bottom == 0
                        ? visibility2
                            ? AppDimensions.height10(context) * 3.7
                            : AppDimensions.height10(context) * 18.7
                        : AppDimensions.height10(context) * 3.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (visibility2 == false) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Container(
                              width: AppDimensions.height10(context) * 27.0,
                              height: AppDimensions.height10(context) * 19.8,
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 1.4)),
                                actionsPadding: const EdgeInsets.all(0.0),
                                contentPadding: const EdgeInsets.all(0.0),
                                titlePadding: const EdgeInsets.all(0.0),
                                title: Container(
                                  margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 1.9,
                                      right:
                                          AppDimensions.height10(context) * 1.6,
                                      left:
                                          AppDimensions.height10(context) * 1.6,
                                      bottom:
                                          AppDimensions.height10(context) * 0),
                                  height: AppDimensions.height10(context) * 2.2,
                                  width: AppDimensions.height10(context) * 23.8,
                                  child: Text(
                                    "Exit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Laila",
                                      fontSize:
                                          AppDimensions.height10(context) * 1.7,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                content: Container(
                                  // color:Colors.red,
                                  margin: EdgeInsets.only(
                                      bottom:
                                          AppDimensions.height10(context) * 1.9,
                                      left:
                                          AppDimensions.height10(context) * 1.6,
                                      right: AppDimensions.height10(context) *
                                          1.6),
                                  height: AppDimensions.height10(context) * 4.8,
                                  width: AppDimensions.height10(context) * 23.8,
                                  child: Text(
                                    "You new updates have not been saved.\nIf you exit now, your new updates will\nbe cancelled.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.3,
                                      height: AppDimensions.height10(context) *
                                          0.15,
                                      fontFamily: "Laila",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                4.4,
                                        width: double.infinity,
                                        color: const Color.fromRGBO(
                                            0, 122, 255, 1),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Go back',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.7,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                4.4,
                                        width: AppDimensions.height10(context) *
                                            27.0,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: const StarReview()));
                                          },
                                          child: Text(
                                            'Yes, cancel and exit',
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  0, 122, 255, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.height10(context) * 10.0,
                        decoration: BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(
                            color: bt_enable
                                ? const Color(0xFF282828).withOpacity(0.5)
                                : const Color(0xFFFA9934),
                          ),
                          // gradient: const LinearGradient(
                          //     begin: Alignment.topCenter,
                          //     end: Alignment.bottomCenter,
                          //     colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Center(
                          child: Text(
                            "Reset",
                            style: TextStyle(
                              color: bt_enable
                                  ? const Color(0xFF282828).withOpacity(0.5)
                                  : const Color(0xFFFA9934),
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () {
                          if (visibility2 == false) {
                            setState(() {
                              unSaved = false;
                            });
                          }
                        },
                        child: Container(
                          height: AppDimensions.height10(context) * 5,
                          width: AppDimensions.height10(context) * 26.2,
                          decoration: BoxDecoration(
                            // color: Color(0xFFFF7D50),
                            border: Border.all(color: Colors.transparent),
                            gradient: bt_enable
                                ? LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                        const Color(0xFF282828)
                                            .withOpacity(0.5),
                                        const Color(0xFF282828).withOpacity(0.5)
                                      ])
                                : const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                        Color(0xFFFCC10D),
                                        Color(0xFFFDA210)
                                      ]),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: bt_enable
                                    ? Colors.white.withOpacity(0.5)
                                    : const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                width: AppDimensions.height10(context) * 38.259,
                height: AppDimensions.height10(context) * 9.707,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 15.6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2.0),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 1.261),
                      width: AppDimensions.height10(context) * 4.437,
                      height: AppDimensions.height10(context) * 4.437,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/circle_tick.png'))),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 9.9,
                      height: AppDimensions.height10(context) * 3.6,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 1.232),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 9.9,
                            height: AppDimensions.height10(context) * 1.4,
                            child: Text(
                              'Updates saved',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.3,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 6.9,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Text(
                              'The why',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          visibility2 = true;
                          unSaved = true;
                        });
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 8.1,
                        height: AppDimensions.height10(context) * 6.0,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 12.1),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFFFFFFFF), width: 1),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                        ),
                        child: Center(
                          child: Text(
                            'Undo',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}

class inner_text extends StatefulWidget {
  final String head_text;
  final bool delete_enable;
  final String body_text;

  const inner_text(
      {super.key,
      required this.body_text,
      required this.head_text,
      required this.delete_enable});

  @override
  State<inner_text> createState() => _inner_textState();
}

class _inner_textState extends State<inner_text> {
  final TextEditingController body_text = TextEditingController();

  final TextEditingController heading_text = TextEditingController();

  late FocusNode _focusNode;

  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocus);
  }

  void _onFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10(context) * 12.5,
      width: AppDimensions.height10(context) * 36.0,
      padding: EdgeInsets.only(
          top: AppDimensions.height10(context) * 1,
          bottom: 1,
          left: AppDimensions.height10(context) * 2,
          right: AppDimensions.height10(context) * 2.0),
      decoration: BoxDecoration(
          gradient: _focusNode.hasFocus
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)])
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)]),
          // color: Colors.white,

          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.height10(context) * 1.8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            //width: AppDimensions.height10(context) * 32.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: AppDimensions.height10(context) * 2.2,
                    width: AppDimensions.height10(context) * 27,
                    margin: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 0.6),
                    child: Text(widget.head_text,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Laila",
                          color: _focusNode.hasFocus
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFFFFFFFF),
                          fontSize: AppDimensions.height10(context) * 2.2,
                        ))),
                GestureDetector(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Container(
                      width: AppDimensions.height10(context) * 27.0,
                      height: AppDimensions.height10(context) * 18.2,
                      child: AlertDialog(
                        actionsPadding: const EdgeInsets.all(0.0),
                        contentPadding: const EdgeInsets.all(0.0),
                        titlePadding: const EdgeInsets.all(0.0),
                        title: Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.9,
                              right: AppDimensions.height10(context) * 1.6,
                              left: AppDimensions.height10(context) * 1.6,
                              bottom: AppDimensions.height10(context) * 0),
                          height: AppDimensions.height10(context) * 2.2,
                          width: AppDimensions.height10(context) * 23.8,
                          child: Text(
                            "Delete",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Laila",
                              fontSize: AppDimensions.height10(context) * 1.7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        content: Container(
                          // color:Colors.red,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.9,
                              left: AppDimensions.height10(context) * 1.6,
                              right: AppDimensions.height10(context) * 1.6),
                          height: AppDimensions.height10(context) * 3.2,
                          width: AppDimensions.height10(context) * 23.8,
                          child: Text(
                            "Are you sure you want to delete this \n item?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.3,
                              fontFamily: "Laila",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          Column(
                            children: [
                              Container(
                                height: AppDimensions.height10(context) * 4.4,
                                width: double.infinity,
                                color: const Color.fromRGBO(0, 122, 255, 1),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 4.4,
                                width: AppDimensions.height10(context) * 27.0,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.7,
                                      fontFamily: "Laila",
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(0, 122, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: widget.delete_enable
                      ? Container(
                          height: AppDimensions.height10(context) * 2.1,
                          width: AppDimensions.height10(context) * 2.1,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.0),
                          //margin: EdgeInsets.only(bottom: AppDimensions.height10(context)*1.0),
                          padding: EdgeInsets.all(
                              AppDimensions.height10(context) * 0.3),
                          // color: Colors.blue,
                          child: Image.asset("assets/images/bin.png"),
                        )
                      : Container(),
                )
              ],
            ),
          ),
          SizedBox(
            height: AppDimensions.height10(context) * 0.9,
          ),
          Container(
              height: AppDimensions.height10(context) * 6.3,
              width: AppDimensions.height10(context) * 32.0,
              child: CupertinoTextField(
                placeholder: widget.body_text,
                placeholderStyle: TextStyle(
                    fontSize: AppDimensions.height10(context) * 1.6,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFFFFFF)),
                controller: body_text,
                maxLines: 4,
                focusNode: _focusNode,
                style: TextStyle(
                    //  height: AppDimensions.height10(context) * 0.15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Laila",
                    height: AppDimensions.height10(context) * 0.14,
                    color: const Color(0xFFFFFFFF)),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              )),
        ],
      ),
    );
  }
}

// FloatingActionButton add_reason = FloatingActionButton(
//   elevation: 0,
//   backgroundColor: Colors.transparent,
//   shape: RoundedRectangleBorder(
//       side: BorderSide(
//           width: AppDimensions.height10(context) * 0.3, color: Colors.white),
//       borderRadius:
//           BorderRadius.circular(AppDimensions.height10(context) * 10)),
//   onPressed: () {
//     // BottomSheetExample();
//   },
//   child: Icon(
//     Icons.add,
//     color: Colors.white,
//     size: AppDimensions.height10(context) * 4.7,
//   ),
// );
