import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/controllers/HistoryItem.dart';
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
  
  final HistoryItemController historyItemController = HistoryItemController();
  String? selectedValue;
  List<HistoryItem> historyItems = []; 
class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      historyItems = await historyItemController.getCommands();
    });
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
                                historyItems.sort((a,b) => a.date!.compareTo(b.date!));
                                break;
                              case "Drink" :
                                historyItems.sort((a,b) => a.name!.compareTo(b.name!));
                                break;
                              case "Price" :
                                historyItems.sort((a,b) => a.price!.compareTo(b.price!));
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
            child: FutureBuilder(
              future: historyItemController.getCommands(),
              builder: (context,AsyncSnapshot<List<HistoryItem>> snapshot){
                if(snapshot.hasData){
                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                      right: 10,
                    ),
                    itemBuilder: (context, index) {
                      HistoryItem historyItem = snapshot.data![index];
                      return Container(
                        width: 374,
                        height: 200,
                        decoration: BoxDecoration(
                          color: coffeeBeige.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 8,),
                                Image.network(
                                  historyItem.image ?? "assets/images/drinkCreme.png",
                                  width: 140,
                                  height: 140,
                                ),
                                SizedBox(width: 24,),
                                SizedBox(
                                  height: 110,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "${historyItem.date} ",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: deepGreen),
                                          ),
                                          Text(
                                            "",
                                            style: const TextStyle(
                                                fontSize: 13, color: deepGreen),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${historyItem.name}  ",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "${historyItem.price}0 DA",
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        historyItem.localisation ?? "",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundedColoredButton(
                                    width: 160,
                                    height: 34,
                                    text: 'Details',
                                    textSize: 15,
                                    textColor: Colors.black,
                                    fillColor: const Color(0xffFBFBFB),
                                    shadowBlurRadius: 0,
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryDetailsPage(historyItem: historyItem)));
                                    }),
                                RoundedColoredButton(
                                    width: 160,
                                    height: 34,
                                    text: historyItem.isClaimed! ? 'Reported' : 'Report',
                                    textSize: 15,
                                    textColor: historyItem.isClaimed! ? Colors.grey : Colors.white,
                                    fillColor: historyItem.isClaimed! ? Color(0xffFBFBFB): Color(0xffEB001B),
                                    shadowBlurRadius: 0,
                                    onPressed: () {
                                      if (!historyItem.isClaimed!){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ReportPage(historyItem: historyItem,)));
                                      }
                                    }),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                  );
                }else if(snapshot.hasError){
                    return Text('Error: ${snapshot.error}');
                }else{
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.16,
                      ),
                      CircularProgressIndicator(
                        color: deepGreen,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.16,
                      ),
                    ],
                  );
                }
              }
              )
          )
        ],
      ),
    );
  }
}
