import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/about_us_controller.dart';
import '../../../Constants/colors.dart';
import '../../Widgets/Public/AppBar.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/info_item.dart';

class GeneralInfoScreen extends StatelessWidget {
  GeneralInfoScreen({super.key});
  final AboutUsController aboutUsController = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: UIColors.white,
        appBar: mainAppBar(context),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false, // إخفاء إشارة الرجوع
              expandedHeight: 250.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Center(
                  child: Image.asset(
                    'assets/images/school icon.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            GetBuilder(
              init: aboutUsController,
              builder: (context) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, i) {
                      return InfoItem(institute: aboutUsController.infos[i]);
                    },
                    childCount: aboutUsController.infos.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
