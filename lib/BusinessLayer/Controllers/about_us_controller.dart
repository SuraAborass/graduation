import 'package:get/get.dart';

import '../../DataAccessLayer/Models/fee.dart';
import '../../DataAccessLayer/Models/institute.dart';
import '../../DataAccessLayer/Repositories/about_institiute_repo.dart';

class AboutUsController extends GetxController{
  InfoRepo repo = InfoRepo();
  List<Institute> infos = [];
  List<Fee> fees = [];

  var loading = false.obs;

  @override
  void onInit() async {
    await getInfo();
    await getFees();
    super.onInit();
  }

  Future<void> getInfo() async {
    loading.value = true;
    infos = await repo.getInfo();
    update();
    loading.value = false;
  }

  Future<void> getFees() async {
    loading.value = true;
    fees = await repo.getFees();
    update();
    loading.value = false;
  }
}