
import 'package:get/get.dart';

import '../../DataAccessLayer/Models/teacher.dart';
import '../../DataAccessLayer/Repositories/teachers_repo.dart';

class TeachersController extends GetxController{
  TeachersRepo repo = TeachersRepo();
  List<Teacher> teachers = [];

  var loading = false.obs;

  @override
  void onInit() async {
    await getTeachers();
    super.onInit();
  }

  Future<void> getTeachers() async {
    loading.value = true;
    teachers = await repo.getTeachers();
    update();
    loading.value = false;
  }
}