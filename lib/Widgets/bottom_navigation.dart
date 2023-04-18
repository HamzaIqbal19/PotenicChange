import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';

import '../Screen/captureHurdles/captureHurdles_whatHurdles.dart';
import '../utils/app_dimensions.dart';

class Navigation_Bar extends StatefulWidget {
  static int _selectedIndex = 0;
  final bool bg_colored;

  const Navigation_Bar({super.key, required this.bg_colored});

  @override
  Navigation_BarState createState() => Navigation_BarState();
}

class Navigation_BarState extends State<Navigation_Bar> {
  void _onItemTapped(int index) {
    setState(() {
      Navigation_Bar._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Container(
      decoration: widget.bg_colored
          ? BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              //transform: GradientRotation(3.14159),
              colors: [Color(0xffD9B4B4), Color(0xffD9B4B4)]))
          : BoxDecoration(shape: BoxShape.rectangle, color: Colors.transparent),
      //height: 77,
      width: AppDimensions.height10 * 30.5,
      padding: EdgeInsets.only(
          bottom: AppDimensions.height10 * 1.7,
          left: AppDimensions.height10 * 5.4,
          right: AppDimensions.height10 * 5.4),
      child: BottomNavigationBar(
        //selectedIconTheme: null,
        unselectedItemColor: const Color(0xff5B74A6),
        fixedColor: const Color(0xff5B74A6),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        backgroundColor: Colors.transparent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
              width: AppDimensions.height10 * 4.0,
              height: AppDimensions.height10 * 4.0,
              child: Container(
                  height: AppDimensions.height10 * 2.612,
                  width: AppDimensions.height10 * 3.318,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
                  padding: EdgeInsets.all(AppDimensions.height10 * 1.2),
                  child: ImageIcon(
                    AssetImage('assets/images/timeline_icon.png'),
                    color: Colors.white,
                  )),
            ),
            label: 'Timeline',
          ),
          BottomNavigationBarItem(
              icon: Container(
                width: AppDimensions.height10 * 6.0,
                height: AppDimensions.height10 * 6.0,
                //margin: EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
                child: Container(
                    height: AppDimensions.height10 * 1.889,
                    width: AppDimensions.height10 * 2.444,
                    padding: EdgeInsets.all(AppDimensions.height10 * 1.2),
                    child: ImageIcon(
                      AssetImage('assets/images/insp (1).png'),
                      color: Colors.white,
                    )),
              ),
              label: 'Inspiration'),
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => hurdles_splash()));
                },
                child: Container(
                  width: AppDimensions.height10 * 6.0,
                  height: AppDimensions.height10 * 6.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
                  child: Container(
                    height: AppDimensions.height10 * 2.612,
                    width: AppDimensions.height10 * 3.318,
                    padding: EdgeInsets.all(AppDimensions.height10 * 1.2),
                    child: ImageIcon(
                      AssetImage('assets/images/hurdle_icon.png'),
                      //size: ,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              label: 'Hurdle'),
          BottomNavigationBarItem(
            icon: Container(
              margin:
                  EdgeInsets.only(top: AppDimensions.height10 * 2.0, right: 0),
              width: AppDimensions.height10 * 4.0,
              height: AppDimensions.height10 * 4.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
              child: Container(
                  height: AppDimensions.height10 * 1.889,
                  width: AppDimensions.height10 * 2.444,
                  padding: EdgeInsets.all(AppDimensions.height10 * 1.2),
                  child: ImageIcon(
                    AssetImage('assets/images/menu_icon.png'),
                    color: Colors.white,
                  )),
            ),
            label: 'Menu',
          ),
        ],
        selectedLabelStyle: TextStyle(
          fontSize: AppDimensions.height10 * 1.4,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: AppDimensions.height10 * 1.4,
          fontWeight: FontWeight.w400,
        ),
        currentIndex: index,
        onTap: _onItemTapped,
      ),
    );
  }
}
