import 'package:get/get.dart';

class LoginController extends GetxController{
  var passwordVisible = false.obs;

  void togglePasswordVisible() {
    passwordVisible.value = !passwordVisible.value;
  }
}