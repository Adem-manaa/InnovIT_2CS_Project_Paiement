import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innovit_2cs_project_paiement/models/PaymentMethod.dart';
import 'package:innovit_2cs_project_paiement/screens/MainPage.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class paymentMethoodController {
  

  String api = 'innovit-payment.onrender.com';

  // GET PAYMENTS METHODS
  Future<List<PaymentMethod>> getPayments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    List<PaymentMethod> ListPaymentMethods = [];
    PaymentMethod paymentMethod = new PaymentMethod();
    var queryParameters = {
      'mail': email,
    };
    var uri = Uri.http(api, '/paiement/payments', queryParameters);
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await http.get(uri, headers: headers);
    var jsonObj = json.decode(response.body);
    for( var i=0; i<jsonObj.length; i++){
      ListPaymentMethods.add(new PaymentMethod(mail : jsonObj[i]['mail'],cartePaiment: jsonObj[i]['cartePaiment'], expiryDate: jsonObj[i]['expiryDate']));
    }
    return ListPaymentMethods;  
  }

  Future<void> pay( PaymentMethod paymentMethod,String code, BuildContext context) async{
    var uri = Uri.parse("https://innovit-payment.onrender.com/paiement/charge");
    Map<String, dynamic> qrCode = jsonDecode(code);
    
    var response = await http.post(uri,headers: {'Content-Type': 'application/json'},body: json.encode({'id': qrCode["idComm"], 'cartePaiment': paymentMethod.cartePaiment, 'ccv': paymentMethod.ccv, 'expiryDate': paymentMethod.expiryDate, "idDistr": qrCode["idDistr"]}) ); 
    var res = jsonDecode(response.body);
  
    if(response.statusCode == 200 && res['resultCode'] == 'Authorised'){
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Transaction Completed Successfully!',
        confirmBtnColor: deepGreen,
        onConfirmBtnTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
          }
        );
      
    }
  }

  Future<void> addMethod( PaymentMethod paymentMethod, BuildContext context) async{
    var uri = Uri.parse('https://innovit-payment.onrender.com/paiement/paiement/add');
    final response = await http.post(uri,headers: {'Content-Type': 'application/json'},body: json.encode({'mail': paymentMethod.mail, 'cartePaiment': paymentMethod.cartePaiment, 'ccv': paymentMethod.ccv, 'expiryDate': paymentMethod.expiryDate}) );
    if( response.statusCode == 200){
      Navigator.of(context).pop();
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Card added successfully!',
        confirmBtnColor: deepGreen,
        autoCloseDuration: const Duration(seconds: 2),
        onConfirmBtnTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
        }
      );
    }
  }

}