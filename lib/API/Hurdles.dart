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
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/hurdle/all-hurdles'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {}
  }

  Future addHurdle(String hurdleName, String triggerStatment,
      thoughtsAndFeelings, int hurdleId, userGoalId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = json.encode({
      "hurdleName": hurdleName,
      "triggerStatment": triggerStatment,
      "thoughtsAndFeelings": thoughtsAndFeelings,
      "userGoalId": userGoalId,
      "hurdleId": "$hurdleId",
      "userId": userId
    });
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userHurdle/add-hurdle'),
        headers: headers,
        body: body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      return responses;
    } else {
      return responses;
    }
  }

  Future deleteUserHurdle(userHurdleId) async {
    final SharedPreferences prefs = await _prefs;

    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userHurdle/$userHurdleId'),
        headers: headers);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return responses["message"];
    }
  }

  Future getHurdleById() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var hurldeId = prefs.getInt('userHurdleId');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userHurdle/$hurldeId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {}
  }

  Future getUserHurdles() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$userId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      return response.statusCode;
    }
  }

  Future checkUserHurdles() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$userId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future filterUserHurdles(filterTerm, goalId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse(goalId != 0 && filterTerm != 0
          ? '${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$userId?hurdleId=$filterTerm&userGoalId=$goalId'
          : filterTerm != 0 && goalId == 0
              ? '${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$userId?hurdleId=$filterTerm'
              : goalId != 0 && filterTerm == 0
                  ? '${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$userId?userGoalId=$goalId'
                  : '${URL.BASE_URL}api/userHurdle/hurdle-by-user-id/$userId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      return response.statusCode;
    } else {}
  }

  Future updateHurdle(destination, update) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var hurldeId = prefs.getInt('userHurdleId');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = jsonEncode({"$destination": update});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userHurdle/$hurldeId'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future deleteMulipleHurdle(userHurdeId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = json.encode({"userHurdleIds": userHurdeId, "userId": userId});
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userHurdle/deleteMultipleHurdle'),
        headers: headers,
        body: body);

    var responses = jsonDecode(request.body);
    print("DElete multple $responses");

    if (request.statusCode == 200) {
      return true;
    } else {
      return responses;
    }
  }
}
