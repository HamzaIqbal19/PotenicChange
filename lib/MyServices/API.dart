import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myapi {
  String BASEURL = "https://210a-59-103-194-106.ngrok-free.app/api/auth/";
  String GoalURL =
      "https://210a-59-103-194-106.ngrok-free.app/api-docs/#/Goal/";
  late String userToken;
  late int userID;

  Future registerapi(name, email, password, token) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(BASEURL + 'signup'));
    request.body = json.encode({
      "name": "$name",
      "email": "$email",
      "password": "$password",
      "fcmRegistrationToken": "$token"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  Future loginapi(email, password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(BASEURL + 'signin'));
    request.body = json.encode({
      "email": "$email",
      "password": "$password",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Map map = jsonDecode(res);
      String token = map['accessToken'];
      int userid = map['id'];

      SharedPreferences login = await SharedPreferences.getInstance();
      login.setString('usertoken', token);
      login.setInt('userid', userid);

      print(map['accessToken']);
      return res;
    } else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  Future forgotPassword(email) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(BASEURL + 'forgot-password'));
    request.body = json.encode({
      "email": "$email",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  Future createGoal(goalName, goalCategoryId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(BASEURL + 'add-goal'));
    request.body = json.encode({
      "goalName": "$goalName",
      "goalCategoryId": "$goalCategoryId",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  Future addUserGoal(name, reason, identityStatement, visualizingYourSelf,
      color, userId, goalCategoryId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(BASEURL + 'add-user-goal'));
    request.body = json.encode({
      "name": "$name",
      "reason": "$reason",
      "identityStatement": "$identityStatement",
      "visualizingYourSelf": "$visualizingYourSelf",
      "color": "$color",
      "userId": "$userId",
      "goalCategoryId": "$goalCategoryId",
    });
    request.headers.addAll(headers);
  }
}
