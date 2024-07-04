import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/subject.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key,required this.subject});
final Subject subject;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.defaultDialog(
            title: 'ملحقات المادة',
            titleStyle: UITextStyle.titleBold.copyWith(color: UIColors.black),
            content: Column(
              children: [
                ListTile(
                  title: Text("الصور",
                      style: UITextStyle.titleBold.copyWith(color: UIColors.black),
                  textDirection: TextDirection.rtl,),
                  onTap: () { Get.toNamed(AppRoutes.subjectImages, arguments: {'subjectId': subject.id});},
                ),
                ListTile(
                  title: Text("الملفات",
                      style: UITextStyle.titleBold.copyWith(color: UIColors.black),
                      textDirection: TextDirection.rtl),
                  onTap: () {Get.toNamed(AppRoutes.subjectFiles, arguments: {'subjectId': subject.id});},
                )
              ],
            ));
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
