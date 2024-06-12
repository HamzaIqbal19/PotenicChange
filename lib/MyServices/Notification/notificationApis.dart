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
      Uri.parse('${URL.BASE_URL}api/user/getAlluserNotifications/$userId'),
      headers: headers,
    );
    print("get notifications ${response.statusCode}");
    if (response.statusCode == 200) {
      print("get notifications ${response.body}");
      var jsonData = jsonDecode(response.body);

      var lastNotification = jsonData["data"][0];
      print("get notifications ${jsonData["data"]}");
      controller.clearNotifications();
      controller.notificationList(jsonData);
      controller.notificationBody(lastNotification["body"]??"");
      controller.notificationRoute(lastNotification["data"]["route"]??"");
      controller.notificationUrl(lastNotification["data"]["url"]??"");
      controller.notificationId(lastNotification["data"]["id"]??"");

    } else {
      throw Exception('Failed to fetch goal names');
    }
  }


}