import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
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
      String author,
      String destinationLink,
      bool visibility,
      String description,
      userGoalId) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');
    var headers = {'x-access-token': '$accessToken'};

    var request = http.MultipartRequest('POST',
        Uri.parse('${URL.BASE_URL}api/userInspiration/add-userInspiration'));

    request.fields.addAll({
      "inspirationId": "$inspirationId",
      "title": title,
      "hashTags": hashTags.toString(),
      "visibility": "$visibility",
      "author": author,
      "destinationLink": destinationLink,
      "userGoalId": userGoalId.toString(),
      "description": description,
      "userId": "$userId"
    });

    request.headers.addAll(headers);

    if (file != null) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
          'file', file.path,
          contentType: MediaType('image', 'jpeg'));

      request.files.add(multipartFile);
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responses = await response.stream.bytesToString();
      var responseBody = jsonDecode(responses);
      await prefs.setInt('userInspirationId', responseBody['result']['id']);
      prefs.remove('inspiration_saved_route');

      return responseBody;
    } else {}
  }

  Future updateInspiration(String title, hashTags, String destinationLink,
      String description, userGoalId, String author) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userInspirationId = prefs.getInt('userInspirationId');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };
    var body = jsonEncode({
      "title": title,
      "hashTags": hashTags.toString(),
      'author': author,
      "destinationLink": destinationLink,
      "description": description,
      "userGoalId": userGoalId
    });

    var request = await client.put(
        Uri.parse('${URL.BASE_URL}api/userInspiration/$userInspirationId'),
        headers: headers,
        body: body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future deleteUserInspiraton() async {
    final SharedPreferences prefs = await _prefs;
    var userInspirationId = prefs.getInt('userInspirationId');
    var accessToken = prefs.getString("usertoken");
    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken'
    };

    var request = await client.delete(
        Uri.parse('${URL.BASE_URL}api/userInspiration/$userInspirationId'),
        headers: headers);

    var responses = jsonDecode(request.body);

    if (request.statusCode == 200) {
      return true;
    } else {
      return responses["message"];
    }
  }

  Future getInspirationById() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userInspirationId = prefs.getInt('userInspirationId');

    var headers = {
      'x-access-token': '$accessToken',
    };
    var response = await http.get(
      Uri.parse('${URL.BASE_URL}api/userInspiration/$userInspirationId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {}
  }

  Future getUserInspiration() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else {
      return false;
    }
  }

  Future checkUserInspiration() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future filterUserInspiration(type, goalId, tag) async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString("usertoken");
    var userId = prefs.getInt('userid');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse(goalId != 0 && type != 0 && tag != null
          ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId?userGoalId=$goalId&inspirationId=$type&tag=$tag'
          : type != 0 && goalId != 0
              ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId?userGoalId=$goalId&inspirationId=$type'
              : goalId != 0 && tag != null
                  ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId?userGoalId=$goalId&$tag=$tag'
                  : tag != null && type != 0
                      ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId?tag=$tag&inspirationId=$type'
                      : type != 0
                          ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId?inspirationId=$type'
                          : goalId != 0
                              ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId?userGoalId=$goalId'
                              : tag != null
                                  ? '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId?tag=$tag'
                                  : '${URL.BASE_URL}api/userInspiration/inspiration-by-userId/$userId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } else if (response.statusCode == 404) {
      return response.statusCode;
    } else {}
  }
}
