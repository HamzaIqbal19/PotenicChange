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

getToken() async {
  SharedPreferences login = await SharedPreferences.getInstance();
  var token = login.get('token');
  return token;
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class AdminGoal {
  Future createGoal(goalName, goalCategoryId) async {
    var headers = {'Content-Type': 'application/json'};
    var Body = json.encode({
      "goalName": "$goalName",
      "goalCategoryId": "$goalCategoryId",
    });
    print("request:$Body");
    var request = await client
        .post(Uri.parse('${URL.BASE_URL}api/goal/add-goal'), body: Body);
    print("request:");

    var responses = jsonDecode(request.body);

    print("status:${request.statusCode}");
    print("request:${responses}");
    print("request:${responses["status"]}");
    if (request.statusCode == 200) {
      print("response:${responses["message"]}");
      var res = await responses.stream.bytesToString();
      return res;
    } else {
      client.close();

      print(responses.reasonPhrase);
      return responses["message"];
    }
  }

  Future updateGoal(goalName, goalCategoryId) async {
    var headers = {'Content-Type': 'application/json'};
    var Body = json
        .encode({"goalName": "$goalName", "goalCategoryId": "$goalCategoryId"});
    print("request:$Body");
    var request = await client
        .put(Uri.parse('${URL.BASE_URL}/api/goal/{goalId}'), body: Body);
    print("request:");

    var responses = jsonDecode(request.body);
    if (responses.statusCode == 200) {}
  }

  Future getGoal() async {
    try {
      var request =
          await client.get(Uri.parse('${URL.BASE_URL}/api/goal/{goalId}'));
      if (request.statusCode == 200) {
        var goal = request.body;
        print("$goal.text.toString()");
      }
    } catch (e) {
      print('Request failed with status: ${"request.statusCode"}.');
    }
  }

  Future deleteGoal() async {
    var request =
        await client.delete(Uri.parse('${URL.BASE_URL}/api/goal/{goalId}'));

    if (request.statusCode == 200) {
      print('Resource deleted successfully.');
    } else {
      // Request failed, handle the error
      print('Request failed with status: ${request.statusCode}.');
    }
  }

  static Future<List<Map<String, dynamic>>> getAllCategoriesNames() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/goalCategory/all-goalCategories'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");
      List<String> goalNames = [];
      for (var goalData in jsonData) {
        var goalName = goalData['name'];
        goalNames.add(goalName);
      }
      print("run type :${goalNames.runtimeType}");
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future<List<Map<String, dynamic>>> getAllGoalAndCategories() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/goal/all-goals'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //print("Result:$jsonData");
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future<List<Map<String, dynamic>>> getAllGoal(int id) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/goal/all-goals?goalCategoryId=$id'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future<List<Map<String, dynamic>>> searchAllGoal() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/goal/all-goals'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  Future userAddGoal(name, reason, identityStatement, visualizingYourSelf,
      userId, goalCategoryId, color) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var Body = json.encode({
      "name": "$name",
      "reason": ["$reason"],
      "identityStatement": ["$identityStatement"],
      "visualizingYourSelf": ["$visualizingYourSelf"],
      "color": "$color",
      "userId": "$userId",
      "goalCategoryId": "$goalCategoryId",
    });

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userGoal/add-user-goal'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

    print("request:${responses}");

    if (request.statusCode == 200) {
      print("response:${responses["message"]}");
      var res = await responses.stream.bytesToString();
      return res;
    } else {
      client.close();

      print(responses.reasonPhrase);
      return responses["message"];
    }
  }

  Future updateUserGoal(var reason) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var request = await client.put(Uri.parse('${URL.BASE_URL}api/userGoal/12'),
        headers: headers, body: jsonEncode({"reason"[0]: reason}));
    if (request.statusCode == 200) {
      var jsonData = jsonDecode(request.body);
      print("Result: $jsonData");

      return jsonData.fromDecode(reason);
    } else {
      print("Not working");

      client.close();
    }
  }

  static Future getUserGoal() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userGoal/12'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  Future deleteUserGoal() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var request = await client
        .delete(Uri.parse('${URL.BASE_URL}api/userGoal/1'), headers: headers);

    var responses = jsonDecode(request.body);
    print("Goal to be deleted");
    if (request.statusCode == 200) {
      print("response:${responses["message"]}");
      var res = await responses.stream.bytesToString();
      print('Goal deleted');
      return res;
    } else {
      client.close();
      return responses["message"];
    }
  }
}
