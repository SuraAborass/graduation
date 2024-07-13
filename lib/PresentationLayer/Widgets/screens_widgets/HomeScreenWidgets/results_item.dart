import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/Constants/get_routes.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/text_styles.dart';

class ResultsItem extends StatelessWidget {
  const ResultsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.results);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: UIColors.result,
            ),
            width: 163,
            height: 114,
          ),
          Positioned( top: 15,right:20,
            child: Text('النتائج',
              style: UITextStyle.bodyNormal.copyWith(color: UIColors.white,fontSize: 25),),),
          Positioned(top: 50,right: 80,
              child: Container(height: 80, width: 110,
                decoration: const BoxDecoration(
                    color: UIColors.lightWhite,
                    borderRadius: BorderRadius. only(topRight: Radius.circular(25))
                ),
              )),
          const Positioned(top: 65,right:100,
              child: Icon(Icons.task_alt ,size: 35,color: UIColors.white,))
        ],
      ),
    );
  }
}
