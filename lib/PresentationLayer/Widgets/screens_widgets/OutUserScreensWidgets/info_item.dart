import 'package:flutter/material.dart';
import 'package:graduation/Constants/colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Constants/text_styles.dart';
import '../../../../DataAccessLayer/Models/institute.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key, required this.institute});
  final Institute institute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info, size: 30, color: UIColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "${institute.description}",
                  style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                ),
              ),
            ],
          ),
          Text(
            "___________________________________",
            style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.phone, size: 30, color: UIColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "رقم الهاتف: ${institute.phone}",
                  style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                ),
              ),
            ],
          ),
          Text(
            "___________________________________",
            style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_pin, size: 30, color: UIColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "العنوان: ${institute.address}",
                  style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                ),
              ),
            ],
          ),
          Text(
            "___________________________________",
            style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final url = institute.facebookLink; // رابط الفيسبوك القادم من البيانات
                  if (await canLaunch(url)) {
                    await launch(url); // فتح الرابط باستخدام url_launcher
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Icon(
                  Ionicons.logo_facebook, // أيقونة الفيسبوك
                  size: 30,
                  color: UIColors.primary,
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                Ionicons.logo_linkedin, // أيقونة الفيسبوك
                size: 30,
                color: UIColors.primary,
              ),
              const SizedBox(width: 10),
              Icon(
                Ionicons.logo_whatsapp, // أيقونة الفيسبوك
                size: 30,
                color: UIColors.primary,
              ),
              const SizedBox(width: 10),
              Icon(
                Ionicons.logo_youtube, // أيقونة الفيسبوك
                size: 30,
                color: UIColors.primary,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
