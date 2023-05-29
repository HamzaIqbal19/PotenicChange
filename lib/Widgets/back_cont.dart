import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_constants.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
// import 'package:flutter_ui/pages/goalsetting/bottom_sheet.dart';
// import 'package:potenic_app/utils/backDecor.dart';
// import 'package:potenic_app/utils/icons.dart';

class backbox extends StatefulWidget {
  TextEditingController reason = TextEditingController();
  String goalName;
  String category;
  backbox({required this.reason,required this.goalName, required this.category});

  @override
  State<backbox> createState() => _backboxState(reason: reason);
}

class _backboxState extends State<backbox> {
  int times=1;
  // List<Widget> containers=[];

  void increment(){
    setState(() {
      times++;
    });
  }

  late FocusNode _focusNode;

  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocus);
  }

  void _onFocus() {
    setState(() {});
  }
  TextEditingController reason = TextEditingController();

  _backboxState({required this.reason});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: AppDimensions.height10 * 38.2,
          height: AppDimensions.height10 * 42.3,
          padding: EdgeInsets.only(left:AppDimensions.height10*1.1,right:AppDimensions.height10*1.1 ),
          
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
                        for(int i = 1; i<=times;i++) ...[
                          Column(
                            children: <Widget>[
                  Container(
                    height: AppDimensions.height10 * 17.9,
                    width: AppDimensions.height10 * 38.0,
                    padding: EdgeInsets.only(
                        top: AppDimensions.height10 * 1.3,
                        left: AppDimensions.height10*2.0,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: AppDimensions.height10 * 3.6,
                            // width: AppDimensions.height10 * 26.9,
                            child: Text('Reason ${times}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Laila",
                                  color: _focusNode.hasFocus
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF828282),
                                  fontSize: AppDimensions.height10 * 2.2,
                                ))),
                        SizedBox(
                          height: AppDimensions.height10 * 0.9,
                        ),
                        Container(
                            height: AppDimensions.height10 * 7.5,
                            // width: AppDimensions.height10 * 26.9,

                            child: CupertinoTextField(
                              placeholder: "I want to achieve this goal because...",
                              textAlignVertical: TextAlignVertical.top,
                              placeholderStyle: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Laila",
                                color: _focusNode.hasFocus
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF828282),),
                              controller: reason,
                              focusNode: _focusNode,
                              maxLines: 4,
                              style: const   TextStyle(
                                  fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF)),
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                            )),
                      ],
                    ),
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
    ]);
  }
}

// class inner_text extends StatefulWidget {
//   String circle_text;
//   inner_text(this.circle_text,{super.key});
//
//
//   @override
//   State<inner_text> createState() => _inner_textState();
// }
//
// class _inner_textState extends State<inner_text> {
//   final TextEditingController body_text = TextEditingController();
//   final TextEditingController heading_text = TextEditingController();
//
//   late FocusNode _focusNode;
//
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode()..addListener(_onFocus);
//   }
//
//   void _onFocus() {
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: AppDimensions.height10 * 17.9,
//       width: AppDimensions.height10 * 38.0,
//       padding: EdgeInsets.only(
//           top: AppDimensions.height10 * 1.3,
//           left: AppDimensions.height10*2.0,
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
//
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
//
//               child: CupertinoTextField(
//                 placeholder: "I want to achieve this goal because...",
//                 textAlignVertical: TextAlignVertical.top,
//                 placeholderStyle: TextStyle(
//                     fontSize: AppDimensions.height10 * 1.6,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Laila",
//                     color: _focusNode.hasFocus
//                     ? const Color(0xFFFFFFFF)
//                       : const Color(0xFF828282),),
//                 controller: body_text,
//                 focusNode: _focusNode,
//                 maxLines: 4,
//                 style: const   TextStyle(
//                     fontWeight: FontWeight.w500, color: Color(0xFFFFFFFF)),
//                 decoration: const BoxDecoration(
//                   color: Colors.transparent,
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }

// FloatingActionButton add_reason = FloatingActionButton(
//   elevation: 0,
//   backgroundColor: Colors.transparent,
//   onPressed: () {
// //
//   },
//   child: Icon(
//     Icons.add,
//     color: Colors.white,
//     size: AppDimensions.height10 * 3.5,
//   ),
//   shape: RoundedRectangleBorder(
//       side: BorderSide(width: 3, color: Colors.white),
//       borderRadius: BorderRadius.circular(100)),
// );
