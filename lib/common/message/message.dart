import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void successMessage(String text) {
  Fluttertoast.showToast(
    msg: "Login Success",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void errorMessage(String text) {
  Fluttertoast.showToast(
    msg: "Login Gagal",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
