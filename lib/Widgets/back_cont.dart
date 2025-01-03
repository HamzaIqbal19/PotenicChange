import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class inner_text extends StatefulWidget {
  final String head_text;
  final String body_text;
  final String placeHolder;
  final bool delete;
  final int index;
  final int length;
  final bool comingFromEditScreen;

  final ValueChanged<String> onChanged;

  final VoidCallback onDelete;
  const inner_text(
      {Key? key,
      required this.head_text,
      required this.body_text,
      required this.length,
      required this.onChanged,
      required this.onDelete,
      required this.delete,
      required this.index,
      required this.comingFromEditScreen,
      required this.placeHolder})
      : super(key: key);

  @override
  State<inner_text> createState() => _inner_textState();
}

class _inner_textState extends State<inner_text> {
  late TextEditingController body_text;

  late FocusNode _focusNode;
  bool delete = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocus);
    body_text = TextEditingController(text: widget.body_text);
    body_text.addListener(_onTextChanged);
  }

  void _onFocus() {
    setState(() {});
  }

  void _onTextChanged() {
    final newValue = body_text.text;
    if (newValue != '') {
      widget.onChanged(newValue);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    body_text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          FocusScope.of(context).requestFocus(_focusNode);
        });
      },
      child: Container(
        //height: AppDimensions.height10(context) * 17.0,
        width: AppDimensions.width10(context) * 36.0,
        padding: EdgeInsets.only(
            top: AppDimensions.height10(context) * 1,
            bottom: AppDimensions.height10(context) * 0.5,
            left: AppDimensions.width10(context) * 2,
            right: AppDimensions.width10(context) * 2.0),
        decoration: BoxDecoration(
            gradient: !_focusNode.hasFocus
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFEFBEB2), Color(0xFFEAA897)])
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFEECDC5), Color(0xFFF6E0DB)]),
            // color: Colors.white,

            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.all(
                Radius.circular(AppDimensions.height10(context) * 1.8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    //height: AppDimensions.height10(context) * 3.6,
                    // width: AppDimensions.width10(context) * 26.9,
                    child: Text(widget.head_text,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Laila",
                          color: widget.comingFromEditScreen
                              ? Colors.white
                              : !_focusNode.hasFocus
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF828282),
                          fontSize: AppDimensions.font10(context) * 2.4,
                        ))),
                widget.delete
                    ? GestureDetector(
                        onTap: () {
                          showAnimatedDialog(
                            animationType: DialogTransitionType.fadeScale,
                            curve: Curves.easeInOut,
                            duration: const Duration(seconds: 1),
                            context: context,
                            builder: (BuildContext context) => SizedBox(
                              width: AppDimensions.width10(context) * 27.0,
                              height: AppDimensions.height10(context) * 18.2,
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 1.4)),
                                actionsPadding: const EdgeInsets.all(0.0),
                                contentPadding: const EdgeInsets.all(0.0),
                                titlePadding: const EdgeInsets.all(0.0),
                                title: Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) * 1.9,
                                      right:
                                          AppDimensions.height10(context) * 1.6,
                                      left: AppDimensions.width10(context) * 1.6,
                                      bottom:
                                          AppDimensions.height10(context) * 0),
                                  height: AppDimensions.height10(context) * 2.2,
                                  width: AppDimensions.width10(context) * 23.8,
                                  child: Text(
                                    "Delete",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Laila",
                                      fontSize:
                                          AppDimensions.font10(context) * 1.7,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                content: Container(
                                  // color:Colors.red,
                                  margin: EdgeInsets.only(
                                      bottom:
                                          AppDimensions.height10(context) * 1.9,
                                      left: AppDimensions.width10(context) * 1.6,
                                      right:
                                          AppDimensions.height10(context) * 1.6),
                                  height: AppDimensions.height10(context) * 3.2,
                                  width: AppDimensions.width10(context) * 23.8,
                                  child: Text(
                                    "Are you sure you want to delete this \n item?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.3,
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
                                                fontSize: AppDimensions.font10(
                                                        context) *
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
                                          onPressed: () {
                                            widget.onDelete();
                                            Navigator.pop(context);
                                          },
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
                          );
                        },
                        child: Container(
                          height: AppDimensions.width10(context) * 2.5,
                          width: AppDimensions.width10(context) * 2.5,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.0,
                              right: AppDimensions.width10(context) * 1.0),
                          //margin: EdgeInsets.only(bottom: AppDimensions.height10(context)*1.0),
                          padding: EdgeInsets.all(
                              AppDimensions.height10(context) * 0.3),
                          // color: Colors.blue,
                          child: Image.asset("assets/images/bin.webp"),
                        ),
                      )
                    : Container()
              ],
            ),
            // SizedBox(
            //   height: AppDimensions.height10(context) * 0.9,
            // ),
            // SizedBox(
            //   height: AppDimensions.height10(context) * 0.9,
            // ),
            Container(
                //height: AppDimensions.height10(context) * 6.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 0.5,
                    bottom: AppDimensions.height10(context)),
                width: AppDimensions.width10(context) * 32.0,
                child: TextFormField(
                  onChanged: widget.onChanged,
                  maxLength: widget.length,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 6,
                  minLines: 3,
                  scrollPadding: EdgeInsets.zero,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: widget.placeHolder,
                      counterText: '',
                      counterStyle: const TextStyle(height: double.minPositive),
                      hintStyle: TextStyle(
                          height: AppDimensions.height10(context) * 0.15,
                          fontSize: AppDimensions.font10(context) * 2.4,
                          fontWeight: FontWeight.w500,
                          color: widget.comingFromEditScreen
                              ? Colors.white
                              : !_focusNode.hasFocus
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF828282)),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none),

                  controller: body_text,
                  // maxLines: 4,
                  focusNode: _focusNode,
                  style: TextStyle(
                      //  height: AppDimensions.height10(context) * 0.15,
                    fontSize: AppDimensions.font10(context) * 2.4,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Laila",
                      height: AppDimensions.height10(context) * 0.14,
                      color: !_focusNode.hasFocus
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF828282)),
                  onFieldSubmitted: (value){

                  },
                )),
          ],
        ),
      ),
    );
  }
}
