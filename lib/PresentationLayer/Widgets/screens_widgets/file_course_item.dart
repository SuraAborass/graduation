import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/file_for_course.dart';
import '../../Screens/Public/view_image_screen.dart';

class FileCourseItem extends StatelessWidget {
  const FileCourseItem({super.key, required this.fileCourse});
  final FileCourse fileCourse;

  void _openFile(BuildContext context) async {
    if (fileCourse.url.endsWith('.jpg') || fileCourse.url.endsWith('.png')) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewImageScreen(imageUrl: fileCourse.url),
        ),
      );
    } else if (fileCourse.url.endsWith('.pdf')) {
      final url = fileCourse.url.startsWith('http') ? fileCourse.url : 'file://${fileCourse.url}';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    if (fileCourse.url.endsWith('.jpg') || fileCourse.url.endsWith('.png')) {
      iconData = Icons.image;
    } else if (fileCourse.url.endsWith('.pdf')) {
      iconData = Icons.picture_as_pdf;
    } else {
      iconData = Icons.insert_drive_file; // افتراضي لأي نوع ملف آخر
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: fileCourse.hasAttachment ? () => _openFile(context) : null,
        child: Container(
          width: 373,
          decoration: BoxDecoration(
            color: UIColors.homework,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Icon(
                  iconData,
                  color: UIColors.iconColor,
                  size: 40,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          fileCourse.description,
                          style: UITextStyle.titleBold,
                          //overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

