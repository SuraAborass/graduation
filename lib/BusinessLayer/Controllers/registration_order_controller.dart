import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../DataAccessLayer/Repositories/registration_order_repo.dart';

class RegistrationOrderController extends GetxController {
  RegistrationOrderRepo repo = RegistrationOrderRepo();

  var selecteGradeValue = ''.obs;
  var selecteGenderValue = ''.obs;
  var isSubmitting = false.obs;
  var isSubmitted = false.obs; // مؤشر لتتبع حالة الإرسال

  // إضافة المتحكمات للحفاظ على قيمة كل حقل
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final yearController = TextEditingController(); // حقل إدخال السنة

  void setGradeValue(String value) {
    selecteGradeValue.value = value;
  }

  void setGenderValue(String value) {
    if (value == 'ذكر') {
      selecteGenderValue.value = '1';
    } else if (value == 'أنثى') {
      selecteGenderValue.value = '0';
    }
  }


  bool validateForm() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        fatherNameController.text.isEmpty ||
        birthDateController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty ||
        yearController.text.isEmpty || // تحقق من تعبئة حقل السنة
        selecteGradeValue.value.isEmpty ||
        selecteGenderValue.value.isEmpty) {
      Get.snackbar(
        "خطأ",
        "يجب تعبئة جميع الحقول",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  Future<void> submitForm() async {
    if (!validateForm() || isSubmitted.value) return;

    isSubmitting.value = true;

    // طباعة المعلومات المرسلة للتأكد من صحة البيانات
    print("First Name: ${firstNameController.text}");
    print("Last Name: ${lastNameController.text}");
    print("Father Name: ${fatherNameController.text}");
    print("Birth Date: ${birthDateController.text}");
    print("Gender: ${selecteGenderValue.value}");
    print("Phone: ${phoneController.text}");
    print("Address: ${addressController.text}");
    print("Grade: ${selecteGradeValue.value}");
    print("Year: ${yearController.text}");


      // استدعاء الميثود المناسبة لإرسال البيانات إلى الخادم
      var result = await repo.registrationOrder(
        firstNameController.text,
        lastNameController.text,
        fatherNameController.text,
        birthDateController.text,
        selecteGenderValue.value,
        phoneController.text,
        addressController.text,
        selecteGradeValue.value,
        yearController.text, // إرسال قيمة السنة
      );

      // تحقق من الاستجابة وتحديث حالة الإرسال
      if (result != null) {
        Get.snackbar(
          "نجاح",
          "تم إرسال البيانات بنجاح",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        isSubmitted.value = true; // تعيين حالة الإرسال إلى true بعد النجاح
      } else {
        Get.snackbar(
          "خطأ",
          "فشل إرسال البيانات",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      isSubmitting.value = false; // إعادة تعيين حالة الإرسال

  }




  Future<void> selectBirthDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      birthDateController.text = picked.toString().split(' ')[0]; // التنسيق YYYY-MM-DD
    }
  }
}
