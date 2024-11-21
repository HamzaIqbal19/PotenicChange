import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../API/Goal.dart';

class StarReviewWhy extends StatefulWidget {
  final int updatedCategory;
  const StarReviewWhy({Key? key, required this.updatedCategory})
      : super(key: key);

  @override
  State<StarReviewWhy> createState() => _StarReviewWhyState();
}

class _StarReviewWhyState extends State<StarReviewWhy> {
  bool loading = true;

  var goalName;
  var reason;
  var reason2;
  var reason3;
  var identity;
  var visualize;
  var color;

  late FocusNode _focusNode;
  @override
  void initState() {
    _focusNode = FocusNode()..addListener(_onFocus);
    super.initState();
    _fetchGoalNames();
  }

  void _onFocus() {
    setState(() {});
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          loading = false;
          goalName = response["name"];
          reason = response["reason"];
          color = response["color"];
          identity = response["identityStatement"];
          visualize = response["visualizingYourSelf"];
        });
      } else {
        setState(() {
          loading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppDimensions.height10(context) * 5.0),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: Buttons().backButton(context, () {
              Navigator.pop(context);
            }),
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/GoalReviewBg.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          loading == false
              ? SingleChildScrollView(
                  reverse: true,
                  physics: const ClampingScrollPhysics(),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 5.3),
                            child: Center(
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF437296),
                                  fontSize: AppDimensions.font10(context) * 1.8,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 0.8,
                          ),
                          SizedBox(
                            width: AppDimensions.width10(context) * 30,
                            child: Center(
                              child: Text(
                                goalName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF437296),
                                  fontSize: AppDimensions.font10(context) * 2.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 4.0,
                          ),
                          Center(
                            child: Text(
                              widget.updatedCategory == 1
                                  ? "The Why"
                                  : widget.updatedCategory == 2
                                      ? 'New Identity Statement'
                                      : 'Visualising Your New Self',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF437296),
                                fontSize: AppDimensions.font10(context) * 2.8,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 0.8,
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 4.6,
                            width: AppDimensions.width10(context) * 37.2,
                            child: Center(
                              child: Text(
                                "Why pursuing this goal is important to \n you? ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF437296),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 3.4,
                          ),
                          Column(children: [
                            SizedBox(
                                width: AppDimensions.width10(context) * 38.2,
                                height: widget.updatedCategory == 3 &&
                                            visualize.length == 1 ||
                                        widget.updatedCategory == 2 &&
                                            identity.length == 1 ||
                                        widget.updatedCategory == 1 &&
                                            reason.length == 1
                                    ? AppDimensions.height10(context) * 20.0
                                    : AppDimensions.height10(context) * 36.0,
                                child: Stack(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  2.3),
                                      padding: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            1.1,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.white,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.8))),
                                      child: ListView.builder(
                                          itemCount: widget.updatedCategory == 1
                                              ? reason.length
                                              : widget.updatedCategory == 2
                                                  ? identity.length
                                                  : visualize.length,
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return Column(children: [
                                              inner_text(
                                                widget.updatedCategory == 1
                                                    ? 'Reason ${index + 1}'
                                                    : 'Statement ${index + 1}',
                                                bodyText: widget
                                                            .updatedCategory ==
                                                        1
                                                    ? '${reason[index]['text']}'
                                                    : widget.updatedCategory ==
                                                            2
                                                        ? '${identity[index]['text']}'
                                                        : '${visualize[index]['text']}',
                                                delete:
                                                    index != 0 ? true : false,
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                    context),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            23.6),
                                                child: Row(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        "Character count:",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xFF464646),
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.3,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        "200",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: const Color(
                                                              0xFF464646),
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.3,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.8,
                                              ),
                                            ]);
                                          }),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: AnimatedScaleButton(
                                          onTap: () {},
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                4.7,
                                            width:
                                                AppDimensions.width10(context) *
                                                    4.7,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xFFB1B8FF),
                                                    Color(0xFFC5CAFF)
                                                  ]),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4,
                                                  left: 4,
                                                  right: 4,
                                                  bottom: 4),
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Image.asset(
                                                  'assets/images/Addgoal.webp',
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.7,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.7,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ]),
                          MediaQuery.of(context).viewInsets.bottom == 0
                              ? SizedBox(
                                  height: widget.updatedCategory == 3 &&
                                              visualize.length == 1 ||
                                          widget.updatedCategory == 2 &&
                                              identity.length == 1 ||
                                          widget.updatedCategory == 1 &&
                                              reason.length == 1
                                      ? AppDimensions.height10(context) * 33.2
                                      : AppDimensions.height10(context) * 17.2,
                                )
                              : SizedBox(
                                  height: AppDimensions.height10(context) * 5.0,
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AnimatedScaleButton(
                                onTap: () {},
                                child: Container(
                                  height: AppDimensions.height10(context) * 5,
                                  width: AppDimensions.width10(context) * 10.0,
                                  decoration: BoxDecoration(
                                    // color: Color(0xFFFF7D50),
                                    border: Border.all(
                                        color: const Color(0xFF282828)),
                                    // gradient: const LinearGradient(
                                    //     begin: Alignment.topCenter,
                                    //     end: Alignment.bottomCenter,
                                    //     colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Reset",
                                      style: TextStyle(
                                        color: const Color(0xFF282828),
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedScaleButton(
                                onTap: () {
                                  AdminGoal()
                                      .updateUserGoal('reason', 'new reasons')
                                      .then((response) {
                                    if (response == true) {
                                    } else {}
                                  }).catchError((error) {});
                                },
                                child: Container(
                                  height: AppDimensions.height10(context) * 5,
                                  width: AppDimensions.width10(context) * 26.2,
                                  decoration: BoxDecoration(
                                    // color: Color(0xFFFF7D50),
                                    border:
                                        Border.all(color: Colors.transparent),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFF282828),
                                          Color(0xFF282828)
                                        ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Save",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 2.5,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom))
                        ],
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ],
      ),
    );
  }
}

class inner_text extends StatefulWidget {
  final bool delete;
  final String circle_text;
  final String bodyText;

  const inner_text(this.circle_text,
      {super.key, required this.bodyText, required this.delete});

  @override
  State<inner_text> createState() => _inner_textState();
}

class _inner_textState extends State<inner_text> {
  final TextEditingController bodyText = TextEditingController();

  final TextEditingController headingText = TextEditingController();

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocus);
  }

  void _onFocus() {
    setState(() {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10(context) * 11.0,
      width: AppDimensions.width10(context) * 36.0,
      padding: EdgeInsets.only(
          top: AppDimensions.height10(context) * 1.3,
          bottom: 1,
          left: AppDimensions.width10(context) * 2,
          right: AppDimensions.width10(context) * 2.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: AppDimensions.height10(context) * 2.2,
                  width: AppDimensions.width10(context) * 29,
                  child: Text(widget.circle_text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: _focusNode.hasFocus
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFFFFFFFF),
                        fontSize: AppDimensions.font10(context) * 2.2,
                      ))),
              widget.delete
                  ? GestureDetector(
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                          width: AppDimensions.width10(context) * 27.0,
                          height: AppDimensions.height10(context) * 18.2,
                          child: AlertDialog(
                            actionsPadding: const EdgeInsets.all(0.0),
                            contentPadding: const EdgeInsets.all(0.0),
                            titlePadding: const EdgeInsets.all(0.0),
                            title: Container(
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.9,
                                  right: AppDimensions.width10(context) * 1.6,
                                  left: AppDimensions.width10(context) * 1.6,
                                  bottom: AppDimensions.height10(context) * 0),
                              height: AppDimensions.height10(context) * 2.2,
                              width: AppDimensions.width10(context) * 23.8,
                              child: Text(
                                "Delete",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Laila",
                                  fontSize: AppDimensions.font10(context) * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            content: Container(
                              // color:Colors.red,
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10(context) * 1.9,
                                  left: AppDimensions.width10(context) * 1.6,
                                  right: AppDimensions.width10(context) * 1.6),
                              height: AppDimensions.height10(context) * 3.2,
                              width: AppDimensions.width10(context) * 23.8,
                              child: Text(
                                "Are you sure you want to delete this \n item?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.3,
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
                                        AppDimensions.height10(context) * 4.4,
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
                                                AppDimensions.font10(context) *
                                                    1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 4.4,
                                    width:
                                        AppDimensions.width10(context) * 27.0,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
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
                      ),
                      child: Container(
                        height: AppDimensions.height10(context) * 2.1,
                        width: AppDimensions.width10(context) * 2.1,

                        // color: Colors.blue,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/bin.webp"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          SizedBox(
            height: AppDimensions.height10(context) * 0.9,
          ),
          SizedBox(
              height: AppDimensions.height10(context) * 5.3,
              width: AppDimensions.width10(context) * 32.0,
              child: CupertinoTextField(
                placeholder: widget.bodyText,
                placeholderStyle: TextStyle(
                    fontSize: AppDimensions.font10(context) * 1.6,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFFFFFF)),
                controller: bodyText,
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
