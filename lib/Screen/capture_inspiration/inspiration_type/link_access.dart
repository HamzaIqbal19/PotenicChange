import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';

import '../../../utils/app_dimensions.dart';

class link_info extends StatefulWidget {
  const link_info({super.key});

  @override
  State<link_info> createState() => _link_infoState();
}

class _link_infoState extends State<link_info> {
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
            height: AppDimensions.height10 * 84.8,
            child: Column(children: [
              Container(
                // width: AppDimensions.height10 * 41.1,
                height: AppDimensions.height10 * 5.1,
                //margin: EdgeInsets.only(top: AppDimensions.height10 * 5.4),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5).withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppDimensions.height10 * 1.0),
                        topRight:
                            Radius.circular(AppDimensions.height10 * 1.0))),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: AppDimensions.height10 * 2.2,
                    width: AppDimensions.height10 * 3.3,
                    margin:
                        EdgeInsets.only(right: AppDimensions.height10 * 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.5,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff007AFF)),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: AppDimensions.height10 * 2.2,
                      width: AppDimensions.height10 * 24.8,
                      child: Center(
                        child: Text(
                          'Create inspiration content link',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.7,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff282828)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: AppDimensions.height10 * 2.2,
                    width: AppDimensions.height10 * 4.3,
                    margin: EdgeInsets.only(left: AppDimensions.height10 * 4.0),
                    child: Text(
                      'Create',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.5,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff007AFF).withOpacity(0.4)),
                    ),
                  )
                ]),
              ),
              Container(
                height: AppDimensions.height10 * 79.7,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: AppDimensions.height10 * 2.1,
                      width: AppDimensions.height10 * 30.5,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 2.0,
                          right: AppDimensions.height10 * 8.9,
                          top: AppDimensions.height10 * 3.2),
                      child: Text(
                        'Content Destination Link',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: AppDimensions.height10 * 2.4,
                          width: AppDimensions.height10 * 30.5,
                          margin: EdgeInsets.only(
                            left: AppDimensions.height10 * 1.5,
                            right: AppDimensions.height10 * 5.0,
                          ),
                          child: TextFormField(
                            onEditingComplete: () {
                              setState(() {
                                link_state = true;
                              });
                            },
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff282828)),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(
                                    AppDimensions.height10 * 1.4,
                                    AppDimensions.height10 * 0.4,
                                    0,
                                    0),
                                hintText: 'Add a link',
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: AppDimensions.height10 * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff828282)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                        ),
                        link_state
                            ? Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => link_editer()));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.5,
                                      height: AppDimensions.height10 * 2.5,
                                      // margin: EdgeInsets.only(
                                      //     right: AppDimensions.height10 * 0.8),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: AppDimensions.height10 * 2,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 3.0,
                                    height: AppDimensions.height10 * 3.0,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10 * 2.0),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: AppDimensions.height10 * 2,
                                    ),
                                  )
                                ],
                              )
                            : GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => link_editer()));
                                },
                                child: Container(
                                  width: AppDimensions.height10 * 3.0,
                                  height: AppDimensions.height10 * 3.0,
                                  // margin: EdgeInsets.only(
                                  //     left: AppDimensions.height10 * 3.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: AppDimensions.height10 * 2,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Container(
                      height: AppDimensions.height10 * 2.1,
                      width: AppDimensions.height10 * 30.5,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 2.0,
                          right: AppDimensions.height10 * 8.9,
                          top: AppDimensions.height10 * 3.9),
                      child: Text(
                        'Why is it inspirational to you',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                      ),
                    ),
                    Container(
                      height: AppDimensions.height10 * 2.4,
                      width: AppDimensions.height10 * 30.5,
                      margin: EdgeInsets.only(
                        //left: AppDimensions.height10 * 2.0,
                        right: AppDimensions.height10 * 10.0,
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff282828)),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(
                                AppDimensions.height10 * 1.6,
                                AppDimensions.height10 * 0.4,
                                0,
                                0),
                            hintText: 'Say more about this inspiration ',
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff828282)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(
                      height: AppDimensions.height10 * 2.1,
                      width: AppDimensions.height10 * 30.5,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 2.0,
                          right: AppDimensions.height10 * 8.9,
                          top: AppDimensions.height10 * 3.9),
                      child: Text(
                        'Content Author',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                      ),
                    ),
                    Container(
                      height: AppDimensions.height10 * 2.4,
                      width: AppDimensions.height10 * 30.5,
                      margin: EdgeInsets.only(
                        // left: AppDimensions.height10 * 2.0,
                        right: AppDimensions.height10 * 10.0,
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff282828)),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(
                                AppDimensions.height10 * 1.6,
                                AppDimensions.height10 * 0.4,
                                0,
                                0),
                            hintText: 'Who created the content',
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                color: const Color(0xff828282)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(
                      height: AppDimensions.height10 * 2.1,
                      width: AppDimensions.height10 * 30.5,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 2.0,
                          right: AppDimensions.height10 * 8.9,
                          top: AppDimensions.height10 * 3.9),
                      child: Text(
                        'Tags',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                      ),
                    ),
                    Container(
                      height: AppDimensions.height10 * 2.4,
                      width: AppDimensions.height10 * 30.5,
                      margin: EdgeInsets.only(
                        // left: AppDimensions.height10 * 2.0,
                        right: AppDimensions.height10 * 10.0,
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff282828)),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(
                                AppDimensions.height10 * 1.6,
                                AppDimensions.height10 * 0,
                                0,
                                0),
                            hintText: 'Add #hashtag',
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff828282)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(
                      height: AppDimensions.height10 * 2.1,
                      width: AppDimensions.height10 * 30.5,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 2.0,
                          right: AppDimensions.height10 * 8.9,
                          top: AppDimensions.height10 * 3.9),
                      child: Text(
                        'Attached goals',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const note_info(
                                    note_saved: true, type_switch: 2)));
                      },
                      child: Container(
                        height: AppDimensions.height10 * 6.0,
                        width: AppDimensions.height10 * 37.5,
                        margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 2.0,
                          right: AppDimensions.height10 * 1.9,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xFF464646)),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppDimensions.height10 * 23.9,
                              height: AppDimensions.height10 * 2.2,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 1.99),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    '00 impacted goals',
                                    style: TextStyle(
                                      color: const Color(0xFF646464),
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                            Container(
                                width: AppDimensions.height10 * 2.4,
                                height: AppDimensions.height10 * 1.39,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 2.391),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/BTN Back.png',
                                    //width: AppDimensions.height10 * 2.6,
                                    //height: AppDimensions.height10 * 2.6,
                                    color: const Color(0xFF646464),
                                    fit: BoxFit.cover,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
