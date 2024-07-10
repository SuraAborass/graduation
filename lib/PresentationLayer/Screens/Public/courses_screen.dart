import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/courses_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';
import '../../Widgets/screens_widgets/course_item.dart';

class CoursesScreen extends StatelessWidget {
   CoursesScreen({super.key});
final CoursesController coursesController = Get.put(CoursesController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
            title: Text("دوراتي",
                style: UITextStyle.titleBold.copyWith(fontSize: 20))),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder(
              init: coursesController,
              builder: (context) {
                return coursesController.loading.value == true
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
                    coursesController.getCourses();
                  },
                  child: coursesController.courses.isEmpty
                      ? SizedBox(
                    height: Get.height - 200,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Text(
                            "لايوجد كورسات مسجل بها بعد!",
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
                      itemCount: coursesController.courses.length,
                      itemBuilder: (context, i) {
                        return CourseItem(
                          course: coursesController.courses[i],
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
