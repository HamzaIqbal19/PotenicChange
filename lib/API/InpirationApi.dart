import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class InspirationApi {
  Future addInspiration(
      int inspirationId,
      File? file,
      String title,
      hashTags,
      String destinationLink,
      bool visibility,
      String description,
      userGoalId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');
    print(prefs.getString("usertoken"));
    print("Path=====================${file!.path}");
    var headers = {
      //'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var request = http.MultipartRequest('POST',
        Uri.parse('${URL.BASE_URL}api/userInspiration/add-userInspiration'));
    print("Fields: ${request.fields}");

    request.fields.addAll({
      "inspirationId": "$inspirationId",
      "title": title,
      "hashTags": hashTags.toString(),
      "visibility": "$visibility",
      "destinationLink": destinationLink,
      "userGoalId": userGoalId.toString(),
      "description": description,
      "userId": "$UserId"
    });

    print("Fields: ${request.fields}");
    request.headers.addAll(headers);
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'file', file.path,
        contentType: MediaType('image', 'jpeg'));

    if (file != null) {
      // File newFile = File(file);
      //  var multipartFileSign = new http.MultipartFile('profile_pic', stream, length,
      // filename: basename(file.path));

      request.files.add(multipartFile);
    }
    print("Request==${request.files}");

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    print(response);

    if (response.statusCode == 200) {
      var responses = await response.stream.bytesToString();
      print("response==========>$responses"); // Printing the response
      return responses;
      // You can parse the response here and return appropriate data
    } else {
      print("request==========>$response.statusCode");
      // Handle error here
    }
  }

  Future updateInspiration(String title, hashTags, String destinationLink,
      String description, String file) async {
    final SharedPreferences prefs = await _prefs;
    //var goal_num = prefs.getInt('goal_num');
    var Accestoken = prefs.getString("usertoken");
    var userInspirationId = prefs.getInt('userInspirationId');

    //int UserGoalId = 12;
    print("request: Update");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    var body = jsonEncode({
      "title": title,
      "hashTags": hashTags,
      "destinationLink": destinationLink,
      "description": description,
      "file": file,
    });
    // var userGoalId = prefs.getInt('goalId');
    // print('$userGoalId');

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userInspiration/$userInspirationId'),
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

  Future deleteUserInspiraton() async {
    final SharedPreferences prefs = await _prefs;
    var userInspirationId = prefs.getInt('userInspirationId');
    var Accestoken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };
    print(userInspirationId);

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userInspiration/$userInspirationId'),
        headers: headers);

    var responses = jsonDecode(request.body);
    print(responses);
    print("Hurdle to be deleted");
    if (request.statusCode == 200) {
      print('object deleted');
      return true;
    } else {
      return responses["message"];
      // client.close();
      // return responses["message"];
    }
  }

  Future getInspirationById() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var userInspirationId = prefs.getInt('userInspirationId');

    var headers = {
      'x-access-token': '$Accestoken',
    };
    print('-=--=----===-==');
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userInspiration/$userInspirationId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('------------------------------------------------');
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");
      print(jsonData['inspiration']['title']);
      return jsonData;
    } else {
      print(
          'Failed to fetch inspiration names Request failed with status: ${response.statusCode}');
    }
  }

  Future getUserInspiration() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return jsonData;
    } else {
      return false;
      // print(
      //     'Failed to fetch inspiration names Request failed with status: ${response.statusCode}');
    }
  }

  Future checkUserInspiration() async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return true;
    } else {
      return false;
      // print(
      //     'Failed to fetch inspiration names Request failed with status: ${response.statusCode}');
    }
  }

  Future filterUserInspiration(type, goalId, tag) async {
    final SharedPreferences prefs = await _prefs;
    var Accestoken = prefs.getString("usertoken");
    var UserId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken',
    };

    var response = await http.get(
      Uri.parse(goalId != 0 && type != 0 && tag != null
          ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId?userGoalId=$goalId&inspirationId=$type&tag=$tag'
          : type != 0 && goalId != 0
              ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId?userGoalId=$goalId&inspirationId=$type'
              : goalId != 0 && tag != null
                  ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId?userGoalId=$goalId$tag=$tag'
                  : tag != null && type != 0
                      ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId?tag=$tag&inspirationId=$type'
                      : type != 0
                          ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId?inspirationId=$type'
                          : goalId != 0
                              ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId?userGoalId=$goalId'
                              : tag != null
                                  ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId?tag=$tag'
                                  : '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$UserId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result:$jsonData");

      return jsonData;
    } else {
      print(
          'Failed to fetch inspiration names Request failed with status: ${response.statusCode}');
    }
  }
}
