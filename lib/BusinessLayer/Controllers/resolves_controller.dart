import 'package:get/get.dart';
import '../../DataAccessLayer/Models/resolve.dart';
import '../../DataAccessLayer/Repositories/about_institiute_repo.dart';


class ResolvesController extends GetxController{
  InfoRepo repo = InfoRepo();
  List<Resolve> resolves = [];
  var loading = false.obs;

  @override
  void onInit() async {
    await getResolves();
    super.onInit();
  }


  Future<void> getResolves() async {
    loading.value = true;
    resolves = await repo.getResolves();
    update();
    loading.value = false;
  }
}