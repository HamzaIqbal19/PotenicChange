import 'package:flutter/material.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_goals_menu.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_motivation.dart';
import 'package:potenic_app/Screen/timeline/coming_soon.dart';
import 'package:potenic_app/Screen/timeline/timeline.dart';
import 'package:potenic_app/Screen/timeline/timelinePopup.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';

import '../utils/app_dimensions.dart';
import 'fading.dart';

class Navigation_Bar extends StatefulWidget {
  static int _selectedIndex = 0;
  final bool bg_colored;
  final String subscription;

  const Navigation_Bar({
    super.key,
    required this.bg_colored,
    required this.subscription,
  });

  @override
  Navigation_BarState createState() => Navigation_BarState();
}

class Navigation_BarState extends State<Navigation_Bar> {
  void _onItemTapped(int index) {
    setState(() {
      Navigation_Bar._selectedIndex = index;
    });
  }

  void checkInspiraion() async {
    InspirationApi()
        .checkUserInspiration()
        .then((response) {
          if (response == true) {
            Navigator.push(
                context,
                FadePageRoute(
                    page: const inspiration_landing(is_Updated: false)));
          } else if (response == false) {
            Navigator.push(
                context,
                FadePageRoute(
                    page: const inspiration_motivation(
                  goal_delete: false,
                  inspirationName: '',
                )));
          }
        })
        .catchError((error) {})
        .whenComplete(() {});
  }

  void checkHurdle() async {
    Hurdles().checkUserHurdles().then((response) {
      if (response == true) {
        Navigator.push(
          context,
          FadePageRoute(page: const landing_hurdles()),
        );

        return response;
      } else if (response == false) {
        Navigator.push(context, FadePageRoute(page: const hurdles_splash()));
      }
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Stack(alignment: AlignmentDirectional.bottomCenter, children: [
      // Container(
      //   decoration: widget.bg_colored
      //       ? const BoxDecoration(
      //           gradient: LinearGradient(
      //               begin: Alignment.topCenter, end: Alignment.bottomCenter,
      //               //transform: GradientRotation(3.14159),
      //               colors: [Color(0xffD9B4B4), Color(0xffD9B4B4)]))
      //       : const BoxDecoration(
      //           shape: BoxShape.rectangle, color: Colors.transparent),
      //   //height: 77,
      //   // width: UpdatedDimensions.width10(context) * 30.5,
      //   padding: EdgeInsets.only(
      //       bottom: UpdatedDimensions.height10(context) * 2.5,
      //       left: UpdatedDimensions.width10(context) * 5.4,
      //       right: UpdatedDimensions.width10(context) * 5.4),
      //   child:
      Padding(
        padding: EdgeInsets.only(
          top: UpdatedDimensions.height10(context) * 1,
          left: UpdatedDimensions.width10(context) * 2,
          right: UpdatedDimensions.width10(context) * 2,
        ),
        child: BottomNavigationBar(
          //selectedIconTheme: null,
          unselectedItemColor: const Color(0xffFBFBFB),
          fixedColor: const Color(0xffFBFBFB),
          unselectedFontSize: 15,
          selectedFontSize: 15,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          backgroundColor: Colors.transparent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AnimatedScaleButton(
                onTap: () {
                  if (widget.subscription == 'active') {
                    Navigator.push(
                        context, FadePageRoute(page: const timeline()));
                  } else {
                    timelinePopup(context);
                  }
                },
                child: Container(
                  width: UpdatedDimensions.width10(context) * 3.0,
                  height: UpdatedDimensions.height10(context) * 3.0,
                  child: const ImageIcon(
                    AssetImage('assets/images/timeline_icon.webp'),
                    color: Colors.white,
                  ),
                ),
              ),
              label: 'Timeline',
            ),
            BottomNavigationBarItem(
                icon: AnimatedScaleButton(
                  onTap: () {
                    checkInspiraion();
                  },
                  child: Container(
                      width: UpdatedDimensions.width10(context) * 3.0,
                      height: UpdatedDimensions.height10(context) * 3.0,
                      child: const ImageIcon(
                        AssetImage('assets/images/insp (1).webp'),
                        color: Colors.white,
                      )),
                ),
                label: 'Inspiration'),
            BottomNavigationBarItem(
                icon: AnimatedScaleButton(
                  onTap: () {
                    checkHurdle();
                  },
                  child: Container(
                    width: UpdatedDimensions.width10(context) * 3.0,
                    height: UpdatedDimensions.height10(context) * 3.0,
                    child: const ImageIcon(
                      AssetImage('assets/images/hurdle_icon.webp'),
                      //size: ,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: 'Hurdle'),
            BottomNavigationBarItem(
              icon: AnimatedScaleButton(
                onTap: () {
                  Navigator.push(
                      context, FadePageRoute(page: your_goals_menu()));
                },
                child: Container(
                    width: UpdatedDimensions.width10(context) * 3.0,
                    height: UpdatedDimensions.height10(context) * 3.0,
                    padding: EdgeInsets.all(2),
                    child: const ImageIcon(
                      AssetImage('assets/images/menu_icon.webp'),
                      color: Colors.white,
                    )),
              ),
              label: 'Menu',
            ),
          ],
          selectedLabelStyle: TextStyle(
            fontSize: UpdatedDimensions.font10(context) * 1.4,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: UpdatedDimensions.font10(context) * 1.4,
            fontWeight: FontWeight.w400,
          ),
          currentIndex: index,
          onTap: _onItemTapped,
        ),
      ),
      //  ),
    ]);
  }
}
