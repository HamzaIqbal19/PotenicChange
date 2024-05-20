import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:potenic_app/API/Apispecs.dart';
import 'package:potenic_app/MyServices/Notification/notificationService.dart';
import 'package:sentry/sentry.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Authentication {
  Future registerApi(name, email, password) async {
    var headers = {'Content-Type': 'application/json'};

    var body = json.encode({
      "name": "$name",
      "email": "$email",
      "password": "$password",
    });

    var request = await client.post(Uri.parse('${URL.BASE_URL}api/auth/signup'),
        headers: headers, body: body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      var response = {
        "message": responses["message"],
        "statusCode": request.statusCode,
      };
      return response;
    } else {
      var response = {
        "message": responses["message"],
        "statusCode": request.statusCode,
      };
      return response;
    }
  }

  Future refreshTokenApi(String sessionToken) async {
    var headers = {'Content-Type': 'application/json'};

    var body = json.encode({
      "sessionToken": sessionToken,
    });
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/auth/refresh-access-token'),
        headers: headers,
        body: body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      await prefs.setString('usertoken', responses);

      return true;
    } else {
      return false;
    }
  }

  Future signIn(email, password) async {
    var headers = {'Content-Type': 'application/json'};
    var fcmToken = await FirebaseMessaging.instance.getToken();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();


    var body = json.encode({
      "fcmRegistrationToken": "$fcmToken",
      "email": "$email",
      "password": "$password",
      //"timeZone": "$currentTimeZone"
    });

    var request = await client.post(Uri.parse('${URL.BASE_URL}api/auth/signin'),
        headers: headers, body: body);

    // print("Response: ${request.statusCode}");

    var response = jsonDecode(request.body);

    if (request.statusCode == 200) {
      print('Login response: $response');
      final SharedPreferences prefs = await _prefs;
      await prefs.setString('usertoken', response["accessToken"]);
      await prefs.setInt('userid', response['id']);
      await prefs.setString('customerID', response['userStripeId']);
      await prefs.setString('userName', response['name']);
      await prefs.setString('userEmail', response['email']);
      await prefs.setString("refreshtoken", response["sessionToken"]);
      await prefs.setString(
          'subscriptionStatus', response["subscriptionStatus"]);
      await prefs.setString('userRole', response['roles'][0]['name']);
      await prefs.setString('accountCreatedAt',
          response["createdAt"].toString().substring(0, 10));

      var responses = {
        "message": response["message"],
        "statusCode": request.statusCode,
      };
      SceduleNotification("Logged in");
      return responses;
    } else if (request.statusCode == 404 ||
        request.statusCode == 401 ||
        request.statusCode == 400) {
      var responses = {
        "message": response["message"],
        "statusCode": request.statusCode,
      };
      return responses;
    }
  }

  Future passReset(email) async {
    var headers = {'Content-Type': 'application/json'};

    var body = json.encode({
      "email": "$email",
    });

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/auth/forgot-password'),
        headers: headers,
        body: body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      await prefs.setString('resetEmail', email);
      await prefs.setInt('ResetId', responses["userId"]);

      return true;
    } else if (request.statusCode == 404) {
      return request.statusCode;
    } else {
      return false;
    }
  }

  Future passwordReset(password) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    final SharedPreferences prefs = await _prefs;
    var reset = prefs.getInt('ResetId');
    String token =
        'KEeQ5q3JlCOwXC5IgPw3Qnwakrs0wwgfI%2FDnm%2BiQRmYSc7CqniIDXi6QeDnB4wzsSnZNBcilk6YdIMx1QWAz1A%3D%3D';
    var body = json.encode({"userId": "$reset", "newPassword": "$password"});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/auth/reset-password?token=$token'),
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

  Future verifyOtp(otp) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    final SharedPreferences prefs = await _prefs;
    var resetId = prefs.getInt('ResetId');

    var body = json.encode({"userId": resetId, "otp": otp});

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/auth/verify-otp'),
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

  Future deleteUserAccount() async {
    final SharedPreferences prefs = await _prefs;

    var userId = prefs.getInt('userid');

    var accesToken = prefs.getString("userId");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accesToken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/auth/delete-user/$userId'),
        headers: headers);

    var responses = jsonDecode(request.body);
    if (request.statusCode == 200) {
      return true;
    } else {
      return responses["message"];
    }
  }

  Future userUpdate(userName, email, bool name) async {
    print("User Email $email, User NAME $userName");
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt('userid');
    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var body = json.encode({"name": "$userName"});

    var body2 = json.encode({"email": "$email"});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/user/update-user/$userId'),
        headers: headers,
        body: name ? body2 : body);

    var response = jsonDecode(request.body);

    print('response ${request.statusCode}  $response');

    if (request.statusCode == 200) {
      return true;
    } else if (request.statusCode == 400) {
      return response;
    } else {
      return false;
    }
  }
}
