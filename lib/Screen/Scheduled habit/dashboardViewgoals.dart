import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/utilities/backDecor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_ui/utilities/mult_circles.dart';

import '../../utilities/icons.dart';

class dashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/Add goal.png')),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  )),
            ],
          )
        ]),
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: NavigationBar(),
        body: Container(
          decoration: dashboardBG,
          width: double.infinity,
          height: double.infinity,
          child: SizedBox(
            width: double.infinity,
            height: 192,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 192,
                    width: 457,
                    child: Row(
                      children: [
                        Container(
                          height: 79,
                          width: 79,
                          margin: const EdgeInsets.only(top: 84),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: Colors.white),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(187, 185, 174, 1),
                                  Color.fromRGBO(206, 194, 149, 1)
                                ]),
                          ),
                          child: Container(
                              margin: const EdgeInsets.only(top: 11.52),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'MON',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  const Text(
                                    '02.06',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                      height: 27,
                                      width: 27,
                                      margin: const EdgeInsets.only(top: 3.32),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: DottedBorder(
                                        borderType: BorderType.Circle,
                                        color: Colors.white,
                                        child: const Center(
                                          child: Text(
                                            '0/0',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ))
                                ],
                              )),
                        ),
                        Container(
                          height: 192,
                          width: 188,
                          margin: EdgeInsets.only(left: 55.5, right: 55.5),
                          child: Container(
                            height: 138.1,
                            width: 132.65,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Asset 10 2.png'),
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'TUE',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff5B74A6)),
                                ),
                                const Text(
                                  '02.07',
                                  style: TextStyle(
                                      color: Color(0xff5B74A6),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                    height: 25,
                                    width: 25,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: const Center(
                                      child: Text(
                                        '0/2',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff5B74A6)),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          //color: Colors.blue,
                        ),
                        Container(
                            height: 79,
                            width: 79,
                            margin: const EdgeInsets.only(
                              top: 84,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 3, color: Colors.white),
                              color: Colors.white,
                            ),
                            child: Container(
                                margin: const EdgeInsets.only(top: 11.52),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'MON',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff5B74A6)),
                                    ),
                                    const Text(
                                      '03.07',
                                      style:
                                          TextStyle(color: Color(0xff5B74A6)),
                                    ),
                                    Container(
                                      height: 27,
                                      width: 27,
                                      margin: const EdgeInsets.only(top: 3.32),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                      ),
                                      child: Container(
                                          width: 17,
                                          height: 15,
                                          margin:
                                              const EdgeInsets.only(top: 3.32),
                                          // margin: const EdgeInsets.only(left: 1),
                                          child: const Center(
                                            child: Text(
                                              '0/2',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff5B74A6)),
                                            ),
                                          )),
                                    )
                                  ],
                                ))),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 356,
                  height: 42,
                  margin: const EdgeInsets.only(left: 24, right: 34, top: 11),
                  child: Column(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '8:00',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.white,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'AM',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
                ),
                Container(
                  width: 313,
                  height: 313,
                  // color: Colors.blue,
                  margin: const EdgeInsets.only(top: 29, bottom: 12, right: 45),
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 268,
                        height: 268,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/oraange_sun.png'),
                                fit: BoxFit.cover)),
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment(0, -0.5),
                                child: Text(
                                  'Control my anger',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff5B74A6)),
                                )),
                            Align(
                              alignment: Alignment(0, -0.2),
                              child: Text(
                                  '“I am someone who is in\n control of my anger”',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff5B74A6))),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.9, 1),
                      child: Container(
                        height: 138,
                        width: 138,
                        decoration: BoxDecoration(
                            //color: Colors.amber,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Ellipse 158.png'),
                                fit: BoxFit.cover)),
                        child: Center(
                            child: Text(
                          'Meditation',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-1, 0.4),
                      child: Container(
                        height: 138,
                        width: 138,
                        decoration: BoxDecoration(
                            //color: Colors.amber,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Ellipse 157.png'),
                                fit: BoxFit.cover)),
                        child: Center(
                            child: Text(
                          'Count\ndown',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ]),
                ),
                Container(
                  height: 134.32,
                  width: 343.35,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/Component 1.png'),
                    fit: BoxFit.fill,
                  )),
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  //color: Colors.blue,
                  child: Stack(children: [
                    Align(
                      alignment: const Alignment(-0.925, -1.5),
                      child: Image.asset(
                        "assets/images/Group.png",
                        height: 43.66,
                        width: 43.66,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.93, 0),
                      child: Image.asset(
                        "assets/images/Vector Smart Object.png",
                        height: 92.96,
                        width: 41.6,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 21,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 280,
                            alignment: Alignment(-0.65, 0),
                            child: const Text(
                              "Hi, it's Reda here",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(91, 116, 166, 1),
                              ),
                            ),
                          ),
                          Container(
                            width: 52.45,
                            margin: EdgeInsets.only(right: 165),
                            child: const Divider(
                              thickness: 1,
                              color: Color.fromRGBO(91, 116, 166, 1),
                            ),
                          ),
                          Container(
                            width: 220,
                            child: const Text(
                              "You have an extra 20% chance of success if you have a support buddy.Have you got one?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(91, 116, 166, 1)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}

class NavigationBar extends StatefulWidget {
  static int _selectedIndex = 0;

  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      NavigationBar._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Container(
      //height: 77,
      width: 305,
      padding: const EdgeInsets.only(bottom: 17, left: 54, right: 54),
      child: BottomNavigationBar(
        //selectedIconTheme: null,
        unselectedItemColor: const Color(0xff5B74A6),
        fixedColor: const Color(0xff5B74A6),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 40,
              height: 40,
              child: Container(
                  height: 26.12,
                  width: 33.18,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
                  padding: EdgeInsets.all(12),
                  child: ImageIcon(
                    AssetImage('assets/images/timeline_icon.png'),
                    color: Colors.white,
                  )),
            ),
            label: 'Timeline',
          ),
          BottomNavigationBarItem(
              icon: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
                child: Container(
                    height: 18.89,
                    width: 24.44,
                    padding: EdgeInsets.all(12),
                    child: ImageIcon(
                      AssetImage('assets/images/insp (1).png'),
                      color: Colors.white,
                    )),
              ),
              label: 'Inspiration'),
          BottomNavigationBarItem(
              icon: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
                child: Container(
                  height: 26.12,
                  width: 33.18,
                  padding: EdgeInsets.all(12),
                  child: ImageIcon(
                    AssetImage('assets/images/hurdle_icon.png'),
                    //size: ,
                    color: Colors.white,
                  ),
                ),
              ),
              label: 'Hurdle'),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 20, right: 0),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
              child: Container(
                  height: 18.89,
                  width: 24.44,
                  padding: EdgeInsets.all(12),
                  child: ImageIcon(
                    AssetImage('assets/images/menu_icon.png'),
                    color: Colors.white,
                  )),
            ),
            label: 'Menu',
          ),
        ],
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        currentIndex: index,
        onTap: _onItemTapped,
      ),
    );
  }
}
