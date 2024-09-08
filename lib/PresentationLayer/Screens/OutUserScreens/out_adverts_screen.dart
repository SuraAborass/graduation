import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/ouUser_adverts_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/out_advert_item.dart';
import '../../Widgets/screens_widgets/advert_item.dart';

class OutAdvertsScreen extends StatelessWidget {
  OutAdvertsScreen({super.key});
  final OutUserAdvertsController outUserAdvertsController = Get.put(OutUserAdvertsController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: instituteAppBar(
            title: Text("الإعلانات",
                style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
              init: outUserAdvertsController,
              builder: (context) {
                if (outUserAdvertsController.loading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: outUserAdvertsController.outAdverts.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return OutAdvertItem(advert: outUserAdvertsController.outAdverts[i]);
                    },
                  );
                }
              }),
        ),
      ),
    );
  }
}
