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
    var SessionToken = prefs.getString("refreshtoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '${Accestoken}',
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
    var SessionToken = prefs.getString("refreshtoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '${Accestoken}',
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
    var SessionToken = prefs.getString("refreshtoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '${Accestoken}',
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

  Future<List<Map<String, dynamic>>> searchAllGoal() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
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

/////////////////////////////////
  ///
/*
  Future<List<List<String>>> getAllGoals() async {
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Miwicm9sZSI6InVzZXIiLCJpYXQiOjE2ODY4MjA1NDIsImV4cCI6MTY4NjkwNjk0Mn0.9Q88GbIH9OTFIXPdYFFgEsn0V0LSAr5omje2YXdqK3M',
    };

    var client = http.Client();
    var request = await client.get(
      Uri.parse(
          'http://192.168.18.23:8000/api/goalCategory/all-goalCategories'),
      headers: headers,
    );
    print("status: ${request.statusCode}");

    if (request.statusCode == 200) {
      print("Successfull");
          print("request: ${request.body}");

      List<List<String>> formattedGoals = [];
      List<String> row = [];

      var responses = jsonDecode(request.body);

      for (var i = 0; i < responses.length; i++) {
        var goal = responses[i]['goal'];

        // Add goal to the current row
        row.add(goal);

        // If the current row is filled, add it to the formatted goals list and start a new row
        if (row.length == 4) {
          formattedGoals.add(row);
          row = [];
        }
      }

      // If there are any remaining goals in the last row, add it to the formatted goals list
      if (row.isNotEmpty) {
        formattedGoals.add(row);
      }

      client.close();
      return formattedGoals;
    } else {
      client.close();
      throw Exception('Failed to fetch goals: ${request.reasonPhrase}');
    }
  }

*/

  Future userAddGoal(var goal) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var Body = json.encode(goal);

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userGoal/add-user-goal'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      print("response for api call:${responses}");
      print("response:${responses["message"]}");

      return true;
    } else {
      client.close();

      // print("response:${}");
      print("request==========>$request");
      return false;
    }
  }

  Future updateUserGoal(reason) async {
    final SharedPreferences login = await _prefs;
    final SharedPreferences prefs = await _prefs;

    var Accestoken = prefs.getString("usertoken");
    var userGoalId = login.getInt('goalid');
    print('$userGoalId');
    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({
      "reason": [
        {"text": "$reason"}
      ],
    });

    var request = await client.put(Uri.parse('${URL.BASE_URL}api/userGoal/1'),
        headers: headers, body: body);
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
      client.close();
      return false;
    }
  }

  static Future getUserGoal() async {
    var goalName;

    final SharedPreferences login = await _prefs;
    final SharedPreferences prefs = await _prefs;

    var Accestoken = prefs.getString("usertoken");
    var userGoalId = login.getInt('goalid');
    print('$userGoalId');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userGoal/$userGoalId'),
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
    final SharedPreferences login = await _prefs;
    final SharedPreferences prefs = await _prefs;

    var UserGoalId = login.getInt('goalId');
    print('$UserGoalId');

    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userGoal/$UserGoalId'),
        headers: headers);

    var responses = jsonDecode(request.body);
    print("Goal to be deleted");
    if (request.statusCode == 200) {
      print('object deleted');
      return true;
    } else {
      return responses["message"];
      // client.close();
      // return responses["message"];
    }
  }
}
