import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/note.dart';
import '../../DataAccessLayer/Repositories/notes_repo.dart';

class NotesController extends GetxController{
  NotesRepo repo = NotesRepo();
  List<Note> notes = [];
  var loading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  Future<void> getNotes() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1)); // للتأكد من تخزين التوكن قبل قراءته
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      notes = await repo.getNotes(token);
      print("notes: $notes"); // تأكد من طباعة المواد بعد جلبها
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }
}