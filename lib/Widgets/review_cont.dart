import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_constants.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../API/Goal.dart';
// import 'package:flutter_ui/pages/goalsetting/bottom_sheet.dart';
// import 'package:potenic_app/utils/backDecor.dart';
// import 'package:potenic_app/utils/icons.dart';

class reviewbox extends StatefulWidget {
  const reviewbox({super.key});

  @override
  State<reviewbox> createState() => _reviewboxState();
}

class _reviewboxState extends State<reviewbox> {
  bool Loading = true;

  Future<List<String>>? _goalNamesFuture;

  var reason;

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          Loading = false;
          reason = response["reason"][0];
        });
      } else {
        print("response:$response");
      }
    }).catchError((error) {
      print("error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: AppDimensions.height10 * 38.2,
          height: AppDimensions.height10 * 52.1,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.white, width: AppDimensions.height10 * 0.2),
              borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.height10 * 1.8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: AppDimensions.height10 * 50.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: AppDimensions.height10 * 2.4,
                      ),
                      inner_text(
                        'Reason 1',
                        bodyText: '$reason',
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: AppDimensions.height10 * 2.0,
                            right: AppDimensions.height10 * 23.6),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                "Character count:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF464646),
                                  fontSize: AppDimensions.height10 * 1.3,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "200",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF464646),
                                  fontSize: AppDimensions.height10 * 1.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10 * 2.8,
                      ),
                      inner_text(
                        "Reason 2",
                        bodyText:
                            'I want to achieve this goal to be in control of my anger and to regain control of my life.',
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: AppDimensions.height10 * 2.0,
                            right: AppDimensions.height10 * 23.6),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                "Character count:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF464646),
                                  fontSize: AppDimensions.height10 * 1.3,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "200",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF464646),
                                  fontSize: AppDimensions.height10 * 1.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10 * 2.8,
                      ),
                      inner_text(
                        "Reason 3",
                        bodyText:
                            'I want to achieve this goal to be in control of my anger and to regain control of my life.',
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: AppDimensions.height10 * 2.0,
                            right: AppDimensions.height10 * 23.6),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                "Character count:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF464646),
                                  fontSize: AppDimensions.height10 * 1.3,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "200",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF464646),
                                  fontSize: AppDimensions.height10 * 1.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
              child: add_reason,
            ),
          ),
        ),
      )
    ]);
  }
}

class inner_text extends StatefulWidget {
  final String circle_text;
  final String bodyText;

  inner_text(this.circle_text, {super.key, required this.bodyText});

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
      height: AppDimensions.height10 * 11.0,
      width: AppDimensions.height10 * 36.0,
      padding: EdgeInsets.only(
          top: AppDimensions.height10 * 2,
          bottom: 1,
          left: AppDimensions.height10 * 2,
          right: AppDimensions.height10 * 2.0),
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
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimensions.height10 * 1.8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: AppDimensions.height10 * 2.2,
                  width: AppDimensions.height10 * 29,
                  child: Text("Reason1",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: _focusNode.hasFocus
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFFFFFFFF),
                        fontSize: AppDimensions.height10 * 2.2,
                      ))),
              GestureDetector(
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
                              color: const Color.fromRGBO(0, 122, 255, 1),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: AppDimensions.height10 * 1.7,
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
                                    fontSize: AppDimensions.height10 * 1.7,
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 122, 255, 1),
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

                  // color: Colors.blue,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bin.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: AppDimensions.height10 * 0.9,
          ),
          Container(
              height: AppDimensions.height10 * 5.3,
              width: AppDimensions.height10 * 32.0,
              child: CupertinoTextField(
                placeholder: widget.bodyText,
                placeholderStyle: TextStyle(
                    fontSize: AppDimensions.height10 * 1.6,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFFFFFF)),
                controller: body_text,
                maxLines: 4,
                focusNode: _focusNode,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF)),
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
  shape: RoundedRectangleBorder(
      side:
          BorderSide(width: AppDimensions.height10 * 0.3, color: Colors.white),
      borderRadius: BorderRadius.circular(AppDimensions.height10 * 10)),
  onPressed: () {
    // BottomSheetExample();
  },
  child: Icon(
    Icons.add,
    color: Colors.white,
    size: AppDimensions.height10 * 4.7,
  ),
);
