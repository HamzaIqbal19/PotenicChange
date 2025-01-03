import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


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
    //var fcmToken = await FirebaseMessaging.instance.getToken();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();

    var body = json.encode({
      "fcmRegistrationToken": 'fcmToken',
      "email": "$email",
      "password": "$password",
      "timeZone": currentTimeZone
    });

    var request = await client.post(Uri.parse('${URL.BASE_URL}api/auth/signin'),
        headers: headers, body: body);

    var response = jsonDecode(request.body);

    if (request.statusCode == 200) {
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


    if (request.statusCode == 200) {
      return true;
    } else if (request.statusCode == 400) {
      return response;
    } else {
      return false;
    }
  }

  Future userStatusUpdate(status, value) async {
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt('userid');
    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var body = json.encode({status: value});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/user/update-user/$userId'),
        headers: headers,
        body: body);

    var response = jsonDecode(request.body);


    if (request.statusCode == 200) {
      return true;
    } else if (request.statusCode == 400) {
      return response;
    } else {
      return false;
    }
  }

  Future appLaunch() async {
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt('userid');
    if (userId != null) {
      var accessToken = prefs.getString("usertoken");
      var headers = {
        'Content-Type': 'application/json',
        'x-access-token': '$accessToken'
      };

      var body = json.encode({
        "userId": userId,
      });
      var request = await client.post(
          Uri.parse('${URL.BASE_URL}api/user/appLaunch'),
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
  }

  Future getUserData() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'x-access-token': '$accessToken',
    };
    var response = await client.get(
      Uri.parse('${URL.BASE_URL}api/auth/user-by-id/$userId'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {}
  }

  Future getUserTrials() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var customerId = prefs.getString('customerID');

    var headers = {
      'x-access-token': '$accessToken',
    };
    var body = {"userStripeId": "$customerId"};
    var response = await client.post(
      Uri.parse('${URL.BASE_URL}api/subscription/getUserFreeTrialDays'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {}
  }

  Future contactUsRequest(String subject,String description) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = json.encode({
      "userId": userId,
      "subject": subject,
      "description": description
    });
    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/user/sendContactRequest'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}

