import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class GoalEvaluationApi {
  Future addGoalEvaluation(destination, result, userGoalId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = json.encode(
        {destination: result, "userGoalId": userGoalId, "userId": userId});
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/goalEvaluation/add-goalEvaluation'),
        headers: headers,
        body: body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      return responses;
    } else {
      return responses;
    }
  }

  static Future getGoalEvaluation() async {
    final SharedPreferences prefs = await _prefs;
    var goalEval = prefs.getInt('goal_eval_id');
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/goalEvaluation/$goalEval'),
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
    var accessToken = prefs.getString("usertoken");
    var goalEval = prefs.getInt('goal_eval_id');
    var levelChange = await prefs.getBool('goalLevelUpdate');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = jsonEncode({"$destination": update});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/goalEvaluation/$goalEval'),
        headers: headers,
        body: body);
    var jsonData = jsonDecode(request.body);
    print('Goal Evaluation: $jsonData');
    if (request.statusCode == 200) {
      if (jsonData['sucess'] == true && jsonData['data'] == null) {
        return true;
      } else {
        final SharedPreferences prefs = await _prefs;
        print('Goal Evaluation: called with data');
        if (levelChange != true || jsonData['data']['goalLevelUpdate']) {
          await prefs.setBool(
              'goalLevelUpdate', jsonData['data']['goalLevelUpdate']);
          await prefs.setString(
              'goalLevelUpOrDown', jsonData['data']['goalLevelUpOrDown']);
          await prefs.setInt(
              'goalAchievedId', jsonData['data']['userGoal']['id']);
          // await prefs.setInt(
          //     'goalAchievedLenght', jsonData['data']['goalEvaluationLength']);
          await prefs.setString(
              'goalAcieved', jsonEncode(jsonData['data']['userGoal']));
        }

        return true;
      }
    } else {
      return false;
    }
  }
}

class PracticeEvaluation {
  Future updatePracticeEvaluation(q1, q2, q3, q4) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var pracEval = prefs.getInt('prac_eval_id');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = json.encode({
      "question1": q1,
      "question2": q2,
      "question3": q3,
      "question4": q4,
    });
    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/practiceEvaluation/$pracEval'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future getPracticeEvaluation() async {
    final SharedPreferences prefs = await _prefs;
    var pracEval = prefs.getInt('prac_eval_id');
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/practiceEvaluation/$pracEval'),
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
    var accessToken = prefs.getString("usertoken");
    var pracNum = prefs.getInt("prac_num");
    var reportDate = prefs.getString('lastReportDate');
    var endDate = prefs.getString('lastReportEnd');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userPractice/user-practice-report-by-id/$pracNum?activeDate=$reportDate&endDate=$endDate'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      throw Exception('Failed to fetch practice report');
    }
  }

  static Future getUserPracticeReportIdBydays(days) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var pracNum = prefs.getInt("prac_num");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userPractice/user-practice-report-by-id/$pracNum?howManyDays=$days'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      throw Exception('Failed to fetch practice report');
    }
  }

  static Future getPracriceAssesment() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var pracNum = prefs.getInt("prac_num");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userPractice/getAllPracticeAssesmentsById/$pracNum'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      throw Exception('Failed to fetch practice report');
    }
  }
}
