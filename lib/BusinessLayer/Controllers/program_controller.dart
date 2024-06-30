import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/pragram.dart';
import '../../DataAccessLayer/Repositories/program_repo.dart';

class ProgramController extends GetxController{
  ProgramRepo repo = ProgramRepo();
  List<Program> programs = [];
  var loading = false.obs;
  final storage = GetStorage();
  Future<void> getSubjects() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1)); // للتأكد من تخزين التوكن قبل قراءته
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      programs = await repo.getProgram(token);
      print("programs: $programs"); // تأكد من طباعة المواد بعد جلبها
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }
}