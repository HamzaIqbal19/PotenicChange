import 'package:flutter/material.dart';

import '../../../Widgets/fading.dart';
import '../../../utils/app_dimensions.dart';

class upload_image_popup extends StatefulWidget {
  const upload_image_popup({super.key});

  @override
  State<upload_image_popup> createState() => _upload_image_popupState();
}

class _upload_image_popupState extends State<upload_image_popup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xff8E8E93),
        child: Center(
          child: Container(
            width: AppDimensions.height10 * 27.0,
            height: AppDimensions.height10 * 24.8,
            decoration: BoxDecoration(
                color: const Color(0xff1E1E1E).withOpacity(0.75),
                borderRadius:
                    BorderRadius.circular(AppDimensions.height10 * 1.4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppDimensions.height10 * 11.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // width: AppDimensions.height10 * 23.8,
                        height: AppDimensions.height10 * 4.3,
                        child: Text(
                          'Potenic would like to access\nyour photos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.7,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        // width: AppDimensions.height10 * 23.8,
                        height: AppDimensions.height10 * 3.35,
                        child: Text(
                          'To upload from your device, allow\naccess to your photos.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.3,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 0.1,
                  child: Divider(
                    color: const Color(0xff545458).withOpacity(0.65),
                    //thickness: AppDimensions.height10 * 0.5,
                    height: AppDimensions.height10 * 0.5,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, FadePageRoute(page: const image_info()));
                  },
                  child: SizedBox(
                    height: AppDimensions.height10 * 4.3,
                    child: Center(
                      child: Text(
                        'Select Photos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.7,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff0A84FF)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 0.1,
                  child: Divider(
                    color: const Color(0xff545458).withOpacity(0.65),
                    //thickness: AppDimensions.height10 * 0.5,
                    height: AppDimensions.height10 * 0.5,
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 4.3,
                  child: Center(
                    child: Text(
                      'Allow Access to All Photos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.7,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff0A84FF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 0.1,
                  child: Divider(
                    color: const Color(0xff545458).withOpacity(0.65),
                    //thickness: AppDimensions.height10 * 0.5,
                    height: AppDimensions.height10 * 0.5,
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 4.3,
                  child: Center(
                    child: Text(
                      'Don’t Allow',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.7,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff0A84FF)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class image_info extends StatefulWidget {
  const image_info({super.key});

  @override
  State<image_info> createState() => _image_infoState();
}

class _image_infoState extends State<image_info> {
  @override
  Widget build(BuildContext context) {
    bool link_state = true;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffC4C4C4),
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: AppDimensions.height10 * 83.517,
        child: Column(children: [
          Container(
            // width: AppDimensions.height10 * 41.1,
            height: AppDimensions.height10 * 5.1,
            // margin: EdgeInsets.only(top: AppDimensions.height10 * 5.4),
            decoration: BoxDecoration(
                color: const Color(0xffF5F5F5).withOpacity(0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppDimensions.height10 * 1.0),
                    topRight: Radius.circular(AppDimensions.height10 * 1.0))),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: AppDimensions.height10 * 2.2,
                width: AppDimensions.height10 * 3.3,
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
              Container(
                height: AppDimensions.height10 * 2.2,
                width: AppDimensions.height10 * 14.7,
                margin: EdgeInsets.only(
                    left: AppDimensions.height10 * 9.1,
                    right: AppDimensions.height10 * 6.4),
                child: Text(
                  'Create inspiration',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.7,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff282828)),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 2.2,
                width: AppDimensions.height10 * 4.3,
                child: Text(
                  'Create',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.5,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff007AFF)),
                ),
              )
            ]),
          ),
          Container(
            height: AppDimensions.height10 * 76.0,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 2.9,
                      left: AppDimensions.height10 * 1.8,
                      right: AppDimensions.height10 * 15.2),
                  width: AppDimensions.height10 * 24.4,
                  height: AppDimensions.height10 * 24.4,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/selected_image.png'))),
                ),
                Container(
                  height: AppDimensions.height10 * 2.1,
                  width: AppDimensions.height10 * 30.5,
                  margin: EdgeInsets.only(
                      left: AppDimensions.height10 * 2.0,
                      right: AppDimensions.height10 * 8.9,
                      top: AppDimensions.height10 * 3.9),
                  child: Text(
                    'Title',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.4,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff828282)),
                  ),
                ),
                Container(
                  height: AppDimensions.height10 * 2.4,
                  width: AppDimensions.height10 * 30.5,
                  // color: Colors.amber,
                  margin: EdgeInsets.only(
                      //left: AppDimensions.height10 * 2.0,
                      right: AppDimensions.height10 * 9.0,
                      top: AppDimensions.height10 * 1.0),
                  child: TextField(
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff282828)),
                    decoration: InputDecoration(
                        hintText: 'Give your inspiration a title',
                        hintStyle: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff828282)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
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
                    'Description',
                    style: TextStyle(
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
                      right: AppDimensions.height10 * 9.0,
                      top: AppDimensions.height10 * 1.0),
                  child: TextField(
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff282828)),
                    decoration: InputDecoration(
                        hintText: 'Say more about this inspiration ',
                        hintStyle: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff828282)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
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
                    'Destination website',
                    style: TextStyle(
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
                          //right: AppDimensions.height10 * 9.0,
                          top: AppDimensions.height10 * 1.0),
                      child: TextField(
                        onEditingComplete: () {
                          setState(() {
                            link_state = true;
                          });
                        },
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff282828)),
                        decoration: InputDecoration(
                            hintText: 'Add a link',
                            hintStyle: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w600,
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
                                  Navigator.push(context,
                                      FadePageRoute(page: const link_editer()));
                                },
                                child: Container(
                                  width: AppDimensions.height10 * 3.0,
                                  height: AppDimensions.height10 * 3.0,
                                  margin: EdgeInsets.only(
                                      right: AppDimensions.height10 * 0.8),
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
                              Navigator.push(context,
                                  FadePageRoute(page: const link_editer()));
                            },
                            child: Container(
                              width: AppDimensions.height10 * 3.0,
                              height: AppDimensions.height10 * 3.0,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 0.8),
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
                    'Destination website',
                    style: TextStyle(
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
                      right: AppDimensions.height10 * 9.0,
                      top: AppDimensions.height10 * 1.0),
                  child: TextField(
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff282828)),
                    decoration: InputDecoration(
                        hintText: 'Add #hashtag',
                        hintStyle: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff828282)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
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
                    'Visibility',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.4,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff828282)),
                  ),
                ),
                Container(
                  height: AppDimensions.height10 * 2.4,
                  width: AppDimensions.height10 * 30.5,
                  margin: EdgeInsets.only(
                    left: AppDimensions.height10 * 2.0,
                    right: AppDimensions.height10 * 8.9,
                  ),
                  child: Text(
                    'Private',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff282828)),
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

class link_editer extends StatefulWidget {
  const link_editer({super.key});

  @override
  State<link_editer> createState() => _link_editerState();
}

class _link_editerState extends State<link_editer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffC4C4C4),
        child: Column(
          children: [
            Container(
              // width: AppDimensions.height10 * 41.1,
              height: AppDimensions.height10 * 5.1,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 5.4),
              decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5).withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppDimensions.height10 * 1.0),
                      topRight: Radius.circular(AppDimensions.height10 * 1.0))),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: AppDimensions.height10 * 33.7,
                  height: AppDimensions.height10 * 3.4,
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                      color: const Color(0xff767680).withOpacity(0.12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 1.4,
                        height: AppDimensions.height10 * 1.413,
                        decoration: const BoxDecoration(
                            //shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/Light.png'),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        width: AppDimensions.height10 * 29.3,
                        height: AppDimensions.height10 * 2.2,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.5),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Give your inspiration a title',
                              hintStyle: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff3C3C43).withOpacity(0.6)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 2.3,
                        height: AppDimensions.height10 * 2.3,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff282828),
                        ),
                        child: Image.asset(
                          'assets/images/ic_clear.png',
                          width: AppDimensions.height10 * 0.941,
                          height: AppDimensions.height10 * 1.4,
                          color: const Color(0xff8E8E93),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: AppDimensions.height10 * 4.2,
                    width: AppDimensions.height10 * 6.2,
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.5,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff007AFF)),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
