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
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
                  )),
            ),
          ]),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Container(
            // color: Colors.amber,
            //width: AppDimensions.height10(context) * 17.1,
            height: AppDimensions.height10(context) * 2.2,
            margin: EdgeInsets.only(
              top: AppDimensions.height10(context) * 5.2,
              // left: AppDimensions.height10(context) * 12.2,
              // right: AppDimensions.height10(context) * 12.1
            ),
            child: Center(
              child: Text(
                'Goal Menu',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 1.8,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffffffff)),
              ),
            ),
          ),
          Container(
            // color: Colors.amber,
            width: AppDimensions.height10(context) * 17.1,
            height: AppDimensions.height10(context) * 2.4,
            margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 0.5,
                left: AppDimensions.height10(context) * 12.2,
                right: AppDimensions.height10(context) * 12.1),
            child: Text(
              'Control my anger',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions.height10(context) * 2.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffffffff)),
            ),
          ),
          Container(
            width: AppDimensions.height10(context) * 8.39,
            height: AppDimensions.height10(context) * 9.3,
            margin:
                EdgeInsets.only(top: AppDimensions.height10(context) * 2.03),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/orange_flair.webp'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            width: double.infinity,
            height: AppDimensions.height10(context) * 0.1,
            color: const Color(0xFFFFFFFF).withOpacity(0.5),
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.9),
          ),
          Container(
            width: AppDimensions.height10(context) * 17.5,
            height: AppDimensions.height10(context) * 17.5,
            padding: EdgeInsets.all(AppDimensions.height10(context) * 1.0),
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFFFFFFF), width: 3)),
            child: Container(
              width: AppDimensions.height10(context) * 15.5,
              height: AppDimensions.height10(context) * 15.5,
              padding: EdgeInsets.all(AppDimensions.height10(context) * 1.2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFFFFFFF), width: 4)),
              child: Container(
                width: AppDimensions.height10(context) * 13.4,
                height: AppDimensions.height10(context) * 13.2,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/circle_grey.webp'))),
                child: Center(
                  child: Text(
                    'Add new\npractice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.8,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: AppDimensions.height10(context) * 0.1,
            color: const Color(0xFFFFFFFF).withOpacity(0.5),
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
          ),
          Container(
            width: AppDimensions.height10(context) * 36.4,
            height: AppDimensions.height10(context) * 6.0,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              color: const Color(0xFFFFFFFF),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: AppDimensions.height10(context) * 18.5,
                  height: AppDimensions.height10(context) * 2.2,
                  margin: EdgeInsets.only(
                      left: AppDimensions.height10(context) * 1.99),
                  child: Text(
                    'Goal details',
                    style: TextStyle(
                      color: const Color(0xff646464),
                      fontSize: AppDimensions.height10(context) * 1.8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                    width: AppDimensions.height10(context) * 2.4,
                    height: AppDimensions.height10(context) * 1.39,
                    margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 2.391),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/BTN Back.webp',
                        //width: AppDimensions.height10(context) * 2.6,
                        //height: AppDimensions.height10(context) * 2.6,
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
