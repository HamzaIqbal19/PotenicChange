import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/main.dart';

void foregroundMessaging() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String? title = message.notification!.title;
    String? body = message.notification!.body;
    String? route = message.data['name'];

    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: "call_channel",
            color: Colors.white,
            title: title,
            body: body,
            category: NotificationCategory.Message,
            roundedLargeIcon: true,
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: false,
            notificationLayout: NotificationLayout.BigText,
            backgroundColor: Colors.transparent));
    // if (route == 'hurdle') {
    //   navigatorKey.currentState?.push(
    //     MaterialPageRoute(builder: (context) => landing_hurdles()),
    //   );
    // }

  });



}

void CreateNotification(String body) {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: "call_channel",
          color: Colors.white,
          title: 'Potenic',
          body: body,
          roundedLargeIcon: true,
          category: NotificationCategory.Message,
          wakeUpScreen: true,
          fullScreenIntent: true,
          autoDismissible: false,
          notificationLayout: NotificationLayout.BigText,
          backgroundColor: Colors.transparent));
}


DateTime scheduledTime = DateTime.now().add(Duration(minutes: 2));

void SceduleNotification(String body){
  AwesomeNotifications().createNotification(
      schedule: NotificationInterval(
        interval: 100,
        repeats: false, // Set to true if you want it to repeat
      ),
      content: NotificationContent(
          id: 1,
          channelKey: "call_channel",
          color: Colors.white,
          title: 'Potenic',
          body: body,
          category: NotificationCategory.Message,
          wakeUpScreen: true,
          fullScreenIntent: true,
          autoDismissible: false,
          notificationLayout: NotificationLayout.BigText,
          backgroundColor: Colors.transparent));
}
