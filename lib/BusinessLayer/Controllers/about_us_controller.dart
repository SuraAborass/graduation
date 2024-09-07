import 'package:get/get.dart';

import '../../DataAccessLayer/Models/institute.dart';
import '../../DataAccessLayer/Repositories/info_institiute_repo.dart';

class AboutUsController extends GetxController{
  InfoRepo repo = InfoRepo();
  List<Institute> infos = [];

  var loading = false.obs;

  @override
  void onInit() async {
    await getInfo();
    super.onInit();
  }

  Future<void> getInfo() async {
    loading.value = true;
    infos = await repo.getInfo();
    update();
    loading.value = false;
  }
}