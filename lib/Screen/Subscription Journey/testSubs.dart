import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class testSubs extends StatefulWidget {
  const testSubs({Key? key}) : super(key: key);

  @override
  _testSubsState createState() => _testSubsState();
}

class _testSubsState extends State<testSubs> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('Buy Now'),
              onPressed: () async {
                makePayment();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> _createPaymentMethod(
      {required String number,
      required String expMonth,
      required String expYear,
      required String cvc}) async {
    String url = 'https://api.stripe.com/v1/payment_methods';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization':
            'Bearer sk_test_51MP8GqRkeqntfFwknA2biblerDGWYbBO6Q1ZWpHtXtQRBOdM3BDoCXTzH57IFqFLOORrudZThiGdQFNqSCwLHHnm00kFTgGr2M',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'type': 'card',
        'card[number]': '$number',
        'card[exp_month]': '$expMonth',
        'card[exp_year]': '$expYear',
        'card[cvc]': '$cvc',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw 'Failed to create PaymentMethod.';
    }
  }

  Future<void> makePayment() async {
    try {
      Map<String, dynamic> paymentIntent = await createPaymentIntent();
      await createCreditCard(
          'cus_Pb6S9z48OEolda', paymentIntent['client_secret']);
      Map<String, dynamic> customerPaymentMethods =
          await getCustomerPaymentMethods();

      await createSubscriptionIntent(customerPaymentMethods['data'][0]['id']);
    } catch (err) {
      print(err);
    }
  }

  Future<void> createCreditCard(
    String customerId,
    String paymentIntentClientSecret,
  ) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        style: ThemeMode.light,
        merchantDisplayName: 'Potenic',
        customerId: customerId,
        setupIntentClientSecret: paymentIntentClientSecret,
      ),
    );

    await Stripe.instance.presentPaymentSheet();
  }

  Future<Map<String, dynamic>> createPaymentIntent() async {
    try {
      var requestBody = {
        'customer': 'cus_Pb6S9z48OEolda',
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

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
      });
    } catch (e) {
      print("Payment failed $e");
    }
  }

  createSubscriptionIntent(
    String paymentId,
  ) async {
    try {
      Map<String, dynamic> body = {
        // 'amount': amount,
        // 'currency': currency,

        'customer': 'cus_Pb6S9z48OEolda',
        'items[0][price]': 'price_1OlQz5RkeqntfFwkHoelDUgz',
        'default_payment_method': paymentId,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/subscriptions'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );


      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  getCustomerPaymentMethods() async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://api.stripe.com/v1/customers/cus_Pb6S9z48OEolda/payment_methods'),
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
}
