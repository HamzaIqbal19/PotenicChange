import 'package:get/get.dart';

class notificationController extends GetxController {
  // Observable string variable
  var notificationBody = ''.obs;
  var notificationList = <dynamic>[].obs;

  // Getter for the string
  String get getNotificationBody => notificationBody.value;

  List<dynamic> getAllNotifications() {
    return notificationList.toList();
  }

  // Setter for the string
  void setNotificationBody(String value) {
    notificationBody.value = value;
  }

  void addNotifications(dynamic obj) {
    notificationList.add(obj);
  }

  void removeNotifications(int index) {
    notificationList.removeAt(index);
  }


  void clearNotifications() {
    notificationList.clear();
  }

  var notificationRoute = ''.obs;

  // Getter for the string
  String get getNotificationRoute => notificationRoute.value;

  // Setter for the string
  void setNotificationRoute(String value) {
    notificationRoute.value = value;
  }

  var notificationId = ''.obs;

  // Getter for the string
  String get getNotificationId => notificationId.value;

  // Setter for the string
  void setNotificationId(String value) {
    notificationId.value = value;
  }

  var notificationUrl = ''.obs;

  // Getter for the string
  String get getNotificationUrl => notificationUrl.value;

  // Setter for the string
  void setNotificationUrl(String value) {
    notificationUrl.value = value;
  }
}