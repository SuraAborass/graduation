import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/text_styles.dart';
import '../../../../DataAccessLayer/Models/teacher.dart';

class TeacherItem extends StatelessWidget {
  const TeacherItem({super.key, required this.teacher});
  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: UIColors.iconColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/teacher-ph.jpg"),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          "الاستاذ: ${teacher.firstName + " " + teacher.lastName}",
                          style: UITextStyle.titleBold.copyWith(
                            color: UIColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text("المادة: ${teacher.subjectName}",
                          style: UITextStyle.titleBold.copyWith(
                            color: UIColors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
