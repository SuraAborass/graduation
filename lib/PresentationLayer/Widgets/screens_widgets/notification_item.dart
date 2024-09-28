import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/notification.dart';


class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key,required this.userNotification});
  final UserNotification userNotification;
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
              decoration:  BoxDecoration(
                color:UIColors.gray.withOpacity(.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Icon(Icons.notifications,size: 35,color: UIColors.yellow,),
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
                        Text(userNotification.title,
                            style: UITextStyle.titleBold
                                .apply(color: UIColors.black)),
                        Text(userNotification.body,
                            style: UITextStyle.titleNormal
                                .apply(color: UIColors.gray,fontSizeFactor: .8),
                          overflow: TextOverflow.ellipsis,),
                        Text(userNotification.createdAt,
                            style: UITextStyle.smallBodyNormal
                                .apply(fontSizeFactor: .5)),
                      ]),
                )),
          ],
        ));
  }
}
