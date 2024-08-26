import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';
import '../../Widgets/Public/AppBar.dart';
import '../../../BusinessLayer/Controllers/registration_order_controller.dart';
import '../../Widgets/Public/text_form_field.dart';

class RegistrationOrderScreen extends StatelessWidget {
  final RegistrationOrderController registrationController =
  Get.put(RegistrationOrderController());

  @override
  Widget build(BuildContext context) {
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
                TextFormField(
                  controller: registrationController.birthDateController,
                  decoration: textFieldStyle.copyWith(
                    hintText: ' تاريخ الميلاد',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today, color: UIColors.primary),
                      onPressed: () {
                        registrationController.selectBirthDate(context);
                      },
                    ),
                  ),
                  readOnly: true,
                ),
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
                SizedBox(height: 10),
                InstituteTextFormField(
                  hintText: 'السنة الدراسية', // حقل إدخال السنة
                  controller: registrationController.yearController,
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
                Obx(() => TextFormField(
                  decoration: textFieldStyle.copyWith(
                    suffixIcon: DropdownButton<String>(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: UIColors.primary,
                        size: 36,
                      ),
                      isExpanded: true,
                      hint: Text('اختر الصف',
                          style: UITextStyle.smallBodyNormal),
                      value: registrationController
                          .selecteGradeValue.value.isEmpty
                          ? null
                          : registrationController.selecteGradeValue.value,
                      items: [
                        'الصف التاسع',
                        'البكالوريا العلمي',
                        'البكالوريا الأدبي'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: UITextStyle.smallBodyNormal),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        registrationController.setGradeValue(newValue!);
                      },
                      iconSize: 0,
                      underline: SizedBox(),
                    ),
                  ),
                  controller: TextEditingController(
                      text: registrationController.selecteGradeValue.value),
                )),
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
                    color: Colors.white,
                  )
                      : registrationController.isSubmitted.value
                      ? Text('تم إرسال الطلب', style: UITextStyle.titleBold.copyWith(color: UIColors.primary))
                      : Text('حفظ', style: UITextStyle.titleBold),
                  onPressed: registrationController.isSubmitting.value ||
                      registrationController.isSubmitted.value
                      ? null
                      : () {
                    registrationController.submitForm();
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
