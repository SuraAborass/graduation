import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/discussions_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';
import '../../Widgets/discussion_item.dart';

class DiscussionsScreen extends StatelessWidget {
   DiscussionsScreen({super.key});
final DiscussionsController discussionsController = Get.put(DiscussionsController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
          title: Text(
            "المناقشات",
            style: UITextStyle.titleBold.copyWith(fontSize: 25),
          ),
        ),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<DiscussionsController>(
            init: discussionsController,
            builder: (context) {
              return discussionsController.loading.value
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
                  await discussionsController
                      .getDiscussions();
                },
                  child:  ListView.builder(
                  itemCount:
                  discussionsController.discussions.length,
                  itemBuilder: (context, i) {
                    return DiscussionItem(
                      discussion: discussionsController.discussions[i],
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
