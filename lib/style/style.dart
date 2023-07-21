import 'dart:ui';

import 'package:crud_app/utility/assetManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color colorRed = Color.fromRGBO(231, 28, 36, 1);
const Color colorGreen = Color.fromRGBO(33, 191, 115, 1);
const Color colorWhite = Color.fromRGBO(255,255,255,1);
const Color colorDarkBlue = Color.fromRGBO(44,62,80,1);


SvgPicture screenBackground({required BuildContext context}){
  return SvgPicture.asset(
    AssetManager.backgroundImage,
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}
InputDecoration appInputDecoration({required String labelTxt}){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide:  BorderSide(color: colorGreen)
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20,10,10,20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: colorWhite,width: 1
      )
    ),
    border: const OutlineInputBorder(),
    labelText: labelTxt
  );
}

DecoratedBox appDropDownStyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(
        color: colorWhite,
        border: Border.all(
            color: colorWhite,
            width: 1
        ),
        borderRadius: BorderRadius.circular(4)
      ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: child,
        ),
  );
}
ButtonStyle appButtonStyle(){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}
Ink successButton({required String buttonText}){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        buttonText,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15
        ),
      ),
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount productGridViewStyle(){
  return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      mainAxisExtent: 250
  );
}
