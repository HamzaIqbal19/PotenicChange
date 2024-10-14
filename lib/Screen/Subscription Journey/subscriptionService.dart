import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:potenic_app/API/Apispecs.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class SubscriptionService {
  Future<void> createCreditCard(
      String paymentIntentClientSecret, String customerId) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          style: ThemeMode.light,
          merchantDisplayName: 'Potenic',
          customerId: customerId,
          setupIntentClientSecret: paymentIntentClientSecret,
          // applePay: const PaymentSheetApplePay(merchantCountryCode: 'US'),
          // googlePay: const PaymentSheetGooglePay(
          //     merchantCountryCode: 'US', currencyCode: 'US', testEnv: true),
          primaryButtonLabel: 'Proceed',
          appearance: const PaymentSheetAppearance(
              primaryButton: PaymentSheetPrimaryButtonAppearance(
                  colors: PaymentSheetPrimaryButtonTheme(
                      light: PaymentSheetPrimaryButtonThemeColors(
                          background: Color(0xFFF5F5F5),
                          text: Color(0XFF8C648A)),
                      dark: PaymentSheetPrimaryButtonThemeColors(
                          background: Color(0xFFF5F5F5),
                          text: Color(0XFF8C648A)))),
              colors: PaymentSheetAppearanceColors(
                  primaryText: Color(0xFFF5F5F5),
                  secondaryText: Color(0xFFF5F5F5),
                  componentBackground: Color(0xFFF5F5F5),
                  placeholderText: Color(0xFF282828),
                  componentText: Color(0XFF8C648A),
                  background: Color(0xFF333232),
                  icon: Color(0xFFF5F5F5)))),
    );

    await Stripe.instance.presentPaymentSheet();
  }

  Future<Map<String, dynamic>> createPaymentIntent(String customerId) async {
    try {
      var requestBody = {
        'customer': customerId,
        'automatic_payment_methods[enabled]': 'true',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/setup_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: requestBody,
      );

      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  createSubscriptionIntent(
      String paymentId, String priceId, customerId, trialDays) async {
    print("Trial Days $trialDays");
    try {
      Map<String, dynamic> body;
      if (trialDays == 0) {
        body = {
          'customer': customerId,
          'items[0][price]': priceId,
          'default_payment_method': paymentId,
          'expand[]': 'latest_invoice.payment_intent',
        };
      } else {
        body = {
          'customer': customerId,
          'items[0][price]': priceId,
          "trial_period_days": "5",
          'default_payment_method': paymentId,
          'expand[]': 'latest_invoice.payment_intent',
        };
      }

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/subscriptions'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      var data = json.decode(response.body);

      return data;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  getCustomerPaymentMethods(String customerId) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://api.stripe.com/v1/customers/$customerId/payment_methods'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );

      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future makePayment(String priceId, trialDays) async {
    final SharedPreferences prefs = await _prefs;
    print("Trial Data $trialDays");
    var response;
    var customerId = prefs.getString('customerID');
    try {
      Map<String, dynamic> paymentIntent =
          await createPaymentIntent(customerId.toString());
      await createCreditCard(
          paymentIntent['client_secret'], customerId.toString());
      Map<String, dynamic> customerPaymentMethods =
          await getCustomerPaymentMethods(customerId.toString());

      await createSubscriptionIntent(customerPaymentMethods['data'][0]['id'],
              priceId, customerId.toString(), trialDays)
          .then((value) => {response = value});

      return response;
    } catch (err) {
      print(err);
    }
  }

  Future getCustomerData() async {
    final SharedPreferences prefs = await _prefs;
    var accessToken = prefs.getString('usertoken');
    var customerId = prefs.getString('customerID');

    var headers = {
      'Content-Type': 'application/json',
      'x-access-token': '$accessToken',
    };

    var response = await http.get(
      Uri.parse(
          '${URL.BASE_URL}api/subscription/user-subscription/$customerId'),
      headers: headers,
    );
    var jsonData = jsonDecode(response.body);

    print("Get costumer data ${jsonData}");

    if (response.statusCode == 200) {
      return jsonData;
    } else {}
  }

  cancelSubscription(String subId, bool trial) async {
    final SharedPreferences prefs = await _prefs;
    var customerId = prefs.getString('customerID');

    try {
      final response = await http.delete(
        Uri.parse('https://api.stripe.com/v1/subscriptions/$subId'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          "prorate": 'true',
          "invoice_now": 'true',
          //  'cancel_at_period_end': '${!trial}'
        },
      );

      print(
          "Cancel status: ${response.statusCode} ${json.decode(response.body)}");
      var data = json.decode(response.body);

      return response.statusCode;
    } catch (error) {
      print('Error canceling subscription: $error');
    }
  }

  cancelSubscriptionImmediatly(String subId, bool trial) async {
    final SharedPreferences prefs = await _prefs;
    var customerId = prefs.getString('customerID');

    try {
      final response = await http.delete(
        Uri.parse('https://api.stripe.com/v1/subscriptions/$subId'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          "prorate": 'false',
          "invoice_now": 'true',
        },
      );

      var data = json.decode(response.body);

      prefs.setString('subscriptionStatus', 'inactive');

      return response.statusCode;
    } catch (error) {
      print('Error canceling subscription: $error');
    }
  }
}

class UnixTime {
  unixIntoDate(String unixTime) {
    int unixTimestamp = int.parse(unixTime); // Example Unix timestamp

    // Convert Unix timestamp to milliseconds
    int milliseconds = unixTimestamp * 1000;

    // Create a DateTime object from the milliseconds
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    // Format the date as day:month:year
    String formattedDate =
        '${date.day} ${_getMonthName(date.month)} ${date.year}';

    print('Formatted Date: $formattedDate');
    return formattedDate;
  }

  unixIntoRemainingDays(String unixTime) {
    int unixTimestamp = int.parse(unixTime); // Example Unix timestamp

    // Convert Unix timestamp to milliseconds
    int milliseconds = unixTimestamp * 1000;

    // Create a DateTime object from the milliseconds
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    // Format the date as day:month:year
    String formattedDate = DateTime.now()
        .add(const Duration(days: 5))
        .difference(date)
        .inDays
        .toString();

    return formattedDate == '1' ? '$formattedDate day' : '$formattedDate days';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
