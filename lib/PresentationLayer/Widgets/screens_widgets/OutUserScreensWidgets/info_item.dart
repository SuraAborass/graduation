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
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10), // إضافة padding حول النص
            decoration: BoxDecoration(
              color: UIColors.yellow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // لضمان محاذاة الأيقونة مع النص
              children: [
                Icon(Icons.stars, size: 30, color: UIColors.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    institute.name,
                    style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                    softWrap: true, // لضمان أن النص يتجزأ على الأسطر الجديدة إذا كان طويلًا
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center, // لضمان محاذاة الأيقونة مع النص
            children: [
              Icon(Icons.info, size: 30, color: UIColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  institute.description,
                  style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                  softWrap: true,
                ),
              ),
            ],
          ),
          const Divider(color: UIColors.primary, thickness: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center, // لضمان محاذاة الأيقونة مع النص
            children: [
              Icon(Icons.phone_android, size: 30, color: UIColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "رقم الموبايل: ${institute.phone1}",
                  style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center, // لضمان محاذاة الأيقونة مع النص
            children: [
              Icon(Icons.phone, size: 30, color: UIColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "رقم الأرضي: ${institute.phone2}",
                  style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                  softWrap: true,
                ),
              ),
            ],
          ),
          const Divider(color: UIColors.primary, thickness: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center, // لضمان محاذاة الأيقونة مع النص
            children: [
              Icon(Icons.location_pin, size: 30, color: UIColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "العنوان: ${institute.address}",
                  style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                  softWrap: true,
                ),
              ),
            ],
          ),
          const Divider(color: UIColors.primary, thickness: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final url = institute.facebookLink;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Icon(
                  Ionicons.logo_facebook,
                  size: 30,
                  color: UIColors.primary,
                ),
              ),
              const SizedBox(width: 10),
              Icon(Ionicons.logo_linkedin, size: 30, color: UIColors.primary),
              const SizedBox(width: 10),
              Icon(Ionicons.logo_whatsapp, size: 30, color: UIColors.primary),
              const SizedBox(width: 10),
              Icon(Ionicons.logo_youtube, size: 30, color: UIColors.primary),
            ],
          ),
        ],
      ),
    );
  }
}
