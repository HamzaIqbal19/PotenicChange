import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class TimelineService {
  static Future getTimeLine(var givenDate, goalId, pracId, type) async {
    final SharedPreferences prefs = await _prefs;

    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    String url = '';

    if (goalId != null && type == null && pracId == null) {
      url =
          '${URL.BASE_URL}api/user/userPastDateTimeLine/$userId?givenDate=$givenDate&userGoalId=$goalId';
    } else if (goalId == null && pracId != null) {
      url =
          '${URL.BASE_URL}api/user/userPastDateTimeLine/$userId?givenDate=$givenDate&userPracticeId=$pracId';
    } else if (goalId == null && type != null) {
      url =
          '${URL.BASE_URL}api/user/userPastDateTimeLine/$userId?givenDate=$givenDate&type=$type';
    } else if (goalId != null && type != null) {
      url =
          '${URL.BASE_URL}api/user/userPastDateTimeLine/$userId?givenDate=$givenDate&userGoalId=$goalId&type=$type';
    } else {
      url =
          '${URL.BASE_URL}api/user/userPastDateTimeLine/$userId?givenDate=$givenDate';
    }

    print("url $url");

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Timeline data $jsonData");
      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future getFutureTimeLine(var givenDate, goalId, practiceId) async {
    final SharedPreferences prefs = await _prefs;

    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    String url = '';

    if (goalId != null && practiceId == null) {
      url =
          '${URL.BASE_URL}api/user/userFutureDateTimeLine/$userId?givenDate=$givenDate&userGoalId=$goalId';
    } else if (goalId == null && practiceId != null) {
      url =
          '${URL.BASE_URL}api/user/userFutureDateTimeLine/$userId?givenDate=$givenDate&userPracticeId=$practiceId';
    } else if (goalId != null && practiceId != null) {
      url =
          '${URL.BASE_URL}api/user/userFutureDateTimeLine/$userId?givenDate=$givenDate&userGoalId=$goalId&userPracticeId=$practiceId';
    } else {
      url =
          '${URL.BASE_URL}api/user/userFutureDateTimeLine/$userId?givenDate=$givenDate';
    }
    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Timeline data $jsonData");
      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }
}
