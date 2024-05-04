import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Constants/get_pages.dart';


void main() async {
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //locale: Get.deviceLocale,
      title: 'School',
     // initialBinding: InitBinding(),
      getPages: getPages,
      //home:  LoginScreen(),
    );
  }
}
