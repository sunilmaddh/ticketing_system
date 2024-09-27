import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticketing_system/app_constents/app_colors.dart';
import 'package:ticketing_system/app_routes/app_pages.dart';
import 'package:ticketing_system/app_routes/app_routes.dart';
import 'package:ticketing_system/utils/custom_logic.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
         useMaterial3: true,
      ),
      home:const MyWidget(),
    );
  }
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

 //




