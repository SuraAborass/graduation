import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/Constants/colors.dart';
import 'package:graduation/Constants/get_routes.dart';
import '../../Constants/text_styles.dart';
import '../../DataAccessLayer/Models/discussion.dart';

class DiscussionItem extends StatelessWidget {
  const DiscussionItem({super.key, required this.discussion});
  final Discussion discussion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.oneDiscussion);
        },
        child: Container(
          width: 373,
          decoration: BoxDecoration(
            color: UIColors.yellow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 66,
                height: 64,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Icon(
                  Icons.quiz,
                  color: UIColors.white,
                  size: 40,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Adjust the alignment to the start
                  children: [
                    Text(
                      "مناقشة " + discussion.subjectName,
                      style: UITextStyle.titleBold,
                    ),
                    SizedBox(height: 5),
                    Text("المدرّس"+" "+
                      discussion.teacherFirstName + " " + discussion.teacherLastName,
                      style: UITextStyle.titleNormal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
