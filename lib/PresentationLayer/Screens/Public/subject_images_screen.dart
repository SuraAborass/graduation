import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/Constants/colors.dart';
import '../../../BusinessLayer/Controllers/subjects_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/screens_widgets/subject_image_item.dart';

class SubjectImagesScreen extends StatelessWidget {
   SubjectImagesScreen({super.key});
final SubjectsController subjectsController = Get.find();
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map;
    final subjectId = args['subjectId'];
    subjectsController.getSubjectImages(subjectId.toString());


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(title: Text("الصور",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer:  InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
              init: subjectsController,
              builder: (context) {
                return subjectsController.loading.value
                    ? Center(child: CircularProgressIndicator())
                    : subjectsController.subjectImages.isNotEmpty
                    ? SizedBox(
                  height: Get.height - 190,
                  child: ListView.builder(
                    itemCount: subjectsController.subjectImages.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return SubjectImageItem(
                          subjectImage:
                          subjectsController.subjectImages[i]);
                    },
                  ),
                )
                    : Center(
                  child: Text("لا يوجد صور لعرضها!",
                    style: UITextStyle.titleBold.copyWith(color: UIColors.black),),
                );
              }
          ),
        ),
      ),
    );
  }
}
