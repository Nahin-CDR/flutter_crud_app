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