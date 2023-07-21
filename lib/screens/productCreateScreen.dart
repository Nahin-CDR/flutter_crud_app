import 'package:crud_app/style/style.dart';
import 'package:crud_app/utility/utility.dart';
import 'package:flutter/material.dart';

import '../restApi/rest_client.dart';

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
  Map<String,String> formValues={
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":""
  };
  bool loading = false;
  void inputOnChange({required String mapKey, required String textValue}){
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }
  Future<void> formOnSubmit()async{
    if(formValues['Img']!.isEmpty){
      Utility.showToast(
          message: "No image link",
          backGroundColor: Colors.deepOrange
      );
    }else if(formValues['ProductCode']!.isEmpty){
      Utility.showToast(
          message: "ProductCode required",
          backGroundColor: Colors.deepOrange
      );
    }else if(formValues['ProductName']!.isEmpty){
      Utility.showToast(
          message: "ProductName required",
          backGroundColor: Colors.deepOrange
      );
    }else if(formValues['Qty']!.isEmpty){
      Utility.showToast(
          message: "Quantity required",
          backGroundColor: Colors.deepOrange
      );
    }else if(formValues['TotalPrice']!.isEmpty){
      Utility.showToast(
          message: "TotalPrice required",
          backGroundColor: Colors.deepOrange
      );
    }else if(formValues['UnitPrice']!.isEmpty){
      Utility.showToast(
          message: "Unit Price required",
          backGroundColor: Colors.deepOrange
      );
    }else{
      // data post
      setState(() {
        loading = true;
      });
      await productCreateRequest(formValues:formValues);
      setState(() {
        loading = false;
      });
    }
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
            child: loading?const Center(
              child: CircularProgressIndicator(),
            ):SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value){
                      inputOnChange(mapKey: "ProductName", textValue: value);
                    },
                    decoration: appInputDecoration(labelTxt:'Product Name'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value){
                      inputOnChange(mapKey: "ProductCode", textValue: value);
                    },
                    decoration: appInputDecoration(labelTxt:'Product code'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value){
                      inputOnChange(mapKey: "Img", textValue: value);
                    },
                    decoration: appInputDecoration(labelTxt:'Product Image'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value){
                      inputOnChange(mapKey: "UnitPrice", textValue: value);
                    },
                    decoration: appInputDecoration(labelTxt:'Unit Price'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value){
                      inputOnChange(mapKey: "TotalPrice", textValue: value);
                    },
                    decoration: appInputDecoration(labelTxt:'Total Price'),
                  ),

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
                          inputOnChange(mapKey: "Qty", textValue: textValue.toString());
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
                          formOnSubmit();
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
