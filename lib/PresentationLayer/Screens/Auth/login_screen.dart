import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/login_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
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
                margin: const EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                child: Text("مرحباً بعودتك!",
                    style: UITextStyle.titleBold.copyWith(fontSize: 25)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: UIColors.primary,
                  backgroundImage:
                      AssetImage("assets/images/schoolchildren.png"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: UITextStyle.titleBold.copyWith(color: Colors.black),
                //controller: loginController.phoneTextController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: UIColors.white,
                  border: const OutlineInputBorder(),
                  hintText: 'أدخل رقم هاتفك',
                  hintStyle: UITextStyle.normalSmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: UIColors.lightBlack),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: UIColors.gray)),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              Obx(() {
                return TextFormField(
                  style: UITextStyle.titleBold.copyWith(color: Colors.black),
                  //controller: loginController.passwordTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: UIColors.white,
                    suffixIcon: IconButton(
                      icon: Icon(!loginController.passwordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: UIColors.iconColor,
                      onPressed: () {
                        loginController.togglePasswordVisible();
                      },
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'أدخل كلمة المرور الخاصة بك',
                    hintStyle: UITextStyle.normalSmall,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: UIColors.lightBlack),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: UIColors.gray)),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !loginController.passwordVisible.value,
                  maxLines: 1,
                );
              }),
              const SizedBox(
                height: 40,
              ),
                MaterialButton(
                  height: 56,
                  minWidth: Get.width,
                  color: UIColors.studentTime,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // if (loginController.sending.value)
                      //   const CircularProgressIndicator(
                      //     color: UIColors.white,
                      //   ),
                      Text('تسجيل الدخول', style: UITextStyle.titleBold)
                    ],
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.homeScreen);
                  },
                ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                  child: MaterialButton(
                height: 56,
                minWidth: Get.width,
                color: UIColors.studentTime,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('طلب تسجيل', style: UITextStyle.titleBold)
                  ],
                ),
                onPressed: () {},
              ))
            ],
          ),
        ),
      ),
    );
  }
}
