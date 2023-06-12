import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_veiw_detail.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/link_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/video_access.dart';

import '../../Widgets/fading.dart';
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
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
                )),
          )
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        // title: Container(
        //   width: AppDimensions.height10(context) * 5.5,
        //   height: AppDimensions.height10(context) * 2.4,
        //   child: Center(
        //     child: Text(
        //       'Menu',
        //       style: TextStyle(
        //           fontSize: AppDimensions.height10(context) * 2.00,
        //           fontWeight: FontWeight.w600,
        //           color: Color(0xFFFFFFFF)),
        //     ),
        //   ),
        // ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_inpiration_purple.png'),
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              width: AppDimensions.height10(context) * 5.5,
              height: AppDimensions.height10(context) * 2.5,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 4.8),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.00,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF)),
                ),
              ),
            ),
            Container(
              // width: AppDimensions.height10(context) * 16.7,
              //height: AppDimensions.height10(context) * 21.2,
              margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 4.3,
              ),
              child: Column(
                children: [
                  if (widget.type_switch == 1) ...[
                    Column(children: [
                      Container(
                        width: AppDimensions.height10(context) * 16.7,
                        height: AppDimensions.height10(context) * 16.7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/sir_nyal.png'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 16.7,
                        height: AppDimensions.height10(context) * 1.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.5),
                        child: Center(
                            child: Text(
                          'Influencer',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF)),
                        )),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 3.0,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Nir Eyal',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFFFFFFF)),
                            )),
                      )
                    ])
                  ] else if (widget.type_switch == 2) ...[
                    Column(children: [
                      Container(
                        width: AppDimensions.height10(context) * 16.7,
                        height: AppDimensions.height10(context) * 16.7,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                              colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)]),
                        ),
                        child: Center(
                          child: Text(
                            'Lorem ipsum dolor\nsit amet, consectetur\nadipiscing elit. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 16.7,
                        height: AppDimensions.height10(context) * 1.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.5),
                        child: Center(
                            child: Text(
                          'Notes',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF)),
                        )),
                      ),
                      SizedBox(
                        width: AppDimensions.height10(context) * 16.7,
                        height: AppDimensions.height10(context) * 3.0,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit....',
                              style: TextStyle(
                                  height:
                                      AppDimensions.height10(context) * 0.15,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFFFFFFF)),
                            )),
                      )
                    ])
                  ] else if (widget.type_switch == 3) ...[
                    Column(children: [
                      Container(
                        width: AppDimensions.height10(context) * 16.7,
                        height: AppDimensions.height10(context) * 16.7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/video_play.png'))),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 16.7,
                        height: AppDimensions.height10(context) * 1.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.5),
                        child: Center(
                            child: Text(
                          'Music Eye Of The Tiger ',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF)),
                        )),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 3.0,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Survivors',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFFFFFFF)),
                            )),
                      )
                    ])
                  ] else if (widget.type_switch == 4) ...[
                    Column(children: [
                      Container(
                        width: AppDimensions.height10(context) * 16.7,
                        height: AppDimensions.height10(context) * 16.7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFD9D9D9),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/distraction content.png'))),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 16.7,
                        height: AppDimensions.height10(context) * 1.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.5),
                        child: Center(
                            child: Text(
                          'Content',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF)),
                        )),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 3.0,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Learn How To Avoid Distraction In A\nWorld That Is Full Of It',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFFFFFFF)),
                            )),
                      )
                    ])
                  ]
                ],
              ),
            ),
            Container(
              width: AppDimensions.height10(context) * 32.0,
              height: AppDimensions.height10(context) * 2.6,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 2.9),
              child: Center(
                  child: Text(
                'What do you want to do?',
                style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),
            ),
            Container(
              width: AppDimensions.height10(context) * 36.0,
              height: AppDimensions.height10(context) * 28.5,
              margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 3.4,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.type_switch == 1) {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const veiw_details(
                            type_switch: 1,
                          )),
                        );
                      } else if (widget.type_switch == 2) {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const veiw_details(
                            type_switch: 3,
                          )),
                        );
                      } else if (widget.type_switch == 3) {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const veiw_details(
                            type_switch: 4,
                          )),
                        );
                      } else if (widget.type_switch == 4) {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const veiw_details(
                            type_switch: 2,
                          )),
                        );
                      }
                    },
                    child: Container(
                      width: AppDimensions.height10(context) * 36.0,
                      height: AppDimensions.height10(context) * 6.0,
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) * 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 23.9,
                            height: AppDimensions.height10(context) * 2.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.99),
                            child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'View details',
                                  style: TextStyle(
                                    color: const Color(0xFF646464),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ),
                          Container(
                              width: AppDimensions.height10(context) * 2.4,
                              height: AppDimensions.height10(context) * 1.39,
                              margin: EdgeInsets.only(
                                  right:
                                      AppDimensions.height10(context) * 2.391),
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/BTN Back.png',
                                  color: const Color(0xFF646464),
                                  //width: AppDimensions.height10(context) * 2.6,
                                  //height: AppDimensions.height10(context) * 2.6,
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
                          FadePageRoute(
                              page: const photo_info(
                            edit_details: true,
                            image_detals: true,
                            image_save: true,
                            image_create: false,
                          )),
                        );
                      } else if (widget.type_switch == 2) {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const note_info(
                                  note_saved: true, type_switch: 1)),
                        );
                      } else if (widget.type_switch == 3) {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const note_info(
                                  note_saved: true, type_switch: 3)),
                        );
                      } else if (widget.type_switch == 4) {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const note_info(
                                  note_saved: true, type_switch: 2)),
                        );
                      }
                    },
                    child: Container(
                      width: AppDimensions.height10(context) * 36.0,
                      height: AppDimensions.height10(context) * 6.0,
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) * 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 23.9,
                            height: AppDimensions.height10(context) * 2.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.99),
                            child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Edit details',
                                  style: TextStyle(
                                    color: const Color(0xFF646464),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ),
                          Container(
                              width: AppDimensions.height10(context) * 2.4,
                              height: AppDimensions.height10(context) * 1.39,
                              margin: EdgeInsets.only(
                                  right:
                                      AppDimensions.height10(context) * 2.391),
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/BTN Back.png',
                                  color: const Color(0xFF646464),
                                  //width: AppDimensions.height10(context) * 2.6,
                                  //height: AppDimensions.height10(context) * 2.6,
                                  fit: BoxFit.cover,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 17.0,
                    height: AppDimensions.height10(context) * 0.5,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: Colors.white),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 6.0,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.height10(context) * 2.4,
                          height: AppDimensions.height10(context) * 2.4,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 0.5,
                          ),
                          child: const Icon(
                            Icons.share,
                            color: Color(0xff646464),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10(context) * 5.0,
                          height: AppDimensions.height10(context) * 2.2,
                          child: Center(
                              child: Text(
                            'Share',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF646464)),
                          )),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                              width: AppDimensions.height10(context) * 27.0,
                              height: AppDimensions.height10(context) * 21.4,
                              child: AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                actionsPadding: EdgeInsets.zero,
                                titlePadding: EdgeInsets.zero,
                                title: Container(
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            1.9,
                                        right: AppDimensions.height10(context) *
                                            1.6,
                                        left: AppDimensions.height10(context) *
                                            1.6,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                0.2),
                                    height:
                                        AppDimensions.height10(context) * 4.4,
                                    width:
                                        AppDimensions.height10(context) * 23.8,
                                    child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.7,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF000000)),
                                            children: const [
                                              TextSpan(
                                                  text:
                                                      'Are you sure you want\nto'),
                                              TextSpan(
                                                text: ' delete ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              TextSpan(
                                                  text: 'this inspiration?')
                                            ]))),
                                content: Container(
                                  margin: EdgeInsets.only(
                                      bottom:
                                          AppDimensions.height10(context) * 1.5,
                                      left:
                                          AppDimensions.height10(context) * 1.6,
                                      right: AppDimensions.height10(context) *
                                          1.6),
                                  height: AppDimensions.height10(context) * 3.4,
                                  width: AppDimensions.height10(context) * 23.8,
                                  child: Text(
                                    "By clicking 'Yes' you confirm that this\ninspiration will be deleted permanently. ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF000000),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.3,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.1,
                                        child: Divider(
                                          color: const Color(0XFF3C3C43)
                                              .withOpacity(0.29),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                4.2,
                                        width: double.infinity,
                                        color: const Color(0xFF007AFF),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                                color: const Color(0xFFFFFFFF),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.7,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.1,
                                        child: Divider(
                                          color: const Color(0XFF3C3C43)
                                              .withOpacity(0.29),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                4.4,
                                        width: double.infinity,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.7,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF007AFF)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
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
                            )),
                    child: Container(
                      width: AppDimensions.height10(context) * 36.0,
                      height: AppDimensions.height10(context) * 6.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.1,
                              color: const Color(0xFFFFFFFF)),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: const Color(0xff464646)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 2.4,
                            height: AppDimensions.height10(context) * 2.4,
                            margin: EdgeInsets.only(
                              right: AppDimensions.height10(context) * 0.5,
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Color(0XFFFFFFFF),
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 5.3,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Center(
                                child: Text(
                              'Delete',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffffffff)),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: AppDimensions.height10(context) * 17.0,
              height: AppDimensions.height10(context) * 0.5,
              //alignment: Alignment.bottomCenter,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 18.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                  color: const Color(0xFFFFFFFF).withOpacity(0.3)),
            ),
          ],
        ),
      ),
    );
  }
}
