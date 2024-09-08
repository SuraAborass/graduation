import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../Constants/colors.dart';
import '../../../../Constants/text_styles.dart';
import '../../../../DataAccessLayer/Models/fee.dart';

class FeeItem extends StatelessWidget {
  const FeeItem({super.key, required this.fee});
  final Fee fee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // إزالة الارتفاع الثابت للسماح للحاوية بأن تأخذ حجم محتواها
        width: double.infinity,
        decoration: BoxDecoration(
          color: UIColors.babyRed,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: FittedBox(
                fit: BoxFit.contain, // يمكنك استخدام BoxFit.fill أو BoxFit.cover أيضًا
                child: Icon(FontAwesomeIcons.moneyBill,
                    size: 40, color: UIColors.white),
              ),
            ),

            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // لضمان محاذاة النصوص على اليسار
                mainAxisAlignment: MainAxisAlignment.center, // لمحاذاة النصوص في وسط العمود
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "الصف: ${fee.className}",
                      style: UITextStyle.titleBold,
                      softWrap: true,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "المبلغ: ${fee.amount.toString()}",
                      style: UITextStyle.titleBold,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
