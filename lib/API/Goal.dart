import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();

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
  }

  Future getAllGoals() async {
    try {
      var request =
          await client.get(Uri.parse('${URL.BASE_URL}/api/goal/all-goals'));
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

  Future userAddGoal(name, reason, identityStatement, visualizingYourSelf,
      userId, accessToken) async {
    var headers = {'Content-Type': 'application/json'};
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
    var request =
        await client.delete(Uri.parse('${URL.BASE_URL}/api/goal/{userGoalId}'));

    if (request.statusCode == 200) {
      print('Resource deleted successfully.');
    } else {
      // Request failed, handle the error
      print('Request failed with status: ${request.statusCode}.');
    }
  }
}
