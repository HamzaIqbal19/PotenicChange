import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/Menu&settings/account_deleted.dart';
import 'package:potenic_app/Screen/Menu&settings/edit_credentials.dart';
import 'package:potenic_app/Screen/Menu&settings/notifications.dart';

import '../../utils/app_dimensions.dart';
import '../community/community.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.png',
                width: AppDimensions.height10 * 2.6,
                height: AppDimensions.height10 * 2.6,
                fit: BoxFit.cover,
              )),
        ),
        centerTitle: true,
        title: SizedBox(
          width: AppDimensions.height10 * 17.0,
          height: AppDimensions.height10 * 4.8,
          child: Center(
            child: Text(
              'Settings',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions.height10 * 1.8,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10 * 37.4,
                height: AppDimensions.height10 * 23.4,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: AppDimensions.height10 * 19.0,
                        height: AppDimensions.height10 * 2.4,
                        child: Text(
                          'My Account Details',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFFFBFBFB)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.4,
                      height: AppDimensions.height10 * 20.0,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: AppDimensions.height10 * 33.4,
                              height: AppDimensions.height10 * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: AppDimensions.height10 * 4.5,
                                    height: AppDimensions.height10 * 4.0,
                                    margin: EdgeInsets.only(
                                        bottom: AppDimensions.height10 * 0.9),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: AppDimensions.height10 * 19.0,
                                          height: AppDimensions.height10 * 1.9,
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.6,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0XFF5B74A6)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppDimensions.height10 * 4.5,
                                          height: AppDimensions.height10 * 2.1,
                                          child: Text(
                                            'Jane',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0XFF5B74A6)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const edit_credentials(
                                                    email: false,
                                                    password_edit: false,
                                                  )));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 4.8,
                                      height: AppDimensions.height10 * 2.8,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'EDIT',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.6,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF5B74A6)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: AppDimensions.height10 * 33.4,
                              height: AppDimensions.height10 * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 19.0,
                                    height: AppDimensions.height10 * 4.0,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: AppDimensions.height10 * 19.0,
                                          height: AppDimensions.height10 * 1.9,
                                          child: Text(
                                            'Email address',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.6,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0XFF5B74A6)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppDimensions.height10 * 19.0,
                                          height: AppDimensions.height10 * 2.1,
                                          child: Text(
                                            'jane.Smith@email.com',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0XFF5B74A6)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const edit_credentials(
                                                    email: true,
                                                    password_edit: false,
                                                  )));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 4.8,
                                      height: AppDimensions.height10 * 2.8,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'EDIT',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.6,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF5B74A6)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: AppDimensions.height10 * 33.4,
                              height: AppDimensions.height10 * 5.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 19.0,
                                    height: AppDimensions.height10 * 4.0,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: AppDimensions.height10 * 19.0,
                                          height: AppDimensions.height10 * 1.9,
                                          child: Text(
                                            'Password (8+ character)',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.6,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0XFF5B74A6)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppDimensions.height10 * 19.0,
                                          height: AppDimensions.height10 * 2.1,
                                          child: Text(
                                            '**********',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0XFF5B74A6)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const edit_credentials(
                                                    email: false,
                                                    password_edit: true,
                                                  )));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 4.8,
                                      height: AppDimensions.height10 * 2.8,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'EDIT',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.6,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF5B74A6)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 37.4,
                height: AppDimensions.height10 * 16.4,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: AppDimensions.height10 * 11.4,
                        height: AppDimensions.height10 * 2.4,
                        child: Text(
                          'Preferences',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFFFBFBFB)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.4,
                      height: AppDimensions.height10 * 13.0,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const notifications()));
                            },
                            child: Container(
                              width: AppDimensions.height10 * 33.4,
                              height: AppDimensions.height10 * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 20.6,
                                    height: AppDimensions.height10 * 1.9,
                                    child: Text(
                                      'Notifications',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width: AppDimensions.height10 * 2.4,
                                      height: AppDimensions.height10 * 1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10 * 2.6,
                                          //height: AppDimensions.height10 * 2.6,
                                          color: const Color(0xff5B74A6),
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 20.6,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Invite a friend',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B74A6)),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10 * 2.6,
                                        //height: AppDimensions.height10 * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 37.4,
                height: AppDimensions.height10 * 41.4,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: AppDimensions.height10 * 5.3,
                        height: AppDimensions.height10 * 2.4,
                        child: Text(
                          'About',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFFFBFBFB)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.4,
                      height: AppDimensions.height10 * 38.0,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const About_us()));
                            },
                            child: Container(
                              width: AppDimensions.height10 * 33.4,
                              height: AppDimensions.height10 * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 20.6,
                                    height: AppDimensions.height10 * 1.9,
                                    child: Text(
                                      'About us',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width: AppDimensions.height10 * 2.4,
                                      height: AppDimensions.height10 * 1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10 * 2.6,
                                          //height: AppDimensions.height10 * 2.6,
                                          color: const Color(0xff5B74A6),
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 5.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xff5B74A6)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 20.6,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Tutorial',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B74A6)),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10 * 2.6,
                                        //height: AppDimensions.height10 * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 5.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xff5B74A6)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 20.6,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'FAQs',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B74A6)),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10 * 2.6,
                                        //height: AppDimensions.height10 * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 5.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xff5B74A6)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 20.6,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Contact us',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B74A6)),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10 * 2.6,
                                        //height: AppDimensions.height10 * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // export_data_sheet(context);
                            },
                            child: Container(
                              width: AppDimensions.height10 * 33.4,
                              height: AppDimensions.height10 * 5.0,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: AppDimensions.height10 * 0.1,
                                          color: const Color(0xff5B74A6)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 20.6,
                                    height: AppDimensions.height10 * 1.9,
                                    child: Text(
                                      'Export data',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                  SizedBox(
                                      width: AppDimensions.height10 * 2.4,
                                      height: AppDimensions.height10 * 1.39,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/BTN Back.png',
                                          //width: AppDimensions.height10 * 2.6,
                                          //height: AppDimensions.height10 * 2.6,
                                          color: const Color(0xff5B74A6),
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 5.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xff5B74A6)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: AppDimensions.height10 * 20.6,
                                    height: AppDimensions.height10 * 1.9,
                                    child: Text(
                                      'Terms of service',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0XFF5B74A6)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10 * 2.6,
                                        //height: AppDimensions.height10 * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 20.6,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Privacy policy',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B74A6)),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10 * 2.6,
                                        //height: AppDimensions.height10 * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                          width: AppDimensions.height10 * 27.0,
                          height: AppDimensions.height10 * 19.8,
                          child: AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            actionsPadding: EdgeInsets.zero,
                            titlePadding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 1.4)),
                            title: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.9,
                                    right: AppDimensions.height10 * 1.6,
                                    left: AppDimensions.height10 * 1.6,
                                    bottom: AppDimensions.height10 * 0.2),
                                height: AppDimensions.height10 * 2.2,
                                width: AppDimensions.height10 * 23.8,
                                child: Text(
                                  'Log out?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize: AppDimensions.height10 * 1.7,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF000000)),
                                )),
                            content: Container(
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10 * 1.9,
                                  top: AppDimensions.height10 * 0.2,
                                  left: AppDimensions.height10 * 1.6,
                                  right: AppDimensions.height10 * 1.6),
                              height: AppDimensions.height10 * 4.8,
                              width: AppDimensions.height10 * 23.8,
                              child: Text(
                                "Are you sure you want to log out? If you\ndo, you will be prompted to login again\nby entering your email and password.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'laila',
                                    height: AppDimensions.height10 * 0.15,
                                    fontSize: AppDimensions.height10 * 1.3,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000)),
                              ),
                            ),
                            actions: <Widget>[
                              Column(
                                children: [
                                  SizedBox(
                                    height: AppDimensions.height10 * 0.1,
                                    child: Divider(
                                      color: const Color(0XFF3C3C43)
                                          .withOpacity(0.29),
                                    ),
                                  ),
                                  Container(
                                    height: AppDimensions.height10 * 4.4,
                                    width: double.infinity,
                                    color: const Color(0xFF007AFF),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      },
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height10 * 0.1,
                                    child: Divider(
                                      color: const Color(0XFF3C3C43)
                                          .withOpacity(0.29),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height10 * 4.4,
                                    width: double.infinity,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF007AFF)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height10 * 0.1,
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
                  width: AppDimensions.height10 * 13.0,
                  height: AppDimensions.height10 * 5.0,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.4),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 5.0),
                    border: Border.all(
                        color: const Color(0xFFFBFBFB),
                        width: AppDimensions.height10 * 0.1),
                    color: const Color(0xFFF5F5F5),
                  ),
                  child: Center(
                    child: Text(
                      'Log out',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFF8C648A)),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                          width: AppDimensions.height10 * 27.0,
                          height: AppDimensions.height10 * 18.2,
                          child: AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            actionsPadding: EdgeInsets.zero,
                            titlePadding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 1.4)),
                            title: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.9,
                                    right: AppDimensions.height10 * 1.6,
                                    left: AppDimensions.height10 * 1.6,
                                    bottom: AppDimensions.height10 * 0.2),
                                height: AppDimensions.height10 * 2.2,
                                width: AppDimensions.height10 * 23.8,
                                child: Text(
                                  'Delete account?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize: AppDimensions.height10 * 1.7,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF000000)),
                                )),
                            content: Container(
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10 * 1.9,
                                  top: AppDimensions.height10 * 0.2,
                                  left: AppDimensions.height10 * 1.6,
                                  right: AppDimensions.height10 * 1.6),
                              height: AppDimensions.height10 * 3.2,
                              width: AppDimensions.height10 * 23.8,
                              child: Text(
                                "Are you sure you want to delete your\naccount? You will lose all your data.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'laila',
                                    height: AppDimensions.height10 * 0.15,
                                    fontSize: AppDimensions.height10 * 1.3,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000)),
                              ),
                            ),
                            actions: <Widget>[
                              Column(
                                children: [
                                  SizedBox(
                                    height: AppDimensions.height10 * 0.1,
                                    child: Divider(
                                      color: const Color(0XFF3C3C43)
                                          .withOpacity(0.29),
                                    ),
                                  ),
                                  Container(
                                    height: AppDimensions.height10 * 4.4,
                                    width: double.infinity,
                                    color: const Color(0xFF007AFF),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Acc_deleted()));
                                      },
                                      child: Text(
                                        'Yes, delete my account',
                                        style: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height10 * 0.1,
                                    child: Divider(
                                      color: const Color(0XFF3C3C43)
                                          .withOpacity(0.29),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height10 * 4.4,
                                    width: double.infinity,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF007AFF)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height10 * 0.1,
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
                  width: AppDimensions.height10 * 18.9,
                  height: AppDimensions.height10 * 5.0,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 4.0,
                      bottom: AppDimensions.height10 * 7.3),
                  child: Center(
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFF8C648A)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.png',
                width: AppDimensions.height10 * 2.6,
                height: AppDimensions.height10 * 2.6,
                fit: BoxFit.cover,
              )),
        ),
        centerTitle: true,
        title: SizedBox(
          width: AppDimensions.height10 * 17.0,
          height: AppDimensions.height10 * 4.8,
          child: Text(
            'About',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppDimensions.height10 * 1.8,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: AppDimensions.height10 * 37.4,
              height: AppDimensions.height10 * 21.4,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 15.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: AppDimensions.height10 * 13.6,
                      height: AppDimensions.height10 * 2.4,
                      child: Text(
                        'About Potenic',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFFFBFBFB)),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 37.4,
                    height: AppDimensions.height10 * 18.0,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 5.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xff5B74A6)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 20.6,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Our story',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B74A6)),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10 * 2.6,
                                        //height: AppDimensions.height10 * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 5.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xff5B74A6)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 20.6,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Like us? Rate us',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF5B74A6)),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        //width: AppDimensions.height10 * 2.6,
                                        //height: AppDimensions.height10 * 2.6,
                                        color: const Color(0xff5B74A6),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10 * 33.4,
                          height: AppDimensions.height10 * 5.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppDimensions.height10 * 20.6,
                                height: AppDimensions.height10 * 1.9,
                                child: Text(
                                  'Follow us',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0XFF5B74A6)),
                                ),
                              ),
                              SizedBox(
                                  width: AppDimensions.height10 * 2.4,
                                  height: AppDimensions.height10 * 1.39,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/BTN Back.png',
                                      //width: AppDimensions.height10 * 2.6,
                                      //height: AppDimensions.height10 * 2.6,
                                      color: const Color(0xff5B74A6),
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: AppDimensions.height10 * 17.0,
              height: AppDimensions.height10 * 0.5,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 51.7),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 5.0),
                  color: Color(0xFFFFFFFF).withOpacity(0.3)),
            )
          ],
        ),
      ),
    );
  }
}

void export_data_sheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.height10 * 2.0),
      )),
      builder: (context) => Container(
            width: AppDimensions.height10 * 41.4,
            height: AppDimensions.height10 * 47.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppDimensions.height10 * 2.0)),
                color: const Color(0xFFF5F5F5)),
            child: Column(
              children: [
                Container(
                  //color: Colors.amber,
                  // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                  alignment: const Alignment(1, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: AppDimensions.height10 * 2.6,
                      height: AppDimensions.height10 * 2.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 1.5,
                          right: AppDimensions.height10 * 1.5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Close_blue.png'))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 1.9,
                      bottom: AppDimensions.height10 * 4.9),
                  child: Image.asset(
                    'assets/images/potenic__icon.png',
                    width: AppDimensions.height10 * 8.202,
                    height: AppDimensions.height10 * 11.2,
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 18.3,
                  height: AppDimensions.height10 * 3.6,
                  // color: Colors.amber,
                  alignment: Alignment.center,
                  //  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                  child: Text(
                    'Export data',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 3.0,
                        letterSpacing: AppDimensions.height10 * 0.2,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF437296)),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 35.2,
                  height: AppDimensions.height10 * 17.6,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.1),
                  child: Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                fontFamily: 'Laila',
                                height: AppDimensions.height10 * 0.12,
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF437296)),
                            children: [
                              const TextSpan(
                                  text:
                                      'To access your data, please email to us at\n'),
                              const TextSpan(
                                  text: 'info@potenic.com',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              const TextSpan(
                                  text:
                                      ' and we will action your request as soon as possible.\n\n\nIn the email subject please state: '),
                              const TextSpan(
                                text: 'Potenic App Export My Data\n\n\n',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const TextSpan(
                                  text: 'Thank you for your co-operation :)')
                            ])),
                  ),
                )
              ],
            ),
          ));
}
