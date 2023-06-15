import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();

//  SharedPreferences login =  SharedPreferences.getInstance();
//       login.getString('usertoken', token);
//       login.getInt('userid', userid);

// var accessToken = login

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
      // print("response:${}");
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
    if (responses.statusCode == 200) {
      //return userAddGoal.fromJson(json.decode(request.body));
    }
  }

  Future getGoal() async {
    try {
      var request =
          await client.get(Uri.parse('${URL.BASE_URL}/api/goal/{goalId}'));
      print("status:${request.statusCode}");
      print("request:${request}");

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
  } ///////////////////////////////

  static Future<List<String>> getAllGoalNames() async {
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwicm9sZSI6InVzZXIiLCJpYXQiOjE2ODY4MzE5MzEsImV4cCI6MTY4NjkxODMzMX0.w2OlQ6fOwXu_Yb2vCsu7mpwMDgZI7PDkfRkM7CUFJOI',
    };

    var response = await http.get(
      Uri.parse(
          'http://161.35.106.33:8000/api/goalCategory/all-goalCategories'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");
      List<String> goalNames = [];

      for (var goalData in jsonData) {
        var goalName = goalData['name'];
        print("goalName :$goalName");
        goalNames.add(goalName);
      }
      print("run type :${goalNames.runtimeType}");
      return goalNames;
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

  void main() async {
    try {
      // var goals = await getAllGoals();
      //  print(goals);
    } catch (e) {
      print(e);
    }
  }

  Future userAddGoal(
      name, reason, identityStatement, visualizingYourSelf, userId) async {
    var headers = {'Content-Type': 'application/json', 'Authorizatin': ''};
    var Body = json.encode({
      "name": "$name",
      "reason": "$reason",
      "identityStatement": "$identityStatement",
      "visualizingYourSelf": "$visualizingYourSelf",
      //"color": "$color",
      "userId": "$userId",

      //"goalCategoryId": "$goalCategoryId",
    });
    print("request:$Body");
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userGoal/add-user-goal'),
        headers: headers,
        body: Body);
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
      // print("response:${}");
      print(responses.reasonPhrase);
      return responses["message"];
    }
  }

  Future updateUserGoal(goalName, goalCategoryId) async {
    var headers = {'Content-Type': 'application/json'};
    var Body = json
        .encode({"goalName": "$goalName", "goalCategoryId": "$goalCategoryId"});
    print("request:$Body");
    var request = await client
        .put(Uri.parse('${URL.BASE_URL}api/goal/{userGoalId}'), body: Body);
    print("request:");

    var responses = jsonDecode(request.body);
    if (responses.statusCode == 200) {
      //return userAddGoal.fromJson(json.decode(request.body));
    }
  }

  Future getUserGoal() async {
    try {
      var request =
          await client.get(Uri.parse('${URL.BASE_URL}/api/goal/{userGoalId}'));
      print("status:${request.statusCode}");
      print("request:${request}");

      if (request.statusCode == 200) {
        var goal = request.body;
        print("$goal.text.toString()");
      }
    } catch (e) {
      print('Request failed with status: ${"request.statusCode"}.');
    }
  }

  Future deleteUserGoal() async {
    var headers = {'Content-Type': 'application/json'};
    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}/api/goal/{userGoalId}'),
        headers: headers);
    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      var res = await responses.stream.bytesToString();
      print('Deleted successfully');
      return res;
    } else {
      client.close();
      return responses["message"];
    }
  }
}
