import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/Constants/get_routes.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/text_styles.dart';
import '../../../../DataAccessLayer/Models/program.dart';

class ProgramItem extends StatelessWidget {
  const ProgramItem({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Get.toNamed(AppRoutes.program);},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: UIColors.studentTime,
            ),
            width: 163,
            height: 114,
          ),
          Positioned( top: 15,right:20,
            child: Text('برنامج الدوام',
              style: UITextStyle.bodyNormal.copyWith(color: UIColors.white,fontSize: 23),),),
          Positioned(top: 50,right: 80,
              child: Container(height: 80, width: 110,
                decoration: const BoxDecoration(
                    color: UIColors.lightWhite,
                    borderRadius: BorderRadius. only(topRight: Radius.circular(25))
                ),
              )),
          const Positioned(top: 65,right:100,
              child: Icon(Icons.checklist_rtl,size: 38,color: UIColors.white,))
        ],
      ),
    );
  }
}
