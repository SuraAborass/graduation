import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/homework.dart';


class HomeworkItem extends StatelessWidget {
  const HomeworkItem({super.key,required this.homework});
  final Homework homework;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 373,
        height: 72,
        decoration:  BoxDecoration(
            color: UIColors.homework,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Icon(Icons.task,color: UIColors.iconColor,size: 40,),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                    padding:  EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            const SizedBox(width: 10,),
                            Text( homework.subjectName,
                                style: UITextStyle.titleBold),
                          ],),
                          Text( homework.description,
                            style: UITextStyle.titleBold,
                            overflow: TextOverflow.ellipsis,),
                        ])
                )),
          ],
        ),
      ),
    );
  }
}
