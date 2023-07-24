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

class InspirationApi {
  Future addInspiration(
      int inspirationId,
      String file,
      String title,
      hashTags,
      String destinationLink,
      bool visibility,
      String description,
      userGoalId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var Body = json.encode({
      "inspirationId": "$inspirationId",
      "file": file,
      "title": title,
      "hashTags": hashTags,
      "visibility": "$visibility",
      "destinationLink": destinationLink,
      "userGoalId": userGoalId,
      "description": description,
      "userId": UserId
    });
    print(Body);

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userInspiration/add-userInspiration'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);
    print(responses);

    if (request.statusCode == 200) {
      var inspirationId =
          prefs.setInt('userInspirationId', responses['result']['id']);

      print(responses['result']['id']);

      return responses;
    } else {
      //client.close();

      // print("response:${}");
      print("request==========>$request");
      return responses;
    }
  }

  Future updateInspiration(String title, hashTags, String destinationLink,
      String description, String file) async {
    final SharedPreferences prefs = await _prefs;
    //var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");
    var userInspirationId = prefs.getInt('userInspirationId');

    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({
      "title": title,
      "hashTags": hashTags,
      "destinationLink": destinationLink,
      "description": description,
      "file": file,
    });
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userInspiration/$userInspirationId'),
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

  Future deleteUserInspiraton() async {
    final SharedPreferences prefs = await _prefs;
    var userInspirationId = prefs.getInt('userInspirationId');
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    print(userInspirationId);

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userInspiration/$userInspirationId'),
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

  Future getInspirationById() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var userInspirationId = prefs.getInt('userInspirationId');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };
    print('-=--=----===-==');
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userInspiration/$userInspirationId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('------------------------------------------------');
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");
      print(jsonData['inspiration']['title']);
      return jsonData;
    } else {
      print(
          'Failed to fetch hurdle names Request failed with status: ${response.statusCode}');
    }
  }

  Future getUserInspiration() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId'),
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
}
