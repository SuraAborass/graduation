import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/general_info_controller.dart';
import '../../../Constants/colors.dart';
import '../../Widgets/Public/AppBar.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/info_item.dart';

class GeneralInfoScreen extends StatelessWidget {
  GeneralInfoScreen({super.key});
  final GeneralInfoController generalInfoController = Get.put(GeneralInfoController());

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
              init: generalInfoController,
              builder: (context) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, i) {
                      return InfoItem(institute: generalInfoController.infos[i]);
                    },
                    childCount: generalInfoController.infos.length,
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
