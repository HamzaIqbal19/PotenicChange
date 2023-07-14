import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
import 'package:potenic_app/Widgets/TimeWidget.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class PracticeGoalApi {
  Future userAddPractice(name, reminder, day) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var practiceId = prefs.getInt('pracId');
    var userId = prefs.getInt('userid');
    var userGoalId = prefs.getInt('goal_num');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var Body = json.encode({
      "name": "$name",
      "reminder": "$reminder",
      "schedule": day,
      "userGoalId": "$userGoalId",
      "userId": "$userId",
      "practiceId": "$practiceId",
    });
    print("request:$Body");
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userPractice/add-user-practice'),
        headers: headers,
        body: Body);
    print("request:");

    var responses = jsonDecode(request.body);

    print("status:${request.statusCode}");
    print("request:${responses}");
    print("request:${responses["status"]}");
    if (request.statusCode == 200) {
      print("response:${responses["message"]}");
      // print('${responses['result']['id']}');

      var prac_num = prefs.setInt("prac_num", responses['result']['id']);

      print('Practice added');

      return true;
    } else {
      client.close();
      // print("response:${}");
      print('Practice error');
      print(responses.reasonPhrase);
      return false;
    }
  }

  Future userAddPracticeColor(name, reminder, userId, practiceId) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var Body = json.encode({
      "name": "$name",
      "userId": "$userId",
      "practiceId": "$practiceId",
    });
    print("request:$Body");
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userPractice/add-user-practice'),
        headers: headers,
        body: Body);
    print("request:");

    var responses = jsonDecode(request.body);

    print("status:${request.statusCode}");
    print("request:${responses}");
    print("request:${responses["status"]}");
    if (request.statusCode == 200) {
      print("response:${responses["message"]}");
      print('Practice added');

      return true;
    } else {
      client.close();
      // print("response:${}");
      print('Practice error');
      print(responses.reasonPhrase);
      return false;
    }
  }

  static Future<List<Map<String, dynamic>>> getPractice() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/practice/all-practice'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");
      List<String> practiceNames = [];
      for (var practiceData in jsonData) {
        var goalName = practiceData['name'];
        practiceNames.add(goalName);
      }
      print("run type :${practiceNames.runtimeType}");
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to fetch practice names');
    }
  }

  static Future<List<Map<String, dynamic>>> SearchPractice(
      String Search) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/practice/all-practice?practiceName=$Search'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");
      List<String> practiceNames = [];
      for (var practiceData in jsonData) {
        var goalName = practiceData['name'];
        practiceNames.add(goalName);
      }
      print("run type :${practiceNames.runtimeType}");
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to fetch practice names');
    }
  }

  static Future getUserPractice() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var prac_num = prefs.getInt("prac_num");

    print('$prac_num');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userPractice/$prac_num'),
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

  Future deleteUserPractice() async {
    final SharedPreferences prefs = await _prefs;

    var prac_num = prefs.getInt('prac_num');
    print('$prac_num');

    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userPractice/$prac_num'),
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

  Future updateUserPracticeColor(color) async {
    final SharedPreferences prefs = await _prefs;
    var prac_num = prefs.getInt('prac_num');
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
        Uri.parse('${URL.BASE_URL}api/userPractice/$prac_num'),
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
