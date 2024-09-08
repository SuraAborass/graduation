import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/courses_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';
import '../../Widgets/screens_widgets/file_course_item.dart';

class CourseFilesScreen extends StatelessWidget {
   CourseFilesScreen({super.key});
final CoursesController coursesController = Get.put(CoursesController());
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map;
    final courseId = args['courseId'];
    coursesController.getFilesForCourse(courseId);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
          title: Text(
            "الملفات الخاصة بالدورة",
            style: UITextStyle.titleBold.copyWith(fontSize: 25),
          ),
        ),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<CoursesController>(
            init: coursesController,
            builder: (context) {
              return coursesController.loading.value
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
                  await coursesController
                      .getFilesForCourse(courseId);
                },
                child: coursesController.filesCourses.isEmpty
                    ? SizedBox(
                  height: Get.height - 200,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          "لايوجد ملفات!",
                          style: UITextStyle.titleBold.copyWith(
                              fontSize: 16,
                              color: UIColors.lightBlack),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
                    : ListView.builder(
                  itemCount:
                  coursesController.filesCourses.length,
                  itemBuilder: (context, i) {
                    return FileCourseItem(
                      fileCourse: coursesController.filesCourses[i],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
