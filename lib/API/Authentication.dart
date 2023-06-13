import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
class Authentication{
  Future registerApi(name,email,password,token) async{
    var headers = {
      'Content-Type': 'application/json'
    };

   var Body = json.encode({
      "name": "$name",
      "email": "$email",
      "password": "$password",
      "fcmRegistrationToken": "$token"
    });

    print("request:$Body");
    var request = await client.post(Uri.parse('http://192.168.100.90:8000/api/auth/signup'),headers:headers,body: Body);
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
    }
    else {
      print("hello world:${responses["message"]}");
      client.close();
      // print("response:${}");
      return responses["message"];
    }

  }





}