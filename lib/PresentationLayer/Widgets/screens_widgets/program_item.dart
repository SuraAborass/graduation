import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/pragram.dart';
import '../../Screens/Public/view_image_screen.dart';


class ProgramItem extends StatelessWidget {
  const ProgramItem({super.key,required this.program});
final Program program;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: InkWell(
        onTap: (){
          Get.to(()=> ViewImageScreen(imageUrl: program.url));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: UIColors.primary, // نفس لون الخلفية
              width: 3.0, // سماكة الإطار
            ),
            borderRadius: BorderRadius.circular(20),
            color: UIColors.primary,
          ),
          width: 300,
          height: 350,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              program.url,
              fit: BoxFit.fill,
              //opacity: const AlwaysStoppedAnimation(.10),
            ),
          ),
        )
        ,
      ),
      subtitle: Center(
        child: Text(program.type,
          style: UITextStyle.titleBold.copyWith(color:UIColors.black),),
      ),
    );
  }
}
