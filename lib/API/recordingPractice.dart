import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';

import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class RecordingPractice {
  Future userAddRecording(before, after, feedback, summary, practiceId,
      timeSlot, recordingDate) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');
    var userGoalId = prefs.getInt('goal_num');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = json.encode({
      "feelingsBeforeSession": "$before",
      "feelingsAfterSession": "$after",
      "notes": feedback,
      "practiceSummary": "$summary",
      "timeSlot": timeSlot,
      "recordingDate": recordingDate,
      "userId": userId,
      "userPracticeId": practiceId,
      "userGoalId": userGoalId
    });

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/recording/add-recording'),
        headers: headers,
        body: body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      await prefs.setInt('recording_id', responses["result"]["id"]);
      if (responses['report'] == true) {
        await prefs.setBool('isReportActive', true);
        await prefs.setString(
            'lastReportDate', responses['reportDetail']['activeDate']);
        await prefs.setString(
            'lastReportEnd', responses['reportDetail']['endDate']);
      } else if (responses['report'] == false) {
        await prefs.setBool('isReportActive', false);
      }

      return true;
    } else {
      var response = {
        "message": responses["message"],
        "statusCode": request.statusCode,
      };
      return response;
    }
  }

  static Future getUserPracticeRecord() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var recordingid = prefs.getInt('recording_id');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/recording/$recordingid'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return (jsonData);
    } else {
      throw Exception('Failed to recording');
    }
  }

  Future updateRecording(destination, message, notes) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var recordingid = prefs.getInt('recording_id');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = jsonEncode({
      "$destination": "$message",
      "notes": notes,
    });

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/recording/$recordingid'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future deleteUserRecording() async {
    final SharedPreferences prefs = await _prefs;

    var accessToken = prefs.getString("usertoken");
    var recordingid = prefs.getInt('recording_id');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/recording/$recordingid'),
        headers: headers);

    var responses = jsonDecode(request.body);
    if (request.statusCode == 200) {
      return true;
    } else {
      return responses["message"];
    }
  }

  Future updateRecordingStatus(status) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var recordingTime = prefs.getString('recording_Time1');
    var date = prefs.getString('record_date');
    var id = prefs.getInt('prac_num');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = jsonEncode({
      "timeSlot": recordingTime,
      "recordingDate": date,
      "recordingStatus": status,
      "userPracticeId": id
    });

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/recording/update-recording-status'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
