import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';
import '../../../main.dart';
import '../../Widgets/Public/AppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: UIColors.white,
        appBar: mainAppBar(context),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
