import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class goalEvaluationApi {
  Future addGoalEvaluation(destination, result, userGoalId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var Body = json.encode(
        {destination: result, "userGoalId": userGoalId, "userId": UserId});
    print(Body);
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/goalEvaluation/add-goalEvaluation'),
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

  static Future getGoalEvaluation() async {
    // var goalName;

    final SharedPreferences prefs = await _prefs;
    var goal_eval = prefs.getInt('goal_eval_id');
    var Accestoken = prefs.getString("usertoken");
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/goalEvaluation/$goal_eval'),
      headers: headers,
    );
    // print('===========$userGoalId');
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return jsonData;
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  Future updateEvaluation(destination, update) async {
    final SharedPreferences prefs = await _prefs;
    //var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");
    var goal_eval = prefs.getInt('goal_eval_id');

    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({"$destination": update});
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/goalEvaluation/$goal_eval'),
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

class PracticeEvaluation {
  Future addPracticeEvaluation(q1, q2, q3, q4, pracId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var Body = json.encode({
      "question1": q1,
      "question2": q2,
      "question3": q3,
      "question4": q4,
      "userPracticeId": pracId,
      "userId": UserId
    });
    print(Body);
    var request = await client.post(
        Uri.parse(
            '${URL.BASE_URL}api/practiceEvaluation/add-practiceEvaluation'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);
    print(responses);

    if (request.statusCode == 200) {
      print("Practice evaluationId =================");
      print(responses["result"]["id"]);
      var prac_eval = prefs.setInt('prac_eval_id', responses["result"]["id"]);
      return responses;
    } else {
      //client.close();

      // print("response:${}");
      print("request==========>$request");
      return responses;
    }
  }

  static Future getPracticeEvaluation() async {
    // var goalName;

    final SharedPreferences prefs = await _prefs;
    var prac_eval = prefs.getInt('prac_eval_id');
    var Accestoken = prefs.getString("usertoken");
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/practiceEvaluation/$prac_eval'),
      headers: headers,
    );
    // print('===========$userGoalId');
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return jsonData;
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future getUserPracticeReportId(days) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var prac_num = prefs.getInt("prac_num");
    // var prac_num = prefs.getInt("prac_score_id");

    // print('$prac_num');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userPractice/user-practice-report-by-id/$prac_num?howManyDays=$days'),
      headers: headers,
    );
    print(response.statusCode);
    print(prac_num);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return response;
    } else if (response.statusCode == 404) {
      print('nOT fOUND');
      return false;
    } else {
      throw Exception('Failed to fetch practice report');
    }
  }
}
