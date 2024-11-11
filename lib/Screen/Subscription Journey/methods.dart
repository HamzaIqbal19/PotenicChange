import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Map<String, dynamic>? paymentIntent;

Future<void> makePayment() async {
  try {
    //STEP 1: Create Payment Intent
    paymentIntent = await createPaymentIntent('100', 'USD');
    var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: 'US', currencyCode: 'US', testEnv: true);
    var aPay = const PaymentSheetApplePay(
      merchantCountryCode: 'US',
    );
    //STEP 2: Initialize Payment Sheet
    await Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: paymentIntent![
                    'client_secret'], //Gotten from payment intent
                style: ThemeMode.light,
                googlePay: gpay,
                applePay: aPay,
                merchantDisplayName: 'Potenic'))
        .then((value) {
    });

    //STEP 3: Display Payment sheet
    displayPaymentSheet();
  } catch (err) {
    throw Exception(err);
  }
}

createPaymentIntent(String amount, String currency) async {
  try {
    //Request body
    Map<String, dynamic> body = {
      'amount': amount,
      'currency': currency,
    };

    //Make post request to Stripe
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization':
            'Bearer sk_test_51MP8GqRkeqntfFwknA2biblerDGWYbBO6Q1ZWpHtXtQRBOdM3BDoCXTzH57IFqFLOORrudZThiGdQFNqSCwLHHnm00kFTgGr2M',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: body,
    );
    return json.decode(response.body);
  } catch (err) {
    throw Exception(err.toString());
  }
}

displayPaymentSheet() async {
  try {
    await Stripe.instance.presentPaymentSheet().then((value) {
      //Clear paymentIntent variable after successful payment
      paymentIntent = null;
    }).onError((error, stackTrace) {
      throw Exception(error);
    });
  } on StripeException catch (e) {
    print('Error is:---> $e');
  } catch (e) {
    print('$e');
  }
}
