import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:sentry/sentry.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = SentryHttpClient();

class Goal {
  Future createGoal(goalName, goalCategoryId) async {
    var headers = {'Content-Type': 'application/json'};
    var Body = json.encode({
      "goalName": "$goalName",
      "goalCategoryId": "$goalCategoryId",
    });
    print("request:$Body");
    var request = await client
        .post(Uri.parse('${URL.BASE_URL}/api/goal/add-goal'), body: Body);
    print("request:");

    var responses = jsonDecode(request.body);

    print("status:${request.statusCode}");
    print("request:${responses}");
    print("request:${responses["status"]}");
    if (request.statusCode == 200) {
      print("response:${responses["message"]}");
      var res = await responses.stream.bytesToString();
      return res;
    } else {
      client.close();
      // print("response:${}");
      print(responses.reasonPhrase);
      return responses["message"];
    }
  }
}
