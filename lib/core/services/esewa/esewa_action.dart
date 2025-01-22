import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:foodmenu/core/services/esewa/esewa.dart';

class EsewaAction {
  Future<double> pay() {
    final Completer<double> completer = Completer<double>();

    try {
      double productPrice = 3000.0;

      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: clientID,
          secretId: secretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: "1",
          productName: "food",
          productPrice: productPrice.toString(),
          callbackUrl: 'call Back',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint("Payment Success");
          completer.complete(productPrice);
        },
        onPaymentFailure: (data) {
          debugPrint("Payment Failed :::=>  $data");
          completer.complete(0.0);
        },
        onPaymentCancellation: (data) {
          debugPrint("Payment Canceled :::=>  $data");
          completer.complete(0.0);
        },
      );
    } catch (e) {
      debugPrint("Exception $e");
      completer.complete(0.0);
    }

    return completer.future;
  }
}
