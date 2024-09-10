import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/about_us_controller.dart';
import '../../../BusinessLayer/Controllers/resolves_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/resolve_item.dart';

class ResolvesScreen extends StatelessWidget {
   ResolvesScreen({super.key});
final ResolvesController resolvesController = Get.put(ResolvesController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: instituteAppBar(title: Text("الحسومات",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        body: GetBuilder(
            init: resolvesController,
            builder: (context) {
              return resolvesController.loading.value
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
                  itemCount: resolvesController.resolves.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i){
                    return  ResolveItem(resolve: resolvesController.resolves[i],);
                  },
                ),
              );
            }
        ),
      ),
    );
  }
}
