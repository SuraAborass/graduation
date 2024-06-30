import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import '../../../main.dart';

class InstituteBottomNavigationBar extends StatelessWidget {
  const InstituteBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: MyApp.currentPage,
      onTap: (index) {
        MyApp.currentPage = index;
        switch (index) {
          case 0:
            Get.toNamed(AppRoutes.homeScreen);
            break;
          case 1:
            Get.toNamed(AppRoutes.notifications);
            break;
          case 2:
            //Get.toNamed(AppRoutes.program);
            break;
          case 3:
            Get.toNamed(AppRoutes.profile);
            break;
          default:
        }
      },
      backgroundColor: UIColors.secondary,
      selectedItemColor: UIColors.white,
      unselectedItemColor: UIColors.white.withOpacity(.5),
      selectedFontSize: 16,
      unselectedFontSize: 16,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: UITextStyle.boldSmall,
      unselectedLabelStyle: UITextStyle.normalSmall,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 35,
          ),
          label: "الرئيسية",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, size: 35),
          label: "الإشعارات",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, size: 35),
          label: "المناقشات",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 35),
          label: "الملف الشخصي",
        ),
      ],
    );
  }
}
