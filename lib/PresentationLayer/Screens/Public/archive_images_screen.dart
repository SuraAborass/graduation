import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/Constants/colors.dart';
import '../../../BusinessLayer/Controllers/years_archive_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/screens_widgets/archive_image_item.dart';


class ArchiveImagesScreen extends StatelessWidget {
  ArchiveImagesScreen({super.key});
  final YearsArchiveController yearsArchiveController = Get.find();
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map;
    final String subjectId = args['subjectId'];
    final String year = args['year'];
    yearsArchiveController.getImages(subjectId, year);


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(title: Text("صور الأرشيف",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer:  InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
              init: yearsArchiveController,
              builder: (context) {
                return yearsArchiveController.loading.value
                    ? Center(child: CircularProgressIndicator())
                    : yearsArchiveController.images.isNotEmpty
                    ? SizedBox(
                  height: Get.height - 190,
                  child: ListView.builder(
                    itemCount: yearsArchiveController.images.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return ArchiveImageItem(
                          subjectImage:
                          yearsArchiveController.images[i]);
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
