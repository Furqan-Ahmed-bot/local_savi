import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentServices {
  Future<bool?> makePayment(clientSecret) async {
    try {
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: clientSecret,
              style: ThemeMode.dark,
              merchantDisplayName: 'Balance Me',
            ),
          )
          .then((value) {})
          .onError((e, _) {
        throw Exception(e);
      });
      //STEP 3: Display Payment sheet
      return await displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<bool?> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        //Clear paymentIntent variable after successful payment
        return true;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
      return true;
    } on StripeException catch (e) {
      log('Error is:---> $e');
      throw Exception(e);
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }
}
