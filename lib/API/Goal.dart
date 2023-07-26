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
      //client.close();

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

  Future<List<Map<String, dynamic>>> searchAllGoal(String searchvalue) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    //String characters = ;
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/goal/all-goals?goalName=$searchvalue'),
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

  Future<List<Map<String, dynamic>>> searchAllGoalById(
      String searchvalue, int id) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/goal/all-goals?goalName=$searchvalue&goalCategoryId=$id'),
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

  Future addNewGoal(goalName, goalCategoryId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var Body = json.encode({
      "goalName": "$goalName",
      "goalCategoryId": "$goalCategoryId",
    });

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userGoal/add-user-goal'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      print("response for api call:${responses}");
      print("response:${responses['message']}");
      print('${responses['result']['id']}');
      var goal_num = prefs.setInt("goal_num", responses["result"]["id"]);
      print('$goal_num');
      return responses;
    } else {
      //client.close();

      // print("response:${}");
      print("request==========>$request");
      return responses;
    }
  }

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
      final SharedPreferences prefs = await _prefs;
      print("response for api call:${responses}");
      print("response:${responses['message']}");
      print('${responses['result']['id']}');
      var goal_num = prefs.setInt("goal_num", responses["result"]["id"]);
      print('$goal_num');
      return true;
    } else {
      //client.close();

      // print("response:${}");
      print("request==========>$request");
      return false;
    }
  }
/*
  Future<bool> updateUserGoal(String category, List<String> reasons) async {
    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var reasonObjects = reasons.map((reason) => {"text": reason}).toList();
    var body = jsonEncode({category: reasonObjects});

    try {
      var response = await client.put(
        Uri.parse('${URL.BASE_URL}api/userGoal/$goal_num'),
        headers: headers,
        body: body,
      );
      print("Requent body: ${response.body}");

      if (response.statusCode == 200) {
        print("Update successful");
        var jsonData = jsonDecode(response.body);
        print("Result: $jsonData");
        print("Respone body: ${response.body}");
        return true;
      } else {
        print("Update failed");
        return false;
      }
    } catch (error) {
      print("Error during update: $error");
      return false;
    }
  }
*/

  Future updateUserGoal(category, reason) async {
    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");

    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({"$category": reason});
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userGoal/$goal_num'),
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

  Future updateUserGoalColor(color) async {
    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");

    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({
      "color": "$color",
    });

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userGoal/$goal_num'),
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

  static Future getUserGoal() async {
    // var goalName;

    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userGoal/$goal_num'),
      headers: headers,
    );
    // print('===========$userGoalId');
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
    var goal_num = prefs.getInt('goal_num');
    var userGoalId = prefs.getInt('goalId');
    print('$userGoalId');

    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userGoal/$goal_num'),
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

  Future updateUserGoalStatus(status) async {
    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");

    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({"goalStatus": "$status"});
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');

    var request = await client.put(
        Uri.parse(
            '${URL.BASE_URL}api/userGoal/change-user-goal-status-by-id/$goal_num'),
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
    } else if (request.statusCode == 400) {
      print("Maximum goal achieved");
      print('STATUSCODE: ${request.statusCode}');
      // client.close();
      return request.statusCode;
    } else {
      print('Update Failed');
      return false;
    }
  }

  static Future getUserGoalByDay(Day) async {
    // var goalName;

    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");

    var userId = prefs.getInt('userid');
    // print('$userGoalId');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userGoal/userGoals-by-day/$userId?day=$Day'),
      headers: headers,
    );
    // print('===========$userGoalId');
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future getUserGoalByUserId() async {
    // var goalName;

    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt('userid');
    var Accestoken = prefs.getString("usertoken");
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userGoal/userGoals-by-userId/$userId'),
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
}
