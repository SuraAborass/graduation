import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/years_archive_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';
import '../../Widgets/screens_widgets/year_archive_item.dart';

class YearsArchiveScreen extends StatelessWidget {
   YearsArchiveScreen({super.key});
final YearsArchiveController yearsArchiveController = Get.put(YearsArchiveController());
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map;
    final subjectId = args['subjectId'];
    yearsArchiveController.getYears(subjectId.toString());

    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
          title: Text(
            " السنوات الماضية",
            style: UITextStyle.titleBold.copyWith(fontSize: 25),
          ),
        ),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<YearsArchiveController>(
            init: yearsArchiveController,
            builder: (context) {
              return yearsArchiveController.loading.value
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
                  await yearsArchiveController
                      .getYears(subjectId.toString());
                },
                child: yearsArchiveController.years.isEmpty
                    ? SizedBox(
                  height: Get.height - 200,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          "لايوجد أرشيف!",
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
                  height: Get.height-190,
                      child: GridView.builder(
                                        itemCount:
                                        yearsArchiveController.years.length,
                                        itemBuilder: (context, i) {
                      return YearArchiveItem(
                        yearArchive: yearsArchiveController.years[i],
                      );
                                        },
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                                      ),
                    ),
              );
            },
          ),
        ),
      ),
    );
  }
}
