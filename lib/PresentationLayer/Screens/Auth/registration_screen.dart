import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/PresentationLayer/Widgets/Public/text_form_field.dart';

import '../../../BusinessLayer/Controllers/registration_order_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';
import '../../Widgets/Public/AppBar.dart';

class RegistrationOrderScreen extends StatefulWidget {
   RegistrationOrderScreen({super.key});


  @override
  State<RegistrationOrderScreen> createState() => _RegistrationOrderScreenState();
}

class _RegistrationOrderScreenState extends State<RegistrationOrderScreen> {
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
               const InstituteTextFormField(
                  hintText: 'الاسم الأول',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'الاسم الأخير',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'اسم الأب',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'اسم الأم',
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => TextFormField(
                  decoration: textFieldStyle.copyWith(
                    suffixIcon: DropdownButton<String>(
                      icon: const Icon(Icons.arrow_drop_down,color: UIColors.primary,size: 36,),
                      isExpanded: true,
                      // iconEnabledColor: UIColors.primary,
                      hint: const Text('الجنس',style: UITextStyle.smallBodyNormal,),
                      value: registrationController.selecteGenderValue.value.isEmpty ? null : registrationController.selecteGenderValue.value,
                      items: ['ذكر', 'أنثى'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: UITextStyle.smallBodyNormal,),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        registrationController.setGenderValue(newValue!);
                      },
                      // لمنع القائمة المنسدلة من تمديد عرضها
                      iconSize: 0,
                      underline: SizedBox(),
                    ),
                  ),
                  controller: TextEditingController(text: registrationController.selecteGenderValue.value),
                )),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: '(YY-MM-DD)تاريخ الميلاد',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'رقم الهاتف',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'العنوان',
                ),
                const SizedBox(
                  height: 10,
                ),
            Obx(() => TextFormField(
              decoration: textFieldStyle.copyWith(
                suffixIcon: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down,color: UIColors.primary,size: 36,),
                 isExpanded: true,
                 // iconEnabledColor: UIColors.primary,
                  hint: const Text(' اختر الصف',style: UITextStyle.smallBodyNormal,),
                  value: registrationController.selecteGradeValue.value.isEmpty ? null : registrationController.selecteGradeValue.value,
                  items: ['الصف التاسع', 'البكالوريا العلمي', 'البكالوريا الأدبي'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: UITextStyle.smallBodyNormal,),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    registrationController.setGradeValue(newValue!);
                  },
                  // لمنع القائمة المنسدلة من تمديد عرضها
                  iconSize: 0,
                  underline: SizedBox(),
                ),
              ),
              controller: TextEditingController(text: registrationController.selecteGradeValue.value),
            )),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'رقم الهاتف',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InstituteTextFormField(
                  hintText: 'العنوان',
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    height: 56,
                    minWidth: Get.width,
                    color: UIColors.primary,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20.0))),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text('حفظ', style: UITextStyle.titleBold)
                      ],
                    ),
                    onPressed: () {},
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
