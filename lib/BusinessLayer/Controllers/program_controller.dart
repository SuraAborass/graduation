import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/program.dart';
import '../../DataAccessLayer/Repositories/program_repo.dart';

class ProgramController extends GetxController {

  ProgramRepo repo = ProgramRepo();
  List<Program> programs = [];
  var loading = false.obs;
  final storage = GetStorage();
  @override
  void onInit() {
  super.onInit();
  getPrograms();
  }

  Future<void> getPrograms() async {
  loading.value = true;
  String? token = storage.read('userToken');
  if (token != null) {
  programs = await repo.getPrograms(token);
  print("programs: $programs");
  } else {
  print("No token found!");
  }
  update();
  loading.value = false;
  }
}


