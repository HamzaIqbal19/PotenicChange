import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:potenic_app/Screen/Alerts/message_center.dart';

import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class RecordingPractice {
  Future userAddRecording(before, after, feedback, summary, practiceId,
      timeSlot, recordingDate) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var Body = json.encode({
      "feelingsBeforeSession": "$before",
      "feelingsAfterSession": "$after",
      "notes": feedback,
      "practiceSummary": "$summary",
      "timeSlot": timeSlot,
      "recordingDate": recordingDate,
      "userId": userId,
      "userPracticeId": practiceId,
    });

    print("request:$Body");
    print('-----------------------!');

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/recording/add-recording'),
        headers: headers,
        body: Body);
    print('=====================!');
    print("request:");

    var responses = jsonDecode(request.body);

    print("status:${request.statusCode}");
    print("request:${responses}");
    print("request:${responses["status"]}");
    if (request.statusCode == 200) {
      print("response:${responses["result"]["id"]}");
      final SharedPreferences prefs = await _prefs;
      var recording_id =
          prefs.setInt('recording_id', responses["result"]["id"]);
      print('Recording added');
      print(responses);

      return true;
    } else {
      var response = {
        "message": responses["message"],
        "statusCode": request.statusCode,
      };
      // print("response:${}");
      return response;
    }
  }

  static Future getUserPracticeRecord() async {
    // var goalName;

    final SharedPreferences prefs = await _prefs;
    var prac_num = prefs.getInt("prac_num");
    var Accestoken = prefs.getString("usertoken");
    var recording_id = prefs.getInt('recording_id');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/recording/$recording_id'),
      headers: headers,
    );
    // print('===========$userGoalId');
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return (jsonData);
    } else {
      throw Exception('Failed to recording');
    }
  }

  Future updateRecording(destination, message, notes) async {
    final SharedPreferences prefs = await _prefs;
    //var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");
    var recording_id = prefs.getInt('recording_id');

    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({
      "$destination": "$message",
      "notes": notes,
    });
    print(body);
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/recording/$recording_id'),
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

  Future deleteUserRecording() async {
    final SharedPreferences prefs = await _prefs;

    var Accestoken = prefs.getString("usertoken");
    var recording_id = prefs.getInt('recording_id');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/recording/$recording_id'),
        headers: headers);

    var responses = jsonDecode(request.body);
    print("Recording to be deleted");
    if (request.statusCode == 200) {
      print('Recording deleted');
      return true;
    } else {
      return responses["message"];
      // client.close();
      // return responses["message"];
    }
  }

  Future updateRecordingStatus(status) async {
    final SharedPreferences prefs = await _prefs;
    //var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");
    var recording_Time = prefs.getString('recording_Time1');
    var Date = prefs.getString('record_date');
    var Id = prefs.getInt('prac_num');
    print(prefs.getString('record_date'));

    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({
      "timeSlot": recording_Time,
      "recordingDate": Date,
      "recordingStatus": status,
      "userPracticeId": Id
    });
    print(body);
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/recording/update-recording-status'),
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
