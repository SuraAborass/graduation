import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../../DataAccessLayer/Models/course.dart';
import '../../DataAccessLayer/Repositories/courses_repo.dart';

class CoursesController extends GetxController{
  CoursesRepo repo = CoursesRepo();
  List<Course> courses = [];
  var loading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getCourses();
  }

  Future<void> getCourses() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1)); // للتأكد من تخزين التوكن قبل قراءته
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      courses = await repo.getCourses(token);
      print("courses: $courses"); // تأكد من طباعة المواد بعد جلبها
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }
}