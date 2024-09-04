import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class PracticeGoalApi {
  Future userAddPractice(name, reminder, day) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var practiceId = prefs.getInt('pracId');
    var userId = prefs.getInt('userid');
    var userGoalId = prefs.getInt('goal_num');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    Map<String, dynamic> requestBody = {
      "name": "$name",
      "reminder": "$reminder",
      "schedule": day,
      "userGoalId": "$userGoalId",
      "userId": "$userId",
    };

    if (practiceId != null) {
      requestBody["practiceId"] = "$practiceId";
    }
    var body = json.encode(requestBody);

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userPractice/add-user-practice'),
        headers: headers,
        body: body);

    var responses = jsonDecode(request.body);
    if (request.statusCode == 200) {
      await prefs.setInt("prac_num", responses['result']['id']);
      Authentication().userStatusUpdate('onBoarding', true);
      return true;
    } else {
      return false;
    }
  }

  Future userAddPracticeColor(name, reminder, userId, practiceId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = json.encode({
      "name": "$name",
      "userId": "$userId",
      "practiceId": "$practiceId",
    });
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/userPractice/add-user-practice'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      client.close();

      return false;
    }
  }

  static Future<List<Map<String, dynamic>>> getPractice() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/practice/all-practice'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<String> practiceNames = [];
      for (var practiceData in jsonData) {
        var goalName = practiceData['name'];
        practiceNames.add(goalName);
      }
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to fetch practice names');
    }
  }

  static Future<List<Map<String, dynamic>>> searchPractice(
      String search) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/practice/all-practice?practiceName=$search'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<String> practiceNames = [];
      for (var practiceData in jsonData) {
        var goalName = practiceData['name'];
        practiceNames.add(goalName);
      }
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to fetch practice names');
    }
  }

  static Future getUserPractice() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var pracNum = prefs.getInt("prac_num");

    print("Practice number $pracNum");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userPractice/$pracNum'),
      headers: headers,
    );

    print("response ${response.statusCode}");
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      final SharedPreferences prefs = await _prefs;
      if (jsonData['practiceEvaluations'] != null) {
        await prefs.setString(
            'lastReportDate', jsonData['practiceEvaluations']['activeDate']);
        await prefs.setString(
            'lastReportEnd', jsonData['practiceEvaluations']['endDate']);
      }
      if (jsonData["practiceEvaluations"] != null) {
        await prefs.setInt(
            'prac_eval_id', jsonData["practiceEvaluations"]["id"]);
      }

      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  Future deleteUserPractice() async {
    final SharedPreferences prefs = await _prefs;

    var pracNum = prefs.getInt('prac_num');

    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userPractice/$pracNum'),
        headers: headers);

    var responses = jsonDecode(request.body);
    if (request.statusCode == 200) {
      return true;
    } else {
      return responses["message"];
    }
  }

  Future deleteUserPracticeById(id) async {
    final SharedPreferences prefs = await _prefs;

    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userPractice/$id'),
        headers: headers);

    var responses = jsonDecode(request.body);
    if (request.statusCode == 200) {
      return true;
    } else {
      return responses["message"];
    }
  }

  Future updateUserPractice(destination, update) async {
    final SharedPreferences prefs = await _prefs;
    var pracNum = prefs.getInt('prac_num');
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = jsonEncode({
      destination: update,
    });

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userPractice/$pracNum'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future updateUserPracticeColor(color) async {
    final SharedPreferences prefs = await _prefs;
    var pracNum = prefs.getInt('prac_num');
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = jsonEncode({
      "color": "$color",
    });

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userPractice/$pracNum'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future getUserPracticeByDay(day) async {
    final SharedPreferences prefs = await _prefs;

    var accessToken = prefs.getString("usertoken");

    var userId = prefs.getInt('userid');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userPractice/userPractice-by-date/$userId?date=$day'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 404) {
      return response;
    }
  }

  static Future getUserDashboard(day) async {

    final SharedPreferences prefs = await _prefs;

    var accessToken = prefs.getString("usertoken");

    var userId = prefs.getInt('userid');
    print("Date : $day userId: $userId");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userPractice/userDashBoardDataById/$userId?givenDate=$day'),
      headers: headers,
    );
    print("Dashboard Response Data ${response.statusCode}");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("Dashboard Response Data $data");
      return data;
    } else if (response.statusCode == 404) {
      var data = jsonDecode(response.body);
      return data;
    }
  }

  Future updateUserPracticeStatus(status, id) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = jsonEncode({"practiceStatus": "$status"});

    var request = await client.put(
        Uri.parse(
            '${URL.BASE_URL}api/userPractice/change-user-practice-status-by-id/$id'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else if (request.statusCode == 400) {
      return request.statusCode;
    } else {
      return false;
    }
  }

  Future updateUserPracticeGoalStatus(status) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var pracNum = prefs.getInt("prac_num");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = jsonEncode({"practiceStatus": "$status"});

    var request = await client.put(
        Uri.parse(
            '${URL.BASE_URL}api/userPractice/active-user-practice-goal-by-id/$pracNum'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      var jsonData = jsonDecode(request.body);
      if (jsonData['isTutorial'] == true) {
        return false;
      } else {
        return true;
      }
    } else if (request.statusCode == 400) {
      return request.statusCode;
    } else {
      return false;
    }
  }

  static Future getUserPracticeById() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var pracNum = prefs.getInt("prac_num");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userPractice/$pracNum'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future getUserReminder() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/user/getUserReminderByUserId/$userId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  Future updateUserReminder(name, reminder) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = json.encode({
      name: reminder,
    });
    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/user/updateUserReminderByUserId/$userId'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      client.close();

      return false;
    }
  }
}
