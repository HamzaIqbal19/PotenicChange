import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_veiw_detail.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/link_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/video_access.dart';

import '../../utils/app_dimensions.dart';

class record_inspiration extends StatefulWidget {
  final int type_switch;
  const record_inspiration({super.key, required this.type_switch});

  @override
  State<record_inspiration> createState() => _record_inspirationState();
}

class _record_inspirationState extends State<record_inspiration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Center(
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/Close.png',
                  width: AppDimensions.height10 * 2.6,
                  height: AppDimensions.height10 * 2.6,
                  fit: BoxFit.cover,
                )),
          )
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        // title: Container(
        //   width: AppDimensions.height10 * 5.5,
        //   height: AppDimensions.height10 * 2.4,
        //   child: Center(
        //     child: Text(
        //       'Menu',
        //       style: TextStyle(
        //           fontSize: AppDimensions.height10 * 2.00,
        //           fontWeight: FontWeight.w600,
        //           color: Color(0xFFFFFFFF)),
        //     ),
        //   ),
        // ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // margin: EdgeInsets.only(top: AppDimensions.height10 * 6.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_inpiration_purple.png'),
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              width: AppDimensions.height10 * 5.5,
              height: AppDimensions.height10 * 2.4,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 4.8),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.00,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
            Container(
              // width: AppDimensions.height10 * 16.7,
              //height: AppDimensions.height10 * 21.2,
              margin: EdgeInsets.only(
                top: AppDimensions.height10 * 4.3,
              ),
              child: Column(
                children: [
                  if (widget.type_switch == 1) ...[
                    Column(children: [
                      Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 16.7,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/sir_nyal.png'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 1.9,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 0.5),
                        child: Center(
                            child: Text(
                          'Influencer',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF)),
                        )),
                      ),
                      SizedBox(
                        child: Center(
                            child: Text(
                          'Nir Eyal',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF)),
                        )),
                      )
                    ])
                  ] else if (widget.type_switch == 2) ...[
                    Column(children: [
                      Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 16.7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)]),
                        ),
                        child: Center(
                          child: Text(
                            'Lorem ipsum dolor\nsit amet, consectetur\nadipiscing elit. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 1.9,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 0.5),
                        child: Center(
                            child: Text(
                          'Notes',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF)),
                        )),
                      ),
                      Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 3.0,
                        child: Center(
                            child: Text(
                          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit....',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF)),
                        )),
                      )
                    ])
                  ] else if (widget.type_switch == 3) ...[
                    Column(children: [
                      Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 16.7,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/video_play.png'))),
                      ),
                      Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 1.9,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 0.5),
                        child: Center(
                            child: Text(
                          'Music Eye Of The Tiger ',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF)),
                        )),
                      ),
                      SizedBox(
                        child: Center(
                            child: Text(
                          'Survivors',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF)),
                        )),
                      )
                    ])
                  ] else if (widget.type_switch == 4) ...[
                    Column(children: [
                      Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 16.7,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFD9D9D9),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/distraction content.png'))),
                      ),
                      Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 1.9,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 0.5),
                        child: Center(
                            child: Text(
                          'Content',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF)),
                        )),
                      ),
                      SizedBox(
                        child: Center(
                            child: Text(
                          'Learn How To Avoid Distraction In A\nWorld That Is Full Of It',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF)),
                        )),
                      )
                    ])
                  ]
                ],
              ),
            ),
            Container(
              width: AppDimensions.height10 * 32.0,
              height: AppDimensions.height10 * 2.6,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 2.9),
              child: Center(
                  child: Text(
                'What do you want to do?',
                style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.2,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),
            ),
            Container(
              width: AppDimensions.height10 * 36.0,
              height: AppDimensions.height10 * 28.5,
              margin: EdgeInsets.only(
                top: AppDimensions.height10 * 3.4,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.type_switch == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => veiw_details(
                                    type_switch: 1,
                                  )),
                        );
                      } else if (widget.type_switch == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => veiw_details(
                                    type_switch: 3,
                                  )),
                        );
                      } else if (widget.type_switch == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => veiw_details(
                                    type_switch: 4,
                                  )),
                        );
                      } else if (widget.type_switch == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => veiw_details(
                                    type_switch: 2,
                                  )),
                        );
                      }
                    },
                    child: Container(
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 6.0,
                      margin:
                          EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          color: Colors.white),
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
                                  'View details',
                                  style: TextStyle(
                                    color: Color(0xFF646464),
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
                                  fit: BoxFit.cover,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.type_switch == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => photo_info(
                                  edit_details: true,
                                  image_detals: true,
                                  image_save: true)),
                        );
                      } else if (widget.type_switch == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  note_info(note_saved: true, type_switch: 1)),
                        );
                      } else if (widget.type_switch == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  note_info(note_saved: true, type_switch: 3)),
                        );
                      } else if (widget.type_switch == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  note_info(note_saved: true, type_switch: 2)),
                        );
                      }
                    },
                    child: Container(
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 6.0,
                      margin:
                          EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          color: Colors.white),
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
                                  'Edit details',
                                  style: TextStyle(
                                    color: Color(0xFF646464),
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
                                  fit: BoxFit.cover,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 17.0,
                    height: AppDimensions.height10 * 0.5,
                    margin:
                        EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Colors.white),
                  ),
                  Container(
                    width: AppDimensions.height10 * 36.0,
                    height: AppDimensions.height10 * 6.0,
                    margin:
                        EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 2.4,
                          height: AppDimensions.height10 * 2.4,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 0.5,
                          ),
                          child: Icon(
                            Icons.share,
                            color: Color(0xff646464),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 5.0,
                          height: AppDimensions.height10 * 2.2,
                          child: Center(
                              child: Text(
                            'Share',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF646464)),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 36.0,
                    height: AppDimensions.height10 * 6.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: AppDimensions.height10 * 0.1,
                            color: Color(0xFFFFFFFF)),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Color(0xff464646)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 2.4,
                          height: AppDimensions.height10 * 2.4,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 0.5,
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 5.3,
                          height: AppDimensions.height10 * 2.2,
                          child: Center(
                              child: Text(
                            'Delete',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffffffff)),
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
