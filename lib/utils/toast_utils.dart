import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketing_system/app_constents/app_colors.dart';
import '../../main.dart';

class ToastUtils {
  static late FToast fToast;
  ToastUtils._internal();
  static final ToastUtils instance = ToastUtils._internal();
  factory ToastUtils() {
    fToast = FToast();
    fToast.init(navigator.navigatorKey.currentContext!);
    return instance;
  }
  void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: AppColors.btnBlack,
      textColor: Colors.white,
      timeInSecForIosWeb: 3,
    );
  }
  void removeToast() {
    fToast.removeCustomToast();
  }
}
