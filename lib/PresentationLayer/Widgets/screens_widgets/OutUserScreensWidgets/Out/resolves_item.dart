import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/Constants/get_routes.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/text_styles.dart';

class ResolvesItem extends StatelessWidget {
  const ResolvesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: (){
          Get.toNamed(AppRoutes.resolves);
        },
        child: Container(
          height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: UIColors.babyRed,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // لضمان محاذاة الأيقونة مع النص
              children: [
                Expanded(flex: 1,
                    child: Icon(Icons.discount,
                        size: 40, color: UIColors.white)),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Text(
                    "الحسومات",
                    style: UITextStyle.titleBold.copyWith(fontSize: 25),
                    softWrap: true,
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
