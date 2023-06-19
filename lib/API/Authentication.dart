import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Authentication {
  Future registerApi(name, email, password) async {
    var headers = {'Content-Type': 'application/json'};

    var Body = json.encode({
      "name": "$name",
      "email": "$email",
      "password": "$password",
    });
    var request = await client.post(Uri.parse('${URL.BASE_URL}api/auth/signup'),
        headers: headers, body: Body);

    var responses = jsonDecode(request.body);

    print("request:${responses}");

    if (request.statusCode == 200) {
      print("response:${responses["message"]}");

      var res = responses["message"];
      print("return this value:$res");
      return res;
    } else {
      client.close();
      // print("response:${}");
      return responses["message"];
    }
  }

  Future refreshTokenApi(String SessionToken) async {
    var headers = {'Content-Type': 'application/json'};

    var Body = json.encode({
      "sessionToken": SessionToken,
    });
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/auth/refresh-access-token'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

    print("request:${responses}");

    if (request.statusCode == 200) {
      String token = responses;

      final SharedPreferences prefs = await _prefs;
      var accesstoken = prefs.setString('usertoken', token);

      return true;
    } else {
      client.close();
      // print("response:${}");
      return false;
    }
  }

  Future SignIn(fcmRegistrationToken, email, password) async {
    var headers = {'Content-Type': 'application/json'};

    var Body = json.encode({
      "fcmRegistrationToken": "$fcmRegistrationToken",
      "email": "$email",
      "password": "$password",
    });

    var request = await client.post(Uri.parse('${URL.BASE_URL}api/auth/signin'),
        headers: headers, body: Body);

    var responses = jsonDecode(request.body);
    // print("status:${request.statusCode}");

    // print("request:${responses}");

    if (request.statusCode == 200) {
      // print("request:${responses["sessionToken"]}");
      String token = responses["accessToken"];
      int userid = responses['id'];
      String Refreshtoken = responses["sessionToken"];

      final SharedPreferences prefs = await _prefs;
      var accesstoken = prefs.setString('usertoken', token);
      var UserId = prefs.setInt('userid', userid);
      var RefreshToken = prefs.setString("refreshtoken", Refreshtoken);

      var Accestoken = prefs.getString("usertoken");
      var UsersId = prefs.getInt("userid");
      var SessionToken = prefs.getString("refreshtoken");

      print("tokenss:$Accestoken+$UsersId+$SessionToken");

      return request.statusCode;
    } else if (request.statusCode == 404) {
      // print("response:${}");
      return request.statusCode;
    } else {
      client.close();
    }
  }

  Future passReset(email) async {
    var headers = {'Content-Type': 'application/json'};

    var Body = json.encode({
      "email": "$email",
    });

    print("request:$Body");
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/auth/forgot-password'),
        headers: headers,
        body: Body);
    print("request:");

    var responses = jsonDecode(request.body);

    print("request:${responses}");
    print("request:${responses["status"]}");
    if (request.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      var resetEmail = prefs.setString('resetEmail', email);
      var reset = prefs.getString('resetEmail');
      print('=====>$reset');

      return true;
    } else {
      client.close();
      // print("response:${}");
      return false;
    }
  }

  Future passwordReset(password) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    final SharedPreferences prefs = await _prefs;
    var reset = prefs.getString('resetEmail');
    String token =
        'KEeQ5q3JlCOwXC5IgPw3Qnwakrs0wwgfI%2FDnm%2BiQRmYSc7CqniIDXi6QeDnB4wzsSnZNBcilk6YdIMx1QWAz1A%3D%3D';
    var Body = json.encode({"email": "$reset", "password": "$password"});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/auth/reset-password?token=$token'),
        headers: headers,
        body: Body);
    print("request:");

    var responses = jsonDecode(request.body);
    print("status:${request.statusCode}");
    print("request:$Body");
    print("request:${responses}");

    if (request.statusCode == 200) {
      print('============================object');

      return true;
    } else {
      client.close();
      // print("response:${}");
      return false;
    }
  }
}
