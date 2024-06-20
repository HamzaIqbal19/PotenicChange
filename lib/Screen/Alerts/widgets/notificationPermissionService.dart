import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notificationSheet.dart';

class NotificationPermissionService {
  static const String _lastPromptDateKey = 'lastPromptDate';

  Future<bool> checkAndRequestNotificationPermission(BuildContext context) async {
    final PermissionStatus status = await Permission.notification.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isPermanentlyDenied) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final DateTime? lastPromptDate = DateTime.tryParse(prefs.getString(_lastPromptDateKey) ?? '');
      final DateTime now = DateTime.now();

      if (lastPromptDate == null || now.difference(lastPromptDate).inDays >= 30) {
        // Store the current date as the last prompt date
        await prefs.setString(_lastPromptDateKey, now.toIso8601String());

        // Show a dialog to open settings
        //_showSettingsDialog(context);
       notificationsSheet(context);
      }
      return false;
    } else {
      return false;
    }
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification Permission Required'),
          content: Text('We need your permission to send you notifications. Please enable it in settings.'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await openAppSettings();
              },
              child: Text('Open Settings'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
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
