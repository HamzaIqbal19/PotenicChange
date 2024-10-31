import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notificationSheet.dart';

class NotificationPermissionService {
  static const String _lastPromptDateKey = 'lastPromptDate';

  Future<bool> checkAndRequestNotificationPermission(
      BuildContext context, bool dashboard) async {
    final PermissionStatus status = await Permission.notification.status;
    if (status.isGranted) {
      return true;
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final DateTime? lastPromptDate =
          DateTime.tryParse(prefs.getString(_lastPromptDateKey) ?? '');
      final DateTime now = DateTime.now();

      if (lastPromptDate == null ||
          now.difference(lastPromptDate).inDays >= 30) {
        // Store the current date as the last prompt date
        await prefs.setString(_lastPromptDateKey, now.toIso8601String());

        // Show a dialog to open settings
        //_showSettingsDialog(context);
        if (dashboard) {
          notificationsSheet(context);
        } else {
          _showSettingsDialog(context);
        }
      }
      return false;
    }
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => SizedBox(
        width: AppDimensions.width10(context) * 27.0,
        height: AppDimensions.height10(context) * 18.8,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Container(
            margin:
                const EdgeInsets.only(top: 19, right: 16, left: 16, bottom: 2),
            height: AppDimensions.height10(context) * 4.4,
            width: AppDimensions.width10(context) * 23.8,
            child: Text(
              "Notification permission is \nneeded",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.7,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          content: Container(
            margin: EdgeInsets.only(
                bottom: AppDimensions.height10(context) * 1.9,
                left: AppDimensions.height10(context) * 1.6,
                right: AppDimensions.height10(context) * 1.6),
            height: AppDimensions.height10(context) * 1.8,
            width: AppDimensions.width10(context) * 23.8,
            child: const Text(
              "Please enable it in Phone’s setting",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Container(
                  height: 42,
                  width: double.infinity,
                  color: const Color(0xFF007AFF),
                  child: TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await openAppSettings();
                    },
                    child: const Text(
                      'Enable Notification',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 17,
                          fontFamily: "Laila",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Laila",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF007AFF)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Notification Permission Required'),
    //       content: Text(
    //           'We need your permission to send you notifications. Please enable it in settings.'),
    //       actions: [
    //         TextButton(
    //           onPressed: () async {
    //             Navigator.of(context).pop();
    //             await openAppSettings();
    //           },
    //           child: Text('Open Settings'),
    //         ),
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text('Cancel'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}

// Future<void> checkPermission(Permission permission, BuildContext context) async{
//   final status = await permission.request();
//   if(status.isGranted){
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Permission is Granted")));
//   }else{
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Permission is not Granted")));
//
//
//}
//}
