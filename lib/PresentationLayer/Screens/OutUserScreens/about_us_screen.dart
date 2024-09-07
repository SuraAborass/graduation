import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/about_us_controller.dart';
import '../../../Constants/colors.dart';
import '../../Widgets/Public/AppBar.dart';
import '../../Widgets/screens_widgets/OutUserScreensWidgets/info_item.dart';

class AboutUsScreen extends StatelessWidget {
   AboutUsScreen({super.key});
final AboutUsController aboutUsController = Get.put(AboutUsController());
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: UIColors.white,
        appBar: mainAppBar(context),
       // extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Center(child: Image.asset('assets/images/school icon.png',height: 200,width: 200,)),
            GetBuilder(
                init: aboutUsController,
                builder: (context) {
                  return SizedBox(
                    height: Get.height-300,
                    child: ListView.builder(
                      itemCount: aboutUsController.infos.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i){
                        return  InfoItem(institute: aboutUsController.infos[i],);
                      },
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
