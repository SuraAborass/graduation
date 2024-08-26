import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/user_controller.dart'; // تغيير هنا
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final UserController userController = Get.put(UserController()); // تغيير هنا

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIColors.primary,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 90),
                alignment: Alignment.center,
                child: Text(
                  "مرحباً بعودتك!",
                  style: UITextStyle.titleBold.copyWith(fontSize: 25),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: Get.width / 2,
                  alignment: Alignment.center,
                  child: const Image(
                    image: AssetImage("assets/images/login_student.png"),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: userController.emailTextController, // تحديث هنا
                style: UITextStyle.titleBold.copyWith(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: UIColors.white,
                  border: const OutlineInputBorder(),
                  hintText: 'أدخل الايميل الخاص بك',
                  hintStyle: UITextStyle.normalSmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 2, color: UIColors.lightBlack),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: UIColors.gray),
                  ),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 10),
              Obx(() {
                return TextFormField(
                  controller: userController.passwordTextController, // تحديث هنا
                  style: UITextStyle.titleBold.copyWith(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: UIColors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        !userController.passwordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      color: UIColors.iconColor,
                      onPressed: () {
                        userController.togglePasswordVisible();
                      },
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'أدخل كلمة المرور',
                    hintStyle: UITextStyle.normalSmall,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 2, color: UIColors.lightBlack),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: UIColors.gray),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !userController.passwordVisible.value,
                  maxLines: 1,
                );
              }),
              const SizedBox(height: 40),
              Obx(() {
                return MaterialButton(
                  height: 56,
                  minWidth: Get.width,
                  color: UIColors.studentTime,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (userController.sending.value)
                        const CircularProgressIndicator(
                          color: UIColors.white,
                        ),
                      const Text('تسجيل الدخول', style: UITextStyle.titleBold),
                    ],
                  ),
                  onPressed: () {
                    userController.login();
                  },
                );
              }),
              const SizedBox(height: 10),
              Flexible(
                child: MaterialButton(
                  height: 56,
                  minWidth: Get.width,
                  color: UIColors.studentTime,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('طلب تسجيل', style: UITextStyle.titleBold),
                    ],
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.registration);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
