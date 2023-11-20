import 'package:flutter/material.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_goals_menu.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_motivation.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';

import '../utils/app_dimensions.dart';
import 'fading.dart';

class Navigation_Bar extends StatefulWidget {
  static int _selectedIndex = 0;
  final bool bg_colored;
  final bool membership;
  final bool trial;
  final bool cancel;

  const Navigation_Bar(
      {super.key,
      required this.bg_colored,
      required this.membership,
      required this.trial,
      required this.cancel});

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
    }).catchError((error) {
      print("Hello world error");
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Stack(alignment: AlignmentDirectional.topStart, children: [
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
      //   // width: AppDimensions.width10(context) * 30.5,
      //   padding: EdgeInsets.only(
      //       bottom: AppDimensions.height10(context) * 2.5,
      //       left: AppDimensions.height10(context) * 5.4,
      //       right: AppDimensions.height10(context) * 5.4),
      //   child:
      Padding(
        padding: EdgeInsets.only(
          bottom: AppDimensions.height10(context) * 3.0,
          left: AppDimensions.height10(context) * 5.4,
          right: AppDimensions.height10(context) * 5.4,
        ),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xffD9B4B4),
                // color: Colors.red,
                blurRadius: 20, // Adjust the blur radius as needed
                spreadRadius: 2, // Adjust the spread radius as needed
                offset: Offset(0, -5), // Adjust the offset as needed
              ),
            ],
          ),
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
                icon: AnimatedScaleButton(
                  onTap: () {
                    //  timeline_sheet(context);
                    // Navigator.push(context, FadePageRoute(page: const timeline()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.0),
                    width: AppDimensions.width10(context) * 4.0,
                    height: AppDimensions.height10(context) * 4.0,
                    child: Container(
                        height: AppDimensions.height10(context) * 2.612,
                        width: AppDimensions.width10(context) * 3.318,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff93ABD0),
                                  Color(0xff8C648A)
                                ])),
                        padding: EdgeInsets.all(
                            AppDimensions.height10(context) * 1.2),
                        child: const ImageIcon(
                          AssetImage('assets/images/timeline_icon.webp'),
                          color: Colors.white,
                        )),
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
                      width: AppDimensions.width10(context) * 6.0,
                      height: AppDimensions.height10(context) * 6.0,
                      //margin: EdgeInsets.only(right: 30),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
                      child: Container(
                          height: AppDimensions.height10(context) * 1.889,
                          width: AppDimensions.width10(context) * 2.444,
                          padding: EdgeInsets.all(
                              AppDimensions.height10(context) * 1.2),
                          child: const ImageIcon(
                            AssetImage('assets/images/insp (1).webp'),
                            color: Colors.white,
                          )),
                    ),
                  ),
                  label: 'Inspiration'),
              BottomNavigationBarItem(
                  icon: AnimatedScaleButton(
                    onTap: () {
                      checkHurdle();
                    },
                    child: Container(
                      width: AppDimensions.width10(context) * 6.0,
                      height: AppDimensions.height10(context) * 6.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
                      child: Container(
                        height: AppDimensions.height10(context) * 2.612,
                        width: AppDimensions.width10(context) * 3.318,
                        padding: EdgeInsets.all(
                            AppDimensions.height10(context) * 1.2),
                        child: const ImageIcon(
                          AssetImage('assets/images/hurdle_icon.webp'),
                          //size: ,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  label: 'Hurdle'),
              BottomNavigationBarItem(
                icon: AnimatedScaleButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        FadePageRoute(
                            page: your_goals_menu(
                          membership: widget.membership ? true : false,
                          trial: widget.trial ? true : false,
                          cancel: widget.cancel ? true : false,
                        )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.0, right: 0),
                    width: AppDimensions.width10(context) * 4.0,
                    height: AppDimensions.height10(context) * 4.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff93ABD0), Color(0xff8C648A)])),
                    child: Container(
                        height: AppDimensions.height10(context) * 1.889,
                        width: AppDimensions.width10(context) * 2.444,
                        padding: EdgeInsets.all(
                            AppDimensions.height10(context) * 1.2),
                        child: const ImageIcon(
                          AssetImage('assets/images/menu_icon.webp'),
                          color: Colors.white,
                        )),
                  ),
                ),
                label: 'Menu',
              ),
            ],
            selectedLabelStyle: TextStyle(
              fontSize: AppDimensions.font10(context) * 1.4,
              fontWeight: FontWeight.w400,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: AppDimensions.font10(context) * 1.4,
              fontWeight: FontWeight.w400,
            ),
            currentIndex: index,
            onTap: _onItemTapped,
          ),
        ),
      ),
      //  ),
    ]);
  }
}
