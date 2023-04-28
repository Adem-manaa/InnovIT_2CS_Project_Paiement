import 'package:flutter/material.dart';

class PaymentMethod {
  int? id;
  String? mail;
  String? cartePaiment;
  String? ccv;
  String? expiryDate;


  PaymentMethod({
    this.id,
    this.mail,
    this.cartePaiment,
    this.ccv,
    this.expiryDate,
  });

  fromJson(Map<String,dynamic> json) {
    id = json['id'] as int?;
    mail = json['mail'];
    cartePaiment = json['cartePaiment'];
    ccv = json['ccv'];
    expiryDate = json['expiryDate'];
    return this;
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    if (id != null) data['id'] = this.id;
    if (mail != null) data['mail'] = this.mail;
    if (cartePaiment != null) data['cartePaiment'] = this.cartePaiment;
    if (ccv != null) data['ccv'] = this.ccv;
    if (expiryDate != null) data['expiryDate'] = this.expiryDate;
    return data;
  }
}
