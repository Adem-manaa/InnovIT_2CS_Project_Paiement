import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:innovit_2cs_project_paiement/models/HistoryItem.dart';
import 'package:innovit_2cs_project_paiement/models/claimsCategory.dart';
import 'package:innovit_2cs_project_paiement/models/report.dart';
import 'package:innovit_2cs_project_paiement/controllers/report.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedColoredButton.dart';
import 'package:innovit_2cs_project_paiement/widgets/RoundedTextField.dart';
import 'package:innovit_2cs_project_paiement/widgets/SimpleAppbar.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../utilities/constants.dart';
import '../widgets/RoundedTextFormField.dart';

class ReportPage extends StatefulWidget {
  final HistoryItem? historyItem;
  const ReportPage({super.key,this.historyItem});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  final List<String> items = [
    "Erreur lors de paiement",
    "Erreur lors de la commande",
    "Autre"
  ];


  final formKey = GlobalKey<FormState>();
  late String? message;
  final reportController ReportController = new reportController();
  List<claimsCategory> ListClaimsCategory = [
    
  ];
  String? selectedValue;
  int? idClaim;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      ListClaimsCategory = await ReportController.getClaimsCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SimpleAppBar(
        title: 'Report a problem',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Text(
              'command number: ${widget.historyItem?.id}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.08,),
            Container(
                width: MediaQuery.of(context).size.width*0.62,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xff9BAEBC).withOpacity(0.8),
                  )
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2( 
                    hint: Text(
                      'Claim type',
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
                      print(value);
                      setState(() {
                        selectedValue = value as String;
                        switch(selectedValue){
                          case "Erreur lors de paiement" :
                            idClaim = 1;
                            break;
                          case "Erreur lors de la commande" :
                            idClaim = 2;
                            break;
                          case "Autre" :
                            idClaim = 3;
                            break;
                        }
                      }
                      );
                      print(idClaim);
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 40,
                      width: MediaQuery.of(context).size.width*0.62,
                      padding: EdgeInsets.only(left: 14,right:14),
                    ),
                    dropdownStyleData: DropdownStyleData(
                        maxHeight: 160,
                        width: 190,
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
              ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Column(
              children: [
                const Text(
                  'What seems to be the problem ?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25,),
                Form(
                  key: formKey,
                  child: RoundedTextFormField(
                      hintText: 'Describe your problem',
                      hintTextSize: 20,
                      borderColor: Color(0xff251201).withOpacity(0.2),
                      selectedBorderColor: coffeeBeige,
                      validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSaved: (String? value){
                            message = value!;
                          },
                      ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.15,),
            RoundedColoredButton(
                width: 260,
                height: 50,
                text: 'Send Report',
                textColor: Colors.white,
                fillColor: Color(0xffEB001B),
                shadowBlurRadius: 1,
                onPressed: (){
                  if (formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.loading,
                      title: 'Loading',
                      text: 'proccessing claim',
                    );
                    Report report = Report(idFacture: widget.historyItem!.idFacture, message: message,idCategoryClaim: idClaim); 
                    ReportController.sendReport(report,context);
                  }
                }),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            const Text(
              'All rights reserved © InnovIt 2023',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
