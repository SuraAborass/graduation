import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/teachers_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/screens_widgets/teacher_item.dart';

class TeachersScreen extends StatelessWidget {
   TeachersScreen({super.key});
final TeachersController teachersController =  Get.put(TeachersController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(title: Text("المدرّسين",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer:  InstituteDrawer(),
        body: GetBuilder(
            init: teachersController,
            builder: (context) {
              return SizedBox(
                height: Get.height-190,
                child: ListView.builder(
                  itemCount: teachersController.teachers.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i){
                    return  TeacherItem(teacher: teachersController.teachers[i],);
                  },
                ),
              );
            }
        ),
      ),
    );
  }
}
