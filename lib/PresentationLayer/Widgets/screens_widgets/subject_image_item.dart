import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/subject_image.dart';
import '../../Screens/Public/view_image_screen.dart';

class SubjectImageItem extends StatelessWidget {
  const SubjectImageItem({super.key,required this.subjectImage});
  final SubjectImage subjectImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: InkWell(
        onTap: (){
          Get.to(()=> ViewImageScreen(imageUrl: subjectImage.url));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: UIColors.primary, // نفس لون الخلفية
              width: 5.0, // سماكة الإطار
            ),
            borderRadius: BorderRadius.circular(20),
            color: UIColors.primary,
          ),
          width: 250,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              subjectImage.url,
              fit: BoxFit.fill,
              //opacity: const AlwaysStoppedAnimation(.10),
            ),
          ),
        )
        ,
      ),
      subtitle: Center(
        child: Text(subjectImage.description,
          style: UITextStyle.titleBold.copyWith(color:UIColors.black),),
      ),
    );
  }
}
