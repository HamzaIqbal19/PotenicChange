import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Hurdles {
  Future getAllHurdles() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/hurdle/all-hurdles'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {
      print(
          'Failed to fetch hurdle names Request failed with status: ${response.statusCode}');
    }
  }

  Future addHurdle(String hurdleName, String triggerStatment,
      thoughtsAndFeelings, int hurdleId, userGoalId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var Body = json.encode({
      "hurdleName": "$hurdleName",
      "triggerStatment": "$triggerStatment",
      "thoughtsAndFeelings": thoughtsAndFeelings,
      "userGoalId": userGoalId,
      "hurdleId": "$hurdleId",
      "userId": UserId
    });
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userHurdle/add-hurdle'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      return responses;
    } else {
      print("request==========>$request");
      return responses;
    }
  }

  Future deleteUserHurdle(userHurdleId) async {
    final SharedPreferences prefs = await _prefs;

    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userHurdle/$userHurdleId'),
        headers: headers);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      print('object deleted');
      return true;
    } else {
      return responses["message"];
    }
  }

  Future getHurdleById() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var hurldeId = prefs.getInt('userHurdleId');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userHurdle/$hurldeId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {
      print(
          'Failed to  hurdle names Request failed with status: ${response.statusCode}');
    }
  }

  Future getUserHurdles() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$UserId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      print(
          'Failed to fetch hurdle names by user id Request failed with status: ${response.statusCode}');
      return response.statusCode;
    }
  }

  Future checkUserHurdles() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$UserId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return true;
    } else {
      return false;
    }
  }

  Future filterUserHurdles(filterTerm, goalId) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse(goalId != 0 && filterTerm != 0
          ? '${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$UserId?hurdleId=$filterTerm&userGoalId=$goalId'
          : filterTerm != 0 && goalId == 0
              ? '${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$UserId?hurdleId=$filterTerm'
              : goalId != 0 && filterTerm == 0
                  ? '${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$UserId?userGoalId=$goalId'
                  : '${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$UserId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      return response.statusCode;
    } else {
      print(
          'Failed to fetch hurdle names by user id Request failed with status: ${response.statusCode}');
    }
  }

  Future updateHurdle(destination, update) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var hurldeId = prefs.getInt('userHurdleId');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({"$destination": update});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userHurdle/$hurldeId'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      print("request: Update successful");
      var jsonData = jsonDecode(request.body);
      return true;
    } else {
      print("Update failed");
      return false;
    }
  }
}
