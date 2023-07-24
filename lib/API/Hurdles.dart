import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
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
      print("Result:$jsonData");

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
    print(responses);

    if (request.statusCode == 200) {
      return responses;
    } else {
      //client.close();

      // print("response:${}");
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
    print(userHurdleId);

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userHurdle/$userHurdleId'),
        headers: headers);

    var responses = jsonDecode(request.body);
    print(responses);
    print("Hurdle to be deleted");
    if (request.statusCode == 200) {
      print('object deleted');
      return true;
    } else {
      return responses["message"];
      // client.close();
      // return responses["message"];
    }
  }

  Future getHurdleById() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var hurldeId = prefs.getInt('userHurdleId');
    print(hurldeId);

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
      print("Result:$jsonData");

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
    print('$UserId');

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
      print("Result:$jsonData");

      return jsonData;
    } else {
      print(
          'Failed to fetch hurdle names by user id Request failed with status: ${response.statusCode}');
    }
  }

  Future updateHurdle(destination, update) async {
    final SharedPreferences prefs = await _prefs;
    //var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");
    var hurldeId = prefs.getInt('userHurdleId');

    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({"$destination": "$update"});
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userHurdle/$hurldeId'),
        headers: headers,
        body: body);
    print("request: Update");
    print('=====>$request.statusCode');
    print(request.body);
    if (request.statusCode == 200) {
      // print("$request.statusCode");
      print("request: Update successful");
      var jsonData = jsonDecode(request.body);
      print("Result: $jsonData");
      return true;
    } else {
      print("Update failed");
      // client.close();
      return false;
    }
  }
}
