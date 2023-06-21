import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innovit_2cs_project_paiement/models/claimsCategory.dart';
import 'package:innovit_2cs_project_paiement/models/report.dart';
import 'package:innovit_2cs_project_paiement/screens/HistoryPage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../utilities/constants.dart';

class reportController {

  Future<List<claimsCategory>> getClaimsCategories() async{
    List<claimsCategory> ListclaimsCategory = [];
    var uri = Uri.parse('https://innovit-payment.onrender.com/paiement/categoryClaims');
    final response = await http.get(uri,headers: {'Content-Type': 'application/json'});
    var jsonObj = json.decode(response.body);
    for( var i=0; i<jsonObj.length; i++){
      ListclaimsCategory.add(new claimsCategory(id : jsonObj[i]['id'],claim: jsonObj[i]['claim'], message: jsonObj[i]['message']));
    }
    return ListclaimsCategory;
  }

  Future<void> sendReport(Report report, BuildContext context) async{
    var uri = Uri.parse('https://innovit-payment.onrender.com/paiement/report/send');
    final response = await http.post(uri,headers: {'Content-Type': 'application/json'},body: json.encode({"idFacture": report.idFacture ,"message": report.message, "idCategoryClaim": report.idCategoryClaim}) );
    if (response.statusCode == 201){
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Claim sent Successfully!',
        confirmBtnColor: deepGreen,
        onConfirmBtnTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryPage()));
        }
      );
    }else{
      QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Sorry, something went wrong',
            backgroundColor: Colors.white,
            titleColor: Colors.black,
            textColor: Colors.black,
            confirmBtnText: 'try again',
            confirmBtnColor: Colors.red,
            onConfirmBtnTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryPage()));
          }
        );
    }
  }
  
}