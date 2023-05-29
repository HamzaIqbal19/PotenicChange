import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class myapi{

  String BASEURL = "https://210a-59-103-194-106.ngrok-free.app/api/auth/";
  String GoalURL = "https://210a-59-103-194-106.ngrok-free.app/api-docs/#/Goal/";
  late String userToken;
  late int userID;

  Future registerapi(name,email,password,token) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(BASEURL+'signup'));
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
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }

  }

  Future loginapi(email, password) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(BASEURL+'signin'));
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
      int userid= map['id'];

      SharedPreferences login = await SharedPreferences.getInstance();
      login.setString('usertoken', token);
      login.setInt('userid', userid);

      print(map['accessToken']);
      return res;
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }

  }

  Future forgotPassword(email) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(BASEURL+'forgot-password'));
    request.body = json.encode({
      "email": "$email",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }

  }

  Future create_goal(name,reason,identity,visualization,category) async {
    SharedPreferences login = await SharedPreferences.getInstance();
    userToken = login.getString('usertoken').toString();

    userID = login.getInt('userid') ?? 0;

    int cat_type =category=="Happiness and Wellbieng"?1:category=="Self Control"?2:category=="relationship"?3:category=="Fulfil Potential"?4:0;

    var headers = {
      'x-access-token': '$userToken',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(GoalURL+'post_api_goal_add_goal'));
    request.body = json.encode({
      "name": "$name",
      "reason": [
        "$reason"
      ],
      "identityStatement": [
        "$identity"
      ],
      "visualizingYourSelf": [
        "$visualization"
      ],
      "userId": userID,
      "goalCategoryId": cat_type
    });
    request.headers.addAll(headers);
    print("requestBody:${request.body}");

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("response:$response");
      var res = await response.stream.bytesToString();
      print("response:$res");
      print(userToken.runtimeType);
      print(userID.runtimeType);
      print(reason.toString().runtimeType);
      print(identity.toString().runtimeType);
      print(visualization.toString().runtimeType);
      print(name.runtimeType);
      print(cat_type.runtimeType);
      return res;
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }
  }
}