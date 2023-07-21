import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class Utility{
  static void showToast({required String message,required Color backGroundColor}){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backGroundColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}