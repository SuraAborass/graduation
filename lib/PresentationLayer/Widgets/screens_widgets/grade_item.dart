import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/grade.dart';
import 'package:get/get.dart';


class GradeItem extends StatelessWidget {
  const GradeItem({super.key,required this.grade});
  final Grade grade;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Container(
          color: UIColors.gray.withOpacity(.2),
          width: Get.width,
          height: 30,
          child: Row(
            children: [
              Text(grade.name+ "     "+grade.fee.toString(),style: UITextStyle.titleBold.copyWith(color: UIColors.primary),),
            ],
          ),
        ),
      ],
    );
  }
}
