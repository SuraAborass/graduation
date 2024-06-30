import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/PresentationLayer/Widgets/screens_widgets/program_item.dart';
import '../../../BusinessLayer/Controllers/program_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';


class ProgramScreen extends StatelessWidget {
   ProgramScreen({super.key});
final ProgramController programController = Get.put(ProgramController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(title: Text("البرنامج",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer:  InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
              init: programController,
              builder: (context) {
                return programController.loading.value
                    ? Center(child: CircularProgressIndicator())
                    : programController.programs.isNotEmpty
                    ? SizedBox(
                  height: Get.height - 190,
                  child: ListView.builder(
                    itemCount: programController.programs.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return ProgramItem(
                          program: programController.programs[i]);
                    },
                  ),
                )
                    : Center(
                  child: Text("لا يوجد برنامج!",
                    style: UITextStyle.titleBold.copyWith(color: UIColors.black),),
                );
              }
          ),
        ),
      ),
    );
  }
}
