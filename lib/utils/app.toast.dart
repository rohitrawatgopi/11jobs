import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static void success(String msg, {duration = 2}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  static void failed(String msg, {duration = 2}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  static void info(String msg, {duration = 2}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }

  static void normal(String msg, {duration = 2}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: duration,
    );
  }
}
