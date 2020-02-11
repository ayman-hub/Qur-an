import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
//fluttertoast: ^3.1.3
void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      fontSize: 20,
      backgroundColor: Colors.cyanAccent,
      textColor: Colors.black,
      timeInSecForIos: 1);
}