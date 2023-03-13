import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:precises/screens/controller.dart';
import 'package:precises/screens/login.dart';

void main() => runApp(
  GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: LoginScreen(),
    initialBinding: BindingsBuilder(() {
      Get.lazyPut(() => HomePageController());
    }),
  ),
);
