import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innovit_2cs_project_paiement/models/report.dart';

class reportController {

  Future<void> sendReport(Report report) async{
    var uri = Uri.parse('https://innovit-payment.onrender.com/paiement/report/send');
    final response = await http.post(uri,headers: {'Content-Type': 'application/json'},body: json.encode({"idFacture": report.idFacture ,"message": report.message}) );
  }
  
}