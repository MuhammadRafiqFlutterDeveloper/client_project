import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:precises/screens/controller.dart';
import 'package:precises/screens/home_screen.dart';
import 'package:precises/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => HomePageController());
      }),
      home: HomePage(),
    );
  }
}

