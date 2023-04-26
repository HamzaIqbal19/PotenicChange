import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class add_your_practice extends StatelessWidget {
  const add_your_practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(top: AppDimensions.height10 * 01),
            width: AppDimensions.height10 * 17.0,
            height: AppDimensions.height10 * 4.8,
            child: Text(
              'Menu',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions.height10 * 2.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            ),
          ]),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Container(
            width: AppDimensions.height10 * 27.5,
            height: AppDimensions.height10 * 11.2,
            margin: EdgeInsets.only(
                top: AppDimensions.height10 * 9.7,
                right: AppDimensions.height10 * 8.3,
                left: AppDimensions.height10 * 5.1),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: AppDimensions.height10 * 10.4,
                    height: AppDimensions.height10 * 11.2,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: AppDimensions.height10 * 7.9,
                        height: AppDimensions.height10 * 7.9,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/image3.png'),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(1, -0.4),
                  child: Container(
                    // color: Colors.amber,
                    width: AppDimensions.height10 * 17.1,
                    height: AppDimensions.height10 * 2.4,
                    child: Text(
                      'Control my anger',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: AppDimensions.height10 * 32.0,
            height: AppDimensions.height10 * 2.6,
            margin: EdgeInsets.only(top: AppDimensions.height10 * 0),
            child: Center(
              child: Text(
                'What do you want to do?',
                style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.2,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff437296)),
              ),
            ),
          ),
          Container(
            width: AppDimensions.height10 * 17.5,
            height: AppDimensions.height10 * 17.5,
            padding: EdgeInsets.all(AppDimensions.height10 * 1.0),
            margin: EdgeInsets.only(top: AppDimensions.height10 * 4.4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFFFFFFF), width: 3)),
            child: Container(
              width: AppDimensions.height10 * 15.5,
              height: AppDimensions.height10 * 15.5,
              padding: EdgeInsets.all(AppDimensions.height10 * 1.2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFFFFFFF), width: 4)),
              child: Container(
                width: AppDimensions.height10 * 13.4,
                height: AppDimensions.height10 * 13.2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/circle_grey.png'))),
                child: Center(
                  child: Text(
                    'Add new\npractice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.8,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: AppDimensions.height10 * 36.4,
            height: AppDimensions.height10 * 6.0,
            margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.height10 * 2.0),
              color: Color(0xFFFFFFFF),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: AppDimensions.height10 * 18.5,
                  height: AppDimensions.height10 * 2.2,
                  margin: EdgeInsets.only(left: AppDimensions.height10 * 1.99),
                  child: Text(
                    'Goal details',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontSize: AppDimensions.height10 * 1.8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                    width: AppDimensions.height10 * 2.4,
                    height: AppDimensions.height10 * 1.39,
                    margin:
                        EdgeInsets.only(right: AppDimensions.height10 * 2.391),
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
        ]),
      ),
    );
  }
}
