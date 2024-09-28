import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/notifications_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';
import '../../Widgets/screens_widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
   NotificationsScreen({super.key});
final UserNotificationsController userNotificationsController =
    Get.put(UserNotificationsController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(title: Text("الإشعارات",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer:  InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder(
              init: userNotificationsController,
              builder: (context) {
                return userNotificationsController.loading.value == true
                    ? SizedBox(
                  height: Get.height - 250,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return const HomeworkShimmer();
                    },
                  ),
                )
                    : RefreshIndicator(
                  onRefresh: () async {
                    userNotificationsController.getUserNotifications();
                  },
                  child: userNotificationsController.userNotifications.isEmpty
                      ? SizedBox(
                    height: Get.height - 200,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Text(
                            "لايوجد إشعارات!",
                            style: UITextStyle.titleBold.copyWith(
                                fontSize: 16,
                                color: UIColors.lightBlack),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                      : SizedBox(
                    height: Get.height - 170,
                    child: ListView.builder(
                      itemCount: userNotificationsController.userNotifications.length,
                      itemBuilder: (context, i) {
                        return NotificationItem(
                          userNotification: userNotificationsController.userNotifications[i],
                        );
                      },
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
