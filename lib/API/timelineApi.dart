import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class TimelineService {
  static Future getTimeLine(var givenDate) async {
    final SharedPreferences prefs = await _prefs;

    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    print('AccessToken $accessToken');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/user/userTimelineByGivenDate/$userId?givenDate=$givenDate'),
      headers: headers,
    );

    print("Timeline data $accessToken");

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Timeline data $jsonData");
      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }
}
