import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../DataAccessLayer/Models/notification.dart';
import '../../DataAccessLayer/Repositories/notifications_repo.dart';



class UserNotificationsController extends GetxController{
  UserNotificationsRepo repo = UserNotificationsRepo();
  List<UserNotification> userNotifications = [];
  var loading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getUserNotifications();
  }

  Future<void> getUserNotifications() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1)); // للتأكد من تخزين التوكن قبل قراءته
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      userNotifications = await repo.getUserNotifications(token);
      print("userNotifications: $userNotifications");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }
}