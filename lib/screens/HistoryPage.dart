import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/models/HistoryItem.dart';
import 'package:innovit_2cs_project_paiement/screens/HistoryDetailsPage.dart';
import 'package:innovit_2cs_project_paiement/utilities/constants.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedTextField.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;

import 'ReportPage.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}
  final List<String> items = [
    'Date',
    'Time',
    'Drink',
    'Price'
  ];
  getPayments() async{
    final queryParameters = {
      'mail': 'ja_manaa@esi.dz',
    };
    final uri = Uri.http('innovit-payment.onrender.com', '/paiement/commands', queryParameters);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri, headers: headers);
    if( response.statusCode == 200){
      var jsonObj = json.decode(response.body);
      return jsonObj;
    }
  }
// List<HistoryItem> historyItems = [];
// List<HistoryItem> loadData(){
//   return [
//     HistoryItem(date: "04 march 2023", time: "08:00 AM", drinkName: "Long Coffee", price: 40, location: "ENP, Alger",drinkImage: 'drinkLongCoffee',isReported: false),
//     HistoryItem(date: "05 april 2023", time: "10:00 AM", drinkName: "Creme", price: 35, location: "ENP, Constantine",drinkImage: 'drinkCreme', isReported: true),
//     HistoryItem(date: "06 may 2023", time: "09:00 AM", drinkName: "Cappuccino", price: 55, location: "ENP, Oran",drinkImage: 'drinkCappuccino', isReported : false),
//   ];
// }
String? selectedValue;
class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/app_logo.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.58,
                height: 40,
                child: RoundedTextField(
                    hintText: 'Search here',
                    hintTextSize: 14,
                    borderColor: const Color(0xff9BAEBC).withOpacity(0.8),
                    selectedBorderColor: coffeeBrown,
                  //todo : implement search
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.38,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xff9BAEBC).withOpacity(0.8),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Order By',
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff9BAEBC).withOpacity(0.8),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                            switch(selectedValue){
                              case "Date" :
                                // historyItems.sort((a,b) => a.date.compareTo(b.date));
                                break;
                              case "Time" :
                                // historyItems.sort((a,b) => a.time.compareTo(b.time));
                                break;
                              case "Drink" :
                                // historyItems.sort((a,b) => a.drinkName.compareTo(b.drinkName));
                                break;
                              case "Price" :
                                // historyItems.sort((a,b) => a.price.compareTo(b.price));
                                break;
                            }
                          }
                          );
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 40,
                          width: 120,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                        iconStyleData:  IconStyleData(
                          icon: const Icon(
                             Icons.filter_list_sharp,
                          ),
                          iconSize: 24,
                          iconEnabledColor: const Color(0xff9BAEBC).withOpacity(0.8),
                        ),
                        dropdownStyleData: DropdownStyleData(
                            maxHeight: 160,
                            width: 120,
                            padding: null,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xff9BAEBC).withOpacity(0.8)
                              ),
                            ),
                            elevation: 1,
                            offset: const Offset(-14, -10),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                        height: 30,
                        padding: EdgeInsets.only(left: 10, right: 0),
                        ) ,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.3,
                ),
                Text(
                  "History page",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
              ],
            ),
          ),
          // Expanded(
          //   child: ListView.separated(
          //       padding: const EdgeInsets.only(
          //         top: 20,
          //         left: 10,
          //         right: 10,
          //       ),
          //       itemBuilder: (context, index) {
          //         return Container(
          //           width: 374,
          //           height: 200,
          //           decoration: BoxDecoration(
          //             color: coffeeBeige.withOpacity(0.2),
          //             borderRadius: BorderRadius.circular(20),
          //           ),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   Image.asset(
          //                     "assets/images/${historyItems[index].drinkImage}.png",
          //                     width: 140,
          //                     height: 140,
          //                   ),
          //                   SizedBox(
          //                     height: 110,
          //                     child: Column(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceAround,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Row(
          //                           children: [
          //                             Text(
          //                               "${historyItems[index].date}  ",
          //                               style: const TextStyle(
          //                                   fontWeight: FontWeight.bold,
          //                                   fontSize: 20,
          //                                   color: deepGreen),
          //                             ),
          //                             Text(
          //                               historyItems[index].time,
          //                               style: const TextStyle(
          //                                   fontSize: 15, color: deepGreen),
          //                             ),
          //                           ],
          //                         ),
          //                         Row(
          //                           children: [
          //                             Text(
          //                               "${historyItems[index].drinkName}  ",
          //                               style: const TextStyle(
          //                                 fontSize: 20,
          //                               ),
          //                             ),
          //                             Text(
          //                               "${historyItems[index].price}0 DA",
          //                               style: const TextStyle(
          //                                 fontSize: 15,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         Text(
          //                           historyItems[index].location,
          //                           style: const TextStyle(
          //                             fontSize: 20,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   RoundedColoredButton(
          //                       width: 160,
          //                       height: 34,
          //                       text: 'Details',
          //                       textSize: 15,
          //                       textColor: Colors.black,
          //                       fillColor: const Color(0xffFBFBFB),
          //                       shadowBlurRadius: 0,
          //                       onPressed: () {
          //                         Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryDetailsPage()));
          //                       }),
          //                   RoundedColoredButton(
          //                       width: 160,
          //                       height: 34,
          //                       text: historyItems[index].isReported? 'Reported' : 'Report',
          //                       textSize: 15,
          //                       textColor: historyItems[index].isReported? Colors.grey : Colors.white,
          //                       fillColor: historyItems[index].isReported? Color(0xffFBFBFB): Color(0xffEB001B),
          //                       shadowBlurRadius: 0,
          //                       onPressed: () {
          //                         if (!historyItems[index].isReported){
          //                           Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportPage(variable: scanData.code)));
          //                         }
          //                       }),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         );
          //       },
          //       separatorBuilder: (context, index) {
          //         return const SizedBox(
          //           height: 5,
          //         );
          //       },
          //       itemCount: historyItems.length
          //   ),
          // ),
        ],
      ),
    );
  }
}
