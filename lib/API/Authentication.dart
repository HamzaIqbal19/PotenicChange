import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();

class Authentication {
  Future registerApi(name, email, password) async {
    var headers = {'Content-Type': 'application/json'};

    var Body = json.encode({
      "name": "$name",
      "email": "$email",
      "password": "$password",
    });

    print("request:$Body");
    var request = await client
        .post(Uri.parse('${URL.BASE_URL}api/auth/signup'),
            headers: headers, body: Body)
        .timeout(Duration(seconds: 10));
    print("request:");

    var responses = jsonDecode(request.body);
    print("status:${request.statusCode}");

    print("request:${responses}");
    print("request:${responses["status"]}");
    if (request.statusCode == 200) {
      print("response:${responses["message"]}");

      var res = await responses.stream.bytesToString();
      print("return this value:$res");
      return res;
    } else {
      client.close();
      // print("response:${}");
      return responses["message"];
    }
  }

  Future SignIn(fcmRegistrationToken, email, password) async {
    var headers = {'Content-Type': 'application/json'};

    var Body = json.encode({
      "fcmRegistrationToken": "$fcmRegistrationToken",
      "email": "$email",
      "password": "$password",
    });

    print("request:$Body");
    var request = await client.post(Uri.parse('${URL.BASE_URL}api/auth/signin'),
        headers: headers, body: Body);
    print("request:");

    var responses = jsonDecode(request.body);
    print("status:${request.statusCode}");

    print("request:${responses}");
    print("request:${responses["status"]}");
    if (request.statusCode == 200) {
      print("response:${responses["message"]}");
      var res = await responses.stream.bytesToString();
      Map map = jsonDecode(res);
      String token = map['accessToken'];
      int userid = map['id'];

      SharedPreferences login = await SharedPreferences.getInstance();
      login.setString('usertoken', token);
      login.setInt('userid', userid);

      print("return this value:$res");
      return res;
    } else {
      client.close();
      // print("response:${}");
      return responses["message"];
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
    print("status:${request.statusCode}");

    print("request:${responses}");
    print("request:${responses["status"]}");
    if (request.statusCode == 200) {
      print("response:${responses["message"]}");
      var res = await responses.stream.bytesToString();

      print("return this value:$res");
      return res;
    } else {
      client.close();
      // print("response:${}");
      return responses["message"];
    }
  }
}
