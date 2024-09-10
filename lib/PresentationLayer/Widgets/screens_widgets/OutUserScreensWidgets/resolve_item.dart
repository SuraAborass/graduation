import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/text_styles.dart';
import '../../../../DataAccessLayer/Models/resolve.dart';

class ResolveItem extends StatelessWidget {
  const ResolveItem({super.key, required this.resolve});
  final Resolve resolve;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: UIColors.babyRed,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // أيقونة الخصم
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Icon(Icons.discount, size: 40, color: UIColors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "الحسومات المتاحة",
                      style: UITextStyle.titleBold.copyWith(fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
            // عرض الحسومات
            if (resolve.resolveMartyr.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: UIColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "حسم أبناء الشهداء: ${resolve.resolveMartyr}",
                      style: UITextStyle.bodyNormal.copyWith(fontSize: 20,color: UIColors.yellow),
                    ),
                  ),
                ),
              ),
            if (resolve.resolveBrother.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: UIColors.primary,
                    borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "حسم الإخوة: ${resolve.resolveBrother}",
                      style: UITextStyle.bodyNormal.copyWith(fontSize: 20,color: UIColors.yellow ),
                    ),
                  ),
                ),
              ),
            if (resolve.resolveSonTeacher.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: UIColors.primary,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "حسم أبناء المعلمين: ${resolve.resolveSonTeacher}",
                      style: UITextStyle.bodyNormal.copyWith(fontSize: 20,color: UIColors.yellow),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
