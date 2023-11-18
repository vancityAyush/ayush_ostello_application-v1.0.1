import 'package:ayush_s_application5/core/app_export.dart';
import 'package:flutter/material.dart';

/// This class is used in the [walletscreenwithsection_item_widget] screen.
enum PaymentType { paid, received, added, deducted }

class PaymentModel {
  const PaymentModel({
    this.image = ImageConstant.noUserImage,
    required this.name,
    required this.amount,
    required this.mobileNo,
    required this.date,
    required this.id,
    required this.paymentType,
  });

  final String image;

  final String name;

  final double amount;

  final String mobileNo;

  final DateTime date;
  final PaymentType paymentType;
  final int id;

  (Color, String) get paymentTypeColorAndText {
    switch (paymentType) {
      case PaymentType.paid:
        return (Colors.red, "-₹$amount");
      case PaymentType.received:
        return (Colors.green, "+₹$amount");
      case PaymentType.added:
        return (Colors.green, "+₹$amount");
      case PaymentType.deducted:
        return (Colors.black, "₹$amount");
    }
  }
}
