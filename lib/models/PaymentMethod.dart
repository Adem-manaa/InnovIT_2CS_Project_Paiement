import 'package:flutter/material.dart';

class PaymentMethod {
  String expiryDate;
  String owner;
  String cardNumber;
  IconData cardLogo;

  PaymentMethod({
    required this.cardLogo,
    required this.cardNumber,
    required this.owner,
    required this.expiryDate,
  });
}
