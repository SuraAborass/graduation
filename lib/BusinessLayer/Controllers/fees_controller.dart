import 'package:get/get.dart';

import '../../DataAccessLayer/Models/fee.dart';
import '../../DataAccessLayer/Repositories/about_institiute_repo.dart';


class FeesController extends GetxController{
  InfoRepo repo = InfoRepo();
  List<Fee> fees = [];

  var loading = false.obs;

  @override
  void onInit() async {
    await getFees();
    super.onInit();
  }


  Future<void> getFees() async {
    loading.value = true;
    fees = await repo.getFees();
    update();
    loading.value = false;
  }


}