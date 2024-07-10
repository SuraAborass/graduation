import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/Constants/colors.dart';
import '../../../BusinessLayer/Controllers/years_archive_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/YearArchive.dart';
import '../../Screens/Public/archive_files_screen.dart';
import '../../Screens/Public/archive_images_screen.dart';
import '../../Screens/Public/subject_files_screen.dart';

class YearArchiveItem extends StatelessWidget {
  const YearArchiveItem({super.key, required this.yearArchive});
  final YearArchive yearArchive;

  @override
  Widget build(BuildContext context) {
    void _onFilesTap(BuildContext context) async {
      // الحصول على المعرفات المطلوبة
      String subjectId = yearArchive.subjectId.toString();
      String year = yearArchive.year;

      // استدعاء تابع getFiles من الكونترولر
      final controller = Get.find<YearsArchiveController>();
      await controller.getFiles(subjectId, year);

      // الانتقال إلى صفحة الملفات بعد جلب الملفات بنجاح
      Get.to(() => ArchiveFilesScreen(), arguments: {'subjectId': subjectId, 'year': year});
    }

    void _onImagesTap(BuildContext context) async {
      String subjectId = yearArchive.subjectId.toString();
      String year = yearArchive.year;
      final controller = Get.find<YearsArchiveController>();
      await controller.getImages(subjectId, year);
      Get.to(() => ArchiveImagesScreen(), arguments: {'subjectId': subjectId, 'year': year});
    }

    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: 'ملحقات المادة',
          titleStyle: UITextStyle.titleBold.copyWith(color: UIColors.black),
          content: Column(
            children: [
              ListTile(
                title: Text(
                  "الصور",
                  style: UITextStyle.titleBold.copyWith(color: UIColors.black),
                  textDirection: TextDirection.rtl,
                ),
                onTap: () {
                  _onImagesTap(context);
                },
              ),
              ListTile(
                title: Text(
                  "الملفات",
                  style: UITextStyle.titleBold.copyWith(color: UIColors.black),
                  textDirection: TextDirection.rtl,
                ),
                onTap: () => _onFilesTap(context),
              ),
            ],
          ),
        );
      },
      child: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.folder,
              size: 150,
              color: UIColors.gray,
            ),
          ),
          Positioned(
            top: 70,
            bottom: 50,
            right: 60,
            child: Text(
              yearArchive.year,
              style: UITextStyle.titleBold.copyWith(
                fontSize: 25,
                color: UIColors.lightBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
