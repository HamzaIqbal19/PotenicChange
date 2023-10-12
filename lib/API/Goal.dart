import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
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

    var request = await client
        .post(Uri.parse('${URL.BASE_URL}api/goal/add-goal'), body: Body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      var res = await responses.stream.bytesToString();
      return res;
    } else {
      return responses["message"];
    }
  }

  Future updateGoal(goalName, goalCategoryId) async {
    var headers = {'Content-Type': 'application/json'};
    var Body = json
        .encode({"goalName": "$goalName", "goalCategoryId": "$goalCategoryId"});

    var request = await client
        .put(Uri.parse('${URL.BASE_URL}/api/goal/{goalId}'), body: Body);

    var responses = jsonDecode(request.body);
    if (responses.statusCode == 200) {}
  }

  Future getGoal() async {
    try {
      var request =
          await client.get(Uri.parse('${URL.BASE_URL}/api/goal/{goalId}'));
      if (request.statusCode == 200) {
        var goal = request.body;
      }
    } catch (e) {
      print('Request failed with status: ${"request.statusCode"}.');
    }
  }

  Future deleteGoal() async {
    var request =
        await client.delete(Uri.parse('${URL.BASE_URL}/api/goal/{goalId}'));

    if (request.statusCode == 200) {
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
      List<String> goalNames = [];
      for (var goalData in jsonData) {
        var goalName = goalData['name'];
        goalNames.add(goalName);
      }
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
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future checkUserActiveGoal() async {
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt('userid');
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userGoal/user-active-goals/$userId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return response.statusCode;
    } else if (response.statusCode == 404) {
      return response.statusCode;
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

      return List<Map<String, dynamic>>.from(jsonData);
    } else if (response.statusCode == 404) {
      return [];
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

      return List<Map<String, dynamic>>.from(jsonData);
    } else if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

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

      var goal_num = prefs.setInt("goal_num", responses["result"]["id"]);
      return responses;
    } else {
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

      var goal_num = prefs.setInt("goal_num", responses["result"]["id"]);
      return true;
    } else {
      print("request==========>$request");
      return false;
    }
  }

  Future updateUserGoal(category, reason) async {
    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({"$category": reason});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userGoal/$goal_num'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      var jsonData = jsonDecode(request.body);
      return true;
    } else {
      print("Update failed");
      return false;
    }
  }

  Future updateUserGoalColor(color) async {
    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");

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

    if (request.statusCode == 200) {
      var jsonData = jsonDecode(request.body);
      return true;
    } else {
      print("Update failed");
      return false;
    }
  }

  static Future getUserGoal() async {
    // var goalName;

    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userGoal/$goal_num'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future getUserGoalById(Id) async {
    final SharedPreferences prefs = await _prefs;

    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userGoal/$Id'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  Future deleteUserGoal() async {
    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var userGoalId = prefs.getInt('goalId');

    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userGoal/$goal_num'),
        headers: headers);

    var responses = jsonDecode(request.body);
    if (request.statusCode == 200) {
      if (responses['checkGoals'].toString() == 'true') {
        return true;
      } else {
        return false;
      }
    } else {
      return responses["message"];
    }
  }

  Future updateUserGoalStatus(status) async {
    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({"goalStatus": "$status"});

    var request = await client.put(
        Uri.parse(
            '${URL.BASE_URL}api/userGoal/change-user-goal-status-by-id/$goal_num'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else if (request.statusCode == 400) {
      return request.statusCode;
    } else {
      print('Update Failed');
      return false;
    }
  }

  static Future getUserGoalByDay(Day) async {
    final SharedPreferences prefs = await _prefs;
    var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");

    var userId = prefs.getInt('userid');
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userGoal/userGoals-by-day/$userId?day=$Day'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return response;
    } else {
      return false;
    }
  }

  static Future getUserGoalByUserId() async {
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt('userid');
    var Accestoken = prefs.getString("usertoken");

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

      return (jsonData);
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }

  static Future checkUserGoalByUserId() async {
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt('userid');
    var Accestoken = prefs.getString("usertoken");

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
      if (jsonData.length != 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future getUserActiveGoal() async {
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt('userid');
    var Accestoken = prefs.getString("usertoken");

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userGoal/user-active-goals/$userId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      print('There are no active goals');
      return response.statusCode;
    } else {
      throw Exception('Failed to fetch goal names');
    }
  }
}
