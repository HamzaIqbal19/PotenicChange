import 'dart:convert';
import 'package:potenic_app/API/Apispecs.dart';
import 'package:potenic_app/MyServices/Notification/notificationController.dart';
import 'package:sentry/sentry.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class notificationApi{

  static Future getUserNotification() async {
    final SharedPreferences prefs = await _prefs;
    final notificationController controller = Get.find<notificationController>();
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/user/getUserRedaCenterNotifications/$userId'),
      headers: headers,
    );
    print("get notifications ${response.statusCode} $userId");
    if (response.statusCode == 200) {
      print("get notifications ${response.body}");
      var jsonData = jsonDecode(response.body);
      print("get notifications ${jsonData["data"]}");
      controller.clearNotifications();
      controller.notificationList(jsonData["data"]);

    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future getMessageCenter() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/user/getUserMessageCenterNotifications/$userId'),
      headers: headers,
    );
    print("get notifications ${response.statusCode} $userId");
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

     return jsonData["data"];

    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future deleteUserNotification(notificationIds) async {
    final SharedPreferences prefs = await _prefs;
    final notificationController controller = Get.find<notificationController>();
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };
    var body = json.encode({
      "notificationIds": notificationIds,
    });

    var response = await http.post(
      Uri.parse('${URL.BASE_URL}api/user/deleteSelectedNotifications'),
      headers: headers,
      body: body
    );

    if (response.statusCode == 200) {
      getUserNotification();
      return true;

    } else {
      throw Exception('Failed to fetch goal names');

    }
  }

  static Future markAsRead(notificationId) async {
    final SharedPreferences prefs = await _prefs;
    final notificationController controller = Get.find<notificationController>();
    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };


    var response = await http.put(
        Uri.parse('${URL.BASE_URL}api/user/markedReadNotification/$notificationId'),
        headers: headers,
    );
    print("Mark as read response ${response.statusCode} ${response.body}");
    if (response.statusCode == 200) {
      getUserNotification();
      return true;

    } else {
      throw Exception('Failed to fetch goal names');

    }
  }


}