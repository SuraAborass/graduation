import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/subject_file.dart';

class SubjectFileItem extends StatelessWidget {
  const SubjectFileItem({super.key, required this.file});
  final SubjectFile file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 373,
        decoration: BoxDecoration(
          color: UIColors.gray.withOpacity(.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () async {
            if (await canLaunch(file.fileUrl)) {
              await launch(file.fileUrl);
            } else {
              throw 'Could not launch ${file.fileUrl}';
            }
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Icon(
                  Icons.picture_as_pdf,
                  color: UIColors.error,
                  size: 50,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.name,
                        style: UITextStyle.titleNormal.copyWith(color: UIColors.lightBlack),
                      ),
                      SizedBox(height: 5),
                      Text(
                        file.description,
                        style: UITextStyle.titleNormal.copyWith(color: UIColors.lightBlack),
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
