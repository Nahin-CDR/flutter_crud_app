import 'package:crud_app/restApi/rest_client.dart';
import 'package:crud_app/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {

  List productList = [];
  bool loading = true;

  callData()async{
    loading = true;
    var data = await productGridViewListRequest();
    setState(() {
      productList = data;
      loading = false;
    });
  }

  @override
  void initState() {
    callData();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("List Product"),
      ),
      body: Stack(
        children: [
          screenBackground(context: context),
          Container(
            child: loading? const Center(child: CircularProgressIndicator()):
            Center(
              child: GridView.builder(
                itemCount: productList.length,
                  gridDelegate: productGridViewStyle(),
                  itemBuilder: (context,index){
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child:Image.network(
                                  productList[index]['Img'],
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error);
                                  },
                              )
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productList[index]['ProductName']),
                                const SizedBox(height: 7),
                                Text("Price ${productList[index]['UnitPrice']} bdt"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(
                                        onPressed:(){} ,
                                        child: const Icon(
                                          CupertinoIcons.ellipsis_vertical_circle,
                                          size: 18
                                        )
                                    ),
                                    OutlinedButton(
                                        onPressed:(){} ,
                                        child: const Icon(
                                            CupertinoIcons.delete,
                                           size: 18,
                                          color: Colors.deepOrange,
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
