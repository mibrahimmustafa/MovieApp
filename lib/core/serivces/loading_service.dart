import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void configLoading(){
    EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 60.0
    ..radius = 45.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.white
    ..textColor = Colors.white
    ..indicatorColor = Colors.blue
    ..userInteractions = false
    ..dismissOnTap = false;
}