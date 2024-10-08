import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/teachers_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/teacher_item.dart';

class TeachersScreen extends StatelessWidget {
   TeachersScreen({super.key});
final TeachersController teachersController =  Get.put(TeachersController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: instituteAppBar(title: Text("المدرّسين",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        body: GetBuilder(
            init: teachersController,
            builder: (context) {
              return teachersController.loading.value
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
                  : SizedBox(
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
