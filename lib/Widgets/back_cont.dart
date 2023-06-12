import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_constants.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

// import 'package:flutter_ui/pages/goalsetting/bottom_sheet.dart';
// import 'package:potenic_app/utils/backDecor.dart';
// import 'package:potenic_app/utils/icons.dart';

class backbox extends StatefulWidget {
  final String body_text;
  final String head_text;
  final bool delete;
  final int length;

  const backbox(
      {super.key,
      required this.body_text,
      required this.head_text,
      required this.delete,
      required this.length});

  @override
  State<backbox> createState() => _backboxState();
}

class _backboxState extends State<backbox> {
  int times = 2;

  void increment() {
    times = times + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.height10 * 38.2,
      height: AppDimensions.height10 * 42.3,
      child: Stack(children: [
        Container(
            width: AppDimensions.height10 * 38.2,
            height: AppDimensions.height10 * 42.3,
            padding: EdgeInsets.only(
                left: AppDimensions.height10 * 1.1,
                right: AppDimensions.height10 * 1.1),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.white, width: AppDimensions.height10 * 0.2),
                borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.height10 * 1.8))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: SizedBox(
                    height: AppDimensions.height10 * 40.0,
                    width: AppDimensions.height10 * 36.2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 1; i <= times; i++) ...[
                            Column(
                              children: <Widget>[
                                inner_text(
                                  body_text: widget.body_text,
                                  head_text: widget.head_text,
                                  delete: widget.delete,
                                  length: widget.length,
                                ),
                                SizedBox(
                                  height: AppDimensions.height10 * 0.4,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: AppDimensions.height10 * 2.0,
                                      right: AppDimensions.height10 * 13.6),
                                  child: Row(
                                    children: [
                                      Center(
                                        child: Text(
                                          "Character count: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF464646),
                                            fontSize:
                                                AppDimensions.height10 * 1.3,
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
                                                AppDimensions.height10 * 1.3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10 * 0.9,
                                ),
                              ],
                            )
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Align(
            //alignment: Alignment.bottomCenter,
            alignment: Alignment(0.01, 1.155),
            //heightFactor: 0.5,
            child: Container(
              height: AppDimensions.height10 * 4.7,
              width: AppDimensions.height10 * 4.7,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFB1B8FF), Color(0xFFC5CAFF)]),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 4),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        increment();
                        print(times);
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/images/Addgoal.png',
                        height: AppDimensions.height10 * 4.7,
                        width: AppDimensions.height10 * 4.7,
                      ),
                    )),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class inner_text extends StatefulWidget {
  final String head_text;
  final String body_text;
  final bool delete;
  final int length;
  const inner_text(
      {super.key,
      required this.head_text,
      required this.body_text,
      required this.delete,
      required this.length});

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
      height: AppDimensions.height10 * 12.5,
      width: AppDimensions.height10 * 36.0,
      padding: EdgeInsets.only(
          top: AppDimensions.height10 * 1,
          bottom: 1,
          left: AppDimensions.height10 * 2,
          right: AppDimensions.height10 * 2.0),
      decoration: BoxDecoration(
          gradient: _focusNode.hasFocus
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEFBEB2), Color(0xFFFEAA897)])
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEECDC5), Color(0xFFF6E0DB)]),
          // color: Colors.white,

          border: Border.all(color: Colors.white, width: 2),
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimensions.height10 * 1.8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            //width: AppDimensions.height10 * 32.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: AppDimensions.height10 * 2.2,
                    width: AppDimensions.height10 * 27,
                    margin: EdgeInsets.only(left: AppDimensions.height10 * 0.6),
                    child: Text(widget.head_text,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: AppDimensions.height10 * 0.15,
                          fontFamily: "Laila",
                          color: _focusNode.hasFocus
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF828282),
                          fontSize: AppDimensions.height10 * 2.2,
                        ))),
                widget.delete
                    ? GestureDetector(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Container(
                            width: AppDimensions.height10 * 27.0,
                            height: AppDimensions.height10 * 18.2,
                            child: AlertDialog(
                              actionsPadding: const EdgeInsets.all(0.0),
                              contentPadding: const EdgeInsets.all(0.0),
                              titlePadding: const EdgeInsets.all(0.0),
                              title: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.9,
                                    right: AppDimensions.height10 * 1.6,
                                    left: AppDimensions.height10 * 1.6,
                                    bottom: AppDimensions.height10 * 0),
                                height: AppDimensions.height10 * 2.2,
                                width: AppDimensions.height10 * 23.8,
                                child: Text(
                                  "Delete",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Laila",
                                    fontSize: AppDimensions.height10 * 1.7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              content: Container(
                                // color:Colors.red,
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 1.9,
                                    left: AppDimensions.height10 * 1.6,
                                    right: AppDimensions.height10 * 1.6),
                                height: AppDimensions.height10 * 3.2,
                                width: AppDimensions.height10 * 23.8,
                                child: Text(
                                  "Are you sure you want to delete this \n item?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.3,
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      height: AppDimensions.height10 * 4.4,
                                      width: double.infinity,
                                      color:
                                          const Color.fromRGBO(0, 122, 255, 1),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  AppDimensions.height10 * 1.7,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: AppDimensions.height10 * 4.4,
                                      width: AppDimensions.height10 * 27.0,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
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
                        ),
                        child: Container(
                          height: AppDimensions.height10 * 2.1,
                          width: AppDimensions.height10 * 2.1,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10 * 1.0,
                              top: AppDimensions.height10 * 0.5),
                          //margin: EdgeInsets.only(bottom: AppDimensions.height10*1.0),
                          padding: EdgeInsets.all(AppDimensions.height10 * 0.3),
                          // color: Colors.blue,
                          child: Image.asset("assets/images/bin.png"),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          // SizedBox(
          //   height: AppDimensions.height10 * 0.9,
          // ),
          Container(
              height: AppDimensions.height10 * 6.3,
              width: AppDimensions.height10 * 32.0,
              child: CupertinoTextField(
                maxLength: widget.length,
                placeholder: widget.body_text,
                placeholderStyle: TextStyle(
                    height: AppDimensions.height10 * 0.15,
                    fontSize: AppDimensions.height10 * 1.6,
                    fontWeight: FontWeight.w500,
                    color: _focusNode.hasFocus
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF828282)),
                controller: body_text,
                maxLines: 4,
                focusNode: _focusNode,
                style: TextStyle(
                    //  height: AppDimensions.height10 * 0.15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Laila",
                    height: AppDimensions.height10 * 0.14,
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

FloatingActionButton add_reason = FloatingActionButton(
  elevation: 0,
  backgroundColor: Colors.transparent,
  onPressed: () {},
  child: Icon(
    Icons.add,
    color: Colors.white,
    size: AppDimensions.height10 * 3.5,
  ),
  shape: RoundedRectangleBorder(
      side: BorderSide(width: 3, color: Colors.white),
      borderRadius: BorderRadius.circular(100)),
);

// Container(
//       height: AppDimensions.height10 * 1.9,
//       width: AppDimensions.height10 * 38.0,
//       padding: EdgeInsets.only(
//           top: AppDimensions.height10 * 1.3,
//           left: AppDimensions.height10 * 2.0,
//           right: AppDimensions.height10 * 2.0),
//       decoration: BoxDecoration(
//           gradient: _focusNode.hasFocus
//               ? const LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Color(0xFFEFBEB2), Color(0xFFFEAA897)])
//               : const LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Color(0xFFEECDC5), Color(0xFFF6E0DB)]),
//           // color: Colors.white,

//           border: Border.all(color: Colors.white, width: 2),
//           borderRadius:
//               BorderRadius.all(Radius.circular(AppDimensions.height10 * 1.8))),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//               height: AppDimensions.height10 * 3.6,
//               // width: AppDimensions.height10 * 26.9,
//               child: Text(widget.circle_text,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontFamily: "Laila",
//                     color: _focusNode.hasFocus
//                         ? const Color(0xFFFFFFFF)
//                         : const Color(0xFF828282),
//                     fontSize: AppDimensions.height10 * 2.2,
//                   ))),
//           SizedBox(
//             height: AppDimensions.height10 * 0.9,
//           ),
//           Container(
//               height: AppDimensions.height10 * 7.5,
//               // width: AppDimensions.height10 * 26.9,

//               child: CupertinoTextField(
//                 placeholder: "I want to achieve this goal because...",
//                 textAlignVertical: TextAlignVertical.top,
//                 placeholderStyle: TextStyle(
//                   fontSize: AppDimensions.height10 * 1.6,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: "Laila",
                  // color: _focusNode.hasFocus
                  //     ? const Color(0xFFFFFFFF)
                  //     : const Color(0xFF828282),
//                 ),
//                 controller: body_text,
//                 focusNode: _focusNode,
//                 maxLines: 4,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF)),
//                 decoration: const BoxDecoration(
//                   color: Colors.transparent,
//                 ),
//               )),
//         ],
//       ),
//     );
  