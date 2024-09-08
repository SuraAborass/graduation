import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../DataAccessLayer/Models/advert.dart';
import '../../DataAccessLayer/Repositories/adverts_repo.dart';
import '../../PresentationLayer/Widgets/Public/snackbars.dart';

class OutUserAdvertsController extends GetxController{
  AdvertsRepo repo = AdvertsRepo();
  List<Advert> outAdverts = [];
  var loading = false.obs;
  var selecteGenderValue = ''.obs;
  var isSubmitting = false.obs;
  var isSubmitted = false.obs;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

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
        phoneController.text.isEmpty ||
        addressController.text.isEmpty ||
        selecteGenderValue.value.isEmpty) {
      SnackBars.showWarning("يجب تعبئة جميع الحقول");
      return false;
    }
    return true;
  }

  Future<void> submitForm(int courseId) async {
    if (!validateForm() || isSubmitted.value) return;

    isSubmitting.value = true;

    // طباعة المعلومات المرسلة للتأكد من صحة البيانات
    print("First Name: ${firstNameController.text}");
    print("Last Name: ${lastNameController.text}");
    print("Father Name: ${fatherNameController.text}");
    print("Gender: ${selecteGenderValue.value}");
    print("Phone: ${phoneController.text}");
    print("Address: ${addressController.text}");

    // استدعاء الميثود المناسبة لإرسال البيانات إلى الخادم
    var result = await repo.AddOrderToCourse(
      firstNameController.text,
      lastNameController.text,
      fatherNameController.text,
      selecteGenderValue.value,
      phoneController.text,
      addressController.text,
      courseId,
    );

    // تحقق من الاستجابة وتحديث حالة الإرسال
    if (result) {
      SnackBars.showSuccess("تم إرسال البيانات بنجاح");
      isSubmitted.value = true; // تعيين حالة الإرسال إلى true بعد النجاح
    } else {
      SnackBars.showError("فشل إرسال البيانات");
    }
    isSubmitting.value = false; // إعادة تعيين حالة الإرسال
  }

  @override
  void onInit() async {
    await getOutUserAdverts();
    super.onInit();
  }

  Future<void> getOutUserAdverts() async {
    loading.value = true;
    outAdverts = await repo.getOutUserAdverts();
    update();
    loading.value = false;
  }

}