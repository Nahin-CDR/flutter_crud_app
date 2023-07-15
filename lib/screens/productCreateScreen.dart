
import 'package:crud_app/style/style.dart';
import 'package:flutter/material.dart';

import '../widgets/dropdown.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});
  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
class _ProductCreateScreenState extends State<ProductCreateScreen> {
  String dropdownValue = list.first;
  String selected = "select";
  List<String> dropDownOptions = <String>[
    '1 pcs',
    '2 pcs',
    '3 pcs',
    '4 pcs',
    '5 pcs'
  ];
  Map<String,String> formValues={"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};

  void inputOnChange(mapKey, textValue){
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Product"),
      ),
      body: Stack(
        children: [
          screenBackground(context: context),
          Container(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value){

                    },
                    decoration: appInputDecoration(labelTxt:'Product Name'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value){

                    },
                    decoration: appInputDecoration(labelTxt:'Product code'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value){

                    },
                    decoration: appInputDecoration(labelTxt:'Product Image'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value){
                      //
                    },
                    decoration: appInputDecoration(labelTxt:'Unit Price'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value){

                    },
                    decoration: appInputDecoration(labelTxt:'Total Price'),
                  ),
                  // appDropDownStyle(
                  //     DropdownButton(
                  //       hint: const Text('Select qt'),
                  //       value: selected,
                  //       items: dropDownOptions.map<DropdownMenuItem<String>>((String value) {
                  //         return DropdownMenuItem<String>(
                  //           value: value,
                  //           child: Text(value),
                  //         );
                  //       }).toList(),
                  //       onChanged:(value){
                  //          setState(() {
                  //            selected = value!;
                  //          });
                  //       },
                  //       underline: Container(),
                  //       isExpanded: true,
                  //     )
                  // ),
                  const SizedBox(height: 10),
                  appDropDownStyle(
                      DropdownButton(
                        value:formValues['Qty'] ,
                        items:const [
                          DropdownMenuItem(value: "",child: Text('Select Qt'),),
                          DropdownMenuItem(value: "1 pcs",child: Text('1 pcs'),),
                          DropdownMenuItem(value: '2 pcs',child: Text('2 pcs'),),
                          DropdownMenuItem(value: '3 pcs',child: Text('3 pcs'),),
                          DropdownMenuItem(value: '4 pcs',child: Text('4 pcs'),),
                        ],
                        onChanged: (textValue){
                          inputOnChange("Qty",textValue);
                        },
                        underline: Container(),
                        isExpanded: true,
                      )
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      style: appButtonStyle(),
                      onPressed: (){

                      },
                      child: successButton(
                          buttonText:'Submit'
                      )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
