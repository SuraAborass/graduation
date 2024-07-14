import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation/DataAccessLayer/Clients/comment_service.dart';
import 'package:graduation/DataAccessLayer/Models/comment.dart';
import 'package:rx_future/rx_future.dart';
import '../../DataAccessLayer/Models/discussion.dart';
import '../../DataAccessLayer/Repositories/disussions_repo.dart';

class DiscussionsController extends GetxController{
  DiscussionsRepo repo = DiscussionsRepo();
  List<Discussion> discussions = [];
  var loading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getDiscussions();
  }

  Future<void> getDiscussions() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1)); // للتأكد من تخزين التوكن قبل قراءته
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      discussions = await repo.getDiscussions(token);
      print("discussions: $discussions");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }


  RxFuture<CommentQuostion> commentsState = RxFuture(CommentQuostion.zero());
  CommentService commentService = CommentService();

  Future<void> getComments(int postId)async{
    await commentsState.observe((p0)async {
      return await commentService.getComments(postId);
    },
      onSuccess: (p0){
      print("this is rx future");
      print(p0);
      },
      onError: (error){
      print("this error");
      print(error.toString());
      }
    );
  }

  RxFuture<void> addCommentState = RxFuture(null);
  Future<void> addComment(int postId , String description)async{
    await addCommentState.observe((p0) async{
    await  commentService.addComment(postId, description);
    },
    onSuccess: (p0) {
      getComments(postId);
    },
    );
  }
    RxFuture<void> editCommentState= RxFuture(null);
    int editCommentId = 0;
  Future<void> editComment(int commentId , String description,{void Function(void)? onSuccess})async{
    await editCommentState.observe((p0) async{
    await  commentService.editComment(commentId, description);
    },
    onSuccess: (p0) {
      // getComments(postId);
      onSuccess?.call(p0);
    },
    );
  }
  RxFuture<void> deleteCommentState = RxFuture(null);
  Future<void> deleteComment(int commentId,{void Function(void)? onSuccess})async{
    await deleteCommentState.observe((p0) async{
    await  commentService.deleteComment(commentId);
    },
    onSuccess: (p0) {
      onSuccess?.call(p0);
    },
    );
  }

}