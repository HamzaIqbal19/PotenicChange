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
      "userGoalId": "$userGoalId",
      "description": description,
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

      return request;
    } else {
      //client.close();

      // print("response:${}");
      print("request==========>$request");
      return responses;
    }
  }

  Future deleteUserHurdle(userInspirationId) async {
    final SharedPreferences prefs = await _prefs;

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
      Uri.parse('${URL.BASE_URL}api/userInspiration/52'),
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

  Future getAllUserInspiration() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userInspiration/userInspirationId'),
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
