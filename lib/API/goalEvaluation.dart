import 'dart:convert';
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
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/goalEvaluation/add-goalEvaluation'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      return responses;
    } else {
      print("request==========>$request");
      return responses;
    }
  }

  static Future getGoalEvaluation() async {
    final SharedPreferences prefs = await _prefs;
    var goal_eval = prefs.getInt('goal_eval_id');
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/goalEvaluation/$goal_eval'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  Future updateEvaluation(destination, update) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var goal_eval = prefs.getInt('goal_eval_id');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({"$destination": update});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/goalEvaluation/$goal_eval'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      print("request: Update successful");
      var jsonData = jsonDecode(request.body);
      return true;
    } else {
      print("Update failed");
      return false;
    }
  }
}

class PracticeEvaluation {
  Future updatePracticeEvaluation(q1, q2, q3, q4) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var prac_eval = prefs.getInt('prac_eval_id');
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
    });
    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/practiceEvaluation/$prac_eval'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      return true;
    } else {
      print("request==========>$request");
      return false;
    }
  }

  static Future getPracticeEvaluation() async {
    final SharedPreferences prefs = await _prefs;
    var prac_eval = prefs.getInt('prac_eval_id');
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/practiceEvaluation/$prac_eval'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future getUserPracticeReportId() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var prac_num = prefs.getInt("prac_num");
    var reportDate = prefs.getString('lastReportDate');
    var endDate = prefs.getString('lastReportEnd');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userPractice/user-practice-report-by-id/$prac_num?activeDate=$reportDate&endDate=$endDate'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      print('nOT fOUND');
      return false;
    } else {
      throw Exception('Failed to fetch practice report');
    }
  }

  static Future getUserPracticeReportIdBydays(days) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var prac_num = prefs.getInt("prac_num");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userPractice/user-practice-report-by-id/$prac_num?howManyDays=$days'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      print('nOT fOUND');
      return false;
    } else {
      throw Exception('Failed to fetch practice report');
    }
  }

  static Future getPracriceAssesment() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var prac_num = prefs.getInt("prac_num");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userPractice/getAllPracticeAssesmentsById/$prac_num'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      print('nOT fOUND');
      return false;
    } else {
      throw Exception('Failed to fetch practice report');
    }
  }
}
