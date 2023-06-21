

import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/HistoryItem.dart';

class HistoryItemController{
  
  String api = 'innovit-payment.onrender.com';

  // GET COMMANDS METHODS
  Future<List<HistoryItem>> getCommands() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    List<HistoryItem> ListCommands = [];
    HistoryItem historyItem = new HistoryItem();
    var queryParameters = {
      'mail': email,
    };
    var uri = Uri.http(api, '/paiement/commands', queryParameters);
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await http.get(uri, headers: headers);
    var jsonObj = json.decode(response.body);
    for( var i=0; i<jsonObj.length; i++){
      ListCommands.add(new HistoryItem(
        id: jsonObj[i]["id"],
        name: jsonObj[i]["name"],
        image: jsonObj[i]["image"],
        recette: jsonObj[i]["recette"],
        ingredient: jsonObj[i]["ingredient"],
        price: jsonObj[i]["price"],
        userMail: jsonObj[i]["userMail"],
        cardNumber: jsonObj[i]["cardNumber"],
        ccv: jsonObj[i]["ccv"],
        idFacture: jsonObj[i]["idFacture"],
        isClaimed: jsonObj[i]["isClaimed"],
        date: jsonObj[i]["date"],
        localisation: jsonObj[i]["localisation"],
        ));
    }
    return ListCommands;  
  }

}