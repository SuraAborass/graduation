import 'package:flutter/material.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';

class InstituteTextFormField extends StatelessWidget {
  const InstituteTextFormField({super.key,
    //required this.controller
    this.hintText = '',
    this.keyboardType = TextInputType.name,
    this.style = UITextStyle.smallBodyNormal,
    this.maxLines = 1,});

  final String hintText;
  //final TextEditingController controller;
  final TextInputType keyboardType;
  final TextStyle style;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: controller,
      keyboardType: keyboardType,
      style: style,
      maxLines: maxLines,
      decoration: textFieldStyle.copyWith(
        hintText: hintText,
      ),
    );
  }
}
