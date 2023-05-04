import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/capture_inspiration/record_inpiration_type.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';

class inspiration_landing extends StatefulWidget {
  final bool is_Updated;
  final bool muliple_insp;
  const inspiration_landing(
      {super.key, required this.muliple_insp, required this.is_Updated});

  @override
  State<inspiration_landing> createState() => _inspiration_landingState();
}

class _inspiration_landingState extends State<inspiration_landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
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
      ),
      extendBodyBehindAppBar: true,
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
              width: AppDimensions.height10 * 34.3,
              height: AppDimensions.height10 * 27.0,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 12.0),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => inspiration_landing(
                                  muliple_insp: true,
                                  is_Updated: false,
                                )),
                      );
                    },
                    child: Container(
                      width: AppDimensions.height10 * 34.3,
                      height: AppDimensions.height10 * 7.3,
                      child: Center(
                        child: GradientText(
                          'My current\ninspirations',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 3.0,
                            fontWeight: FontWeight.w700,
                          ),
                          colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.525),
                    child: Container(
                      width: AppDimensions.height10 * 16.43,
                      height: AppDimensions.height10 * 16.43,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        opacity: 0.2,
                        image: AssetImage('assets/images/Star.png'),
                      )),
                      child: Center(
                        child: Container(
                          width: AppDimensions.height10 * 15.6,
                          height: AppDimensions.height10 * 15.6,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Inspiration_center 1.png'))),
                          child: Center(
                              child: Container(
                            width: AppDimensions.height10 * 6.8,
                            height: AppDimensions.height10 * 6.8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFFFFFFF)),
                            child: Center(
                                child: Container(
                                    width: AppDimensions.height10 * 3.2,
                                    height: AppDimensions.height10 * 3.2,
                                    child:
                                        Image.asset('assets/images/plus.png'))),
                          )),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.1, 0.85),
                    child: Container(
                      width: AppDimensions.height10 * 13.5,
                      height: AppDimensions.height10 * 2.2,
                      child: Text(
                        'New inspiration',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            widget.muliple_insp
                ? Container(
                    //  color: Colors.red,
                    height: AppDimensions.height10 * 47.0,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 2.4,
                    ),
                    child: Row(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: AppDimensions.height10 * 16.7,
                            //  height: AppDimensions.height10 * 71.0,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 3.0),

                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: AppDimensions.height10 * 16.7,
                                    height: AppDimensions.height10 * 22,
                                    child: Column(children: [
                                      Container(
                                        width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 16.7,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Rectangle 10.png'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        // width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 1.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10 * 0.5),
                                        child: Center(
                                            child: Text(
                                          'Feelings and thoughts',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      ),
                                      SizedBox(
                                        child: Center(
                                            child: Text(
                                          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit....',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    ]),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: AppDimensions.height10 * 16.7,
                                    height: AppDimensions.height10 * 22,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10 * 3.0,
                                        bottom: AppDimensions.height10 * 3.0),
                                    child: Column(children: [
                                      Container(
                                        width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 16.7,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFD9D9D9),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/image 65.png'))),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 1.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10 * 0.5),
                                        child: Center(
                                            child: Text(
                                          'Quote',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      ),
                                      SizedBox(
                                        child: Center(
                                            child: Text(
                                          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit....',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    ]),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              record_inspiration(
                                                type_switch: 2,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    width: AppDimensions.height10 * 16.7,
                                    height: AppDimensions.height10 * 22,
                                    margin: EdgeInsets.only(
                                        bottom: AppDimensions.height10 * 3.0),
                                    child: Column(children: [
                                      Container(
                                        width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 16.7,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFD9D9D9),
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFE9A594),
                                                Color(0xFFEEBEB2)
                                              ]),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Lorem ipsum dolor\nsit amet, consectetur\nadipiscing elit. ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 1.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10 * 0.5),
                                        child: Center(
                                            child: Text(
                                          'Quote',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      ),
                                      SizedBox(
                                        child: Center(
                                            child: Text(
                                          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit....',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    ]),
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10 * 3.0,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.amber,
                          width: AppDimensions.height10 * 16.7,

                          //height: AppDimensions.height10 * 71.0,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 3.0,
                              top: AppDimensions.height10 * 7.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              record_inspiration(
                                                type_switch: 3,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    width: AppDimensions.height10 * 16.7,
                                    height: AppDimensions.height10 * 21.2,
                                    child: Column(children: [
                                      Container(
                                        width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 16.7,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFD9D9D9),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/video_play.png'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        // width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 1.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10 * 0.5),
                                        child: Center(
                                            child: Text(
                                          'Music Eye Of The Tiger ',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      ),
                                      SizedBox(
                                        child: Center(
                                            child: Text(
                                          'Survivors',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    ]),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              record_inspiration(
                                                type_switch: 1,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    width: AppDimensions.height10 * 16.7,
                                    height: AppDimensions.height10 * 21.2,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10 * 3.0,
                                        bottom: AppDimensions.height10 * 3.0),
                                    child: Column(children: [
                                      Container(
                                        width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 16.7,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/sir_nyal.png'))),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 1.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10 * 0.5),
                                        child: Center(
                                            child: Text(
                                          'Influencer',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      ),
                                      SizedBox(
                                        child: Center(
                                            child: Text(
                                          'Nir Eyal',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    ]),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              record_inspiration(
                                                type_switch: 4,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    width: AppDimensions.height10 * 16.7,
                                    height: AppDimensions.height10 * 22,
                                    margin: EdgeInsets.only(
                                        bottom: AppDimensions.height10 * 3.0),
                                    child: Column(children: [
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
                                        // width: AppDimensions.height10 * 16.7,
                                        height: AppDimensions.height10 * 1.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10 * 0.5),
                                        child: Center(
                                            child: Text(
                                          'Content',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      ),
                                      SizedBox(
                                        child: Center(
                                            child: Text(
                                          'Learn How To Avoid Distraction In A\nWorld That Is Full Of It.',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    ]),
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10 * 3.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      widget.is_Updated
                          ? NavigatorState()
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => record_inspiration(
                                        type_switch: 1,
                                      )),
                            );
                    },
                    child: Container(
                      width: AppDimensions.height10 * 16.7,
                      height: AppDimensions.height10 * 21.2,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 3.0,
                        right: AppDimensions.height10 * 21.7,
                        left: AppDimensions.height10 * 3.0,
                      ),
                      child: Column(children: [
                        Container(
                          width: AppDimensions.height10 * 16.7,
                          height: AppDimensions.height10 * 16.7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFD9D9D9),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/sir_nyal.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: AppDimensions.height10 * 16.7,
                          height: AppDimensions.height10 * 1.9,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 0.5),
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
                      ]),
                    ),
                  ),
            widget.muliple_insp
                ? Container()
                : Container(
                    width: AppDimensions.height10 * 38.259,
                    height: AppDimensions.height10 * 9.707,
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 14.319),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 1.261),
                          width: AppDimensions.height10 * 4.437,
                          height: AppDimensions.height10 * 4.437,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/circle_tick.png'))),
                        ),
                        Container(
                          width: AppDimensions.height10 * 6.9,
                          height: AppDimensions.height10 * 3.6,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 1.232),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 4.6,
                                height: AppDimensions.height10 * 1.4,
                                //   color: Colors.amber,
                                child: Text(
                                  widget.is_Updated ? 'Updated' : 'SAVED',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.3,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF)),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 6.9,
                                height: AppDimensions.height10 * 2.2,
                                child: Text(
                                  'Nir Eyal',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFFFFF)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 8.1,
                          height: AppDimensions.height10 * 6.0,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 15.1),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFFFFFFFF), width: 1),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                          ),
                          child: Center(
                            child: Text(
                              'Veiw',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
            widget.muliple_insp
                ? Container()
                : Container(
                    width: AppDimensions.height10 * 17.0,
                    height: AppDimensions.height10 * 0.5,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Color(0xFFFFFFFF).withOpacity(0.3)),
                  ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: widget.muliple_insp
          ? BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                // color: Colors.blue,
                padding: EdgeInsets.only(
                    left: AppDimensions.height10 * 2.2,
                    right: AppDimensions.height10 * 2.2),
                height: AppDimensions.height10 * 7.0,
                width: AppDimensions.height10 * 41.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: AppDimensions.height10 * 2.4,
                          height: AppDimensions.height10 * 2.4,
                          // padding: EdgeInsets.only(
                          //     top: AppDimensions.height10 * 0.5,
                          //     bottom: AppDimensions.height10 * 0.5),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ic_filter_list.png',
                              width: AppDimensions.height10 * 2.4,
                              height: AppDimensions.height10 * 2.4,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10 * 0.5,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: Container(
                            width: AppDimensions.height10 * 11.5,
                            height: AppDimensions.height10 * 3.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 1.0),
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.1,
                                    color: Color(0xFFE0E0E0))),
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.3,
                                right: AppDimensions.height10 * 1.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 1.0),
                                  child: Text(
                                    'Goal:',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFA9934)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 1.9,
                                  height: AppDimensions.height10 * 2.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 0.8),
                                  child: Center(
                                    child: Text(
                                      'All',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffFA9934)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 2.4,
                                  height: AppDimensions.height10 * 2.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 0.8,
                                      bottom: AppDimensions.height10 * 0.3),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xffFA9934),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showTagSheet(context);
                          },
                          child: Container(
                            width: AppDimensions.height10 * 11.6,
                            height: AppDimensions.height10 * 3.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 1.0),
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.1,
                                    color: Color(0xFFE0E0E0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 1.0),
                                  child: Text(
                                    'Type:',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFA9934)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 1.9,
                                  height: AppDimensions.height10 * 2.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 0.8),
                                  child: Center(
                                    child: Text(
                                      'All',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffFA9934)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 2.4,
                                  height: AppDimensions.height10 * 2.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 0.8,
                                      bottom: AppDimensions.height10 * 0.3),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xffFA9934),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: AppDimensions.height10 * 3.9,
                            height: AppDimensions.height10 * 3.4,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Clec',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFFFA9934).withOpacity(0.30)),
                            ),
                          ),
                        )
                      ],
                    ),

                    Container(
                      width: AppDimensions.height10 * 4.9,
                      height: AppDimensions.height10 * 5.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/Search.png',
                          width: AppDimensions.height10 * 5,
                          height: AppDimensions.height10 * 5,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    //const Padding(padding: EdgeInsets.all(10))
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}

// class filter_bottom_sheet extends StatelessWidget {
//   const filter_bottom_sheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

_showBottomSheet(BuildContext context) {
  String goal = 'Goal Name';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: AppDimensions.height10 * 30.3,
          color: Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10 * 4.0,
                    width: AppDimensions.height10 * 41.4,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10 * 0.1,
                                color: Color(0xFF828282)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: AppDimensions.height10 * 5.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 2.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2F80ED)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 3.7,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2F80ED)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 37.5,
                    height: AppDimensions.height10 * 24.8,
                    // color: Colors.amber,
                    child: ListWheelScrollView(
                        onSelectedItemChanged: (value) {},
                        diameterRatio: 1.5,
                        // magnification: 1.5,
                        overAndUnderCenterOpacity: 0.5,
                        itemExtent: AppDimensions.height10 * 3.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 1',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 2',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 3',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

_showTagSheet(BuildContext context) {
  String goal = 'Tag';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: AppDimensions.height10 * 30.3,
          color: Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10 * 4.0,
                    width: AppDimensions.height10 * 41.4,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10 * 0.1,
                                color: Color(0xFF828282)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: AppDimensions.height10 * 5.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 2.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2F80ED)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 3.7,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2F80ED)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 37.5,
                    height: AppDimensions.height10 * 24.8,
                    // color: Colors.amber,
                    child: ListWheelScrollView(
                        onSelectedItemChanged: (value) {},
                        diameterRatio: 1.5,
                        // magnification: 1.5,
                        overAndUnderCenterOpacity: 0.5,
                        itemExtent: AppDimensions.height10 * 3.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 1',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 2',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 3',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}




//  Expanded(
//                     child: ListView.builder(
//                       // controller: controller,
//                       itemCount: 4,
//                       itemBuilder: (_, index) {
//                         return Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: AppDimensions.height10 * 2.0),
//                           decoration: BoxDecoration(
//                               border: Border(
//                                   bottom: BorderSide(
//                                       width: AppDimensions.height10 * 0.1,
//                                       color: Color(0xFF828282)))),
//                           padding: EdgeInsets.all(8),
//                           child: Center(child: Text("Goal name $index")),
//                         );
//                       },
//                     ),
//                   ),