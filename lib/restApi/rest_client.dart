import 'dart:convert';
import 'package:crud_app/utility/utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

  Future<bool> productCreateRequest({required Map formValues})async{
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var postBody = json.encode(formValues);
  var postHeader = {"Content-Type" : "application/json"};

  var response = await http.post(url,headers: postHeader,body: postBody);
  var resultCode = response.statusCode;
  var resultBody = jsonDecode(response.body);
  if(resultCode == 200 && resultBody['status'] == "success"){
    Utility.showToast(
        message: "request success",
        backGroundColor: Colors.green
    );
    if (kDebugMode) {
      print(resultBody['data']);
    }
    return true;
  }else{
    Utility.showToast(
        message: "request failed",
        backGroundColor: Colors.red
    );
    return false;
  }

}

  Future<List>productGridViewListRequest()async{
    var url = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    var postHeader = {"Content-Type" : "application/json"};
    var response = await http.get(url,headers: postHeader);
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);

    if(resultCode == 200 && resultBody['status'] == "success"){
      Utility.showToast(message: "Success", backGroundColor:Colors.green);
      return resultBody['data'];
    }else{
      Utility.showToast(message: "Failed", backGroundColor:Colors.deepOrange);
      return [];
    }
  }

  Future<bool>productDeleteRequest({required String id})async{
    var url = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/$id");
    var postHeader = {"Content-Type" : "application/json"};
    var response = await http.get(url,headers: postHeader);
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);

    if(resultCode == 200 && resultBody['status'] == "success"){
      Utility.showToast(message: "deleted", backGroundColor:Colors.green);

    }else{
      Utility.showToast(message: "Failed", backGroundColor:Colors.deepOrange);
    }

    return false;
  }

  Future<bool> productUpdateRequest({required Map formValues,required String id})async{
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/$id");
  var postBody = json.encode(formValues);
  var postHeader = {"Content-Type" : "application/json"};

  var response = await http.post(url,headers: postHeader,body: postBody);
  var resultCode = response.statusCode;
  var resultBody = jsonDecode(response.body);
  if(resultCode == 200 && resultBody['status'] == "success"){
    Utility.showToast(
        message: "request success",
        backGroundColor: Colors.green
    );
    if (kDebugMode) {
      print(resultBody['data']);
    }
    return true;
  }else{
    Utility.showToast(
        message: "request failed",
        backGroundColor: Colors.red
    );
    return false;
  }

}
