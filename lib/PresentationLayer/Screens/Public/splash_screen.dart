import 'package:flutter/material.dart';
import '../../../BusinessLayer/Controllers/splash_controller.dart';
import 'package:get/get.dart';

import '../../../Constants/colors.dart';

class SplashScreen extends StatelessWidget {
    SplashScreen({super.key});
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.primary,
        bottomNavigationBar: Container(
          height : 20,
          color: UIColors.white,
        ),
        body: Center(
          child: Image.asset(
            'assets/images/graduation-hat.png',
            height: 290,
            width: 345,
          ),
        )
    );
  }
}
