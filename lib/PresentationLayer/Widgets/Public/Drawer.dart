import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/user_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import '../../../main.dart';

class InstituteDrawer extends StatelessWidget {
   InstituteDrawer({super.key});
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: UIColors.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: UIColors.secondary),
            accountName: Text(
                MyApp.appUser != null ? MyApp.appUser!.firstName+" "+MyApp.appUser!.lastName :
                "اسم الطالب",
                style: UITextStyle.titleBold.copyWith(color: UIColors.white)),
            accountEmail: Text(
                MyApp.appUser != null ? MyApp.appUser!.email :
                "email@gmail.com",
                style: UITextStyle.bodyNormal
                    .copyWith(color: UIColors.white.withOpacity(.5))),
            currentAccountPicture: const CircleAvatar(
              //backgroundImage: NetworkImage(MyApp.appUser!.image),
              backgroundColor: UIColors.primary,
            ),
          ),
          ListTile(
              leading: const Icon(
                Icons.login,
                color: UIColors.white,
                size: 30,
              ),
              title: Text('طلب تسجيل طالب جديد',
                  style:
                  UITextStyle.titleNormal.copyWith(color: UIColors.white)),
              onTap: () => Get.toNamed(AppRoutes.registration)),
          ListTile(
              leading: const Icon(
                Icons.auto_stories,
                color: UIColors.white,
                size: 30,
              ),
              title: Text('المواد',
                  style:
                  UITextStyle.titleNormal.copyWith(color: UIColors.white)),
              onTap: () => Get.toNamed(AppRoutes.subjects)),
          //if (MyApp.appUser != null)
            ListTile(
              onTap: () async {
                await userController.logout();
              },
              leading: const Icon(
                Icons.logout,
                color: UIColors.white,
                size: 30,
              ),
              title: Text(
                "تسجيل الخروج",
                style: UITextStyle.titleNormal.copyWith(color: UIColors.white),
              ),
            ),
        ],
      ),
    );
  }
}
