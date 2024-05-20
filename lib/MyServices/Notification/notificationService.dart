import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void foregroundMessaging() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String? title = message.notification!.title;
    String? body = message.notification!.body;
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: "call_channel",
            color: Colors.white,
            title: title,
            body: body,
            category: NotificationCategory.Message,
            roundedLargeIcon: true,
            largeIcon: 'assets/images/potenicIcon.png',
            icon: 'assets/images/potenicIcon.png',
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: false,
            notificationLayout: NotificationLayout.BigText,
            backgroundColor: Colors.transparent));
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
          largeIcon: 'assets/images/potenicIcon.png',
          icon: 'assets/images/potenicIcon.png',
          category: NotificationCategory.Message,
          wakeUpScreen: true,
          fullScreenIntent: true,
          autoDismissible: false,
          notificationLayout: NotificationLayout.BigText,
          backgroundColor: Colors.transparent));
}
