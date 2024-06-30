// import 'package:get/get.dart';
//
// class ProfileController extends GetxController{
//   var loading = false.obs;
//   var isProfilePicPathSet = false.obs;
//   var profilePicPath = "".obs;
//   File? pickedFile;
//   ImagePicker imagePicker = ImagePicker();
//   Future<void> takePhoto(ImageSource source) async {
//     final pickedImage =
//     await imagePicker.pickImage(source: source, imageQuality: 100);
//     if (pickedImage != null) {
//       pickedFile = File(pickedImage.path);
//     }
//     Get.back();
//     loading.value = true;
//     print("send to client");
//     var response =
//     await userClient.updateAvatar(MyApp.appUser!.id, pickedImage!.path);
//     if (response != null) {
//       User user = User.fromMap(response);
//       boxClient.setAuthedUser(user);
//       MyApp.appUser = user;
//       SnackBars.showSuccess('تم تحديث صورة الملف الشخصي بنجاح');
//     } else {
//       SnackBars.showError('تعذر تغيير صورة الملف الشخصي');
//     }
//     print("end send to client");
//     setProfileImagePath(pickedFile!.path);
//     loading.value = false;
//     update();
//   }
//
//   void setProfileImagePath(String path) {
//
//     profilePicPath.value = path;
//     isProfilePicPathSet.value = true;
//     update();
//   }
// }