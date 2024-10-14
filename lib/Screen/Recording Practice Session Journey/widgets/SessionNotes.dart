
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeEmotions.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class addNotes extends StatefulWidget {
  final bool state_;
  final TextEditingController controller;
  const addNotes({
    super.key,
    required this.state_, required this.controller,
  });

  @override
  State<addNotes> createState() => _addNotesState();
}

class _addNotesState extends State<addNotes> {
  int iconColor = 0xffffffff;
  int backColor = 0x000000ff;
  bool noteCheck = false;

  getNotes(){
    return Column(
      children: [
        Container(
          width: AppDimensionsUpdated.width10(context) * 36.0,
          // height: AppDimensionsUpdated.height10(context) * 11.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensionsUpdated.height10(context) * 1.8)),
              color: Colors.white),
          child: Column(
            children: [
              TextFormField(
                controller: widget.controller,
                maxLength: 150,
                maxLines: null,
                minLines: null,
                scrollPadding: EdgeInsets.zero,
                decoration: InputDecoration(
                    hintText: 'Add notes here',
                    hintStyle: TextStyle(
                      fontSize: AppDimensionsUpdated.font10(context) * 1.6,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff646464),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: AppDimensionsUpdated.width10(context) * 7.6,
          height: AppDimensionsUpdated.height10(context) * 7.6,
          //margin: EdgeInsets.only(bottom: 113),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScaleButton(
                onTap: () {
                  noteCheck
                      ? setState(() {
                    backColor = 0x000000ff;
                    iconColor = 0xffffffff;
                    noteCheck = false;
                  })
                      : setState(() {
                    backColor = 0xffffffff;
                    iconColor = 0xffFA9934;
                    noteCheck = true;
                    // icon_color = 0xffFA9934,
                  });
                },
                child: Container(
                  width: AppDimensionsUpdated.width10(context) * 5.0,
                  height: AppDimensionsUpdated.height10(context) * 5.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(backColor),
                      border: Border.all(
                          width: AppDimensionsUpdated.width10(context) * 0.2,
                          color: Color(iconColor))),
                  child: Container(
                    height: AppDimensionsUpdated.height10(context) * 2.7,
                    width: AppDimensionsUpdated.width10(context) * 2.7,
                    margin: const EdgeInsets.only(left: 3),
                    child: Center(
                        child: Icon(
                          Icons.edit_note,
                          //size: 27,
                          color: Color(iconColor),
                        )),
                  ),
                ),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 7.6,
                height: AppDimensionsUpdated.height10(context) * 1.9,
                margin:
                EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 0.6),
                child: Text(
                  'Add Notes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensionsUpdated.font10(context) * 1.6,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Container(
            child: noteCheck
                ? Container(
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 1.0,
                    bottom: AppDimensionsUpdated.height10(context) * 2.0),
                child: getNotes())
                : SizedBox(
              height: AppDimensionsUpdated.height10(context) * 12.1,
            )),
      ],
    );
  }
}
