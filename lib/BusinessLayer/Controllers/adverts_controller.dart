import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/advert.dart';
import '../../DataAccessLayer/Repositories/adverts_repo.dart';
import '../../PresentationLayer/Widgets/Public/snackbars.dart';

class AdvertsController extends GetxController {
  AdvertsRepo repo = AdvertsRepo();
  List<Advert> ads = [];
  var loading = false.obs;
  var registeredCourses = <int>{}.obs; // Set to store registered course IDs
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    getAdverts();
    loadRegisteredCourses(); // Load registered courses on initialization
  }

  Future<void> getAdverts() async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      ads = await repo.getAdverts(token);
      print("ads: $ads");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }

  Future<void> loadRegisteredCourses() async {
    final storage = GetStorage();
    final registered = storage.read<List<dynamic>>('registeredCourses') ?? [];
    registeredCourses.addAll(registered.cast<int>());
  }

  Future<void> registerForCourse(int courseId) async {
    final storage = GetStorage();
    final token = storage.read('token');

    if (token == null) {
      Get.snackbar('Error', 'User token is missing.');
      return;
    }

    try {
      final success = await repo.registerCourse(courseId, token);
      if (success) {
        registeredCourses.add(courseId);
        GetStorage().write('registeredCourses', registeredCourses.toList());
        SnackBars.showSuccess( 'تم التسجيل بنجاح');
      } else {
        SnackBars.showWarning( 'أنت مسجل بالفعل');
      }
    } catch (e) {
      SnackBars.showError('حدث خطأ أثناء التسجيل');
    }
    update();
  }
}
