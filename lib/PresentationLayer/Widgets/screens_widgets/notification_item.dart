import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';


class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: Get.width,
        height: 80,
        decoration: BoxDecoration(
          color: UIColors.gray.withOpacity(.2),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 65,
              height: 65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/teacher-ph.jpg")),
                color: UIColors.secondary,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("نوع الإشعار",
                            style: UITextStyle.titleBold
                                .apply(color: UIColors.black)),
                        Text("الوصف حيث يمكن أن يكون إشعار بوظيفة أو نتيجة أي أي شيء",
                            style: UITextStyle.titleNormal
                                .apply(color: UIColors.gray,fontSizeFactor: .8),
                          overflow: TextOverflow.ellipsis,),
                        Text("منذ دقيقتين",
                            style: UITextStyle.smallBodyNormal
                                .apply(fontSizeFactor: .5)),
                      ]),
                )),
          ],
        ));
  }
}
