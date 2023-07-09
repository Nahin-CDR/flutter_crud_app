
import 'package:crud_app/style/style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});
  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
