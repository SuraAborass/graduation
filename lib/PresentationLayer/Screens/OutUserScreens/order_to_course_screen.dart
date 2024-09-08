import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/ouUser_adverts_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';
import '../../Widgets/Public/AppBar.dart';
import '../../Widgets/Public/text_form_field.dart';


class OrderToCourseScreen extends StatelessWidget {
  OrderToCourseScreen({super.key});
  final OutUserAdvertsController registrationController = Get.put(OutUserAdvertsController());

  @override
  Widget build(BuildContext context) {
    // استلام courseId الممرر من الصفحة السابقة
    final int courseId = Get.arguments['courseId'];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: mainAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InstituteTextFormField(
                  hintText: 'الاسم الأول',
                  controller: registrationController.firstNameController,
                ),
                SizedBox(height: 10),
                InstituteTextFormField(
                  hintText: 'الاسم الأخير',
                  controller: registrationController.lastNameController,
                ),
                SizedBox(height: 10),
                InstituteTextFormField(
                  hintText: 'اسم الأب',
                  controller: registrationController.fatherNameController,
                ),
                SizedBox(height: 10),
                Obx(() => TextFormField(
                  decoration: textFieldStyle.copyWith(
                    suffixIcon: DropdownButton<String>(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: UIColors.primary,
                        size: 36,
                      ),
                      isExpanded: true,
                      hint: Text('الجنس',
                          style: UITextStyle.smallBodyNormal),
                      value: registrationController
                          .selecteGenderValue.value.isEmpty
                          ? null
                          : (registrationController.selecteGenderValue.value == '1'
                          ? 'ذكر'
                          : 'أنثى'),  // عرض القيم بناءً على 0 أو 1
                      items: ['ذكر', 'أنثى'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: UITextStyle.smallBodyNormal),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        registrationController.setGenderValue(newValue!);
                      },
                      iconSize: 0,
                      underline: SizedBox(),
                    ),
                  ),
                  controller: TextEditingController(
                      text: registrationController.selecteGenderValue.value == '1'
                          ? 'ذكر'
                          : 'أنثى'),  // عرض القيم بناءً على 0 أو 1
                )),
                SizedBox(height: 10),
                InstituteTextFormField(
                  hintText: 'رقم الهاتف',
                  controller: registrationController.phoneController,
                ),
                SizedBox(height: 10),
                InstituteTextFormField(
                  hintText: 'العنوان',
                  controller: registrationController.addressController,
                ),
                SizedBox(height: 20),
                Obx(() => MaterialButton(
                  height: 56,
                  minWidth: Get.width,
                  color: UIColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: registrationController.isSubmitting.value
                      ? CircularProgressIndicator(
                    color: UIColors.secondary,
                  )
                      : registrationController.isSubmitted.value
                      ? Text('تم إرسال الطلب، راجع إدارة المعهد', style: UITextStyle.titleBold.copyWith(color: UIColors.primary))
                      : Text('حفظ', style: UITextStyle.titleBold),
                  onPressed: registrationController.isSubmitting.value ||
                      registrationController.isSubmitted.value
                      ? null
                      : () {
                    // استخدام courseId الممرر هنا
                    registrationController.submitForm(courseId);
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

