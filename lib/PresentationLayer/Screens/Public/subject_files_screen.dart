import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../BusinessLayer/Controllers/subjects_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/screens_widgets/subject_file_item.dart';


class SubjectFilesScreen extends StatelessWidget {
  SubjectFilesScreen({super.key});

final SubjectsController subjectsController = Get.find();
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map;
    final subjectId = args['subjectId'];
    subjectsController.getSubjectFiles(subjectId.toString());

    return Scaffold(
      appBar: instituteAppBar(
        title: Text(
          "الملفات",
          style: UITextStyle.titleBold.copyWith(fontSize: 25),
        ),
      ),
      drawer: InstituteDrawer(),
      body: Obx(() {
        if (subjectsController.loading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: subjectsController.subjectFiles.length,
            itemBuilder: (context, index) {
              return SubjectFileItem(file: subjectsController.subjectFiles[index],);
            },
          );
        }
      }),
    );
  }
}
