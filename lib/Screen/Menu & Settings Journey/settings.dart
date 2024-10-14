import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
// import 'package:flutter_offline/flutter_offline.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/account_deleted.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/edit_credentials.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/notifications.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/widgets/menuWidgets.dart';
import 'package:potenic_app/Screen/Practice%20Review%20Journey/Activateyourstar.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/followUs.dart';
import 'package:potenic_app/Widgets/webVisit.dart';
import 'package:potenic_app/utils/app_link.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String userName = 'Jane';
  String userEmail = 'jane.Smith@email.com';

  getUser() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userName = prefs.getString('userName') ?? 'Jane';
      userEmail = prefs.getString('userEmail') ?? 'jane.Smith@email.com';
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    final colorC = Color.alphaBlend(
        const Color(0xFF000000).withOpacity(0.2), const Color(0XFF5B74A6));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Buttons().backButton(context, () {
          Navigator.pop(context);
        }),
        centerTitle: true,
        title: SizedBox(
          width: AppDimensions.width10(context) * 17.0,
          height: AppDimensions.height10(context) * 4.8,
          child: Center(
            child: Text(
              'Settings',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions.font10(context) * 1.8,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Stack(alignment: Alignment.center, children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 38.4,
                  height: AppDimensions.height10(context) * 23.6,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 15.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: AppDimensions.width10(context) * 19.0,
                          height: AppDimensions.height10(context) * 2.6,
                          child: Text(
                            'My Account Details',
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 2.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0XFFFBFBFB)),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 38.4,
                        height: AppDimensions.height10(context) * 20.0,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const edit_credentials(
                                    email: false,
                                    password_edit: false,
                                  )),
                                );
                              },
                              child: Container(
                                width: AppDimensions.width10(context) * 33.4,
                                height: AppDimensions.height10(context) * 5.2,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 1.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width:
                                                AppDimensions.width10(context) *
                                                    0.1,
                                            color: colorC))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 4.5,
                                      height:
                                          AppDimensions.height10(context) * 4.0,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  0.9),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width:
                                                AppDimensions.width10(context) *
                                                    19.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.9,
                                            child: Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w500,
                                                  color: colorC),
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.1,
                                            child: Text(
                                              userName,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w400,
                                                  color: colorC),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 4.8,
                                      height:
                                          AppDimensions.height10(context) * 2.8,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'EDIT',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w500,
                                            color: colorC),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const edit_credentials(
                                          email: true, password_edit: false)),
                                );
                              },
                              child: Container(
                                width: AppDimensions.width10(context) * 33.4,
                                height: AppDimensions.height10(context) * 5.2,
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 1.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width:
                                                AppDimensions.width10(context) *
                                                    0.1,
                                            color: colorC))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 19.0,
                                      height:
                                          AppDimensions.height10(context) * 4.0,
                                      child: Column(
                                        children: [
                                          Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    19.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.9,
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Email address',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w500,
                                                  color: colorC),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                AppDimensions.width10(context) *
                                                    19.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.1,
                                            child: Text(
                                              userEmail,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w400,
                                                  color: colorC),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 4.8,
                                      height:
                                          AppDimensions.height10(context) * 2.8,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'EDIT',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w500,
                                            color: colorC),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const edit_credentials(
                                          email: false, password_edit: true)),
                                );
                              },
                              child: Container(
                                alignment: Alignment.topLeft,
                                width: AppDimensions.width10(context) * 33.4,
                                height: AppDimensions.height10(context) * 5.2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 19.0,
                                      height:
                                          AppDimensions.height10(context) * 4.0,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width:
                                                AppDimensions.width10(context) *
                                                    19.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.9,
                                            child: Text(
                                              'Password (8+ character)',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w500,
                                                  color: colorC),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                AppDimensions.width10(context) *
                                                    19.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.1,
                                            child: Text(
                                              '**********',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w400,
                                                  color: colorC),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 4.8,
                                      height:
                                          AppDimensions.height10(context) * 2.8,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'EDIT',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w500,
                                            color: colorC),
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
                  width: AppDimensions.width10(context) * 38.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: AppDimensions.width10(context) * 11.4,
                          height: AppDimensions.height10(context) * 2.4,
                          child: Text(
                            'Preferences',
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 2.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0XFFFBFBFB)),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 38.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: AppDimensions.height10(context),
                            ),
                            menuItems(context, () {
                              Navigator.push(
                                context,
                                FadePageRoute(page: const notifications()),
                              );
                            }, 'Notifications'),
                            menuItems(context, () {}, 'Invite a friend'),
                            SizedBox(
                              height: AppDimensions.height10(context) * 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 38.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: AppDimensions.width10(context) * 5.3,
                          height: AppDimensions.height10(context) * 2.4,
                          child: Text(
                            'About',
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 2.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFBFBFB)),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 38.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: AppDimensions.height10(context),
                            ),
                            menuItems(context, () {
                              Navigator.push(
                                context,
                                FadePageRoute(page: const About_us()),
                              );
                            }, 'About us'),
                            menuItems(context, () {
                              Navigator.pushReplacement(
                                  context,
                                  FadePageRoute(
                                    page: const ViewDashboard(
                                      missed: false,
                                      name: '',
                                      update: false,
                                      helpfulTips: true,
                                      record: 0,
                                    ),
                                  ));
                              dashboard_sheet(context);
                            }, 'Tutorial'),
                            menuItems(context, () {
                              webVisit(AppLinks().faqs);
                            }, 'FAQs'),
                            menuItems(context, () {
                              webVisit(AppLinks().contactUs);
                            }, 'Contact us'),
                            menuItems(context, () {
                              export_data_sheet(context);
                            }, 'Export data'),
                            menuItems(context, () {
                              webVisit(AppLinks().termsOfService);
                            }, 'Terms of service'),
                            menuItems(context, () {
                              webVisit(AppLinks().privacyPolicy);
                            }, 'Privacy policy'),
                            SizedBox(
                              height: AppDimensions.height10(context) * 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedScaleButton(
                  onTap: () => showAnimatedDialog(
                      animationType: DialogTransitionType.fadeScale,
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      context: context,
                      builder: (BuildContext context) => SizedBox(
                            width: AppDimensions.width10(context) * 27.0,
                            height: AppDimensions.height10(context) * 19.8,
                            child: AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              actionsPadding: EdgeInsets.zero,
                              titlePadding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 1.4)),
                              title: Container(
                                  margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 1.9,
                                      right:
                                          AppDimensions.height10(context) * 1.6,
                                      left:
                                          AppDimensions.height10(context) * 1.6,
                                      bottom: AppDimensions.height10(context) *
                                          0.2),
                                  height: AppDimensions.height10(context) * 2.2,
                                  width: AppDimensions.width10(context) * 23.8,
                                  child: Text(
                                    'Log out?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'laila',
                                        fontSize:
                                            AppDimensions.font10(context) * 1.7,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF000000)),
                                  )),
                              content: Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 1.9,
                                    top: AppDimensions.height10(context) * 0.2,
                                    left: AppDimensions.width10(context) * 1.6,
                                    right:
                                        AppDimensions.height10(context) * 1.6),
                                height: AppDimensions.height10(context) * 4.8,
                                width: AppDimensions.width10(context) * 23.8,
                                child: Text(
                                  "Are you sure you want to log out? If you do, you will be prompted to login again by entering your email and password.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      height: AppDimensions.height10(context) *
                                          0.15,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.3,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF000000)),
                                ),
                              ),
                              actions: <Widget>[
                                Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 4.4,
                                      width: double.infinity,
                                      color: const Color(0xFF007AFF),
                                      child: TextButton(
                                        onPressed: () async {
                                          final SharedPreferences prefs =
                                              await _prefs;
                                          var email =
                                              prefs.getString('loginEmail');
                                          var pass =
                                              prefs.getString('loginPass');
                                          await prefs.clear();

                                          if (email != null && pass != null) {
                                            prefs.setString(
                                                'loginEmail', email);
                                            prefs.setString('loginPass', pass);
                                          }
                                          Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page: const HomeScreen(
                                                login: false,
                                              )));
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.7,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 4.4,
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
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
                                          AppDimensions.height10(context) * 0.1,
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
                    width: AppDimensions.width10(context) * 13.0,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 5.0),
                      border: Border.all(
                          color: const Color(0xFFFBFBFB),
                          width: AppDimensions.width10(context) * 0.1),
                      color: const Color(0xFFF5F5F5),
                    ),
                    child: Center(
                      child: Text(
                        'Log out',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFF8C648A)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 4),
                AnimatedScaleButton(
                  onTap: () => showAnimatedDialog(
                      animationType: DialogTransitionType.fadeScale,
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      context: context,
                      builder: (BuildContext context) => SizedBox(
                            width: AppDimensions.width10(context) * 27.0,
                            height: AppDimensions.height10(context) * 18.2,
                            child: AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              actionsPadding: EdgeInsets.zero,
                              titlePadding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 1.4)),
                              title: Container(
                                  margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 1.9,
                                      right:
                                          AppDimensions.height10(context) * 1.6,
                                      left:
                                          AppDimensions.height10(context) * 1.6,
                                      bottom: AppDimensions.height10(context) *
                                          0.2),
                                  height: AppDimensions.height10(context) * 2.2,
                                  width: AppDimensions.width10(context) * 23.8,
                                  child: Text(
                                    'Delete account?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'laila',
                                        fontSize:
                                            AppDimensions.font10(context) * 1.7,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF000000)),
                                  )),
                              content: Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 1.9,
                                    top: AppDimensions.height10(context) * 0.2,
                                    left: AppDimensions.width10(context) * 1.6,
                                    right:
                                        AppDimensions.height10(context) * 1.6),
                                height: AppDimensions.height10(context) * 3.2,
                                width: AppDimensions.width10(context) * 23.8,
                                child: Text(
                                  "Are you sure you want to delete your\naccount? You will lose all your data.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      height: AppDimensions.height10(context) *
                                          0.15,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.3,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF000000)),
                                ),
                              ),
                              actions: <Widget>[
                                Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 4.4,
                                      width: double.infinity,
                                      color: const Color(0xFF007AFF),
                                      child: TextButton(
                                        onPressed: () {
                                          Authentication()
                                              .deleteUserAccount()
                                              .then((response) {
                                            if (response == true) {
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page:
                                                          const Acc_deleted()));
                                            } else {}
                                          }).whenComplete(() => null);
                                        },
                                        child: Text(
                                          'Yes, delete my account',
                                          style: TextStyle(
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.7,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 4.4,
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
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
                                          AppDimensions.height10(context) * 0.1,
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
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                            height: AppDimensions.height10(context) * 0.15,
                            decoration: TextDecoration.underline,
                            fontSize: AppDimensions.font10(context) * 1.6,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFF8C648A)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 8),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    final colorC = Color.alphaBlend(
        const Color(0xFF000000).withOpacity(0.2), const Color(0XFF5B74A6));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Buttons().backButton(context, () {
          Navigator.pop(context);
        }),
        centerTitle: true,
        title: SizedBox(
          width: AppDimensions.width10(context) * 17.0,
          height: AppDimensions.height10(context) * 4.8,
          child: Text(
            'About',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.8,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: AppDimensions.width10(context) * 38.4,
              height: AppDimensions.height10(context) * 21.4,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 15.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: AppDimensions.width10(context) * 13.6,
                      height: AppDimensions.height10(context) * 2.4,
                      child: Text(
                        'About Potenic',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFFFBFBFB)),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 38.4,
                    height: AppDimensions.height10(context) * 18.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            webVisit(AppLinks().ourStory);
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 33.4,
                            height: AppDimensions.height10(context) * 5.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.width10(context) *
                                            0.1,
                                        color: colorC))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.width10(context) * 20.6,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    'Our story',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: colorC),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.width10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.webp',
                                        //width: AppDimensions.width10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        color: colorC,
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
                            width: AppDimensions.width10(context) * 33.4,
                            height: AppDimensions.height10(context) * 5.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.width10(context) *
                                            0.1,
                                        color: colorC))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.width10(context) * 20.6,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    'Like us? Rate us',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: colorC),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.width10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.webp',
                                        //width: AppDimensions.width10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        color: colorC,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialogs().FollowUsDialogs(context);
                          },
                          child: SizedBox(
                            width: AppDimensions.width10(context) * 33.4,
                            height: AppDimensions.height10(context) * 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.width10(context) * 20.6,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    'Follow us',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: colorC),
                                  ),
                                ),
                                SizedBox(
                                    width: AppDimensions.width10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.webp',
                                        //width: AppDimensions.width10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        color: colorC,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
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
              width: AppDimensions.width10(context) * 17.0,
              height: AppDimensions.height10(context) * 0.5,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 51.7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 5.0),
                  color: const Color(0xFFFFFFFF).withOpacity(0.3)),
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
        top: Radius.circular(AppDimensions.height10(context) * 2.0),
      )),
      builder: (context) => Container(
            width: AppDimensions.width10(context) * 41.4,
            height: AppDimensions.height10(context) * 48.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top:
                        Radius.circular(AppDimensions.height10(context) * 2.0)),
                color: const Color(0xFFF5F5F5)),
            child: Column(
              children: [
                Container(
                  //color: Colors.amber,
                  // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                  alignment: const Alignment(1, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: AppDimensions.width10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.5,
                          right: AppDimensions.width10(context) * 1.5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Close_blue.webp'))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9,
                      bottom: AppDimensions.height10(context) * 3.9),
                  child: Image.asset(
                    'assets/images/potenic__icon.webp',
                    width: AppDimensions.width10(context) * 8.202,
                    height: AppDimensions.height10(context) * 11.2,
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 18.3,
                  height: AppDimensions.height10(context) * 3.6,
                  // color: Colors.amber,
                  alignment: Alignment.center,
                  //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                  child: Text(
                    'Export data',
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 3.0,
                        letterSpacing: AppDimensions.height10(context) * 0.2,
                        height: AppDimensions.height10(context) * 0.15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF437296)),
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 35.2,
                  height: AppDimensions.height10(context) * 17.6,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.1),
                  child: Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                fontFamily: 'Laila',
                                height: AppDimensions.height10(context) * 0.15,
                                fontSize: AppDimensions.font10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF437296)),
                            children: const [
                              TextSpan(
                                  text:
                                      'To access your data, please email to us at\n'),
                              TextSpan(
                                  text: 'support@potenic.com',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text:
                                      ' and we will action your request as soon as possible.\n\n\nIn the email subject please state: '),
                              TextSpan(
                                text: 'Potenic App Export My Data\n\n\n',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                  text: 'Thank you for your co-operation :)')
                            ])),
                  ),
                )
              ],
            ),
          ));
}
