import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/subject.dart';
import 'package:get/get.dart';

class SubWithHomeworkItem extends StatelessWidget {
  const SubWithHomeworkItem({super.key,required this.subject});
  final Subject subject;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.homeworks,arguments: {'subjectId': subject.id});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: UIColors.primary,),
        width: 180,
        height: 120,
        child: Center(child: Text(
          subject.name,
          style: UITextStyle.bodyNormal.copyWith(
            color: UIColors.white,
            fontSize: 25,),),
        ),),
    );
  }
}
