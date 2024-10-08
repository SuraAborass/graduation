import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/about_us_controller.dart';
import '../../../BusinessLayer/Controllers/fees_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/fee_item.dart';


class FeesScreen extends StatelessWidget {
   FeesScreen({super.key});
  final FeesController feesController = Get.put(FeesController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: instituteAppBar(title: Text("الأقساط",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        body: GetBuilder(
            init: feesController,
            builder: (context) {
              return feesController.loading.value
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
                  itemCount: feesController.fees.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i){
                    return  FeeItem(fee: feesController.fees[i],);
                  },
                ),
              );
            }
        ),
      ),
    );
  }
}
