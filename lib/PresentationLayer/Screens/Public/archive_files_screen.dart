import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../BusinessLayer/Controllers/years_archive_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/screens_widgets/archive_file_item.dart';

class ArchiveFilesScreen extends StatelessWidget {
  ArchiveFilesScreen({super.key});

  final YearsArchiveController yearsArchiveController = Get.find();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map;
    final String subjectId = args['subjectId'];
    final String year = args['year'];

    yearsArchiveController.getFiles(subjectId, year);

    return Scaffold(
      appBar: instituteAppBar(
        title: Text(
          "ملفات الأرشيف",
          style: UITextStyle.titleBold.copyWith(fontSize: 25),
        ),
      ),
      drawer: InstituteDrawer(),
      body: Obx(() {
        if (yearsArchiveController.loading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: yearsArchiveController.files.length,
            itemBuilder: (context, index) {
              return ArchiveFileItem(file: yearsArchiveController.files[index]);
            },
          );
        }
      }),
    );
  }
}
