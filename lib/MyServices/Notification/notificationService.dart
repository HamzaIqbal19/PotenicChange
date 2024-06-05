import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notificationController.dart';

void foregroundMessaging() {
 // final notificationController notificationsController = Get.find<notificationController>();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    String? title = message.notification!.title;
    String? body = message.notification!.body;
    String? route = message.data['route'];
    String? id = message.data['id'];
    String? url = message.data['url'];

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
    // notificationsController.setNotificationBody(body??'');
    // notificationsController.setNotificationRoute(route??'');
    // notificationsController.setNotificationId(id??"");
    // notificationsController.setNotificationUrl(url??"");


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
