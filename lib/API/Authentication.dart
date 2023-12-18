import 'dart:convert';
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

    if (request.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      var accesstoken = prefs.setString('usertoken', responses);

      return true;
    } else {
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

    var response = jsonDecode(request.body);
    print("Loginin response $response");

    if (request.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      print("Loginin response $response  ${response['roles'][0]['name']}");
      var accesstoken = prefs.setString('usertoken', response["accessToken"]);
      var UserId = prefs.setInt('userid', response['id']);
      var userName = prefs.setString('userName', response['name']);
      var UseruserEmail = prefs.setString('userEmail', response['email']);
      var RefreshToken =
          prefs.setString("refreshtoken", response["sessionToken"]);
      var subscription =
          prefs.setString('subscriptionStatus', response["subscriptionStatus"]);
      var role = prefs.setString('userRole', response['roles'][0]['name']);
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

    var Body = json.encode({
      "email": "$email",
    });

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/auth/forgot-password'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      var resetEmail = prefs.setString('resetEmail', email);
      var resetId = prefs.setInt('ResetId', responses["userId"]);
      var reset = prefs.getString('resetEmail');

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
    var Body = json.encode({"userId": "$reset", "newPassword": "$password"});

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/auth/reset-password?token=$token'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

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

    var Body = json.encode({"userId": resetId, "otp": otp});

    var request = await client.post(
        Uri.parse('${URL.BASE_URL}api/auth/verify-otp'),
        headers: headers,
        body: Body);

    var responses = jsonDecode(request.body);

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

    var Accestoken = prefs.getString("userId");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$Accestoken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/auth/delete-user/$userId'),
        headers: headers);

    var responses = jsonDecode(request.body);
    if (request.statusCode == 200) {
      print('Account deleted');
      return true;
    } else {
      return responses["message"];
    }
  }
}
